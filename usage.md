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
