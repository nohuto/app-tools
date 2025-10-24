#    LGHUB Switcher
#    Copyright (C) 2025 Noverse

$host.ui.RawUI.WindowTitle = "Noverse LGHUB Switcher"
$Host.UI.RawUI.BackgroundColor = "Black"
sv -Scope Global -Name "ErrorActionPreference" -Value "SilentlyContinue"
cls

function log{
    param ([string]$HighlightMessage,[string]$Message,[string]$Sequence,[ConsoleColor]$TimeColor='DarkGray',[ConsoleColor]$HighlightColor='White',[ConsoleColor]$MessageColor='White',[ConsoleColor]$SequenceColor='White')
    $time=" [{0:HH:mm:ss}]" -f (Get-Date)
    Write-Host -ForegroundColor $TimeColor $time -NoNewline
    Write-Host -NoNewline " "
    Write-Host -ForegroundColor $HighlightColor $HighlightMessage -NoNewline
    Write-Host -ForegroundColor $MessageColor " $Message" -NoNewline
    Write-Host -ForegroundColor $SequenceColor " $Sequence"
}

function nvmain {
    cls
    Write-Host ""
    Write-Host " [" -Nonewline
    Write-Host "1" -Nonewline -ForegroundColor Blue
    Write-Host "] Enable LGHub"
    Write-Host " [" -Nonewline
    Write-Host "2" -Nonewline -ForegroundColor Blue
    Write-Host "] Disable LGHub"
    Write-Host " [" -Nonewline
    Write-Host "3" -Nonewline -ForegroundColor Blue
    Write-Host "] Exit"
    Write-Host ""
    Write-Host " >> " -ForegroundColor Blue -NoNewline
    $choice = Read-Host
    switch ($choice) {
        "1" {
            echo ""
            Set-Service -Name LGHUBUpdaterService -StartupType Manual | Out-Null
            log "[+]" "Set startup to manual" "LGHUBUpdaterService" -HighlightColor Green -SequenceColor DarkGray
            savs -Name LGHUBUpdaterService | Out-Null
            log "[+]" "Started service" "LGHUBUpdaterService" -HighlightColor Green -SequenceColor DarkGray
            sleep 1
            nvmain
        }
        "2" {
            echo ""
            spsv -Name LGHUBUpdaterService | Out-Null
            log "[+]" "Stopped" "LGHUBUpdaterService" -HighlightColor Green -SequenceColor DarkGray
            sp -Path "HKLM:\SYSTEM\CurrentControlSet\Services\LGHUBUpdaterService" -Name Start -Value 4 | Out-Null
            log "[+]" "Disabled" "LGHUBUpdaterService" -HighlightColor Green -SequenceColor DarkGray
            sp -Path "HKLM:\SYSTEM\CurrentControlSet\Services\logi_joy_bus_enum" -Name Start -Value 4 | Out-Null
            log "[+]" "Disabled" "logi_joy_bus_enum" -HighlightColor Green -SequenceColor DarkGray
            sp -Path "HKLM:\SYSTEM\CurrentControlSet\Services\logi_joy_vir_hid" -Name Start -Value 4 | Out-Null
            log "[+]" "Disabled" "logi_joy_vir_hid" -HighlightColor Green -SequenceColor DarkGray
            sp -Path "HKLM:\SYSTEM\CurrentControlSet\Services\logi_lamparray_service" -Name Start -Value 4 | Out-Null
            log "[+]" "Disabled service" "logi_lamparray_service" -HighlightColor Green -SequenceColor DarkGray
            rp -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Run" -Name "Lghub" | Out-Null
            log "[+]" "Removed autostart" "Lghub" -HighlightColor Green -SequenceColor DarkGray
            sleep 1
            nvmain
        }
        "3" {echo "";log "[/]" "Exiting" -HighlightColor Yellow;sleep 1;exit}
        default {
            echo ""
            log "[-]" "Invalid input" -HighlightColor Red
            sleep 1
            nvmain
        }
    }
}
nvmain