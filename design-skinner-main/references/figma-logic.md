# Figma Skinning Logic

## Theme Buckets

Use the page's named style buckets as the source of truth:

- `light`
- `dark`

## Theme Direction

For this JimiRing page:

- yellow currently represents the original theme
- blue currently represents the custom theme

Treat these as snapshot labels, not permanent hex values.

## Visible Tokens

The page exposes named color styles like:

- `icon_background`
- `brand`
- `bg`
- `text_primary`
- `text_secondary`
- `menstrualperiod`
- `button`
- `heartrate`
- `stress`
- `bloodoxygen`
- `bt`
- `card`
- `button_regular`
- `card_fill`
- `card_stroke`

## Preferred Flow

1. Update the shared style token.
2. Keep module geometry unchanged.
3. Let instances inherit the new token.
4. Only override a local module if the shared style is not available.

## Skinning Rule

- Brand color changes should flow through `brand` and its dependent button/accent styles.
- Surface changes should flow through `bg`, `card`, `card_fill`, and `card_stroke`.
- Typography changes should flow through `text_primary` and `text_secondary`.
- Metric colors should stay isolated by semantic token, not hard-coded per layer.
- Never hardcode theme colors into the skill; always read the current source tokens and map by role.

## Practical Interpretation for This Page

- When the user asks for the original skin, prefer whatever color currently occupies the original theme role.
- When the user asks for the custom skin, prefer whatever color currently occupies the custom theme role.
- Do not treat data-semantic colors like `heartrate`, `stress`, or `bloodoxygen` as the main brand accent unless the user explicitly asks.
