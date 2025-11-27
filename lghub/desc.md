# LGHUB Switcher

Simple script which enables/disables the `LGHUBUpdaterService` service and other related ones. If you use the LG Hub software just for your mouse, use [onboard memory manager](https://support.logi.com/hc/en-us/articles/360059641133-Onboard-Memory-Manager) instead.

Disables/removes:_
- `LGHUBUpdaterService`
- `logi_joy_bus_enum`
- `logi_joy_vir_hid`
- `logi_lamparray_service`
- LGHUB from Startup

## In-App Settings

![](https://github.com/5Noxi/app-tools/blob/main/lghub/media/logi.png?raw=true)

## Download

It might fail execution if the powershell execution policy is set to it's default values. See [PS Unrestricted Policy](https://github.com/5Noxi/win-config/blob/main/security/desc.md#ps-unrestricted-policy) for details.

> [lghub/NV-LGHUB-Switch](https://github.com/5Noxi/app-tools/blob/main/lghub/NV-LGHUB-Switch.ps1)