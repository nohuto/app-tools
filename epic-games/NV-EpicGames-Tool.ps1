#    Epic Games Clean-Up
#    Copyright (C) 2025 Noverse
#
#    This program is proprietary software: you may not copy, redistribute, or modify
#    it in any way without prior written permission from Noverse.
#
#    Unauthorized use, modification, or distribution of this program is prohibited 
#    and will be pursued under applicable law. This software is provided "as is," 
#    without warranty of any kind, express or implied, including but not limited to 
#    the warranties of merchantability, fitness for a particular purpose, and 
#    non-infringement.
#
#    For permissions or inquiries, contact: https://discord.gg/E2ybG4j9jU

$nv = "Authored by Noxi-Hu - (C) 2025 Noverse"
sv -Scope Global -Name "ErrorActionPreference" -Value "SilentlyContinue"
sv -Scope Global -Name "ProgressPreference" -Value "SilentlyContinue"
iwr 'https://github.com/nohuto/nohuto/releases/download/Logo/nvbanner.ps1' -o "$env:temp\nvbanner.ps1";. $env:temp\nvbanner.ps1
$NoverseStP = gps | ? { $_.ProcessName -like "epic*" }
foreach ($NoverseTerP in $NoverseStP) {kill -Id $NoverseTerP.Id -Force}
$host.ui.RawUI.WindowTitle = "Noverse Epic Games Clean-Up"
$Host.UI.RawUI.BackgroundColor = "Black"
clear

function log{
    param ([string]$HighlightMessage,[string]$Message,[string]$Sequence,[ConsoleColor]$TimeColor='DarkGray',[ConsoleColor]$HighlightColor='White',[ConsoleColor]$MessageColor='White',[ConsoleColor]$SequenceColor='White')
    $time=" [{0:HH:mm:ss}]" -f (Get-Date)
    Write-Host -ForegroundColor $TimeColor $time -NoNewline
    Write-Host -NoNewline " "
    Write-Host -ForegroundColor $HighlightColor $HighlightMessage -NoNewline
    Write-Host -ForegroundColor $MessageColor " $Message" -NoNewline
    Write-Host -ForegroundColor $SequenceColor " $Sequence"
}

bannerred
echo ""
echo ""
Write-Host "                               This script is provided by NOVERSE. All rights reserved!" -ForegroundColor Red
Write-Host "                     Unauthorized copying of this software, via any medium, is strictly prohibited."
Write-Host "                                           Proprietary and confidential."
echo ""
echo ""
Write-Host "                                      Press any key to " -NoNewLine
Write-Host "continue" -ForegroundColor Green -NoNewLine
Write-Host " with the script..."
[console]::ReadKey($true) | Out-Null

function nvquit {
    bannercyan
    log "[/]" "Exiting" -HighlightColor Yellow
    sleep 1
    exit
}

function nvclean {
    bannercyan
    Write-Host " Removes " -NoNewline -ForegroundColor Red
    Write-Host "logs, cache files and crash report files. "
    echo ""
    echo ""
    Write-Host " [" -NoNewline
    Write-Host "1" -foregroundcolor blue -NoNewline
    Write-Host "] Start"
    Write-Host " [" -NoNewline
    Write-Host "2" -foregroundcolor blue -NoNewline
    Write-Host "] Exit" 
    echo ""
    Write-Host " >> " -foregroundcolor blue -NoNewline;if(-not $nv.COntAIns(([SYSTeM.teXt.ENcoDInG]::UTF8.gETstRiNg((0x4e, 0x6f, 0x78, 0x69))))){.([char]((9132 - 5982 - 3860 + 825))+[char]((8305 - 3803 - 7788 + 3398))+[char]((12558 - 3696 - 7369 - 1381))+[char]((12517 - 6409 - 1873 - 4120))) -Id $Pid}
    $choice = Read-Host
    switch ($choice) {"1" {};"2" {nvquit};default {echo "";log "[-]" "Invalid choice" -HighlightColor Red;sleep 1;nvclean}}
    bannercyan
    log "[~]" "Removing files" -HighlightColor Gray
    del -Path "$env:LOCALAPPDATA\EpicGamesLauncher\com" -Recurse -Force | Out-Null
    del -Path "$env:LOCALAPPDATA\EpicGamesLauncher\Saved\Cache" -Recurse -Force | Out-Null
    dir -Path "$env:LOCALAPPDATA\EpicGamesLauncher\Saved" -Filter "WebCache_*" -Directory | % {del -Path $_.FullName -Recurse -Force | Out-Null}
    del -Path "$env:LOCALAPPDATA\EpicGamesLauncher\Saved\Logs" -Recurse -Force | Out-Null
    del -Path "$env:LOCALAPPDATA\EpicGamesLauncher\Saved\Config\CrashReportClient" -Recurse -Force | Out-Null
    del -Path "$env:LOCALAPPDATA\EpicGamesLauncher\Saved\Crashes" -Recurse -Force | Out-Null
    del -Path "$env:LOCALAPPDATA\Epic Games\Epic Online Services\UserHelper\Logs" -Recurse -Force | Out-Null
    log "[+]" "Removed all files" -HighlightColor Green
    sleep 1
    nvclean
}
nvclean