# Brave Configuration (iOS)

On iOS, [Brave](https://github.com/brave/brave-browser/releases) is my primary browser (more feature rich than Safari). If you don't like the UI or similar of Brave, Safari is also a good choice.

## App Settings

### Shields & Privacy

- `Trackers & ads blocking`: Aggressive
- `Upgrade connection to HTTPS`: Strict
- `Auto-redirect AMP pages`: On
- `Auto-redirect tracking URLs`: On
- `Block scripts`: Off ('On' will break things since JS is getting blocked, turn it on if possible)
- `Block Fingerprinting`: On
- `Store contact information for future broken site reports`: Off
- Content Filtering (I use a private DNS server, therefore I only add specific lists that can't be applied via DNS filtering)
  - https://ublockorigin.github.io/uAssetsCDN/filters/filters.min.txt
  - https://cdn.jsdelivr.net/gh/uBlockOrigin/uAssetsCDN@main/filters/unbreak.min.txt
  - https://cdn.jsdelivr.net/gh/uBlockOrigin/uAssetsCDN@main/filters/quick-fixes.min.txt
  - https://ublockorigin.pages.dev/filters/privacy.min.txt
  - https://ublockorigin.github.io/uAssets/filters/privacy-removeparam.txt
  - https://secure.fanboy.co.nz/fanboy-cookiemonster_ubo.txt
  - https://ublockorigin.github.io/uAssetsCDN/filters/annoyances-cookies.txt
  - https://ublockorigin.pages.dev/thirdparties/easylist-social.txt
  - https://ublockorigin.pages.dev/filters/annoyances.min.txt
  - https://cdn.jsdelivr.net/gh/uBlockOrigin/uAssetsCDN@main/thirdparties/easylist-annoyances.txt
  - https://cdn.jsdelivr.net/gh/uBlockOrigin/uAssetsCDN@main/thirdparties/easylist-notifications.txt
  - https://ublockorigin.github.io/uAssetsCDN/thirdparties/easylist-newsletters.txt
  - https://ublockorigin.pages.dev/thirdparties/easylist-chat.txt
- Privacy Hub
  - `Show Shields Data`: Off (preference)
- `Enable Global Privacy Control`: On ([GPC](https://support.mozilla.org/en-US/kb/global-privacy-control) isn't the same as [DNT](https://support.mozilla.org/en-US/kb/how-do-i-turn-do-not-track-feature) which shouldn't be used anymore - "GPC is newer and has stronger recognition in laws like the CCPA and GDPR")
- `Block Dangerous Websites`: On
- `Enable Screen Time`: Off
- `Allow Privacy-Presering Product Analytics (P3A)`: Off
- `Automtically send dialy usage ping to Brave`: Off
- `Allow Brave surveys`: Off

### Rewards

- `Enable Brave Rewards`: Off

### Leo

- `Show In Quick Search Engines Bar`: Off
- `Reset And Clear Leo Data`: Reset

### Web3

Disable Brave's Web3 features if you don't use them.

- `Resolve Solana Name Service (SNS) domain names`: Disabled
- `Resolve Ethereum Name Service (ENS) domain names`: Disabled
- `Allow ENS Offchain Lookup`: Disabled
- `Resolve Unstoppable Domains domain names`: Disabled

### Search Engine

See [search-engine](https://noverse.dev/docs/app-guides/search-engine/).

- `Standart Tab`: Custom Search Engine (`https://noai.duckduckgo.com/search?q=%s`)
- `Private Tab`: Custom Search Engine (`https://noai.duckduckgo.com/search?q=%s`)
- `Show Search Suggestions`: Off
- `Show Browser Suggestions`: Off

### Media

- `Block YouTube Recommended Content`: On
- `Block YouTube Distracting Elements`: On
- `Block YouTube Shorts`: On

### Appearance

- `Appearance`: Dark (preference)
- `Night Mode`: On (preference)

### Change App Icon

- `Brave Icons`: PopArt Dark (preference)

### New Tab Page

- `Background`: On (preference)
- `Media Type`: Default Images
- `Privacy Hub`: Off (preference)
- `Favorites`: Off (preference)

### Display

- `Hide Brave Rewards Icon`: On

### Logins & Password

Don't use the built-in password manager, use a [passowrd manager](https://noverse.dev/docs/app-guides/extensions/#password-manager-firefox---chrome) instead.

- `Save Logins`: Off

## Flags

We will use flags to disable some of the bloat features which are enabled by default in Brave, e.g. wallet/AI/crypto.

| Flag | Description | State |
| --- | --- | --- |
| `brave-sync-default-passwords` | Turn on password syncing when Sync is enabled. | Disabled |
| `brave-wallet-zcash` | Zcash support for native Brave Wallet | Disabled |
| `brave-wallet-bitcoin` | Bitcoin support for native Brave Wallet | Disabled |
| `brave-ai-chat` | Summarize articles and engage in conversation with AI | Disabled |
| `brave-ai-chat-history` | Enables AI Chat History persistence and management | Disabled |