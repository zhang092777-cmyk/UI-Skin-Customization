param(
  [string]$Root = (Split-Path -Parent $PSScriptRoot)
)

$ErrorActionPreference = 'Stop'

$required = @(
  'SKILL.md',
  'agents/openai.yaml',
  'references/workflow.md',
  'references/tokens.md',
  'references/examples.md',
  'references/figma-logic.md',
  'references/decision-tree.md',
  'references/module-mapping.md',
  'scripts/apply-svg-skin.ps1',
  'scripts/extract-svg-skin.ps1'
)

$missing = @()
foreach ($item in $required) {
  if (-not (Test-Path -LiteralPath (Join-Path $Root $item))) {
    $missing += $item
  }
}

if ($missing.Count -gt 0) {
  Write-Error ("Missing files: " + ($missing -join ', '))
}

Write-Output "skill structure looks complete"
