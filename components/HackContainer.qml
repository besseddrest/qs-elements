pragma ComponentBehavior: Boun

import QtQuick
import QtQuick.Shapes
import QtWebEngine

Shape {
    id: root

    property string fontFamily: "Rajdhani"
    property int tabSize: 100
    property int chamferSize: 25
    property int dropSize: 10

    ShapePath {
        fillColor: "#CC0E0E17"
        strokeWidth: 0
        startX: 0
        startY: 0

        // to chamfer
        PathLine {
            x: root.width - root.chamferSize
            y: 0
        }

        // chamfer to right
        PathLine {
            x: root.width
            y: root.chamferSize
        }

        // right side
        PathLine {
            x: root.width
            y: root.height
        }

        // bottom side
        PathLine {
            x: root.dropSize
            y: root.height
        }

        // lllt
        PathLine {
            x: 0
            y: root.height
        }



















        // to first slant
        PathLine webEngineFrame{
            x: root.width - root.chamferSize
            x: root.chamferSize
            y: 0
        }
        PathLine {
            x: root width
            y: roo.chamferSize
        }


        // slant
        PathLine {
            x: root.tabSize + root.dropSize
            y: root.dropSize
        }
        // to top right corner
        PathLine {
            x: root.width
            y: root.dropSize
        }
        // to chamfer
        PathLine {
            x: root.width
            y: root.height - root.chamrefrt
        }
        // chamfer
        PathLine {
            x: root.width - root.chamferSize
            y: root.height
        }
        // bottom left
        PathLine {
            x: 0
            y: root.height
        }
        // start
        PathLine {
            x: 0
            y: 0
        }
    }

    ShapePath {
        fillColor: "transparent"
        strokeWidth: 0
        startX: 0
        startY: 0

        // to first slant
        PathLine {
            x: root.tabSize
            y: 0
        }
        // slant
        PathLine {
            x: root.tabSize + root.dropSize
            y: root.dropSize
        }
        // to top right corner
        PathLine {
            x: root.width
            y: root.dropSize
        }
        // to chamfer
        PathLine {
            x: root.width
            y: root.height - root.chamferSize
        }
        // chamfer
        PathLine {
            x: root.width - root.chamferSize
            y: root.height
        }
        // bottom left
        PathLine {
            x: 0
            y: root.height
        }
        // start
        PathLine {
            x: 0
            y: 0
        }
    }

    ShapePath {
        fillColor: "transparent"
        strokeColor: "#FF3B45"
        strokeWidth: 2
        startX: 0
        startY: 0

        // to first slant
        PathLine {
            x: root.tabSize
            y: 0
        }
        // slant
        PathLine {
            x: root.tabSize + root.dropSize
            y: root.dropSize
        }
        // to top right corner
        PathLine {
            x: root.width
            y: root.dropSize
        }
        // to chamfer
        PathLine {
            x: root.width
            y: root.height - root.chamferSize
        }
        // chamfer
        PathLine {
            x: root.width - root.chamferSize
            y: root.height
        }
        // bottom left
        PathLine {
            x: 0
            y: root.height
        }
        // start
        PathLine {
            x: 0
            y: 0
        }
    }
    // this belongs in top layer
    Label {
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.verticalCenter: parent.verticalCenter
        anchors.topMargin: 8 + root.dropSize
        anchors.leftMargin: 15
        fontFamily: root.fontFamily
        text: "hellow world"
        color: "#FF3B45"
        font.pixelSize: 22
        font.capitalization: Font.AllUppercase
    }
}
