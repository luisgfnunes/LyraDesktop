import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import Qt5Compat.GraphicalEffects // Necessário para o DropShadow no Qt 6

ApplicationWindow {
    id: root
    width: 1280
    height: 720
    visible: true
    title: qsTr("Lyra")

    QtObject {
        id: theme
        readonly property color background: "#05050A"
        readonly property color surface: "#AA121218"
        readonly property color surfaceLight: "#339D4EDD"
        readonly property color primary: "#9D4EDD"
        readonly property color primaryGlow: "#9D4EDD"
        readonly property color textMain: "#FFFFFF"
        readonly property color textSecondary: "#8A8A93"
    }

    color: theme.background

    ColumnLayout {
        anchors.fill: parent
        spacing: 0

        // 1. ÁREA SUPERIOR (Sidebar + Conteúdo Principal)
        RowLayout {
            Layout.fillWidth: true
            Layout.fillHeight: true
            spacing: 0

            // --- BARRA LATERAL (SIDEBAR) ---
            Item {
                Layout.preferredWidth: 260
                Layout.fillHeight: true
                z: 2

                Rectangle {
                    id: sidebarBg
                    anchors.fill: parent
                    color: theme.surface
                    border.color: "#1A9D4EDD"
                    border.width: 1

                    ColumnLayout {
                        anchors.fill: parent
                        anchors.topMargin: 30
                        anchors.leftMargin: 20
                        anchors.rightMargin: 20
                        anchors.bottomMargin: 20
                        spacing: 24

                        Text {
                            text: "🌌 Lyra"
                            color: theme.textMain
                            font.pixelSize: 24
                            font.bold: true
                        }

                        ColumnLayout {
                            Layout.fillWidth: true
                            spacing: 6

                            Button {
                                Layout.fillWidth: true
                                Layout.preferredHeight: 40
                                text: "✨ Explorar"
                                background: Rectangle {
                                    color: parent.hovered ? theme.surfaceLight : "transparent"
                                    radius: 8
                                    border.color: parent.hovered ? theme.primary : "transparent"
                                    border.width: 1
                                }
                                contentItem: Text {
                                    text: parent.text
                                    color: theme.textMain
                                    font.pixelSize: 14
                                    font.bold: true
                                    leftPadding: 12
                                }
                            }

                            Button {
                                Layout.fillWidth: true
                                Layout.preferredHeight: 40
                                text: "📚 Biblioteca"
                                background: Rectangle {
                                    color: parent.hovered ? theme.surfaceLight : "transparent"
                                    radius: 8
                                }
                                contentItem: Text {
                                    text: parent.text
                                    color: theme.textSecondary
                                    font.pixelSize: 14
                                    leftPadding: 12
                                }
                            }
                        }

                        Item { Layout.fillHeight: true }
                    }
                }

                DropShadow {
                    anchors.fill: sidebarBg
                    horizontalOffset: 8
                    verticalOffset: 0
                    radius: 16
                    samples: 24
                    color: "#80000000"
                    source: sidebarBg
                }
            }

            // --- ÁREA DE CONTEÚDO CENTRAL ---
            Rectangle {
                Layout.fillWidth: true
                Layout.fillHeight: true
                color: "transparent"

                Text {
                    anchors.centerIn: parent
                    text: "Área de Conteúdo Principal 🚀"
                    color: theme.primary
                    font.pixelSize: 22
                    font.bold: true
                }
            }
        }

        // 2. BARRA INFERIOR DE CONTROLE DE ÁUDIO (NOW PLAYING)
        Item {
            Layout.fillWidth: true
            Layout.preferredHeight: 90
            z: 3

            Rectangle {
                id: playerBg
                anchors.fill: parent
                color: theme.surface

                Rectangle {
                    width: parent.width
                    height: 1
                    color: theme.primary
                    opacity: 0.3
                }

                // Metadados da Música
                RowLayout {
                    anchors.left: parent.left
                    anchors.leftMargin: 24
                    anchors.verticalCenter: parent.verticalCenter
                    spacing: 14

                    Rectangle {
                        width: 56
                        height: 56
                        color: "#1A1A24"
                        radius: 8
                        border.color: theme.primaryGlow
                        border.width: 1

                        Text {
                            anchors.centerIn: parent
                            text: "🎵"
                            font.pixelSize: 20
                        }
                    }

                    ColumnLayout {
                        spacing: 2
                        Text {
                            text: "Nenhuma música"
                            color: theme.textMain
                            font.pixelSize: 14
                            font.bold: true
                        }
                        Text {
                            text: "Selecione uma faixa"
                            color: theme.textSecondary
                            font.pixelSize: 12
                        }
                    }
                }

                // Controles Centrais
                ColumnLayout {
                    anchors.centerIn: parent
                    spacing: 6

                    RowLayout {
                        Layout.alignment: Qt.AlignCenter
                        spacing: 24

                        Button { text: "⏮"; implicitWidth: 36; implicitHeight: 36 }

                        // Botão Play
                        Item {
                            width: 44
                            height: 44

                            Rectangle {
                                id: playBtnBg
                                anchors.fill: parent
                                color: theme.primary
                                radius: 22
                            }

                            DropShadow {
                                anchors.fill: playBtnBg
                                horizontalOffset: 0
                                verticalOffset: 0
                                radius: 12
                                samples: 20
                                color: theme.primary
                                source: playBtnBg
                            }

                            Button {
                                anchors.fill: parent
                                text: "▶"
                                background: Item {}
                                contentItem: Text {
                                    text: "▶"
                                    color: "#FFFFFF"
                                    horizontalAlignment: Text.AlignHCenter
                                    verticalAlignment: Text.AlignVCenter
                                    font.pixelSize: 16
                                }
                            }
                        }

                        Button { text: "⏭"; implicitWidth: 36; implicitHeight: 36 }
                    }

                    ProgressBar {
                        Layout.preferredWidth: 400
                        value: 0.0
                    }
                }
            }

            DropShadow {
                anchors.fill: playerBg
                horizontalOffset: 0
                verticalOffset: -4
                radius: 12
                samples: 20
                color: "#60000000"
                source: playerBg
            }
        }
    }
}