import QtQuick 2.12
import QtQuick.Controls 2.12 as Controls
import org.kde.kirigami 2.8 as Kirigami
import QtQuick.Layouts 1.12

ColumnLayout {
    id: requestContainer

    Controls.TabBar {
        id: requestTab
        Controls.TabButton {
            text: "Params"
        }
        Controls.TabButton {
            text: "Headers"
        }
        Controls.TabButton {
            text: "Body"
        }
    }

    StackLayout { // Disable animation on this?
        currentIndex: requestTab.currentIndex
        Layout.fillWidth: true
        Layout.fillHeight: true
        clip: true

        // TODO: Handle null activeRequest (Splash page?)
        ParamTable {
            tableModel: rootModel.activeRequest.params
        }
        ParamTable {
            tableModel: rootModel.activeRequest.headers
        }

        ColumnLayout { // RequestBodyEditor
            StackLayout {
                currentIndex: requestBodyTab.currentIndex

                Item { // No request body
                    Layout.fillHeight: true
                    Layout.fillWidth: true

                    Controls.Label {
                        anchors.centerIn: parent
                        text: "No request body."
                    }
                }
                Item { // Raw body
                    Layout.fillHeight: true
                    Layout.fillWidth: true

                    Controls.Label {
                        anchors.centerIn: parent
                        text: "Raw"
                    }
                }
                Item { // Form
                    Layout.fillHeight: true
                    Layout.fillWidth: true

                    Controls.Label {
                        anchors.centerIn: parent
                        text: "Form"
                    }
                }
                Item { // Url Encoded
                    Layout.fillHeight: true
                    Layout.fillWidth: true

                    Controls.Label {
                        anchors.centerIn: parent
                        text: "Url"
                    }
                }
                Item { // Binary
                    Layout.fillHeight: true
                    Layout.fillWidth: true

                    Controls.Label {
                        anchors.centerIn: parent
                        text: "Binary."
                    }
                }
            }

            Controls.TabBar {
                id: requestBodyTab
                position: Controls.TabBar.Footer

                Controls.TabButton {
                    text: "None"
                }
                Controls.TabButton {
                    text: "Raw"
                    Controls.Button {
                        flat: true
                        height: 20
                        width: 20
                        anchors.verticalCenter: parent.verticalCenter
                        anchors.right: parent.right
                        anchors.rightMargin: 3

                        onPressed: bodyTypePopup.open()

                        Kirigami.Icon {
                            id: icon
                            anchors.fill: parent
                            source: "arrow-up"
                        }

                        Controls.Popup {
                            id: bodyTypePopup
                            y: -height // Popup from bottom

                            ColumnLayout {
                                Repeater {
                                    model: [
                                        "Text",
                                        "Text (text/plain)",
                                        "JSON (application/json)",
                                        "Javascript (application/javascript)",
                                        "XML (application/xml)",
                                        "XML (text/xml)",
                                        "HTML (text/html)"
                                    ]
                                    delegate:  Controls.RadioButton {
                                        Layout.fillWidth: true
                                        text: modelData
                                        checked: index === 0
                                        onPressed: /* Switch to body tab. */ requestBodyTab.setCurrentIndex(1)
                                    }
                                }
                            }
                        }
                    }
                }
                Controls.TabButton {
                    text: "Form Data"
                }
                Controls.TabButton {
                    text: "Form Url-Encoded"
                }
                Controls.TabButton {
                    text: "Binary"
                }
            }
        }
    }
}
