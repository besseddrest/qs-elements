pragma ComponentBehavior: Bound

import QtQuick
import QtQuick.Shapes

// Shared geometry for the QuickHack tab shape.
// Instantiated once per layer (base / shade / stroke).
ShapePath {
    id: root

    property real shapeWidth: 0
    property real shapeHeight: 0
    property real chamferSize: 18
    property real dropSize: 8

    startX: 0
    startY: 0

    // to first slant
    PathLine {
        x: root.shapeWidth - root.chamferSize
        y: 0
    }

    // slant
    PathLine {
        x: root.shapeWidth
        y: root.chamferSize
    }

    // to bottom right
    PathLine {
        x: root.shapeWidth
        y: root.shapeHeight
    }

    // to bottom left
    PathLine {
        x: root.dropSize
        y: root.shapeHeight
    }

    // up halfway left side
    PathLine {
        x: root.dropSize
        y: root.shapeHeight / 2
    }

    // bottom left notch
    PathLine {
        x: 0
        y: root.shapeHeight / 2 - root.dropSize
    }

    // start
    PathLine {
        x: 0
        y: 0
    }
}
