# Color Guide

## STATE LAYERS

| State | Layer 1 | Layer 2 | Layer 3 |
|---|---|---|---|
| **Idle** | - | `#FF3B45` 30%  | `#0E0E17` 80% |
| **Hover** | `#FF3B45` 100% | `#FF3B45` 10% | `#0E0E17` 80% |
| **Activated** | `#FF3B45` 100% | `#FF3B45` 40% | `#0E0E17` 80% |
| **Click (Flash)** | `#FF3B45` 100% | `#FF3B45` 70% | `#0E0E17` 80% |
| **Cyan** | `#53F6FF` | `#53F6FF` | `#53F6FF |

Layer 1 = outline · Layer 3 = base. Cyan row has no opacity (full color as-is).


ShapePath has no `opacity` property. Per-layer transparency is done via the alpha channel of `#AARRGGBB` colors.

## Alpha prefix table

| Alpha | Hex |
|-------|-----|
| 100%  | `FF` |
| 90%   | `E6` |
| 80%   | `CC` |
| 70%   | `B3` |
| 60%   | `99` |
| 50%   | `80` |
| 40%   | `66` |
| 30%   | `4D` |
| 25%   | `40` |
| 20%   | `33` |
| 10%   | `1A` |

Values are rounded to nearest. Existing project examples: `#4DFF3B45` ≈ 30%, `#500E0E17` ≈ 31%.

## Usage

```qml
fillColor: "#CCFF3B45"   // 80% red
strokeColor: "#80FF3B45" // 50% red
fillColor: "transparent" // fully off (still participates in the path)
```
