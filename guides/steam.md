# Steam Configuration

## App Settings

### Profile Settings

`<steamname>` tab -> `Edit Profile` on the right.

- General
   - `Real Name`: Delete
   - `Location:`: Do not display
   - `Hide Community Awards on my profile`: On
- Avatar
  - `Upload your avatar`: Don't use a private picture (face etc.)
- Privacy Setitngs
  - `My profile` Private

- Account
  - Privacy Settings
    - `My profile`: Private
    - `Game details`: Private
    - `Friends List`: Private
    - `Inventory`: Private

### Account Settings

Store -> Browse -> My Preferences.

- Store preferences
  - Community Content Preferences
    - `Language Preferences`: Do not filter
    - `User Group Preferences`: Do not filter text from my Steam Friends
  - Broadcast Preferences
    - `Hide all live broadcasts on the store product pages`: On
- Security & Devices
  - `Sign out everywhere`: If there're too many devices which hinders clarity
- Data & Browsing
  - `Optional Cookies`: Reject All
  - `Third Party Links (UTM)`: Off
  - `Ask Me For Feedback`: Off
  - `Anonymous Game Framerate Data`: Off
- Notification Settings
  - `Manage Email Notifications`: Opt out of all email marketing communication

### Steam Settings

Steam (top left) -> Settings.

- Friends & Chat
  - `Sign in to friends when Steam starts`: Off (preference)
  - `Compact friends list & chat view`: On (preference)
  - `Compact favorite friends area`: On (preference)
  - `Remember my open chats`: Off
  - `Disable spellcheck in chat message entry`: On
- Security
  - `Don't save account credentials on this computer`: On (if on public/shared computer)
- Notifications
  -`Show Notification Toasts...`: Never (preference)
- Interface
  - `Clinet Beta Participation`: No beta chosen
  - `Start Up Location`: Library (preference)
  - `Run Steam when my computer starts`: Off
- Library
  - `Low Bandwidth Mode`: On
  - `Low Performance Mode`: On
  - `Disable Community Content`: On
- Downloads
  - `Allow downlaods during gameplay`: Off
  - `Display download rates in bits per second`: Off
- In Game
  - `Enable the Steam Overlay while in-game`: Off (on for in-game purchases)
  - `Steam Networking`: [Never](https://help.steampowered.com/en/faqs/view/1433-AD20-F11D-B71E/) (uses [ISteamNetworkingSockets/ISteamNetworkingMessages](https://partner.steamgames.com/doc/features/multiplayer/networking))
- Accessibility
  - `Reduce Motion`: On
- `Game Recording` Recording Off
- Remote Play
  - `Enable Remote Play`: Off
- Broadcast
  - `Privacy setting`: Broadcasting disabled

### Per-Game Settings

Library -> `<game>` -> Properties.

- General
  - `Enable the Steam Overlay while in-game`: Off
  - `Launch Options`: See all listed [here](https://github.com/nohuto/app-tools/blob/main/assets/Steam-Commands.xlsx)
- Controller
  - `Override for <game>`: Disable Steam Input

## Local Config Files

[`Steam-Config.ps1`](https://github.com/nohuto/app-tools/blob/main/assets/Steam-Config.ps1) parses localconfig, then adds/edits the keys/blocks (a `.bak` file gets created in case you want to revert the changes). The order doesn't seem to be important means that the script adds missing keys/blocks to the buttom.

You can edit the settings the script applies via `$settings`, to do so you need to know if a key is in the root block or if it's in a specific block. The script currently applies several settings which are listed in [#app-settings]().

- `C:\Program Files (x86)\Steam\config\config.vdf`
- `C:\Program Files (x86)\Steam\config\loginusers.vdf`: stores users/login behaviours (offline mode, remember password, auto login, etc.)
- `C:\Program Files (x86)\Steam\config\libraryfolders.vdf`: stores library paths
- `C:\Program Files (x86)\Steam\userdata\<AccountID>\config\localconfig.vdf`: saves most steam settings
- `C:\Program Files (x86)\Steam\userdata\<AccountID>\<AppID>\remote\sharedconfig.vdf`: saves per-app/SteamUI config (and toast settings)

Means to automate the configuration we only use `localconfig.vdf`/`sharedconfig.vdf`. It's not possible to configure all settings from [#app-settings]() via the local files/registry but some of them.

## Steam CEF

`umpdc.dll` checks Steam's `RunningAppID` to see whether a game is running and terminates `steamwebhelper.exe` (runs CEF UI) while one is active. This can be used to avoid SteamWebHelper processes during gaming ("CEF is Chromium Embedded Framework, the browser engine Steam uses for web-based UI parts like the store, community, chat/friends, and other embedded web views."). Install it using the command below (replace `v5.0.2` with `v5.0.1` if x86 machine).

```powershell
$steam = (gp "HKCU:\Software\Valve\Steam").SteamPath
iwr "https://github.com/Aetopia/NoSteamWebHelper/releases/download/v5.0.2/umpdc.dll" -OutFile (Join-Path $steam "umpdc.dll")
```

## Steam Registry Values

All values steam queries (`HKCU\Software\Valve\Steam`):
```powershell
"HKCU\Software\Valve\Steam\ActiveProcess\ActiveUser","Type: REG_DWORD, Length: 4, Data: 0"
"HKCU\Software\Valve\Steam\ActiveProcess\SteamClientDll","Type: REG_SZ, Length: 90, Data: C:\Program Files (x86)\Steam\steamclient.dll"
"HKCU\Software\Valve\Steam\ActiveProcess\SteamClientDll64","Type: REG_SZ, Length: 94, Data: C:\Program Files (x86)\Steam\steamclient64.dll"
"HKCU\Software\Valve\Steam\ActiveProcess\Universe","Type: REG_SZ, Length: 14, Data: Public"
"HKCU\Software\Valve\Steam\ActiveProcess\pid","Type: REG_DWORD, Length: 4, Data: 3520"
"HKCU\Software\Valve\Steam\AlreadyRetriedOfflineMode","Type: REG_DWORD, Length: 4, Data: 0"
"HKCU\Software\Valve\Steam\Apps\2357570\Installed","Type: REG_DWORD, Length: 4, Data: 1"
"HKCU\Software\Valve\Steam\Apps\2357570\Running","Type: REG_DWORD, Length: 4, Data: 0"
"HKCU\Software\Valve\Steam\Apps\2357570\Updating","Type: REG_DWORD, Length: 4, Data: 0"
"HKCU\Software\Valve\Steam\AutoLoginUser","Type: REG_SZ, Length: 18, Data: <accountname>"
"HKCU\Software\Valve\Steam\CEFGPUBlocklistDisabled","Length: 16"
"HKCU\Software\Valve\Steam\CompletedOOBEStage1","Type: REG_DWORD, Length: 4, Data: 1"
"HKCU\Software\Valve\Steam\DPIScaling","Type: REG_DWORD, Length: 4, Data: 0"
"HKCU\Software\Valve\Steam\DWriteEnable","Type: REG_DWORD, Length: 4, Data: 0"
"HKCU\Software\Valve\Steam\DeviceFriendlyName","Length: 12"
"HKCU\Software\Valve\Steam\DeviceSavedHardwareID","Length: 20"
"HKCU\Software\Valve\Steam\EnableGamescopeComposer","Length: 16"
"HKCU\Software\Valve\Steam\EnableGamescopeComposerVR","Length: 16"
"HKCU\Software\Valve\Steam\FlushConfig","Length: 16"
"HKCU\Software\Valve\Steam\ForceOOBE","Length: 16"
"HKCU\Software\Valve\Steam\ForceOOBEStage2","Length: 16"
"HKCU\Software\Valve\Steam\GPUAccelWebViewsV3","Type: REG_DWORD, Length: 4, Data: 0"
"HKCU\Software\Valve\Steam\GamescopeEnableAppTargetRefreshRate2","Length: 16"
"HKCU\Software\Valve\Steam\H264HWAccel","Type: REG_DWORD, Length: 4, Data: 0"
"HKCU\Software\Valve\Steam\IgnoreCompatMode#Steam_WindowsCompat_Description_2","Length: 16"
"HKCU\Software\Valve\Steam\IgnoreCompatMode#Steam_WindowsCompat_Webhelper_2","Length: 16"
"HKCU\Software\Valve\Steam\Language","Type: REG_SZ, Length: 16, Data: english"
"HKCU\Software\Valve\Steam\OSVersionUnsupported","Length: 16"
"HKCU\Software\Valve\Steam\OverlayScaleInterface","Type: REG_DWORD, Length: 4, Data: 0"
"HKCU\Software\Valve\Steam\OverrideBrowserComposerMode","Length: 16"
"HKCU\Software\Valve\Steam\Restart","Type: REG_DWORD, Length: 4, Data: 0"
"HKCU\Software\Valve\Steam\RunningAppID","Type: REG_DWORD, Length: 4, Data: 0"
"HKCU\Software\Valve\Steam\SkinV5","Length: 12"
"HKCU\Software\Valve\Steam\SmoothScrollWebViews","Type: REG_DWORD, Length: 4, Data: 0"
"HKCU\Software\Valve\Steam\SourceModInstallPath","Type: REG_SZ, Length: 100, Data: C:\Program Files (x86)\Steam\steamapps\sourcemods"
"HKCU\Software\Valve\Steam\StartupMode","Type: REG_DWORD, Length: 4, Data: 7"
"HKCU\Software\Valve\Steam\StartupModeTmpIsValid","Type: REG_DWORD, Length: 4, Data: 0"
"HKCU\Software\Valve\Steam\steamglobal\Language","Type: REG_SZ, Length: 16, Data: english"
"HKCU\Software\Valve\Steam\SteamExe","Type: REG_SZ, Length: 78, Data: c:/program files (x86)/steam/steam.exe"
"HKCU\Software\Valve\Steam\SteamInstaller","Length: 12"
"HKCU\Software\Valve\Steam\SteamPath","Type: REG_SZ, Length: 58, Data: c:/program files (x86)/steam"
"HKCU\Software\Valve\Steam\SuppressAutoRun","Type: REG_DWORD, Length: 4, Data: 0"
```