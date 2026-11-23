pragma ComponentBehavior: Bound

import QtQuick
import QtQuick.Shapes
import "paths" as Paths

Item {
    id: root
    width: parent.width
    height: parent.height

    property string fontFamily: "Rajdhani"
    property int tabSize: 100
    property int chamferSize: 18
    property int dropSize: 8
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

    Shape {
        width: root.width
        height: root.height

        // base fill
        Paths.QuickHack {
            fillColor: root.colorScheme.base
            strokeWidth: 0
            shapeWidth: root.width
            shapeHeight: root.height
            chamferSize: root.chamferSize
            dropSize: root.dropSize
        }

        // shade overlay
        Paths.QuickHack {
            fillColor: root.colorScheme.shade
            strokeWidth: 0
            shapeWidth: root.width
            shapeHeight: root.height
            chamferSize: root.chamferSize
            dropSize: root.dropSize
        }

        // stroke outline
        Paths.QuickHack {
            fillColor: "transparent"
            strokeColor: root.colorScheme.stroke
            strokeWidth: 2
            shapeWidth: root.width
            shapeHeight: root.height
            chamferSize: root.chamferSize
            dropSize: root.dropSize
        }

        Label {
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: parent.top
            anchors.verticalCenter: parent.verticalCenter
            anchors.topMargin: 8
            anchors.leftMargin: 15 + root.dropSize
            fontFamily: root.fontFamily
            font.weight: Font.Medium
            text: "System Collapse"
            color: root.colorScheme.text
            font.pixelSize: 30
            font.capitalization: Font.AllUppercase
        }
    }

    MouseArea {
        id: hover
        anchors.fill: parent
        hoverEnabled: true
        acceptedButtons: Qt.LeftButton
    }
}
