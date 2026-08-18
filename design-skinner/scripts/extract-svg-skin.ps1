param(
  [Parameter(Mandatory = $true)]
  [string]$Path
)

$ErrorActionPreference = 'Stop'

$text = Get-Content -LiteralPath $Path -Raw

$fills = [regex]::Matches($text, 'fill="([^"]+)"') | ForEach-Object { $_.Groups[1].Value } | Sort-Object -Unique
$strokes = [regex]::Matches($text, 'stroke="([^"]+)"') | ForEach-Object { $_.Groups[1].Value } | Sort-Object -Unique
$stopColors = [regex]::Matches($text, 'stop-color="([^"]+)"') | ForEach-Object { $_.Groups[1].Value } | Sort-Object -Unique
$radii = [regex]::Matches($text, 'rx="([^"]+)"|ry="([^"]+)"') | ForEach-Object {
  if ($_.Groups[1].Value) { $_.Groups[1].Value } else { $_.Groups[2].Value }
} | Sort-Object -Unique

[pscustomobject]@{
  fills = $fills
  strokes = $strokes
  stopColors = $stopColors
  radii = $radii
} | ConvertTo-Json -Depth 4
