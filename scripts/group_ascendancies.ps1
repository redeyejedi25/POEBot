$html = Get-Content "C:\Users\andis\OneDrive\Documents\Projects\POEbot\knowledge_cache\sources\poe2db_ascendancy_raw.html" -Raw

# Match each passive skill col block:
# Contains: PassiveSkills link, Ascendancy, Character, and the mod text (implicitMod or explicitMod)
$pattern = '(?s)<a class="PassiveSkills"[^>]*>([^<]+)</a></div><div class="property">Ascendancy:\s*<span[^>]*><a[^>]*>([^<]+)</a></span></div><div class="property">Character:\s*<span[^>]*><a[^>]*>([^<]+)</a></span></div><div class="separator"></div>(.*?)(?=</div></div></div></div>|<div class="col">|$)'

$matches = [regex]::Matches($html, $pattern)
Write-Output "Total passive blocks matched: $($matches.Count)"

$grouped = @{}
foreach ($m in $matches) {
    $passiveName = $m.Groups[1].Value.Trim()
    $ascendancy = $m.Groups[2].Value.Trim()
    $character = $m.Groups[3].Value.Trim()
    $rawMods = $m.Groups[4].Value
    
    # Clean HTML tags and entities
    $cleanMods = ($rawMods -replace '<div[^>]*>', "`n* " -replace '</div>', '' -replace '<[^>]+>', '' -replace '&nbsp;', ' ' -replace '&#39;', "'").Trim()
    
    if (-not $grouped.ContainsKey($ascendancy)) {
        $grouped[$ascendancy] = @{
            Character = $character
            Nodes = @()
        }
    }
    
    $grouped[$ascendancy].Nodes += [PSCustomObject]@{
        Name = $passiveName
        Mods = $cleanMods
    }
}

foreach ($asc in $grouped.Keys | Sort-Object) {
    Write-Output "Ascendancy '$asc' ($($grouped[$asc].Character)): $($grouped[$asc].Nodes.Count) nodes"
}
