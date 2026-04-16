# Mullvad Configuration

[Mullvad](https://github.com/mullvad/mullvad-browser/releases) is my primary desktop browser, it's configured by default for privacy/security/fingerprinting restistance ([hard-facts](https://mullvad.net/en/browser/hard-facts)), therefore there's not much to change (it's recommended to use the default configuration to not get unique). Read more about the Mullvad browser in their [acticles](https://mullvad.net/en/browser/articles).

## [Default Compile/Preference Flags](https://mullvad.net/en/browser/hard-facts)

- `--disable-crashreporter`
- `--disable-parental-controls`
- `--disable-eme`
- `--enable-proxy-bypass-protection`
- `--disable-system-policies`
- `--enable-bundled-fonts`
- `--disable-backgroundtasks`
- `--disable-update-agent`
- `--disable-default-browser-agent` *(Windows only)*

- `privacy.resistFingerprinting` = `true`
- `privacy.resistFingerprinting.autoDeclineNoUserInputCanvasPrompts` = `true`
- `privacy.resistFingerprinting.block_mozAddonManager` = `true`
- `privacy.resistFingerprinting.exemptedDomains` = `-.example.invalid`
- `privacy.resistFingerprinting.jsmloglevel` = `Warn`
- `privacy.resistFingerprinting.letterboxing` = `true`
- `privacy.resistFingerprinting.randomDataOnCanvasExtract` = `true`
- `privacy.resistFingerprinting.reduceTimerPrecision.jitter` = `true`
- `privacy.resistFingerprinting.reduceTimerPrecision.microseconds` = `1000`
- `privacy.resistFingerprinting.target_video_res` = `480`
- `privacy.resistFingerprinting.testGranularityMask` = `0`
- `services.sync.prefs.sync.privacy.resistFingerprinting.reduceTimerPrecision.jitter` = `true`
- `services.sync.prefs.sync.privacy.resistFingerprinting.reduceTimerPrecision.microseconds` = `true`

## App Settings

As said above the default configuration shouldn't be changed a lot, therefore I'll only point out some specific parts which are preference/already default but shouldn't be changed.

### General

- General
  - `Open previous windows and tabs`: Off
  - `Ctrl+Tab cycles through tabs in recently used order`: Off
  - `Open links in tabs instead of new windows`: On
  - `When you open a link, image or media in a new tab, switch to it immediately`: On
  - `Ask before closing multiple tabs`: Off
  - `Show tab previews in the Windows taskbar`: Off
  - `Show an image preview when you hover on a tab`: Off
- Language
  - `Check your spelling as you type`: Off
- Files and Applications
  - `Always ask you where to save files`: Off
  - `What should Mullvad Browser do with other files?`: Save files
- Browsing
  - `Show a touch keyboard when necessary`: Off
  - `Search for text when you start typing`: Off
- Home
  - `Homepage and new windows`: Blank Page
  - `New tabs`: Blank Page

### Search

See [search-engine](https://github.com/nohuto/app-tools/blob/main/search-engine.md).

### Privacy & Security

- Browser Privacy
  - `Delete cookies and site data when Mullvad Browser is closed`: Off (leave enabled if you don't care about logging in every time)
  - `Always use private browsing mode`: Off
  - `Remember browsing and download history`: Off
  - `Clear history when Mullvad Browser closes`: On
    - Borwsing & download history
    - Saved form info
- Permissions
  - `Block pop-ups and third-party redirects`: On
  - `Warn you when websites try to install add-ons`: On
- Security
  - `Security Level`: Safest (breaks websites, if too much issues 'Safer')
  - `HTTPS-Only Mode`: Enable HTTPS-Only Mode in all windows
  - `DNS over HTTPS`: Max Protection (I would recommend to use [Mullvad](https://mullvad.net/en/help/dns-over-https-and-dns-over-tls#specifications)/[Quad9](https://quad9.net/news/blog/doh-with-quad9-dns-servers/#additional-information) or set up your own private DNS via [AdGuard](https://adguard-dns.io/) - see [win-config/network/encrypted-dns/#providers-compared](https://www.noverse.dev/docs/win-config/network/encrypted-dns/#providers-compared) & [win-config/network/encrypted-dns/#note-for-ios-users](https://www.noverse.dev/docs/win-config/network/encrypted-dns/#note-for-ios-users))

### Extensions & [Themes](https://addons.mozilla.org/en-US/firefox/themes/)

See [extensions](https://github.com/nohuto/app-tools/blob/main/extensions.md).

## Flags

Can be applied via `about:config`.

| Flag | Description | State |
| --- | --- | --- |
| `browser.compactmode.show` | Enables the option '[Compact (not supported)](https://support.mozilla.org/en-US/kb/compact-mode-workaround-firefox)' in Menu > More tools > Customize toolbar... > Density. | true |
| `full-screen-api.transition-duration.enter` | Fullscreen transition animation duration (enter fullscreen) | 0 0 |
| `full-screen-api.transition-duration.leave` | Fullscreen transition animation duration (exit fullscreen) | 0 0 |
| `privacy.resistFingerprinting.letterboxing` | It's recommended to leave it enabled to [prevent fingerprinting the screen dimensions](https://mullvad.net/en/browser/hard-facts#letterboxing), only disable if understanding the consequences | false |
| `network.http.sendRefererHeader` | Controls whether or not to send a referrer regardless of origin. [Values](https://wiki.mozilla.org/Security/Referrer): 0 = never send the header, 1 = send the header only when clicking on links and similar elements, 2 = (default) send on all requests (e.g. images, links, etc.) | 1 |
| `privacy.donottrackheader.enabled` | "Many sites do not respect this indication of a person's privacy preferences and, in some cases, it can reduce privacy." ~ [support.mozilla](https://support.mozilla.org/en-US/kb/how-do-i-turn-do-not-track-feature), I'm adding it here since many recommend to use it | Off |