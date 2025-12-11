# Epic Games Clean-Up

| Option       | Description                                       |
| ------------ | ------------------------------------------------- |
| **Clean up** | Removes logs, cache files, and crash report files.|

Epic Games Launcher alternative:
> https://github.com/derrod/legendary ([*](https://github.com/RareDevs/Rare))  

CL Arguments (UE):
> https://dev.epicgames.com/documentation/en-us/unreal-engine/command-line-arguments-in-unreal-engine  

Create your own launcher terminator - example using `FortniteClient-Win64-Shipping` (included in the [Fortnite Tool](https://github.com/nohuto/game-tools/blob/main/fortnite/NV-Fortnite-Tool.ps1)):
```ps
saps "com.epicgames.launcher://apps/fn%3A{CatalogItemId}%3AFortnite?action=launch&silent=true"
saps powershell -windowstyle hidden -argumentlist 'while ($true){if(gps FortniteClient-Win64-Shipping -ea silentlycontinue){kill -name EpicGamesLauncher -force -ea silentlycontinue;break};sleep 1}'
```
Replace `{CatalogItemId}` with your ID, which can be found in `%programdata%\Epic\EpicGamesLauncher\Data\Manifests` -> `.item` file.

Disable Epic Games related services:
```bat
reg add "HKLM\SYSTEM\CurrentControlSet\Services\EpicGamesUpdater" /v Start /t REG_DWORD /d 4 /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\EpicOnlineServices" /v Start /t REG_DWORD /d 4 /f
```

## In-App Settings

![](https://github.com/nohuto/app-tools/blob/main/epic-games/media/epic.png?raw=true)

---

Miscellaneous notes (ingore them).

```ini
[X_General]
MinimiseToSystemTray=False
NotificationsEnabled_FreeGame=False
NotificationsEnabled_Adverts=False

[X_Offline]
OfflineMode=False

[ChatSettings]
ShowNotifications=False
SoundEnabled=False
```

## Download

It might fail execution if the powershell execution policy is set to it's default values. See [PS Unrestricted Policy](https://github.com/nohuto/win-config/blob/main/security/desc.md#ps-unrestricted-policy) for details.

> [epic-games/NV-EpicGames-Tool](https://github.com/nohuto/app-tools/blob/main/epic-games/NV-EpicGames-Tool.ps1)