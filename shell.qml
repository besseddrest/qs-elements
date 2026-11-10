pragma ComponentBehavior: Bound

import QtQuick
import Quickshell
import QtQuick.Layouts
import "components"

Scope {

    FloatingWindow {
        id: win
        color: "transparent"
        Rectangle {
            color: "transparent"
            anchors.fill: parent

            ColumnLayout {
                anchors.centerIn: parent
                GetRekt {
                    Layout.preferredWidth: 500
                    Layout.preferredHeight: 80
                }
                // Shapes
            }
        }
    }
}
