# Decision Tree

## Start

1. Is the source SVG?
2. Is the source Figma?
3. Is the source code?

## SVG

- inspect fill/stroke/stop-color
- map module names to visible groups
- recolor only the requested tokens
- optionally adjust `rx`, `ry`, or shadow

## Figma

- update shared styles first
- keep geometry untouched
- flow changes through semantic tokens

## Code

- update design tokens first
- then update the components that consume them
- avoid hardcoded colors unless the design is intentionally one-off

## Ambiguous Mapping

If one module name matches multiple layers, choose the smallest set of layers that fully owns the visible module.
