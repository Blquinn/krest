import QtQuick 2.1
import org.kde.kirigami 2.8 as Kirigami
import QtQuick.Controls 2.13 as Controls
import QtQuick.Layouts 1.12

import "contents/ui"

Kirigami.ApplicationWindow {
    id: root

    title: i18n("KRest")

    globalDrawer: Kirigami.GlobalDrawer {
        title: i18n("KRest")
        titleIcon: "applications-graphics"

        // TODO: Drawer is too wide.
        modal: false
        collapsible: true

        ColumnLayout {
            Kirigami.SearchField {
                Layout.fillWidth: true
            }

            Item {
                Layout.fillHeight: true
                Layout.fillWidth: true
            }
        }
    }

    contextDrawer: Kirigami.ContextDrawer {
        id: contextDrawer
    }

    pageStack.initialPage: mainPageComponent

    Component {
        id: mainPageComponent

        Kirigami.Page {
            Layout.leftMargin: 0

            actions {
                main: Kirigami.Action {
                    iconName: "list-add"
                    text: i18n("New")
                    tooltip: i18n("Create a new request.")
                    onTriggered: showPassiveNotification(i18n("Created new request"))
                }
                left: Kirigami.Action {
                    iconName: "go-previous"
                }
                right: Kirigami.Action {
                    iconName: "go-next"
                }
            }

            RequestResponseView {
                anchors.fill: parent
            }
        }
    }
}

/*##^##
Designer {
    D{i:0;autoSize:true;height:480;width:640}
}
##^##*/
