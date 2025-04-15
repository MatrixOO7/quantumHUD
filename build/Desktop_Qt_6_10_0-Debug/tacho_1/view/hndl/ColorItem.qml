import QtQuick

Item {
    property real red: 0.0
    property real green: 0.0
    property real blue: 0.0
    property real alpha: 1.0
    readonly property color colorValue: Qt.rgba(red, green, blue, alpha)
    property string title: "Default text"
    property int intValue: 0
}
