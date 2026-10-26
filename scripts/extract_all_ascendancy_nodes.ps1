$html = Get-Content "C:\Users\andis\OneDrive\Documents\Projects\POEbot\knowledge_cache\sources\poe2db_ascendancy_raw.html" -Raw

# Find the Ascendancy passives tab
$idx = $html.IndexOf('id="AscendancyPassives"')
if ($idx -lt 0) {
    $idx = $html.IndexOf('Ascendancy passives')
}

$section = $html.Substring($idx, 150000)

# Check table structure inside
$tableIdx = $section.IndexOf("<table")
if ($tableIdx -ge 0) {
    $tableSnippet = $section.Substring($tableIdx, 5000)
    Write-Output "Table snippet:"
    Write-Output $tableSnippet
} else {
    Write-Output "No table found in first 150k chars"
}
