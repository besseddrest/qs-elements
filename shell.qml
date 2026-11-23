//@ pragma AppId shapeshifter
pragma ComponentBehavior: Bound

import QtQuick
import Quickshell
import QtQuick.Layouts
import QtQuick.Shapes
import QtQuick.Effects
import Qt5Compat.GraphicalEffects

Scope {
    id: root

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
    readonly property color cyan: "#53F6FF"
    readonly property color filler: "#800E0E17"
    readonly property int cardW: 150
    readonly property int cardH: 100
    readonly property int glowPad: 20

    // Shared path geometry — one ShapePath layer for fill+stroke
    component PathCard: Shape {
        id: shape
        preferredRendererType: Shape.CurveRenderer
        layer.enabled: true
        layer.samples: 8
        layer.smooth: true

        property color fillColor: root.filler
        property color strokeColor: root.cyan
        property real strokeWidth: 2
        property bool pathOnly: false

        readonly property real tab: 48
        readonly property real drop: 10
        readonly property real chamfer: 16
        readonly property real notch: 14
        readonly property real inset: 2

        ShapePath {
            fillColor: shape.pathOnly ? "transparent" : shape.fillColor
            strokeColor: shape.strokeColor
            strokeWidth: shape.strokeWidth
            joinStyle: ShapePath.MiterJoin
            miterLimit: 4
            capStyle: ShapePath.FlatCap

            startX: shape.inset
            startY: shape.inset + shape.notch

            PathLine {
                x: shape.inset + shape.notch
                y: shape.inset
            }
            PathLine {
                x: shape.inset + shape.tab
                y: shape.inset
            }
            PathLine {
                x: shape.inset + shape.tab + shape.drop
                y: shape.inset + shape.drop
            }
            PathLine {
                x: shape.width - shape.inset
                y: shape.inset + shape.drop
            }
            PathLine {
                x: shape.width - shape.inset
                y: shape.height - shape.inset - shape.chamfer
            }
            PathLine {
                x: shape.width - shape.inset - shape.chamfer
                y: shape.height - shape.inset
            }
            PathLine {
                x: shape.inset
                y: shape.height - shape.inset
            }
            PathLine {
                x: shape.inset
                y: shape.inset + shape.notch
            }
        }
    }

    FloatingWindow {
        id: win
        title: "shapeshifter · cyan glow"
        color: "transparent"
        implicitWidth: (root.cardW + root.glowPad * 2) * 4 + 80 * 3
        implicitHeight: root.cardH + root.glowPad * 2 + 28

        RowLayout {
            anchors.centerIn: parent
            spacing: 80

            // ── 1. Qt5Compat Glow ────────────────────────────────
            ColumnLayout {
                spacing: 8

                Item {
                    Layout.preferredWidth: root.cardW + root.glowPad * 2
                    Layout.preferredHeight: root.cardH + root.glowPad * 2

                    PathCard {
                        anchors.centerIn: parent
                        width: root.cardW
                        height: root.cardH
                        layer.effect: Glow {
                            samples: 25
                            radius: 12
                            spread: 0.35
                            color: root.cyan
                            transparentBorder: true
                        }
                    }
                }
                Text {
                    Layout.fillWidth: true
                    color: "#CC53F6FF"
                    font.family: root.fontFamily
                    font.pixelSize: 13
                    font.weight: Font.DemiBold
                    font.capitalization: Font.AllUppercase
                    horizontalAlignment: Text.AlignHCenter
                    text: "1 · Glow"
                }
            }

            // ── 2. MultiEffect cyan shadow (zero offset) ──────────
            ColumnLayout {
                spacing: 8

                Item {
                    Layout.preferredWidth: root.cardW + root.glowPad * 2
                    Layout.preferredHeight: root.cardH + root.glowPad * 2

                    PathCard {
                        anchors.centerIn: parent
                        width: root.cardW
                        height: root.cardH
                        layer.effect: MultiEffect {
                            autoPaddingEnabled: true
                            shadowEnabled: true
                            shadowColor: root.cyan
                            shadowOpacity: 0.95
                            shadowBlur: 0.7
                            blurMax: 28
                            shadowHorizontalOffset: 0
                            shadowVerticalOffset: 0
                            shadowScale: 1.02
                        }
                    }
                }
                Text {
                    Layout.fillWidth: true
                    color: "#CC53F6FF"
                    font.family: root.fontFamily
                    font.pixelSize: 13
                    font.weight: Font.DemiBold
                    font.capitalization: Font.AllUppercase
                    horizontalAlignment: Text.AlignHCenter
                    text: "2 · MultiEffect"
                }
            }

            // ── 3. Stacked stroke bloom (no effect module) ────────
            ColumnLayout {
                spacing: 8

                Item {
                    Layout.preferredWidth: root.cardW + root.glowPad * 2
                    Layout.preferredHeight: root.cardH + root.glowPad * 2

                    PathCard {
                        anchors.centerIn: parent
                        width: root.cardW
                        height: root.cardH
                        pathOnly: true
                        strokeColor: "#1A53F6FF"
                        strokeWidth: 14
                    }
                    PathCard {
                        anchors.centerIn: parent
                        width: root.cardW
                        height: root.cardH
                        pathOnly: true
                        strokeColor: "#3353F6FF"
                        strokeWidth: 8
                    }
                    PathCard {
                        anchors.centerIn: parent
                        width: root.cardW
                        height: root.cardH
                        pathOnly: true
                        strokeColor: "#6653F6FF"
                        strokeWidth: 4
                    }
                    PathCard {
                        anchors.centerIn: parent
                        width: root.cardW
                        height: root.cardH
                    }
                }
                Text {
                    Layout.fillWidth: true
                    color: "#CC53F6FF"
                    font.family: root.fontFamily
                    font.pixelSize: 13
                    font.weight: Font.DemiBold
                    font.capitalization: Font.AllUppercase
                    horizontalAlignment: Text.AlignHCenter
                    text: "3 · Stacked strokes"
                }
            }

            // ── 4. FastBlur cyan silhouette ───────────────────────
            ColumnLayout {
                spacing: 8

                Item {
                    Layout.preferredWidth: root.cardW + root.glowPad * 2
                    Layout.preferredHeight: root.cardH + root.glowPad * 2

                    PathCard {
                        anchors.centerIn: parent
                        width: root.cardW
                        height: root.cardH
                        pathOnly: true
                        strokeColor: "#A653F6FF"
                        strokeWidth: 6
                        layer.effect: FastBlur {
                            radius: 14
                            transparentBorder: true
                        }
                    }
                    PathCard {
                        anchors.centerIn: parent
                        width: root.cardW
                        height: root.cardH
                    }
                }
                Text {
                    Layout.fillWidth: true
                    color: "#CC53F6FF"
                    font.family: root.fontFamily
                    font.pixelSize: 13
                    font.weight: Font.DemiBold
                    font.capitalization: Font.AllUppercase
                    horizontalAlignment: Text.AlignHCenter
                    text: "4 · FastBlur sil"
                }
            }
        }
    }
}
