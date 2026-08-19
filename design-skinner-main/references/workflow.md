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

## 3. Apply Rules

- color only by default
- radius only when requested
- shadow only when requested
- never change layout unless asked

## 4. Verify

Check that:

- text is unchanged
- geometry is unchanged
- only requested tokens changed

## 5. Return

Return the updated file and a short note describing what changed.
