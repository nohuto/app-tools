# Spotify Configuration

By default Spotify includes trackers/ads/analytics which can be blocked using a patched version of it, see SpotX.

## [App Settings](https://support.spotify.com/us/article/explicit-content/) (Desktop)

- Audio quality
  - `Streaming Quality`: Automatic
    - Automatic: Dependent on your network connection
    - Low: Equivalent to approximately 24kbit/s
    - Normal: Equivalent to approximately 96kbit/s
    - High: Equivalent to approximately 160kbit/s
    - Very high: Equivalent to approximately 320kbit/s
    - Lossless: Equivalent up to 24-bit/44.1kHz FLAC
- Display
  - `Show anounements about new releases`: Off (personal preference)
  - `Show desktop overlay when using media keys`: Off
  - `See what your friends are palying`: Off (personal preference)
- Social
  - Disconnect facebook
  - `Publish my new playlist on my profile`: Off
  - `Start a private session`: On (will turn off after 6H)
  - `Share my listening activity on Spotify`: Off
  - `Show my recently played artists on my public profile`: Off
  - `Show my folower and following on my public profile`: Off
- Startup and window behaviour
  - `Open Spotify automatically after you log into your computer`: No

### Browser Settings

It's also recommended to change some settings via the browser, to do so log in and open [account/overview](https://www.spotify.com/account/overview/).

- Edit personal info
  - `Share my registration data with Spotify's content providers for marketing purposes. Note that your data may be transferred to a country outside of the EEA as described in our privacy policy.`: Off
- Manage apps
  - Unlink every possible one
- Notification settings
  - Untick all `Email` boxes
- Account privacy
  - `Tailored ads`: Off ("[Opting out tailored ads prevents Spotify from tailoring your ad experience based on third party data. This does not decrease the number of ads you receive on the free service but means you might see and hear ads that are not as relevant to you.](https://support.spotify.com/us/article/data-rights-and-privacy-settings/)")
  - `Facebook data`: Off ("[Opting out prevents Spotify from processing your Facebook display name, Facebook profile picture, and Facebook Friends.](https://support.spotify.com/us/article/data-rights-and-privacy-settings/)")
- Ad preferences
  - `Alcohol`: Off
  - `Dating`: Off
  - `Gambling`: Off
  - `Social Issues, politics or government`: Off
  - `Pregnancy and parenting`: Off
  - `Weight loss`: Off

## [Automating App Configuration](https://github.com/nohuto/app-tools/blob/main/assets/Spotify-Config.ps1)

Spotify stores most desktop settings locally in the `prefs` files. Global app settings: `%APPDATA%\Spotify\prefs`, per-account settings: `%APPDATA%\Spotify\Users\<autologin.username>-user\prefs`.

These settings aren't written down anywhere so I deciced to write them down to make it possible to automate the configuration.

See [Spotify-Config.ps1](https://github.com/nohuto/app-tools/blob/main/assets/Spotify-Config.ps1) for a possible automated configuration. You can easily modify it adding/removing lines from `$user`/`$global` using the information below.

### Global Settings

```ini
; Start a private session (start time)
; Convert it using [DateTimeOffset]::FromUnixTimeSeconds(<number>)
core.incognito.start_time=<number>

; Open Spotify automatically after you log into the computer
; off = No
; on (or not present) = Minimized 
; normal = Yes
app.autostart-mode="off"

; Offline storage location
storage.last-location=<path>
storage.location=<path>

; Proxy type
; 0 (or not present) = Autodetect settings
; 1 = No proxy
; 2 = HTTP
; 3 = SOCKS4
; 4 = SOCKS5
network.proxy.mode=1

; Enable hardware acceleration
; true (or not present) = On
; false = Off
ui.hardware_acceleration=false
```

### Per-account Settings

```ini
; Streaming quality
; 0 = Automatic
; 1 = Low
; 2 = Normal
; 3 = High
; 4 = Very High
audio.play_bitrate_non_metered_enumeration=0
audio.play_bitrate_enumeration=0

; Download
; 0 = Automatic
; 1 = Low
; 2 = Normal
; 3 = High
; 4 = Very High
sync_bitrate_enumeration=0

; Auto adjust quality
; true (or not present) = On
; false = Off
audio.allow_downgrade=true

; Normalize volume
; true (or not present) = On
; false = Off
audio.normalize_v2=false

; Volume level
; 0 = Quiet
; 1 (or not present) = Normal
; 2 = Loud
audio.loudness.environment=1

; Show announcements about new releases
; true = Off
; false (or not present) = On
ui.hide_hpto=true

; Show desktop overlay when using media keys
; true (or not present) = On
; false = Off
ui.system_media_controls_enabled=false

; See what your friends are playing (Friends Activity Panel)
; 0 = Hidden
; 1 (or not present) = Shown
ui.right_panel_content=0

; Crossfade songs
; false = Off
; true (or not present) = On
; time_v2 is in ms, range is 0-12000 (12 sec)
audio.crossfade_v2=false
audio.crossfade.time_v2=1000

; Automix - Allow seamless transitions between songs on select playlists
; true (or not present) = On
; false = Off
audio.automix=true

; Mono audio - Makes the left and right speakers play the same audio
; true = On
; false (or not present) = Off
audio.downmixer_v2=false

; Trim silence - Skips silent moments in podcasts
; true = On
; false (or not present) = Off
audio.silence_trimmer_v2=false

; Equalizer
; true = On
; false (or not present) = Off
audio.equalizer_v2=false

; Equalizer Presets
; Each Hz gets it's own line, the number has a range of 2147483647 (+12dB) - -2147483647 (-12dB)
; Calculate the number via [math]::round((<dB> / 12.0) * 2147483647)
; low_shelf_gain_v2 = 60Hz
; low_peak_gain_v2 = 150Hz
; low_mid_peak_gain_v2 = 400Hz
; high_mid_peak_gain_v2 = 1KHz
; high_peak_gain_v2 = 2.4KHz
; high_shelf_gain_v2 = 15KHz
; 'Bass booster' preset would use:
audio.equalizer.low_shelf_gain_v2=760567125
audio.equalizer.low_peak_gain_v2=626349397
audio.equalizer.low_mid_peak_gain_v2=223696213
audio.equalizer.high_mid_peak_gain_v2=0
audio.equalizer.high_peak_gain_v2=0
audio.equalizer.high_shelf_gain_v2=0

; Close button should minimize the Spotify window
; true = On
; false (or not present) = Off
ui.minimize_to_tray=false

; Volume
; Range is 0-65000
app.player.volume=25000

; ?
audio.play_bitrate_non_metered_migrated=true
```

## SpotX

See a list of all parameters [here](https://github.com/SpotX-Official/SpotX/discussions/60). The command below installs the old theme.

```powershell
Invoke-Expression "& { $(Invoke-WebRequest -UseBasicParsing 'https://raw.githubusercontent.com/SpotX-Official/spotx-official.github.io/main/run.ps1') } -v 1.2.13.661.ga588f749-4064 -confirm_spoti_recomended_over -block_update_on -podcasts_off -adsections_off -DisableStartup -confirm_uninstall_ms_spoti -confirm_spoti_recomended_uninstall"
```