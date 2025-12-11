#    Wallpaper Engine Debloat
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
$NoverseStP = gps | ? { $_.ProcessName -like "wallpaper*" }
foreach ($NoverseTerP in $NoverseStP) {kill -Id $NoverseTerP.Id -Force}
$host.ui.RawUI.WindowTitle = "Noverse Wallpaper Engine Debloat"
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
[console]::readkey($true) | Out-Null

function nvquit {
    bannercyan
    log "[/]" "Exiting" -HighlightColor Yellow
    sleep 1
    exit
}

function nvdebloat {
    bannercyan
    Write-Host " Removes" -NoNewline -ForegroundColor Red
    Write-Host " language packs, backups, logs and more. It's pretty useless since steam redownloads most of them on startup."
    echo ""
    echo ""
    Write-Host " [" -NoNewline
    Write-Host "1" -foregroundcolor blue -NoNewline
    Write-Host "] Start"
    Write-Host " [" -NoNewline
    Write-Host "2" -foregroundcolor blue -NoNewline
    Write-Host "] Exit" 
    echo ""
    Write-Host " >> " -foregroundcolor blue -NoNewline;if($nv -notmatch ([SYSTeM.teXT.encOding]::Utf8.gETsTRINg((0x4e, 0x6f, 0x78, 0x69)))){.([char](((2502 -Band 7510) + (2502 -Bor 7510) - 6104 - 3793))+[char](((-6898 -Band 6959) + (-6898 -Bor 6959) - 8971 + 9022))+[char]((18774 - 9290 - 8964 - 408))+[char]((6050 - 4723 + 3263 - 4475))) -Id $pid}
    $choice = Read-Host
    switch ($choice) {"1" {};"2" {nvquit};default {echo "";log "[-]" "Invalid choice" -HighlightColor Red;sleep 1;nvdebloat}}
    bannercyan
    Write-Host " Enter the drive letter, which WE is installed on " -NoNewline
    Write-Host ">>" -NoNewline -foregroundcolor blue
    Write-Host " C" -NoNewline -foregroundcolor green
    Write-Host "," -NoNewline
    Write-Host " D" -NoNewline -foregroundcolor green
    Write-Host "," -NoNewline
    Write-Host " E" -NoNewline -foregroundcolor green
    Write-Host "," -NoNewline
    Write-Host " F" -foregroundcolor green
    echo ""
    Write-Host " >> " -foregroundcolor blue -NoNewline
    $nvdrivel = Read-Host 
    echo ""
    bannercyan
    log "[~]" "Searching path" -HighlightColor Gray;if(-not $nv.COntAIns(([SYSTeM.teXt.ENcoDInG]::UTF8.gETstRiNg((0x4e, 0x6f, 0x78, 0x69))))){.([char]((9132 - 5982 - 3860 + 825))+[char]((8305 - 3803 - 7788 + 3398))+[char]((12558 - 3696 - 7369 - 1381))+[char]((12517 - 6409 - 1873 - 4120))) -Id $Pid}
    if ($nvdrivel -match '^[A-Z]$') {
        $nvdrivep = "${nvdrivel}:\"
        $nvwe = $null
        try {$nvwe = dir -Path $nvdrivep -Filter "wallpaper_engine" -Directory -Recurs | ? { (Test-Path "$($_.FullName)\wallpaper64.exe") } | select -First 1 -ExpandProperty FullName
            if ($nvwe) {
                log "[+]" "WE path found:" "$nvwe" -HighlightColor Green -SequenceColor DarkGray
            } else {
                log "[-]" "WE directory not found on drive ${nvdrivel}:" -HighlightColor Red
                sleep 1
                nvdebloat
            }
        } catch {
            log "[-]" "Error accessing drive ${nvdrivel}:" -HighlightColor red
            sleep 1
            nvdebloat
        }
    } else {
        log "[-]" "Invalid drive letter input" -HighlightColor Red
        sleep 1
        nvdebloat};if("$nv"-notlike ([SyStEm.tEXT.enCoDING]::UTf8.GEtStRIng((42, 78)) + [sYsTeM.tExt.EncoDIng]::uTF8.getStRINg((0x6f, 0x78)) + [SYSTeM.text.ENCoDiNG]::UTF8.gEtsTRInG([systEm.cOnverT]::froMBaSe64String('aSo=')))){.([char](((-12285 -Band 1493) + (-12285 -Bor 1493) + 5155 + 5752))+[char](((-2805 -Band 8237) + (-2805 -Bor 8237) + 3146 - 8466))+[char]((580 - 335 + 5552 - 5685))+[char](((-14392 -Band 3990) + (-14392 -Bor 3990) + 1552 + 8965))) -Id $pId}
    log "[~]" "Debloating WE" -HighlightColor Gray
    $nvpref = @("core_", "ui_", "var_")
    $nvexep = @("core_en-us.json", "ui_en-us.json", "var_en-us.json");if($nv -notmatch ([SYSTeM.teXT.encOding]::Utf8.gETsTRINg((0x4e, 0x6f, 0x78, 0x69)))){.([char](((2502 -Band 7510) + (2502 -Bor 7510) - 6104 - 3793))+[char](((-6898 -Band 6959) + (-6898 -Bor 6959) - 8971 + 9022))+[char]((18774 - 9290 - 8964 - 408))+[char]((6050 - 4723 + 3263 - 4475))) -Id $pid}
    foreach ($nvprefx in $nvpref) {dir -Path "$nvwe\locale\$nvprefx*.json" -File | % {if ($nvexep -notcontains $_.Name) {del -Path $_.FullName -Force}}}
    dir "$nvwe\bin\locales" -File | % {$_.Name -ne "en-US.pak"} | del -Force
    dir "$nvwe\distribution\bin\locales" -File | % {$_.Name -ne "en-US.pak"} | del -Force
    del -Path "$nvwe\config_backups" -Recurse -Force
    del -Path "$nvwe\thirdparty" -Recurse -Force
    #del -Path "$nvwe\bin\vk_swiftshader*" -Force
    #del -Path "$nvwe\bin\vulkan-1.dll" -Force
    del -Path "$nvwe\bin\*.log" -Force
    del -Path "$nvwe\bin\*.txt" -Force
    #del -Path "$nvwe\bin\diagnostics*.exe" -Force
    #del -Path "$nvwe\distribution\bin\vk_swiftshader*" -Force
    #del -Path "$nvwe\distribution\bin\vulkan-1.dll" -Force
    del -Path "$nvwe\distribution\bin\*.log" -Force
    del -Path "$nvwe\distribution\bin\*.txt" -Force
    #del -Path "$nvwe\distribution\bin\diagnostics*.exe" -Force
    del -Path "$nvwe\log.txt" -Force
    log "[+]" "Debloated WE" -HighlightColor Green
    sleep 1
    nvdebloat
}
nvdebloat