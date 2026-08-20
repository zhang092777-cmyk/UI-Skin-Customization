---
name: UI Skin Customization
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
- The starting colors and custom colors must not be modified arbitrarily; users are required to provide the specific parameters for the final custom colors, and custom colors cannot be determined or created at one's own discretion.

## Workflow

1. Identify the target module name using normal component naming.
2. Map that module to the matching shapes, text, and effects.
3. For SVGs, resolve the module through a module skin map and replace only that module's recorded tokens.
4. Preserve all other properties exactly.
5. If the module mapping is ambiguous, ask a short clarifying question.
6. If the source has shared styles or variables, update those first.

## Supported Inputs

- SVG exports
- HTML/CSS mockups
- React component trees
- Figma pages that use named color styles or variables

For SVG work, use the scripts in `scripts/` to inspect tokens, apply module-level color changes, apply marked-region color changes, and validate the result.

For Figma work, prefer editing shared color styles first, then let module instances inherit the updated tokens.

## Module Targets

1.Use standard names like:

- `Header`
- `Button`
- `Card`
- `Sidebar`
- `Tab`
- `Badge`
- `Input`
  
2.Areas marked by users using a selection box or text description.（You can choose either one）

## Change Rules

- **Color**: update all visible color tokens that belong to the target module.
- **Radius**: change only if explicitly requested.
- **Shadow**: change only if explicitly requested.
- **States**: keep hover, active, disabled, and pressed states visually consistent with the new color.

## Output Preference

When editing source, return the minimal file changes needed to implement the requested skin.

## References

- `references/decision-tree.md` for choosing the right edit path
- `references/module-mapping.md` for layer-to-module mapping rules
- `references/figma-logic.md` for the Figma-specific skinning flow
- `references/workflow.md` for the exact interaction flow
- `references/tokens.md` for token mapping rules
- `references/examples.md` for prompt patterns
- `references/jimiring-sample-registry.md` for the recorded SVG before/after set
- `scripts/extract-svg-skin.ps1` for SVG inspection
- `scripts/apply-module-skin.ps1` for module-scoped SVG recoloring
- `scripts/apply-marked-region-skin.ps1` for marked-region SVG recoloring
- `scripts/apply-svg-skin.ps1` for SVG recoloring
- `scripts/apply-svg-replacements.ps1` for exact color-to-color SVG replacements
- `scripts/validate-skill.ps1` for basic repository checks
- `assets/module-skin-map-template.json` for the module-to-token registry format

## Example Requests

- `Change the Header module to brand yellow.`
- `Change the Card module primary color to #1E66FF and set radius to 12.`
- `Change the Button module to green and reduce the shadow.`
- `Change the Header module to #0137BE without changing other modules.`
- `Use the marked red box region and change it to #0137BE.`

See [usage notes](references/usage.md) for the exact interaction pattern.

## Figma Source Editing Rule

When the user asks to reskin a design:

1. First inspect the local source or provided design file.
2. If a Figma link or Figma source is available, ask:
   "是否需要同步编辑 Figma 源文件？请选择：只修改本地文件 / 同步修改 Figma 源文件。"
3. Do not edit Figma until the user confirms.
4. If the user confirms:
   - use the Figma MCP server
   - inspect the exact Figma node or frame
   - update shared color variables or styles first
   - preserve layout, spacing, text, and geometry
   - edit only the requested module or marked region
5. After editing, report:
   - changed Figma node
   - changed color/style/variable
   - whether local output was also updated
