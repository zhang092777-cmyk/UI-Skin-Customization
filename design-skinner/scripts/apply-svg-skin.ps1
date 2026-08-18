param(
  [Parameter(Mandatory = $true)]
  [string]$Path,

  [Parameter(Mandatory = $true)]
  [string]$OutPath,

  [Parameter(Mandatory = $true)]
  [string]$Color,

  [string]$Radius,
  [string]$Shadow
)

$ErrorActionPreference = 'Stop'

$text = Get-Content -LiteralPath $Path -Raw

function Normalize-Hex([string]$value) {
  $v = $value.Trim()
  if ($v.StartsWith('#')) { return $v }
  return "#$v"
}

$color = Normalize-Hex $Color

# Replace simple SVG paint tokens with the requested color.
$text = [regex]::Replace($text, 'fill="(?!none|url\()[^"]+"', "fill=""$color""")
$text = [regex]::Replace($text, 'stroke="(?!none|url\()[^"]+"', "stroke=""$color""")
$text = [regex]::Replace($text, 'stop-color="[^"]+"', "stop-color=""$color""")

if ($Radius) {
  $text = [regex]::Replace($text, 'rx="[^"]+"', "rx=""$Radius""")
  $text = [regex]::Replace($text, 'ry="[^"]+"', "ry=""$Radius""")
}

if ($Shadow) {
  $text = $text -replace 'feGaussianBlur stdDeviation="[^"]+"', "feGaussianBlur stdDeviation=""$Shadow"""
}

Set-Content -LiteralPath $OutPath -Value $text -NoNewline
