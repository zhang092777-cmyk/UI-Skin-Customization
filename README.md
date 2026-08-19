[README.md](https://github.com/user-attachments/files/31218718/README.md)[README.en.md](https://github.com/user-attachments/files/31211554/README.en.md)
[Uploading README.en.md…]()


# Design Skinner（EN）

Codex skill for module-based design recoloring. By default it changes colors only, with radius and shadow changes only when explicitly requested.

## What it does

- Modify the color of the definition module.
- Keeps layout, spacing, and text unchanged
- Supports SVG, Figma styles, and code-based UI

## How to use

```text
Retrieve the specified skill and apply a custom skin, clearly identifying the areas to be modified and specifying any points that should remain unchanged.
```

## Structure

- `SKILL.md` - core skill instructions
- `agents/` - UI metadata
- `references/` - workflow and mapping rules
- `scripts/` - SVG helpers and validation
- `assets/` - sample theme data
[README.zh.md](https://github.com/user-attachments/files/31211559/README.zh.md)

# Design Skinner（CN）

这是一个给设计稿做“换肤”的 Codex skill，默认只改颜色；只有明确要求时才改圆角和阴影。

## 它能做什么

- 修改制定模块的颜色
- 保持布局、间距、文案不变
- 支持 SVG、Figma 样式和代码型 UI

## 怎么用

```text
调取这个skill然后进行指定换肤，明确需要换肤的地方以及可以点名不需要改动的点。
```

## 目录说明

- `SKILL.md` - skill 核心规则
- `agents/` - 界面元数据
- `references/` - 流程和映射规则
- `scripts/` - SVG 辅助和校验
- `assets/` - 示例主题数据

- [Upl# Design Skinner

See:

- [English](README.en.md)
- [中文](README.zh.md)
- [JimiRing sample registry](references/jimiring-sample-registry.md)

## Marked Region Recolor

If part of an SVG has no stable name, wrap it in a group and mark it:

```svg
<g data-skin-target="Header">
  <rect x="24" y="24" width="212" height="44" rx="12" fill="#FFC900" />
  <rect
    x="24"
    y="24"
    width="212"
    height="44"
    rx="12"
    fill="none"
    stroke="#FF0000"
    stroke-width="2"
    data-skin-marker="true"
  />
</g>
```

Then ask:

```text
Use $design-skinner to recolor the marked Header region to #0137BE and keep the rest unchanged.
```
oading README.md…]()

