$html = Get-Content "C:\Projects\POEbot\knowledge_cache\sources\poe2db_ascendancy_raw.html" -Raw

$pattern = '(?s)<a class="PassiveSkills"[^>]*>([^<]+)</a></div><div class="property">Ascendancy:\s*<span[^>]*><a[^>]*>([^<]+)</a></span></div><div class="property">Character:\s*<span[^>]*><a[^>]*>([^<]+)</a></span></div><div class="separator"></div>(.*?)(?=</div></div></div></div>|<div class="col">|$)'

$matches = [regex]::Matches($html, $pattern)
$grouped = @{}

foreach ($m in $matches) {
    $passiveName = $m.Groups[1].Value.Trim()
    $ascendancy = $m.Groups[2].Value.Trim()
    $character = $m.Groups[3].Value.Trim()
    $rawMods = $m.Groups[4].Value
    
    # Clean HTML tags and entities
    $cleanMods = ($rawMods -replace '<div[^>]*>', "`n* " -replace '</div>', '' -replace '<[^>]+>', '' -replace '&nbsp;', ' ' -replace '&#39;', "'").Trim()
    # Normalize bullet points
    $cleanLines = ($cleanMods -split "`n") | ForEach-Object {
        $line = $_.Trim()
        if ($line.StartsWith("*")) { $line } elseif ($line) { "* $line" } else { "" }
    } | Where-Object { $_ -ne "" }
    $cleanModsFormatted = $cleanLines -join "`n"

    if (-not $grouped.ContainsKey($ascendancy)) {
        $grouped[$ascendancy] = @{
            Character = $character
            Nodes = @()
        }
    }
    
    $grouped[$ascendancy].Nodes += [PSCustomObject]@{
        Name = $passiveName
        Mods = $cleanModsFormatted
    }
}

# Curated key facts (approved by Andi, POEbot project). These are injected at the TOP of the
# generated ascendancy file so that GENERAL questions about the ascendancy always surface them.
# Keep this map here so re-running this generator never wipes curated facts.
$curatedKeyFacts = @{
    'Disciple of Varashta' = @(
        'The **djinns** that the **Disciple of Varashta** ascendancy can summon **only scale with skill tree nodes, skills, and skill gems that have the `minion` tag**. (Detail: `knowledge_cache/raw/classes/ascendancies/disciple_of_varashta_djinn_scaling.md`)'
    )
}

$outDir = "C:\Projects\POEbot\knowledge_cache\raw\classes\ascendancies"
if (-not (Test-Path $outDir)) {
    New-Item -ItemType Directory -Path $outDir -Force | Out-Null
}

foreach ($asc in $grouped.Keys | Sort-Object) {
    $char = $grouped[$asc].Character
    $slug = ($asc.ToLower() -replace '\s+', '_') + ".md"
    $filePath = Join-Path $outDir $slug
    
    $sb = [System.Text.StringBuilder]::new()
    [void]$sb.AppendLine("# Path of Exile 2: $asc (Ascendancy Class)")
    [void]$sb.AppendLine("")
    [void]$sb.AppendLine("* **Base Class:** $char")
    [void]$sb.AppendLine("* **Source:** PoE2DB (`https://poe2db.tw/us/$($asc -replace ' ', '_')`)")
    [void]$sb.AppendLine("")
    [void]$sb.AppendLine("---")
    [void]$sb.AppendLine("")
    if ($curatedKeyFacts.ContainsKey($asc)) {
        [void]$sb.AppendLine("## Key Facts (ALWAYS INCLUDE in any answer about this ascendancy)")
        [void]$sb.AppendLine("")
        foreach ($fact in $curatedKeyFacts[$asc]) {
            [void]$sb.AppendLine("* **KEY FACT:** $fact")
        }
        [void]$sb.AppendLine("")
        [void]$sb.AppendLine("---")
        [void]$sb.AppendLine("")
    }
    [void]$sb.AppendLine("## Ascendancy Passive Skills & Keystones")
    [void]$sb.AppendLine("")
    
    foreach ($node in $grouped[$asc].Nodes) {
        [void]$sb.AppendLine("### $($node.Name)")
        [void]$sb.AppendLine($node.Mods)
        [void]$sb.AppendLine("")
    }
    
    Set-Content -Path $filePath -Value $sb.ToString() -Encoding UTF8
    Write-Output "Generated: $slug with $($grouped[$asc].Nodes.Count) nodes"
}

