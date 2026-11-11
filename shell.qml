pragma ComponentBehavior: Bound

import QtQuick
import Quickshell
import QtQuick.Layouts
import "components"

Scope {
    id: root

    // bundled Rajdhani faces (fonts/)
    FontLoader {
        id: fontRajdhaniLight
        source: Qt.resolvedUrl("fonts/Rajdhani-Light.ttf")
    }
    FontLoader {
        id: fontRajdhaniRegular
        source: Qt.resolvedUrl("fonts/Rajdhani-Regular.ttf")
    }
    FontLoader {
        id: fontRajdhaniMedium
        source: Qt.resolvedUrl("fonts/Rajdhani-Medium.ttf")
    }
    FontLoader {
        id: fontRajdhaniSemiBold
        source: Qt.resolvedUrl("fonts/Rajdhani-SemiBold.ttf")
    }
    FontLoader {
        id: fontRajdhaniBold
        source: Qt.resolvedUrl("fonts/Rajdhani-Bold.ttf")
    }

    readonly property string fontFamily: fontRajdhaniRegular.name || "Rajdhani"

    FloatingWindow {
        id: win
        color: "transparent"
        Rectangle {
            color: "transparent"
            anchors.fill: parent

            ColumnLayout {
                anchors.centerIn: parent
                spacing: 20
                GetRekt {
                    Layout.preferredWidth: 500
                    Layout.preferredHeight: 80
                    fontFamily: root.fontFamily
                }
                Chamfer {
                    Layout.preferredWidth: 500
                    Layout.preferredHeight: 80
                }
                Chicklet {
                    Layout.preferredWidth: 500
                    Layout.preferredHeight: 160
                }
            }
        }
    }
}
