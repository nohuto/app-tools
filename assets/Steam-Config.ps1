# Steam Configuration
# Copyright (C) 2026 Noverse

param([string[]]$paths)
#[console]::Title = "Noverse Steam Configuration"

class vdfnode { [System.Collections.Generic.List[object]]$entries = [System.Collections.Generic.List[object]]::new() }

class vdfentry {
    [string]$kind
    [string]$name
    [string]$value
    [vdfnode]$node
    vdfentry([string]$kind, [string]$name, [string]$value, [vdfnode]$node) {
        $this.kind = $kind; $this.name = $name; $this.value = $value; $this.node = $node
    }
}

function readstr([string]$text, [ref]$pos) {
    $chars = [System.Collections.Generic.List[char]]::new(); $null = $pos.Value++
    while ($pos.Value -lt $text.Length) {
        $char = $text[$pos.Value]
        if ($char -eq '\') {
            if ($pos.Value + 1 -ge $text.Length) { throw 'unterminated escape sequence' }
            $pos.Value++; $chars.Add($text[$pos.Value]); $null = $pos.Value++; continue
        }
        if ($char -eq '"') { $null = $pos.Value++; return -join $chars }
        $chars.Add($char); $null = $pos.Value++
    }
    throw 'unterminated string'
}

function skipws([string]$text, [ref]$pos) {
    while ($pos.Value -lt $text.Length) {
        $char = $text[$pos.Value]
        if ([char]::IsWhiteSpace($char)) { $null = $pos.Value++; continue }
        if ($char -eq '/' -and $pos.Value + 1 -lt $text.Length -and $text[$pos.Value + 1] -eq '/') {
            while ($pos.Value -lt $text.Length -and $text[$pos.Value] -notin "`r", "`n") { $null = $pos.Value++ }
            continue
        }
        break
    }
}

function parseobj([string]$text, [ref]$pos) {
    $node = [vdfnode]::new()
    while ($true) {
        skipws $text $pos
        if ($pos.Value -ge $text.Length) { throw 'unexpected end of file' }
        if ($text[$pos.Value] -eq '}') { $null = $pos.Value++; return $node }
        if ($text[$pos.Value] -ne '"') { throw "expected key at offset $($pos.Value)" }
        $name = readstr $text $pos; skipws $text $pos
        if ($pos.Value -ge $text.Length) { throw "missing value for '$name'" }
        if ($text[$pos.Value] -eq '{') {
            $null = $pos.Value++
            $node.entries.Add([vdfentry]::new('block', $name, $null, (parseobj $text $pos)))
            continue
        }
        if ($text[$pos.Value] -ne '"') { throw "expected string or block for '$name'" }
        $node.entries.Add([vdfentry]::new('value', $name, (readstr $text $pos), $null))
    }
}

function parsevdf([string]$text) {
    $pos = 0; skipws $text ([ref]$pos)
    if ($pos -ge $text.Length -or $text[$pos] -ne '"') { throw 'missing root key' }
    $name = readstr $text ([ref]$pos); skipws $text ([ref]$pos)
    if ($pos -ge $text.Length -or $text[$pos] -ne '{') { throw 'missing root block' }
    $pos++
    $tree = [pscustomobject]@{ name = $name; node = parseobj $text ([ref]$pos) }
    skipws $text ([ref]$pos)
    if ($pos -lt $text.Length) { throw "unexpected trailing content at offset $pos" }
    $tree
}

function esc([string]$text) { $text.Replace('\', '\\').Replace('"', '\"') }

function writenode([vdfnode]$node, [int]$depth) {
    $lines = [System.Collections.Generic.List[string]]::new(); $pad = "`t" * $depth
    foreach ($entry in $node.entries) {
        $name = esc $entry.name
        if ($entry.kind -eq 'value') { $lines.Add($pad + '"' + $name + '"' + "`t`t" + '"' + (esc $entry.value) + '"'); continue }
        $lines.Add($pad + '"' + $name + '"'); $lines.Add($pad + '{')
        foreach ($line in writenode $entry.node ($depth + 1)) { $lines.Add($line) }
        $lines.Add($pad + '}')
    }
    $lines
}

function writevdf($tree) {
    $lines = [System.Collections.Generic.List[string]]::new()
    $lines.Add('"' + (esc $tree.name) + '"'); $lines.Add('{')
    foreach ($line in writenode $tree.node 1) { $lines.Add($line) }
    $lines.Add('}')
    [string]::Join("`r`n", $lines) + "`r`n"
}

function findentry([vdfnode]$node, [string]$name) {
    for ($i = 0; $i -lt $node.entries.Count; $i++) { if ($node.entries[$i].name -ceq $name) { return $i } }
    -1
}

function ensureblock([vdfnode]$node, [string]$name) {
    $i = findentry $node $name
    if ($i -ge 0) {
        $entry = $node.entries[$i]
        if ($entry.kind -ne 'block') { throw "expected '$name' to be a block" }
        return $entry.node
    }
    $child = [vdfnode]::new()
    $node.entries.Add([vdfentry]::new('block', $name, $null, $child))
    $child
}

function setvalue([vdfnode]$node, [string]$name, [string]$value) {
    $i = findentry $node $name
    if ($i -ge 0) {
        $entry = $node.entries[$i]
        if ($entry.kind -ne 'value') { throw "expected '$name' to be a value" }
        $entry.value = $value
        return
    }
    $node.entries.Add([vdfentry]::new('value', $name, $value, $null))
}

function steamroot {
    $reg = Get-ItemProperty 'HKCU:\Software\Valve\Steam' -Name SteamPath -ErrorAction SilentlyContinue
    if ($reg.SteamPath) { return $reg.SteamPath }
    "${env:ProgramFiles(x86)}\Steam"
}

$settings = [ordered]@{
    Broadcast = [ordered]@{
        Permissions = '0'
        FirstTimeComplete = '1'
    }
    system = [ordered]@{
        displayratesasbits = '0'
        EnableGameOverlay = '0'
        InGameOverlayRestoreBrowserTabs = '0'
        InGameOverlayScreenshotNotification = '0'
        InGameOverlayScreenshotPlaySound = '0'
        NetworkingAllowShareIP = '1'
    }
    streaming_v2 = [ordered]@{
        EnableStreaming = '0'
    }
    friends = [ordered]@{
        SignIntoFriends = '0'
    }
    GameRecording = [ordered]@{
        BackgroundRecordMode = '0'
    }
    news = [ordered]@{
        NotifyAvailableGames = '0'
    }
    root = [ordered]@{
        LibraryLowBandwidthMode = '1'
        LibraryLowPerfMode = '1'
        LibraryDisableCommunityContent = '1'
        ReadyToPlayIncludesStreaming = '0'
        SteamController_Enable_Chord = '0'
        Controller_CheckGuideButton = '0'
        SteamController_PSSupport = '0'
    }
    Accessibility = [ordered]@{
        ReduceMotion = '1'
    }
}

$proc = Get-Process steam* -ErrorAction SilentlyContinue
if ($proc) { $proc | Stop-Process -Force }

if (-not $paths) {
    $paths = Get-ChildItem ((Join-Path (steamroot) 'userdata\*\config\localconfig.vdf')) -File -ErrorAction SilentlyContinue | ForEach-Object FullName
}

foreach ($path in $paths) {
    if (Test-Path $path) {
        $text = [System.IO.File]::ReadAllText($path, [System.Text.Encoding]::UTF8)
        $tree = parsevdf $text
    } else {
        $tree = [pscustomobject]@{ name = 'UserLocalConfigStore'; node = [vdfnode]::new() }
    }

    if ($tree.name -ne 'UserLocalConfigStore') { throw "unexpected root key '$($tree.name)' in $path" }

    $root = $tree.node
    foreach ($scope in $settings.Keys) {
        $node = if ($scope -eq 'root') { $root } else { ensureblock $root $scope }
        foreach ($name in $settings[$scope].Keys) { setvalue $node $name $settings[$scope][$name] }
    }

    if (Test-Path $path) { [System.IO.File]::Copy($path, "$path.bak", $true) }
    $tmp = "$path.tmp"
    [System.IO.File]::WriteAllText($tmp, (writevdf $tree), [System.Text.UTF8Encoding]::new($false))
    Move-Item -LiteralPath $tmp -Destination $path -Force
}



