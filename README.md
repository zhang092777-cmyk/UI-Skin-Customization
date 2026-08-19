[README.en.md](https://github.com/user-attachments/files/31218842/README.en.md)

# Design Skinner

Codex skill for module-based design recoloring. By default it changes colors only, with radius and shadow changes only when explicitly requested.

## What it does

- Updates shared colors first
- Keeps layout, spacing, and text unchanged
- Supports SVG, Figma styles, and code-based UI
- Supports marked SVG regions for unnamed areas

## How to use

```text
Use $design-skinner to change the Header module primary color to #FDC708 and leave everything else unchanged.
```

## Marked Region Recolor

If part of the SVG has no stable name, wrap that area in a group and mark it:

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

Then ask Codex:

```text
Use $design-skinner to recolor the marked Header region to #0137BE and keep the rest unchanged.
```

Notes:

- `data-skin-target` is the module name Codex should use
- `data-skin-marker="true"` keeps the visible red box as a locator and prevents it from being recolored
- If the area already has a stable module name, prefer the module skin map flow instead

## Structure

- `SKILL.md` - core skill instructions
- `agents/` - UI metadata
- `references/` - workflow and mapping rules
- `scripts/` - SVG helpers and validation
- `assets/` - sample theme data

[README.zh.md](https://github.com/user-attachments/files/31218845/README.zh.md)
# Design Skinner

这是一个给设计稿做换肤的 Codex skill，默认只改颜色；只有明确要求时才改圆角和阴影。

## 它能做什么

- 优先改共享颜色
- 保持布局、间距、文案不变
- 支持 SVG、Figma 样式和代码型 UI
- 支持对没有命名的 SVG 区域做标记后再换肤

## 怎么用

```text
Use $design-skinner to change the Header module primary color to #FDC708 and leave everything else unchanged.
```

## 标记区域换肤

如果 SVG 里有一块区域没有稳定命名，可以先把那一块包进一个分组里，再给它加标记：

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

然后这样告诉 Codex：

```text
Use $design-skinner to recolor the marked Header region to #0137BE and keep the rest unchanged.
```

说明：

- `data-skin-target` 是这块区域的模块名
- `data-skin-marker="true"` 用来保留红框作为定位标记，不会被一起换色
- 如果这个区域本来就有稳定模块名，优先用 module skin map 的方式

## 目录说明

- `SKILL.md` - skill 核心规则
- `agents/` - 界面元数据
- `references/` - 流程和映射规则
- `scripts/` - SVG 辅助和校验
- `assets/` - 示例主题数据


[README.md](https://github.com/user-attachments/files/31218866/README.md)
# Design Skinner

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
