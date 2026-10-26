$html = Get-Content "C:\Users\andis\OneDrive\Documents\Projects\POEbot\knowledge_cache\sources\poe2db_ascendancy_raw.html" -Raw

$idx = $html.IndexOf("Hulking_Form")
$snippet = $html.Substring($idx, 1500)
Write-Output $snippet
