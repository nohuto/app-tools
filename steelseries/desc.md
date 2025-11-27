# SteelSeries Debloat

It was made for fun, if you're using SS for something else than your keyboard, don't use it. The script is pretty simple to understand, if you want to modify the debloat process just add the file/folder names to the vars.

It'll break:
- Moments (capture & sound tab shows error)
- Cloud sync
- Sonar (reinstalls itself if using it)
- 3D aim trainer
- Uninstall executable (add the file name to the list, to prevent it)
- All languages (only leaves english)
- All apps except of Engine
- Game overlay
- CV GameSense
- Low battery sounds
- `SteelSeries_Sonar_VAD` service
- `SteelSeriesGGUpdateServiceProxy` service

> Backup the `GG` folder in your SteelSeries folder (`%programfiles%\SteelSeries`)

## Comparison

![](https://github.com/5Noxi/app-tools/blob/main/steelseries/media/ssbefore.png?raw=true)
![](https://github.com/5Noxi/app-tools/blob/main/steelseries/media/ssafter.png?raw=true)

## In-App Settings

![](https://github.com/5Noxi/app-tools/blob/main/steelseries/media/steel1.png?raw=true)
![](https://github.com/5Noxi/app-tools/blob/main/steelseries/media/steel2.png?raw=true)
![](https://github.com/5Noxi/app-tools/blob/main/steelseries/media/steel3.png?raw=true)
![](https://github.com/5Noxi/app-tools/blob/main/steelseries/media/steel4.png?raw=true)

## Download

It might fail execution if the powershell execution policy is set to it's default values. See [PS Unrestricted Policy](https://github.com/5Noxi/win-config/blob/main/security/desc.md#ps-unrestricted-policy) for details.

> [steelseries/NV-SteelSeries-Tool](https://github.com/5Noxi/app-tools/blob/main/steelseries/NV-SteelSeries-Tool.ps1)