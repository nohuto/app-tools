# Brave Configuration (Desktop)

[Brave](https://github.com/brave/brave-browser/releases) is my second browser which I use for streaming content that requires widevine.

## App Settings

### Customize New Tab Page

Click on the gear in a new tab to get to this part.

- Background Image
  - `Show new tab page ads`: Off
- Search
  - `Show search widget in new tabs`: Off
- Top Sites
  - `Show top sites`: Off
- Cards
  - `Brave Stats`: Off
  - `Brave VPN`: Off
  - `Brave Rewards`: Off
  - `Brave Talk`: Off

### Appearance

- Customize your toolbar
  - `Wallet`: Off
  - `Leo AI`: Off
  - `VPN`: Off
  - `Password Manager`: Off (use a password manager extension, not the built-in managers)
  - `Rewards`: Off
- Show autocomplete suggestions in address bar
  - `Leo AI Assistant`: Off
- `Use wide address bar`: On
- `Always show full URLs`: On

### Shields

- `Show the number of blocked items on the Shield icon`: Off (you can see it by clicking on the icon/hovering over it)
- `Trackers & ads blocking`: Aggressive
- `Upgrade connection to HTTPS`: Strict
- `Block scripts`: Off ('On' will break things since JS is getting blocked, turn it on if possible)
- `Block fingerprinting`: On
- `Block cookies`: Block third-party cookies
- Content filtering
  - All off, I personally use uBO instead (if you would use uBO only for adding blocklists, use Brave Shields instead)
- `Allow Facebook logins and embeded posts`: Off
- `Allow X (previously Twitter) embedded tweet`: Off
- `Allow LinkedIn embedded posts`: Off

### Privacy and security

- Security
  - `Use secure DNS`: On (I would recommend to use [Mullvad](https://mullvad.net/en/help/dns-over-https-and-dns-over-tls#specifications)/[Quad9](https://quad9.net/news/blog/doh-with-quad9-dns-servers/#additional-information) or set up your own private DNS via [AdGuard](https://adguard-dns.io/) - see [win-config/network/encrypted-dns/#providers-compared](https://www.noverse.dev/docs/win-config/network/encrypted-dns/#providers-compared) & [win-config/network/encrypted-dns/#note-for-ios-users](https://www.noverse.dev/docs/win-config/network/encrypted-dns/#note-for-ios-users))
  - Manage JavaScript optimizations & security
    - `Don't allow sites to use JavaScript optimization`: On
- Site and Shields Settings
  - `Automatically remove permissions from unused sites`: On
- `WebRTC IP handling policy`: Disable non-proxied UDP
- `Use Google services for push messaging`: Off
- `Auto-redirect AMP pages`: On
- `Auto-redirect tracking URLs`: On
- `Prevent sites from fingerprinting me based on my language preferences`: On
- `Block Microsoft Recall`: On
- `Send a "Do Not Track" request with your browsing traffic`: Off (" Many sites do not respect this indication of a person's privacy preferences and, in some cases, it can reduce privacy." ~ [support.mozilla](https://support.mozilla.org/en-US/kb/how-do-i-turn-do-not-track-feature))

### Data collection

- `Allow privacy-preserving product analytics (P3A)`: Off
- `Automatically send daily usage ping to Brave`: Off
- `Automatically send diagnostic reports`: Off
- Survey Panelist
  - `Allow Brave surveys`: Off

### Web3

Disable Brave's Web3 features if you don't use them.

- `Default Ethereum wallet`: Extension (no fallback)
- `Default Solana wallet`: Extension (no fallback)
- `Resolve Unstoppable Domains domain names`: Disabled
- `Resolve Ethereum Name Service (ENS) domain names`: Disabled
- `Resolve Solana Name Service (SNS) domain names`: Disabled

### Leo

- `Show Leo icon in the sidebar`: Off
- `Show Leo in the context menu on websites`: Off
- `Clear Leo data`: Clear it once
- `Store my conversation history`: Off

### Search Engine

See [search-engine](https://github.com/nohuto/app-tools/blob/main/search-engine.md).

### Extensions

See [extensions](https://github.com/nohuto/app-tools/blob/main/extensions.md).

### Autofill and passwords

Don't use the built-in password manager, use a [passowrd manager extension](https://github.com/nohuto/app-tools/blob/main/extensions.md#password-manager-firefox---chrome) instead.

- Password Manager
  - Settings
    - `Offer to save paswords and passkeys`: Off
- Payment methods
  - `Save and fill payment methods`: Off
  - `Save security codes`: Off
  - `Allow sites to check if you have payment methods saved`: Off
- `Allow auto-fill in private window`: Off

### Languages

- `Check for spelling errors when you type text on web pages`: Off

### System

- `Continue running background apps when Brave is closed`: Off
- `Close window when closing last tab`: On
- `Warn me before closing window with multiple tabs`: Off (preference)
- `Show full screen reminder to press Esc on exit`: Off
- `Show VPN Tray Icon`: Off
- `Memory Saver`: Balanced

## Flags

We will use flags to disable some of the bloat features which are enabled by default in Brave, e.g. wallet/AI/crypto.

You could also add flags via the [CL](https://support.brave.com/hc/en-us/articles/360044860011-How-Do-I-Use-Command-Line-Flags-in-Brave) instead of applying some of them using `brave://flags`. Verify it by entering `brave://version` and checking the '**Command Line**' section.

| Flag | Description | State |
| --- | --- | --- |
| `brave-wallet-zcash` | Zcash support for native Brave Wallet | Disabled |
| `brave-wallet-bitcoin` | Bitcoin support for native Brave Wallet | Disabled |
| `brave-wallet-cardano` | Cardano support for native Brave Wallet | Disabled |
| `brave-ai-chat` | Summarize articles and engage in conversation with AI | Disabled |
| `brave-ai-chat-history` | Enables AI Chat History persistence and management | Disabled |
| `brave-ai-chat-rich-search-widgets` | Enables AI Chat Rich Search Widgets | Disabled |
| `brave-ai-chat-open-leo-from-brave-search` | Enables opening Leo AI Chat from Brave Search | Disabled |
| `native-brave-wallet` | Native cryptocurrency wallet support without the use of extensions | Disabled |
| `brave-news-peek` | Prompt Brave News via the top featured article peeking up from the bottom of the New Tab Page, after a short delay | Disabled |
| `brave-news-feed-update` | Use the updated Brave News feed | Disabled |
| `brave-rewards-gemini` | Enables support for Gemini as an external wallet provider for Brave | Disabled |

## Disabling Brave Services/Tasks

```powershell
Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Services\brave" -Name "Start" -PropertyType DWord -Value 4 -Force
Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Services\BraveElevationService" -Name "Start" -PropertyType DWord -Value 4 -Force
Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Services\bravem" -Name "Start" -PropertyType DWord -Value 4 -Force
Get-ScheduledTask -TaskPath '\' | ? { $_.TaskName -like 'BraveSoftwareUpdate*'  } | % { Disable-ScheduledTask -TaskName $_.TaskName -TaskPath '\' }
```
`BraveSoftwareUpdateTaskUser*`: Keeps your BraveSoftware software up to date. If this task is disabled or stopped, your BraveSoftware software will not be kept up to date, meaning security vulnerabilities that may arise cannot be fixed and features may not work. This task uninstalls itself when there is no BraveSoftware software using it.