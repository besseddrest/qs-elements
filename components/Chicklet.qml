pragma ComponentBehavior: Bound

import QtQuick
import QtQuick.Shapes

Shape {
    id: root

    property string fontFamily: "Rajdhani"

    ShapePath {
        id: mainBox
        fillColor: "#500E0E17"
        strokeColor: "#4DFF3B45"
        strokeWidth: 3
        startX: 0
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
            x: 0
            y: root.height
        }
        PathLine {
            x: 0
            y: 0
        }
    }

    ShapePath {
        fillColor: "#4DFF3B45"
        strokeColor: "#4DFF3B45"
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
        anchors.leftMargin: 15
        fontFamily: root.fontFamily
        text: "Chicklet"
        color: "#FF3B45"
        font.pixelSize: 22
        font.capitalization: Font.AllUppercase
    }
}
