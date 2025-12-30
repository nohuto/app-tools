# Steam Tool

| Option                                                                                 | Description                                                                                                                                                                                                            |
| -------------------------------------------------------------------------------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| **Clean up**                                                                           | Removes files *(logs, cache files...)*                                                                                                                                                                               |
| **Startup with parameters**                                                            | - Lets you create a batch<br> - Set the Start Up Location to `Libary`<br> - Disables features and reduces usage                                                                                                        |
| **Disable [Chromium Embedded Framework](https://github.com/Aetopia/NoSteamWebHelper)** | This seems to not work anymore. <br> - Automatically toggles the CEF depending if a game is running or not<br> - There will also be '**Steam WebHelper**' in your taskbar, which lets you toggle it manually<br> With CEF:<br>![](https://github.com/nohuto/app-tools/blob/main/steam/media/cef.png?raw=true)<br> Without CEF:<br>![](https://github.com/nohuto/app-tools/blob/main/steam/media/cefoff.png?raw=true) |
| **Registry Values**                                                                    | Adds some registry values, which are read (Interface settings)                                                                                                                                                       |

Command line options for games/steam:
> https://developer.valvesoftware.com/wiki/Command_line_options#Steam_.28Windows.29  
> [Command Lines Options Excel Sheet](https://github.com/nohuto/app-tools/blob/main/steam/files/Steam-Commands.xlsx)  

## Steam Trace

All values steam reads on startup (`HKCU\Software\Valve\Steam`):
```c
"HKCU\Software\Valve\Steam\ActiveProcess\pid","Type: REG_DWORD, Length: 4, Data: 10056"
"HKCU\Software\Valve\Steam\Language","Length: 12"
"HKCU\Software\Valve\Steam\Language","Type: REG_SZ, Length: 16, Data: english"
"HKCU\Software\Valve\Steam\FlushConfig","Length: 16"
"HKCU\Software\Valve\Steam\DPIScaling","Type: REG_DWORD, Length: 4, Data: 0"
"HKCU\Software\Valve\Steam\StartupMode","Type: REG_DWORD, Length: 4, Data: 0"
"HKCU\Software\Valve\Steam\StartupModeTmpIsValid","Type: REG_DWORD, Length: 4, Data: 0"
"HKCU\Software\Valve\Steam\steamglobal\Language","Length: 12"
"HKCU\Software\Valve\Steam\steamglobal\Language","Type: REG_SZ, Length: 16, Data: english"
"HKCU\Software\Valve\Steam\OverrideBrowserComposerMode","Length: 16"
"HKCU\Software\Valve\Steam\CEFGPUBlocklistDisabled","Length: 16"
"HKCU\Software\Valve\Steam\GPUAccelWebViewsV3","Type: REG_DWORD, Length: 4, Data: 0"
"HKCU\Software\Valve\Steam\H264HWAccel","Type: REG_DWORD, Length: 4, Data: 0"
"HKCU\Software\Valve\Steam\SmoothScrollWebViews","Type: REG_DWORD, Length: 4, Data: 0"
"HKCU\Software\Valve\Steam\SkinV5","Length: 140"
"HKCU\Software\Valve\Steam\DWriteEnable","Type: REG_DWORD, Length: 4, Data: 0"
"HKCU\Software\Valve\Steam\IgnoreCompatMode#Steam_WindowsCompat_Description_2","Length: 16"
"HKCU\Software\Valve\Steam\IgnoreCompatMode#Steam_WindowsCompat_Webhelper_2","Length: 16"
"HKCU\Software\Valve\Steam\ActiveProcess\SteamClientDll","Type: REG_SZ, Length: 90, Data: C:\Program Files (x86)\Steam\steamclient.dll"
"HKCU\Software\Valve\Steam\ActiveProcess\pid","Type: REG_DWORD, Length: 4, Data: 9672"
"HKCU\Software\Valve\Steam\ForceOOBE","Length: 16"
"HKCU\Software\Valve\Steam\AutoLoginUser","Length: 12"
"HKCU\Software\Valve\Steam\AutoLoginUser","Type: REG_SZ, Length: 18, Data: noxi1305"
"HKCU\Software\Valve\Steam\OSVersionUnsupported","Length: 16"
"HKCU\Software\Valve\Steam\OverlayScaleInterface","Type: REG_DWORD, Length: 4, Data: 0"
"HKCU\Software\Valve\Steam\GamescopeEnableAppTargetRefreshRate2","Length: 16"
"HKCU\Software\Valve\Steam\SteamInstaller","Length: 12"
```

## In-App Settings

![](https://github.com/nohuto/app-tools/blob/main/steam/media/steam1.png?raw=true)
![](https://github.com/nohuto/app-tools/blob/main/steam/media/steam2.png?raw=true)
![](https://github.com/nohuto/app-tools/blob/main/steam/media/steam3.png?raw=true)
![](https://github.com/nohuto/app-tools/blob/main/steam/media/steam4.png?raw=true)

---

Miscellaneous notes:

```c
// .vdf = Valve Data Format, used by Valve's engine
"C:\Program Files (x86)\Steam\userdata\ID\7\remote\sharedconfig.vdf"
"C:\Program Files (x86)\Steam\userdata\ID\config\localconfig.vdf"
"C:\Program Files (x86)\Steam\config\config.vdf"
```
Options don't exist by default, like:
```c
// localconfig.vdf

    "Broadcast"
    {
        "Permissions"        "0"
        "FirstTimeComplete"        "1"
    }
    "streaming_v2"
    {
        "EnableStreaming"        "0"
    }

    "LibraryLowBandwidthMode"        "1"
    "LibraryLowPerfMode"        "1"
    "LibraryDisableCommunityContent"        "1"
    "ReadyToPlayIncludesStreaming"        "0"
    "news"
    {
        "NotifyAvailableGames"        "0"
    }
    "LibraryDisplaySize"        "1"
    "SteamController_PSSupport"        "0"
    "Controller_CheckGuideButton"        "0"

        "Notifications_ShowIngame"        "0"
        "Notifications_ShowOnline"        "0"
        "Notifications_ShowMessage"        "0"
        "Notifications_EventsAndAnnouncements"        "0"
        "Sounds_PlayIngame"        "0"
        "Sounds_PlayOnline"        "0"
        "Sounds_PlayMessage"        "0"
        "Sounds_EventsAndAnnouncements"        "0"
        "ChatFlashMode"        "2"

    "system"
    {
        "EnableGameOverlay"        "0"
    }

// sharedconfig.vdf

    "PlaySoundOnToast"        "0"
    "DisableAllToasts"        "1"
    "DisableToastsInGame"        "1"
```

> https://developer.valvesoftware.com/wiki/KeyValues

## Download

It might fail execution if the powershell execution policy is set to it's default values. See [PS Unrestricted Policy](https://github.com/nohuto/win-config/blob/main/security/desc.md#ps-unrestricted-policy) for details.

> [steam/NV-Steam-Tool](https://github.com/nohuto/app-tools/blob/main/steam/NV-Steam-Tool.ps1)