import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15

Rectangle {
    color: "#FFFFFF"
    radius: 12
    border.color: "#E9ECEF"
    border.width: 1

    ColumnLayout {
        anchors.fill: parent
        anchors.margins: 30
        spacing: 10

        Text {
            text: "用户名"
            font.pixelSize: 13
            font.bold: true
            color: "#495057"
        }
        TextField {
            id: nicknameField
            Layout.fillWidth: true
            placeholderText: "输入您的用户名"
            font.pixelSize: 15
            background: Rectangle {
                border.color: nicknameField.activeFocus ? "#80BDFF" : "#CED4DA"
                border.width: 1
                radius: 6
                color: "#FFFFFF"
            }
        }

        Text {
            text: "密码"
            font.pixelSize: 13
            font.bold: true
            color: "#495057"
        }
        TextField {
            id: passwordField
            Layout.fillWidth: true
            placeholderText: "输入您的密码"
            echoMode: TextInput.Password
            font.pixelSize: 15
            background: Rectangle {
                border.color: passwordField.activeFocus ? "#80BDFF" : "#CED4DA"
                border.width: 1
                radius: 6
                color: "#FFFFFF"
            }
        }

        Button {
            text: "登录"
            Layout.alignment: Qt.AlignHCenter
            Layout.preferredWidth: 150
            Layout.preferredHeight: 45
            font.pixelSize: 15
            font.bold: true
            background: Rectangle {
                color: enabled ? (hovered ? "#0056b3" : "#007BFF") : "#B0D7FF"
                radius: 8
            }
            contentItem: Text {
                text: parent.text
                color: enabled ? "white" : "#E0F0FF"
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                font: parent.font
            }
            onClicked: chatWindow.login(nicknameField.text, passwordField.text)
        }
    }
}