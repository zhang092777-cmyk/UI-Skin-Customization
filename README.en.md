# Design Skinner

Codex skill for module-based design recoloring. By default it changes colors only, with radius and shadow changes only when explicitly requested.

## What it does

- Updates shared colors first
- Keeps layout, spacing, and text unchanged
- Supports SVG, Figma styles, and code-based UI

## How to use

```text
Use $design-skinner to change the Header module primary color to #FDC708 and leave everything else unchanged.
```

## Structure

- `SKILL.md` - core skill instructions
- `agents/` - UI metadata
- `references/` - workflow and mapping rules
- `scripts/` - SVG helpers and validation
- `assets/` - sample theme data
