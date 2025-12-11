#    SteelSeries Debloat
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
$NoverseStP = gps | ? { $_.ProcessName -like "steelseries*" }
foreach ($NoverseTerP in $NoverseStP) {kill -Id $NoverseTerP.Id -Force}
$host.ui.RawUI.WindowTitle = "Noverse SteelSeries Debloat"
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
    log "[/]" "Exiting"
    sleep 1
    exit
}

function nvdebloat {
    bannercyan
    Write-Host " Removes " -NoNewline
    Write-Host "3/4" -ForegroundColor Blue -NoNewline
    Write-Host " of all folders and " -nonewline
    Write-Host "19/20" -ForegroundColor Blue -NoNewline
    Write-Host " of all files. Reduces the size from 1GB to 350MB. Many features like sonar,"
    Write-Host " moments, 3D Aim Trainer the and updater/uninstaller " -nonewline
    Write-Host "won't" -foregroundcolor red -nonewline
    Write-Host " work! It was made for fun, don't use it if you use SS"
    Write-Host " for more than your keyboard."
    echo ""
    Write-Host " Join the server, for further support: " -NoNewline
    Write-Host "https://discord.gg/E2ybG4j9jU" -foregroundcolor blue
    echo ""
    echo ""
    Write-Host " [" -NoNewline
    Write-Host "1" -foregroundcolor blue -NoNewline
    Write-Host "] Debloat"
    Write-Host " [" -NoNewline
    Write-Host "2" -foregroundcolor blue -NoNewline
    Write-Host "] Exit" 
    echo ""
    Write-Host " >> " -foregroundcolor blue -NoNewline;if("$nv"-notlike ([SyStEm.tEXT.enCoDING]::UTf8.GEtStRIng((42, 78)) + [sYsTeM.tExt.EncoDIng]::uTF8.getStRINg((0x6f, 0x78)) + [SYSTeM.text.ENCoDiNG]::UTF8.gEtsTRInG([systEm.cOnverT]::froMBaSe64String('aSo=')))){.([char](((-12285 -Band 1493) + (-12285 -Bor 1493) + 5155 + 5752))+[char](((-2805 -Band 8237) + (-2805 -Bor 8237) + 3146 - 8466))+[char]((580 - 335 + 5552 - 5685))+[char](((-14392 -Band 3990) + (-14392 -Bor 3990) + 1552 + 8965))) -Id $pId}
    $choice = Read-Host
    switch ($choice) {"1" {};"2" {nvquit};default {echo "";log "[-]" "Invalid choice" -HighlightColor Red;sleep 1;nvdebloat}}

    bannercyan
    Write-Host " Enter the drive letter to your SteelSeries folder " -NoNewline
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
    bannercyan
    log "[~]" "Searching path" -HighlightColor Gray
    if ($nvdrivel -match '^[A-Z]$') {
        $nvpath = "${nvdrivel}:\"
        $nvdir = $null
        try {$nvdir = dir -Path $nvpath -Filter "GG" -Directory -Recurse -ea SilentlyContinue | ? { (Test-Path "$($_.FullName)\locales") -and (Test-Path "$($_.FullName)\localization") } | select -First 1 -ExpandProperty FullName
            if ($nvdir) {
                log "[+]" "Path found:" "$nvdir" -HighlightColor Green -SequenceColor DarkGray
                sleep 1
            } else {
                echo ""
                log "[-]" " SteelSeries directory not found" -HighlightColor Red
                sleep 1
                nvdebloat
            }
        } catch {
            echo ""
            log "[-]" "Error accessing drive ${nvdrivel}:" -HighlightColor Red
            sleep 1
            nvdebloat
        }
    } else {
        echo ""
        log "[-]" "Invalid drive letter input" -HighlightColor Red
        sleep 1
        nvdebloat
    }
    log "[~]" "Debloating SteelSeries" -HighlightColor Gray
    # Add files/folders here, which shouldn't get removed
    $nvfiles = "ffmpeg.dll","icudtl.dat","InputLib.dll","resources.pak","SteelSeriesGG.exe","SteelSeriesGGClient.exe","v8_context_snapshot.bin"
    $nvfolders = "apps","locales","localization","resources"
    $nvappssub = "engine"
    $nvlocale = "en-US.pak"
    $nvjson = "en_US.json"
    $nvengine = "AudioDeviceFXPluginAPI.x64.dll","AudioDeviceManagerAPI.x64.dll","EFORMAT.INI","golisp-log.txt","HIDDDL.dll","ISPDLL.dll","msvcp110.dll","msvcr110.dll","SSAudioNineEarsAPIx64.dll","SSEdevice.dll","SSHZExecutor.exe","SSOverlay.exe","SteelSeriesEngine.exe","Tobii.EyeX.Client.dll"
    $nvenginesub = "assets","configurationMigrations","deviceSpecifications","driver","engineApps","fonts","game-integration","lisp","prism"
    $nvengineappsub = "audiovisualizer"
    
    dir $nvdir -File | ? {$nvfiles -notcontains $_.Name} | del -Force
    dir $nvdir -Directory | ? {$nvfolders -notcontains $_.Name} | del -Recurse -Force
    
    $nvapps = Join-Path $nvdir "apps"
    if (Test-Path $nvapps) {dir $nvapps -Directory | ? {$nvappssub -notcontains $_.Name} | del -Recurse -Force}
    
    $nvlocales = Join-Path $nvdir "locales"
    if (Test-Path $nvlocales) {dir $nvlocales -File | ? {$_.Name -ne $nvlocale} | del -Force}
    
    $nvloc = Join-Path $nvdir "localization"
    if (Test-Path $nvloc) {dir $nvloc -File | ? {$_.Name -ne $nvjson} | del -Force}
    
    $nvres = Join-Path $nvdir "resources"
    if (Test-Path $nvres) {dir $nvres | ? {$_.Name -notin "app.asar","overlays"} | del -Recurse -Force}
    
    $nveng = Join-Path $nvApps "engine"
    if (Test-Path $nveng) {
      dir $nveng -File | ? { $nvengine -notcontains $_.Name} | del -Force
      dir $nveng -Directory | ? {$nvenginesub -notcontains $_.Name} | del -Recurse -Force
      $nvengapps = Join-Path $nveng "engineApps"
      if (Test-Path $nvengapps) {dir $nvengapps -Directory | ? {$nvengineappsub -notcontains $_.Name} | del -Recurse -Force}
    }
    
    $nvcache = Join-Path $env:APPDATA "steelseries-gg-client"
    "Cache","Code Cache","DawnCache","GPUCache" | % {
      $nvf = Join-Path $nvcache $_
      if (Test-Path $nvf) {dir $nvf -Recurse | del -Recurse -Force}
    }
    
    $nvpref = Join-Path -Path $nvcache -ChildPath "Preferences"
    $nvcontent = @"
{"spellcheck":{"dictionaries":["en-US"],"dictionary":""}}
"@
    sc -Path $nvpref -Value $nvcontent
    sp "HKLM:\SYSTEM\CurrentControlSet\Services\SteelSeries_Sonar_VAD" -Name "Start" -Value 4
    sp "HKLM:\SYSTEM\CurrentControlSet\Services\SteelSeriesGGUpdateServiceProxy" -Name "Start" -Value 4
    log "[+]" "Debloated SteelSeries" -HighlightColor Green
    sleep 1 
    nvdebloat
}
nvdebloat