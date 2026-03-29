# LGHUB Configuration

There're two scenarios, first is that you only have a logitech mouse, if so use [OMM](https://support.logi.com/hc/en-us/articles/360059641133-Onboard-Memory-Manager) instead. Otherwise if you've more than a mouse from logitech you might need LGHub to configure other devices (e.g. headphones). After doing so, enable OMM for your mouse, use the app settings & disable LGHub using the toggle script.

## App Settings

- Devices
  - Enable OMM
- General Settings
  - General
    - `Launch app on login`: Off
    - `Automatically disable lightning`: On
    - `Game lightning control`: Off
    - `Recommendations`: Off
  - Beta Features
    - `Games`: Off (prevent sharing analytics/logs)
  - Analytics
    - `Share my usage data`: Off
    - `Send error logs automatically when G HUB encounters issues`: Off

## [LGHUB Toggle](https://github.com/nohuto/app-tools/blob/main/assets/LGHUB-Toggle.ps1)

Script which enables/disables the `LGHUBUpdaterService` service and other drivers. The `Enable LGHub` option only enables `LGHUBUpdaterService` since the other drivers aren't required for it to work.

The use case of this script is to disable LGHUB when you're not using it and to enable it when you want, for example, to configure equalizer settings for headphones.

Disables/removes:
- `LGHUBUpdaterService` (lghub_updater.exe)
- `logi_joy_bus_enum`: virtual bus enumerator driver, creates the virtual bus used for G HUB's synthetic/input translation features
- `logi_joy_vir_hid`: virtual HID driver, exposes virtual Logitech input devices on that bus
- LGHUB from Startup (doesn't exist if `Launch app on login` = off)