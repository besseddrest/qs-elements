pragma ComponentBehavior: Bound

import QtQuick
import QtQuick.Shapes

// Cyberpunk 2077: Attribute boosters (e.g. coffee)
//
//   TL ★ pointy ──────────────────────── TR chamfer
//      │                                    ╲
//      │                                     ★
//      │                                     │
//      ★                                     │
//       ╲                                    │
//        ★ BL chamfer ──────────────── BR ★ pointy
//
// Path is inset by `inset` so stroke (+ miter tips) stays inside the
// Shape bounds. Without that, TL/BR miters clip at the item edge and
// look rounded; TR/BL chamfers sit inward so they looked fine.
//
ShapePath {
    id: root

    property real shapeWidth: 0
    property real shapeHeight: 0
    property real chamferSize: 15
    // half stroke (or more) — keeps miter tips inside Shape texture
    property real inset: 1

    joinStyle: ShapePath.MiterJoin
    miterLimit: 4
    capStyle: ShapePath.FlatCap

    readonly property real l: root.inset                          // left
    readonly property real t: root.inset                          // top
    readonly property real r: root.shapeWidth - root.inset        // right
    readonly property real b: root.shapeHeight - root.inset       // bottom

    // ── TL ★ pointy (path START) ──────────────────────────
    startX: root.l
    startY: root.t

    // TL → top edge → before TR chamfer
    PathLine {
        x: root.r - root.chamferSize
        y: root.t
    }

    // ── TR ★ chamfer ──────────────────────────────────────
    PathLine {
        x: root.r
        y: root.t + root.chamferSize
    }

    // TR → right edge → BR
    PathLine {
        x: root.r
        y: root.b
    }
    // ── BR ★ pointy ───────────────────────────────────────

    // BR → bottom edge → before BL chamfer
    PathLine {
        x: root.l + root.chamferSize
        y: root.b
    }

    // ── BL ★ chamfer ──────────────────────────────────────
    PathLine {
        x: root.l
        y: root.b - root.chamferSize
    }

    // BL → left edge → TL (close)
    PathLine {
        x: root.l
        y: root.t
    }
}
