pragma ComponentBehavior: Bound

import QtQuick

// Text label with optical vertical centering for capital letters.
// Bounding-box VCenter sits on the full em box (ascent+descent); this
// nudges so the cap-height band is visually centered instead.
//
// Prefer anchors.verticalCenter (offset applies). anchors.fill +
// verticalAlignment still works, but the optical nudge only applies
// when verticalCenter is set.
Text {
    id: root

    property string fontFamily: "Rajdhani"

    font.family: fontFamily
    verticalAlignment: Text.AlignVCenter
    anchors.verticalCenterOffset: opticalOffset

    readonly property real opticalOffset: -(fm.ascent - fm.capHeight - fm.descent) / 2

    FontMetrics {
        id: fm
        font: root.font
    }
}
