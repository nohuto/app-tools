# Spotify Configuration
# Copyright (C) 2026 Noverse

[console]::Title = "Noverse Spotify Configuration"
[console]::BackgroundColor = "Black"
cls

$proc = Get-Process spotify* -ErrorAction SilentlyContinue
if ($proc) { $proc | Stop-Process -Force }

function setprefs([string]$path, [hashtable]$prefs) {
    $lines = [System.Collections.Generic.List[string]]::new()
    if (Test-Path $path) {
        foreach ($line in Get-Content $path) {
            if ($line -ne '') { [void]$lines.Add($line) }
        }
    }
    foreach ($key in $prefs.Keys) {
        $entry = "$key=$($prefs[$key])"
        $index = -1
        for ($i = 0; $i -lt $lines.Count; $i++) {
            if ($lines[$i] -like "$key=*") {
                $index = $i
                break
            }
        }
        if ($index -ge 0) {
            $lines[$index] = $entry
        }
        else {
            [void]$lines.Add($entry)
        }
    }
    Set-Content -Path $path -Value $lines -Encoding UTF8
}

$global = @{
    #'core.incognito.start_time' =
    'app.autostart-configured' = 'true'
    'app.autostart-mode' = '"off"'
    #'storage.last-location' =
    #'storage.location' =
    'network.proxy.mode' = '1'
    'ui.hardware_acceleration' = 'false'
}

$user = @{
    'audio.play_bitrate_non_metered_enumeration' = '0'
    'audio.play_bitrate_enumeration' = '0'
    'audio.sync_bitrate_enumeration' = '0'
    'audio.allow_downgrade' = 'true'
    'audio.normalize_v2' = 'false'
    #'audio.loudness.environment' = '1'
    'ui.hide_hpto' = 'true'
    'ui.system_media_controls_enabled' = 'false'
    'ui.right_panel_content' = '0'
    'audio.crossfade_v2' = 'false'
    #'audio.crossfade.time_v2' = '1000'
    'audio.automix' = 'true'
    'audio.downmixer_v2' = 'false'
    'audio.silence_trimmer_v2' = 'false'
    #'audio.equalizer_v2' = 'true'
    #'audio.equalizer.low_shelf_gain_v2' = '760567125'
    #'audio.equalizer.low_peak_gain_v2' = '626349397'
    #'audio.equalizer.low_mid_peak_gain_v2' = '223696213'
    #'audio.equalizer.high_mid_peak_gain_v2' = '0'
    #'audio.equalizer.high_peak_gain_v2' = '0'
    #'audio.equalizer.high_shelf_gain_v2' = '0'
    'ui.minimize_to_tray' = 'false'
    #'app.player.volume' = '25000'
}

setprefs "$env:APPDATA\Spotify\prefs" $global

Get-ChildItem "$env:APPDATA\Spotify\Users" -Directory -ErrorAction SilentlyContinue | ForEach-Object {
    $prefs = Join-Path $_.FullName 'prefs'
    if (Test-Path $prefs) { setprefs $prefs $user }
}
