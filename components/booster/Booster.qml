pragma ComponentBehavior: Bound

import QtQuick
import QtQuick.Shapes

Item {
    id: root
    width: parent.width
    height: parent.height

    property string fontFamily: "Rajdhani"
    property int chamferSize: 15
    property bool hovered: hover.containsMouse
    property bool pressed: hover.pressed

    readonly property string shapeState: {
        if (root.pressed)
            return "click";
        if (root.hovered)
            return "hover";
        return "idle";
    }

    readonly property var colorScheme: {
        switch (root.shapeState) {
        case "click":
            return {
                base: "#CC0E0E17",
                shade: "#B353F6FF",
                stroke: "#53F6FF",
                text: "#CC0E0E17"
            };
        case "hover":
            return {
                base: "#CC0E0E17",
                shade: "#1A53F6FF",
                stroke: "#53F6FF",
                text: "#53F6FF"
            };
        default:
            return {
                base: "#CC0E0E17",
                shade: "transparent",
                stroke: "#4D53F6FF",
                text: "#4D53F6FF"
            };
        }
    }

    readonly property real strokeWidth: 2
    // stroke is centered on path; inset so outer half + miter tips
    // aren't clipped by the Shape item bounds (that was the soft TL/BR)
    readonly property real pathInset: root.strokeWidth

    Shape {
        width: root.width
        height: root.height

        BoosterPath {
            fillColor: root.colorScheme.base
            strokeWidth: 0
            shapeWidth: root.width
            shapeHeight: root.height
            chamferSize: root.chamferSize
            inset: root.pathInset
        }
        BoosterPath {
            fillColor: "transparent"
            strokeColor: "#53F6FF"
            strokeWidth: 3
            shapeWidth: root.width
            shapeHeight: root.height
            chamferSize: root.chamferSize
            inset: root.pathInset
        }
    }

    MouseArea {
        id: hover
        anchors.fill: parent
        hoverEnabled: true
        acceptedButtons: Qt.LeftButton
    }
}
