import QtQuick 2.12
import QtQuick.Controls 2.12 as Controls
import org.kde.kirigami 2.8 as Kirigami
import QtQuick.Layouts 1.12
import me.blq.KRest.models 1.0

// TODO: Make columns resizable.

Item {
    property ParamTableModel tableModel;

    // Proportions of key and value columns' widths relative to their parent.
    property var keyColumnWidth: 0.33333333
    property var valueColumnWidth: 0.33333333

    ColumnLayout {
        id: col
        anchors.fill: parent

        RowLayout {
            Layout.fillWidth: true

            Controls.Label {
                text: i18n("Key")
                Layout.preferredWidth: col.width * keyColumnWidth
            }
            Controls.Label {
                text: i18n("Value")
                Layout.preferredWidth: col.width * valueColumnWidth
            }
            Controls.Label {
                text: i18n("Description") // TODO: Rename variable to description
                Layout.fillWidth: true
            }
        }

        ListView {
            id: table
            Layout.fillWidth: true
            Layout.fillHeight: true
            clip: true
            spacing: 1

            Controls.ScrollBar.vertical: Controls.ScrollBar { }

            model: tableModel.params

            delegate: RowLayout {
                width: table.width
                height: 40
                spacing: 3

                Controls.TextField {
                    text: modelData.key
                    onEditingFinished: modelData.key = text
                    Layout.preferredWidth: table.width * keyColumnWidth
                }
                Controls.TextField {
                    text: modelData.value
                    onEditingFinished: modelData.value = text
                    Layout.preferredWidth: table.width * valueColumnWidth
                }
                Controls.TextField {
                    Layout.fillWidth: true
                    text: modelData.display
                    onEditingFinished: modelData.display = text
                }
                Controls.Button {
                    flat: true

                    onPressed: tableModel.removeRow(index)

                    Controls.ToolTip {
                        visible: parent.hovered
                        text: i18n("Remove row.")
                    }

                    Kirigami.Icon {
                        anchors.centerIn: parent
                        width: 30
                        height: 30
                        source: "list-remove"
                    }
                }
            }

            footer: Item {
                Controls.Button {
                    flat: true
                    anchors.topMargin: 10

                    onPressed: tableModel.addEmptyRow()

                    Controls.ToolTip {
                        visible: parent.hovered
                        text: i18n("Add row to table.")
                    }

                    Kirigami.Icon {
                        anchors.centerIn: parent
                        width: 30
                        height: 30
                        source: "list-add"
                    }
                }
            }
        }
    }
}
