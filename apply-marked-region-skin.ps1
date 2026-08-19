param(
  [Parameter(Mandatory = $true)]
  [string]$Path,

  [Parameter(Mandatory = $true)]
  [string]$OutPath,

  [Parameter(Mandatory = $true)]
  [string]$Module,

  [Parameter(Mandatory = $true)]
  [string]$TargetColor,

  [string]$Radius,
  [string]$Shadow
)

$ErrorActionPreference = 'Stop'

function Normalize-Hex([string]$value) {
  $v = $value.Trim()
  if ($v.StartsWith('#')) { return $v.ToUpper() }
  return "#$($v.ToUpper())"
}

function Is-Truthy([string]$value) {
  if ($null -eq $value) { return $false }
  $v = $value.Trim().ToLowerInvariant()
  return ($v -ne '' -and $v -ne 'false' -and $v -ne '0' -and $v -ne 'no')
}

function Recolor-Node([System.Xml.XmlNode]$Node, [bool]$Active, [string]$ModuleName, [string]$Color, [string]$RadiusValue, [string]$ShadowValue) {
  if ($Node -isnot [System.Xml.XmlElement]) {
    foreach ($child in $Node.ChildNodes) {
      Recolor-Node -Node $child -Active $Active -ModuleName $ModuleName -Color $Color -RadiusValue $RadiusValue -ShadowValue $ShadowValue
    }
    return
  }

  $isTarget = $false
  if ($Node.HasAttribute('data-skin-target')) {
    $isTarget = ($Node.GetAttribute('data-skin-target') -eq $ModuleName)
  }

  $isMarker = $false
  if ($Node.HasAttribute('data-skin-marker')) {
    $isMarker = Is-Truthy ($Node.GetAttribute('data-skin-marker'))
  }

  $nextActive = $Active -or $isTarget

  if ($nextActive -and -not $isMarker) {
    foreach ($attrName in @('fill', 'stroke', 'stop-color')) {
      if ($Node.HasAttribute($attrName)) {
        $current = $Node.GetAttribute($attrName)
        if ($current -and $current -notmatch '^(none|url\()') {
          $Node.SetAttribute($attrName, $Color)
        }
      }
    }

    if ($RadiusValue) {
      foreach ($attrName in @('rx', 'ry')) {
        if ($Node.HasAttribute($attrName)) {
          $Node.SetAttribute($attrName, $RadiusValue)
        }
      }
    }

    if ($ShadowValue -and $Node.LocalName -eq 'feGaussianBlur' -and $Node.HasAttribute('stdDeviation')) {
      $Node.SetAttribute('stdDeviation', $ShadowValue)
    }
  }

  foreach ($child in $Node.ChildNodes) {
    Recolor-Node -Node $child -Active $nextActive -ModuleName $ModuleName -Color $Color -RadiusValue $RadiusValue -ShadowValue $ShadowValue
  }
}

$doc = New-Object System.Xml.XmlDocument
$doc.PreserveWhitespace = $true
$doc.Load((Resolve-Path -LiteralPath $Path))

$target = Normalize-Hex $TargetColor
$radiusOut = $Radius
$shadowOut = $Shadow

Recolor-Node -Node $doc.DocumentElement -Active $false -ModuleName $Module -Color $target -RadiusValue $radiusOut -ShadowValue $shadowOut

$doc.Save($OutPath)
