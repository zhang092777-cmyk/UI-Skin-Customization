# Module Mapping

## Priority

1. shared styles
2. variables
3. semantic tokens
4. explicit layer names
5. local fallback overrides

## Layer Heuristics

- `Header` usually includes top bars, navigation, titles, and icons in the header region
- `Button` includes text, icon, fill, stroke, hover, and disabled states
- `Card` includes fill, stroke, radius, and drop shadow
- `Sidebar` includes background, dividers, active state, and list items
- `Badge` includes small capsules, status labels, and semantic color chips

## Safe Edits

- do not rename modules
- do not move layers
- do not merge unrelated groups
- do not restyle semantic data colors unless requested
