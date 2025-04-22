// Created with Qt Quick Effect Maker (version 0.44), Wed Apr 2 20:33:45 2025

import QtQuick

Item {
    id: rootItem

    // This is the main source for the effect
    property Item source: null

    property color colorLo: Qt.rgba(0, 0.0107576, 0.31545, 0.686244)
    property color colorHi: Qt.rgba(1, 0, 1, 1)

    ShaderEffect {
        readonly property alias iSource: rootItem.source
        readonly property alias colorLo: rootItem.colorLo
        readonly property alias colorHi: rootItem.colorHi

        vertexShader: 'tacho_hand.vert.qsb'
        fragmentShader: 'tacho_hand.frag.qsb'
        anchors.fill: parent
    }
}
