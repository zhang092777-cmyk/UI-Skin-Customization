# Workflow

## 1. Collect Inputs

Ask for:

- source file
- target module name
- primary color
- optional radius
- optional shadow

## 2. Resolve Module

Use the normal component name first.

If the source has explicit IDs, titles, or layer names, prefer those.

For SVGs without stable layer names, use a module skin map file that records which colors belong to each module.
If the source has a marked region, use the marked region as the source of truth for that module.

## 3. Apply Rules

- color only by default
- radius only when requested
- shadow only when requested
- never change layout unless asked
- do not recolor tokens outside the requested module
- do not recolor outside a marked region

## 4. Verify

Check that:

- text is unchanged
- geometry is unchanged
- only requested tokens changed

## 5. Return

Return the updated file and a short note describing what changed.
