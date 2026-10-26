$html = Get-Content "C:\Users\andis\OneDrive\Documents\Projects\POEbot\knowledge_cache\sources\poe2db_ascendancy_raw.html" -Raw

$idx = $html.IndexOf('id="AscendancyClasses"')
$endIdx = $html.IndexOf('id="AscendancyPassives"')
if ($endIdx -lt 0) { $endIdx = $html.IndexOf('id="Ascendancy"') }
$section = $html.Substring($idx, $endIdx - $idx)

# Find all blocks with character and ascendancies
$cols = [regex]::Matches($section, '(?s)<div class="col">(.*?)</div>\s*</div>\s*</div>')
Write-Output "Found Class Blocks: $($cols.Count)"

foreach ($col in $cols) {
    $text = $col.Groups[1].Value
    # Extract Base Class name
    $baseClassMatch = [regex]::Match($text, '<figcaption><a[^>]*>([^<]+)</a></figcaption>')
    $baseClass = $baseClassMatch.Groups[1].Value
    
    # Extract all Ascendancy links inside
    $ascMatches = [regex]::Matches($text, '<figcaption><a[^>]*href="(/us/|)([^"]+)"[^>]*>([^<]+)</a></figcaption>')
    $ascNames = @()
    for ($i = 1; $i -lt $ascMatches.Count; $i++) {
        $ascNames += $ascMatches[$i].Groups[3].Value
    }
    
    Write-Output "Base Class: $baseClass -> Ascendancies: $($ascNames -join ', ')"
}
