param(
  [Parameter(Mandatory = $true)]
  [string]$Path,

  [Parameter(Mandatory = $true)]
  [string]$OutPath,

  [Parameter(Mandatory = $true)]
  [string]$MapPath
)

$ErrorActionPreference = 'Stop'

function Normalize-Hex([string]$value) {
  $v = $value.Trim()
  if ($v.StartsWith('#')) { return $v }
  return "#$v"
}

$text = Get-Content -LiteralPath $Path -Raw
$map = Get-Content -LiteralPath $MapPath -Raw | ConvertFrom-Json

$replacements = @()
if ($null -ne $map.replacements) {
  $replacements = @($map.replacements)
}
elseif ($map -is [System.Collections.IEnumerable]) {
  $replacements = @($map)
}
else {
  throw "MapPath must contain either a replacements array or a flat array of {from,to} objects."
}

foreach ($item in $replacements) {
  if ($null -eq $item.from -or $null -eq $item.to) {
    throw "Each replacement needs from and to values."
  }

  $from = Normalize-Hex $item.from
  $to = Normalize-Hex $item.to
  $pattern = [regex]::Escape($from)
  $text = [regex]::Replace($text, $pattern, $to, 'IgnoreCase')
}

Set-Content -LiteralPath $OutPath -Value $text -NoNewline
