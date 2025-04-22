// Created with Qt Quick Effect Maker (version 0.44), Wed Apr 2 21:40:18 2025

import QtQuick

Item {
    id: rootItem

    // This is the main source for the effect
    property Item source: null

    property color colorSpeedHi: Qt.rgba(0.44921, 0.22417, 0, 1)
    property color colorSpeedLo: Qt.rgba(0, 0.447593, 0.509422, 1)

    ShaderEffect {
        readonly property alias iSource: rootItem.source
        readonly property alias colorSpeedHi: rootItem.colorSpeedHi
        readonly property alias colorSpeedLo: rootItem.colorSpeedLo

        vertexShader: 'tacho_2.vert.qsb'
        fragmentShader: 'tacho_2.frag.qsb'
        anchors.fill: parent
    }
}
