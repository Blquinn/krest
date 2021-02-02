import QtQuick 2.0
import QtQuick.Layouts 1.12
import QtQuick.Controls 2.12 as Controls

ColumnLayout {
    id: responseContainer

    RowLayout {
        Layout.fillWidth: true
        height: childrenRect.height
        Item {
            Layout.fillWidth: true
            height: childrenRect.height
            Controls.Label {
                anchors.horizontalCenter: parent.horizontalCenter
                text: i18n("Status: -")
            }
        }
        Item {
            Layout.fillWidth: true
            height: childrenRect.height
            Controls.Label {
                anchors.horizontalCenter: parent.horizontalCenter
                text: i18n("Time: -")
            }
        }
        Item {
            Layout.fillWidth: true
            height: childrenRect.height
            Controls.Label {
                anchors.horizontalCenter: parent.horizontalCenter
                text: i18n("Size: -")
            }
        }
    }

    Controls.TabBar {
        id: responseDataTab
        Controls.TabButton {
            text: "Headers"
        }
        Controls.TabButton {
            text: "Body"
        }
    }

    StackLayout {
        Layout.fillHeight: true
        currentIndex: responseDataTab.currentIndex

        Controls.Label { // Response headers viewer
            id: responseHeaders
            Layout.fillHeight: true
            Layout.fillWidth: true
        }

        ColumnLayout { // Response body viewer
            StackLayout {
                currentIndex: responseBodyTab.currentIndex

                Controls.TextArea {
                    id: responseBodyPretty
                }
                Controls.TextArea {
                    id: responseBodyRaw
                }
                Controls.TextArea {
                    id: responseBodyPreview
                }
            }

            Controls.TabBar {
                id: responseBodyTab
                position: Controls.TabBar.Footer

                Controls.TabButton {
                    text: "Pretty"
                }
                Controls.TabButton {
                    text: "Raw"
                }
                Controls.TabButton {
                    text: "Preview"
                }
            }
        }
    }
}
