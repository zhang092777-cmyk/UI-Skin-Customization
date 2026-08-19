# Usage Notes

## Expected Prompt Form

Tell Codex:

`Use $design-skinner to change the Header module primary color to #FDC708 and leave everything else unchanged.`

## Ambiguity Handling

If a module name could map to multiple layers, clarify only the smallest missing detail.

## Safe Defaults

- Preserve layout
- Preserve text
- Preserve spacing
- Preserve asset placement
- Preserve existing structure

## Optional Controls

Only apply these when explicitly requested:

- corner radius
- shadow
- border strength

## Recorded Shortcut

For the JimiRing sample set, use the filename as the module label and keep geometry unchanged. If you need exact color swaps, use `scripts/apply-svg-replacements.ps1` with a JSON map file.

## Module Shortcut

For module-scoped SVG recoloring, provide:

- the source SVG
- the module name
- the target color
- a module skin map JSON file

Then run `scripts/apply-module-skin.ps1` so only that module's recorded tokens are changed.

## Marked Region Shortcut

For unnamed SVG areas, wrap the region in a `<g data-skin-target="Module">` block. You may place a visible outline inside the group and mark that outline with `data-skin-marker="true"` so it stays as a locator.

Then run `scripts/apply-marked-region-skin.ps1` to recolor only that marked region.
