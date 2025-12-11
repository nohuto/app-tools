# Discord Tool

| Option      |        Description     |      Details         |
| ------------------ | ------------------ | ------------------ |
| **Debloat (Discord)**                | Removes older Discord versions, modules, language packs, update files *(choice)*, and more.                                   | 200% DPI scaling won't work afterwards|
| **Debloat (Equibop)**                | Removes language packs, Vulkan-related files, logs, etc.                                                                      | 200% DPI scaling won't work afterwards|
| **Optimized Settings (Discord)**     | Optimizes the settings in the `settings.json` file                                                                            | -|
| **Clean up (Discord)**               | Removes files *(logs, cache files, cookies...)*| -|
| **Equibop Installer (Vesktop fork)** | Automatically installs [Equibop](https://github.com/Equicord/Equibop), a Vesktop fork with enhanced features and performance. | **Equibop Features**<br>- Custom CSS and Themes<br>- Huge amount of plugins (more than Vesktop)<br>- Much more lightweight and faster than the official app<br><br>**Other Custom Clients**<br>- [Legcord](https://github.com/Legcord/Legcord)<br>- [Vesktop](https://github.com/Vencord/Vesktop)<br><br>**Other Discord Mods**<br>- [OpenAsar](https://github.com/GooseMod/OpenAsar)<br>- [Vencord](https://github.com/Vendicated/Vencord)<br><br>**Discord Themes**<br>- [Discord 2016](https://github.com/XYZenix/DTM-16)<br>- [Pastel Themes](https://github.com/catppuccin/discord)<br>- [Skeuomorphic Theme](https://github.com/Marda33/SkeuoCord)<br>- [More Themes](https://betterdiscord.app/themes) ([*](https://github.com/search?q=Discord%20Themes&type=repositories))<br><br>**Plugins**<br>`DisableDeepLinks`, `GitHubRepos`, `DisableAnimations`, `Translate`, `NoOnboardingDelay`, `MemberCount`, `FixImagesQuality`, `ClearURLs`, `BetterSettings`, ...<br>*(There are many more, names taken from `settings.json`)* |

Add it on your own, if wanted (`CTRL` + `SHIFT` + `I` -> dev console):

```c
"DANGEROUS_ENABLE_DEVTOOLS_ONLY_ENABLE_IF_YOU_KNOW_WHAT_YOURE_DOING": true
```

## In-App Settings

The `Game Overlay` should also be disabled, but the tool disables it anyway.

![](https://github.com/nohuto/app-tools/blob/main/discord/media/discord.png?raw=true)

## Download

It might fail execution if the powershell execution policy is set to it's default values. See [PS Unrestricted Policy](https://github.com/nohuto/win-config/blob/main/security/desc.md#ps-unrestricted-policy) for details.

> [discord/NV-Discord-Tool](https://github.com/nohuto/app-tools/blob/main/discord/NV-Discord-Tool.ps1)