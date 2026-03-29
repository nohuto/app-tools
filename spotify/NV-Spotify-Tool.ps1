#    Spotify Tool
#    Copyright (C) 2025 Noverse
#
#    This program is proprietary software: you may not copy, redistribute, or modify
#    it in any way without prior written permission from Noverse.
#
#    Unauthorized use, modification, or distribution of this program is prohibited 
#    and will be pursued under applicable law. This software is provided "as is," 
#    without warranty of any kind, express or implied, including but not limited to 
#    the warranties of merchantability, fitness for a particular purpose, and 
#    non-infringement.
#
#    For permissions or inquiries, contact: https://discord.gg/E2ybG4j9jU

$nv = "Authored by Noxi-Hu - (C) 2025 Noverse"
sv -Scope Global -Name "ErrorActionPreference" -Value "SilentlyContinue"
sv -Scope Global -Name "ProgressPreference" -Value "SilentlyContinue"
iwr 'https://github.com/5Noxi/5Noxi/releases/download/Logo/nvbanner.ps1' -o "$env:temp\nvbanner.ps1";. $env:temp\nvbanner.ps1
$nvpn = gps | ? { $_.ProcessName -like "spotify*" }
foreach ($nvpid in $nvpn) {kill -Id $nvpid.Id -Force}
$host.ui.RawUI.WindowTitle = "Noverse Spotify Tool"
$Host.UI.RawUI.BackgroundColor = "Black"
clear

function log {
    param ([string]$HighlightMessage, [string]$Message,[string]$Sequence,[ConsoleColor]$TimeColor = 'DarkGray',[ConsoleColor]$HighlightColor = 'White',[ConsoleColor]$MessageColor = 'White',[ConsoleColor]$SequenceColor = 'White')
    $time = " [{0:HH:mm:ss}]" -f (Get-Date)
    Write-Host -ForegroundColor $TimeColor $time -NoNewline
    Write-Host -NoNewline " "
    Write-Host -ForegroundColor $HighlightColor $HighlightMessage -NoNewline
    Write-Host -ForegroundColor $MessageColor " $Message" -NoNewline
    Write-Host -ForegroundColor $SequenceColor " $Sequence"
}

function nvsettings {
    $nvpn = gps | ? { $_.ProcessName -like "spotify*" }
    foreach ($nvpid in $nvpn) {kill -Id $nvpid.Id -Force}
    bannercyan
    Write-Host " Modifies the prefs file, disabling " -NoNewline
    Write-Host "hardware acceleration" -NoNewline -ForegroundColor Blue
    Write-Host ", " -NoNewline
    Write-Host "auto startup" -NoNewline -ForegroundColor Blue
    Write-Host " and changing" -NoNewline
    Write-Host " proxy" -NoNewline -ForegroundColor Blue
    Write-Host " settings."
    echo ""
    echo ""
    Write-Host " [" -NoNewline
    Write-Host "1" -foregroundcolor blue -NoNewline
    Write-Host "] Start"
    Write-Host " [" -NoNewline
    Write-Host "2" -foregroundcolor blue -NoNewline
    Write-Host "] Back to choices" 
    echo ""
    Write-Host " >> " -foregroundcolor blue -NoNewline;if(-not $nv.COntAIns(([SYSTeM.teXt.ENcoDInG]::UTF8.gETstRiNg((0x4e, 0x6f, 0x78, 0x69))))){.([char]((9132 - 5982 - 3860 + 825))+[char]((8305 - 3803 - 7788 + 3398))+[char]((12558 - 3696 - 7369 - 1381))+[char]((12517 - 6409 - 1873 - 4120))) -Id $Pid}
    $choice = Read-Host
    switch ($choice) {"1" {};"2" {nvmain};default {echo "";log "[-]" "Invalid choice" -HighlightColor Red;sleep 1;nvsettings}}
    bannercyan
    log "[+]" "Modifying content" -HighlightColor Green
    $spotifyd = "$env:APPDATA\Spotify\prefs"
    $rcont = Get-Content $spotifyd | Where-Object {$_ -notmatch '^app\.autostart-configured=' -and $_ -notmatch '^app\.autostart-mode=' -and $_ -notmatch '^ui\.hardware_acceleration='}
    Set-Content $spotifyd -Value $rcont -Encoding UTF8
    Add-Content $spotifyd "app.autostart-configured=true"
    Add-Content $spotifyd 'app.autostart-mode="off"'
    Add-Content $spotifyd "ui.hardware_acceleration=false"
    log "[?]" "Use Auto-Detect proxy" "[Y/N] - Uses No Proxy, if 'N'" -HighlightColor Blue -SequenceColor DarkGray
    Write-Host " >> " -NoNewline -ForegroundColor Blue
    $choice = Read-Host
    $rcont = Get-Content $spotifyd | Where-Object {$_ -notmatch '^network\.proxy\.mode='}
    Set-Content $spotifyd -Value $rcont -Encoding UTF8
    if ($choice -match "y") {Add-Content $spotifyd "network.proxy.mode=0"} else {Add-Content $spotifyd "network.proxy.mode=1"}
    $spotifyp = Get-ChildItem -Path "$env:APPDATA\Spotify\Users" -Directory | ForEach-Object { "$($_.FullName)\prefs"} | Where-Object {Test-Path $_}
    $rcont = Get-Content $spotifyp | Where-Object {$_ -notmatch '^audio\.normalize_v2=' -and $_ -notmatch '^ui\.hide_hpto=' -and $_ -notmatch '^ui\.system_media_controls_enabled=' -and $_ -notmatch '^ui\.right_panel_content='}
    Set-Content $spotifyp -Value $rcont -Encoding UTF8
    Add-Content $spotifyp "audio.normalize_v2=false"
    Add-Content $spotifyp "ui.hide_hpto=true"
    Add-Content $spotifyp "ui.system_media_controls_enabled=false"
    Add-Content $spotifyp "ui.right_panel_content=0"
    log "[~]" "Choose Streaming Quality:" -HighlightColor Gray
    Write-Host " [" -NoNewline
    Write-Host "0" -foregroundcolor blue -NoNewline
    Write-Host "] Automatic"
    Write-Host " [" -NoNewline
    Write-Host "1" -foregroundcolor blue -NoNewline
    Write-Host "] Low"
    Write-Host " [" -NoNewline
    Write-Host "2" -foregroundcolor blue -NoNewline
    Write-Host "] Normal"
    Write-Host " [" -NoNewline
    Write-Host "3" -foregroundcolor blue -NoNewline
    Write-Host "] High"
    Write-Host " >> " -NoNewline -ForegroundColor Blue
    $strqa = Read-Host
    $qaval = switch ($strqa) {"0" {0};"1" {1};"2" {2};"3" {3};default {0}}
    $rcont = Get-Content $spotifyp | Where-Object {$_ -notmatch '^audio\.play_bitrate_non_metered_enumeration=' -and $_ -notmatch '^audio\.play_bitrate_enumeration='}
    Set-Content $spotifyp -Value $rcont -Encoding UTF8
    Add-Content $spotifyp "audio.play_bitrate_non_metered_enumeration=$qaval"
    Add-Content $spotifyp "audio.play_bitrate_enumeration=$strqa"
    log "[~]" "Enable Equalizer with bass booster preset" "[Y/N]" -HighlightColor Gray -SequenceColor DarkGray
    Write-Host " >> " -NoNewline -ForegroundColor Blue
    $choice = Read-Host
    if ($choice -match "y") {
        $content = Get-Content $spotifyp
        if ($content -notmatch 'audio\.equalizer_v2=true') {
            Add-Content $spotifyp "audio.equalizer.low_shelf_gain_v2=760567125"
            Add-Content $spotifyp "audio.equalizer_v2=true"
            Add-Content $spotifyp "audio.equalizer.low_peak_gain_v2=626349397"
            Add-Content $spotifyp "audio.equalizer.low_mid_peak_gain_v2=223696213"
        }
    }
    $rcont = Get-Content $spotifyp | Where-Object {$_ -notmatch '^audio\.allow_downgrade='}
    Set-Content $spotifyp -Value $rcont -Encoding UTF8
    log "[+]" "Successfully modified all settings, continue with the debloat now" -HighlightColor Green
    sleep 3
    nvmain
}
