import QtQuick 2.1
import org.kde.kirigami 2.8 as Kirigami
import QtQuick.Controls 2.13 as Controls
import QtQuick.Layouts 1.12

ColumnLayout {
    anchors.fill: parent

    RowLayout {
        Layout.fillWidth: true

        Controls.ComboBox {
            id: methodCombo
            model: ["GET", "POST", "PUT", "PATCH", "DELETE"]
            implicitWidth: 100
            onAccepted: rootModel.activeRequest.method = currentValue;
        }

        Controls.TextField {
            Layout.fillWidth: true
            id: urlText
            placeholderText: "Url"
            onEditingFinished: rootModel.activeRequest.url = text
        }

        Controls.Button {
            text: "Send"
            onPressed: rootModel.performRequest()
        }
    }

    Controls.TabBar {
        id: tabBar
        Layout.alignment: Qt.AlignCenter
        Controls.TabButton {
            text: "Request"

            Kirigami.Icon {
                anchors.right: parent.right
                anchors.rightMargin: 3
                anchors.verticalCenter: parent.verticalCenter
                height: 20
                width: 20
                source: "arrow-up"
            }
        }
        Controls.TabButton {
            text: "Response"
            Kirigami.Icon {
                anchors.left: parent.left
                anchors.leftMargin: 3
                anchors.verticalCenter: parent.verticalCenter
                height: 20
                width: 20
                source: "arrow-down"
            }
        }
    }

    Controls.SwipeView {
        id: swipeView
        Layout.fillHeight: true
        Layout.fillWidth: true
        currentIndex: tabBar.currentIndex
        clip: true

        RequestEditor { }
        ResponseViewer { }
    }
}
