---
name: SKILL.md
description: Update a design by changing only the requested module colors by default, with optional corner-radius and shadow adjustments when explicitly asked. Use when the user wants to restyle a design, SVG, mockup, or UI while keeping layout, text, spacing, and structure unchanged.
---

# Design Skinner

## Use When

Use this skill when a user wants to reskin a design and gives a module name plus target values.

## Core Rule

Default to color-only changes.

- Change only fills, strokes, gradients, text color, icon color, border color, overlays, and state colors.
- Do not change layout, copy, spacing, position, or sizing unless asked.
- Only change corner radius or shadow when the user explicitly requests it.

## Workflow

1. Identify the target module name using normal component naming.
2. Map that module to the matching shapes, text, and effects.
3. Apply only the requested token changes.
4. Preserve all other properties exactly.
5. If the module mapping is ambiguous, ask a short clarifying question.

## Supported Inputs

- SVG exports
- HTML/CSS mockups
- React component trees
- Figma pages that use named color styles or variables

For SVG work, use the scripts in `scripts/` to inspect tokens and apply module-level color changes.

For Figma work, prefer editing shared color styles first, then let module instances inherit the updated tokens.

## Module Targets

Use standard names like:

- `Header`
- `Button`
- `Card`
- `Sidebar`
- `Tab`
- `Badge`
- `Input`

## Change Rules

- **Color**: update all visible color tokens that belong to the target module.
- **Radius**: change only if explicitly requested.
- **Shadow**: change only if explicitly requested.
- **States**: keep hover, active, disabled, and pressed states visually consistent with the new color.

## Output Preference

When editing source, return the minimal file changes needed to implement the requested skin.

## References

- `references/figma-logic.md` for the Figma-specific skinning flow
- `references/workflow.md` for the exact interaction flow
- `references/tokens.md` for token mapping rules
- `references/examples.md` for prompt patterns
- `scripts/extract-svg-skin.ps1` for SVG inspection
- `scripts/apply-svg-skin.ps1` for SVG recoloring

## Example Requests

- `Change the Header module to brand yellow.`
- `Change the Card module primary color to #1E66FF and set radius to 12.`
- `Change the Button module to green and reduce the shadow.`

See [usage notes](references/usage.md) for the exact interaction pattern.
