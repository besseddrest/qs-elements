pragma ComponentBehavior: Bound

import QtQuick
import QtQuick.Shapes

Shape {
    id: root

    property string fontFamily: "Rajdhani"
    property int tierOffset: 15

    // tiered: color coded, split bar
    ShapePath {
        fillColor: "#4DFF3B45"
        strokeColor: "transparent"
        strokeWidth: 1
        startX: 0
        startY: 0
        PathLine {
            x: root.tierOffset
            y: 0
        }
        PathLine {
            x: root.tierOffset
            y: root.height
        }
        PathLine {
            x: 0
            y: root.height
        }
        PathLine {
            x: 0
            y: 0
        }
    }
    // main
    ShapePath {
        fillColor: "#500E0E17"
        strokeColor: "#4DFF3B45"
        strokeWidth: 3
        startX: root.tierOffset + 10
        startY: 0
        PathLine {
            x: root.width
            y: 0
        }
        PathLine {
            x: root.width
            y: root.height - 30
        }

        PathLine {
            x: root.width - 30
            y: root.height
        }
        PathLine {
            x: root.tierOffset + 10
            y: root.height
        }
        PathLine {
            x: root.tierOffset + 10
            y: 0
        }
    }

    ShapePath {
        fillColor: "#4DFF3B45"
        strokeColor: "transparent"
        startX: root.width
        startY: root.height - 20

        PathLine {
            x: root.width - 20
            y: root.height
        }

        PathLine {
            x: root.width - 10
            y: root.height
        }

        PathLine {
            x: root.width
            y: root.height - 10
        }

        PathLine {
            x: root.width
            y: root.height - 20
        }
    }

    Label {
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.verticalCenter: parent.verticalCenter
        anchors.topMargin: 8
        anchors.leftMargin: 25 + root.tierOffset
        fontFamily: root.fontFamily
        text: "Tiered"
        color: "#FF3B45"
        font.pixelSize: 22
        font.capitalization: Font.AllUppercase
    }
}
