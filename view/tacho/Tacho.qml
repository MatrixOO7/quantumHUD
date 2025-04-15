import QtQuick
import QtQuick.Controls
import QtQuick.Controls.Material


Rectangle {
    id: mainTacho
    width: 500
    height: 500
    color: Qt.rgba(0, 0, 0, 0)

    property real speedValue: -130.0
    property real speedMinimum: -130.0
    property real speedMaximum: 130.0


    property color colorFrameLo: Qt.rgba(0.0, 0.1, 0.1, 1.0)
    property color colorFrameHi: Qt.rgba(0.0, 1.0, 0.6, 1.0)

    property color colorHandRpmLo: Qt.rgba(0.0, 0.1, 0.1, 1.0)
    property color colorHandRpmHi: Qt.rgba(1.0, 0.4, 0.0, 1.0)

    property color colorHandLo: Qt.rgba(0.0, 0.1, 0.1, 1.0)
    property color colorHandHi: Qt.rgba(1.0, 0.4, 0.7, 1.0)

    property color colorTachoBackLo: Qt.rgba(0.0, 0.4, 0.5, 0.5)
    property color colorTachoBackHi: Qt.rgba(0.5, 0.5, 0.0, 1.0)

    property color colorRpmBackLo: Qt.rgba(0.0, 0.1, 0.1, 1.0)
    property color colorRpmBackHi: Qt.rgba(0.0, 1.0, 0.6, 1.0)

    property color colorSpaceLo: Qt.rgba(0.0, 0.1, 0.1, 1.0)
    property color colorSpaceHi: Qt.rgba(0.0, 1.0, 0.6, 1.0)


    function changeFrameColor ( colorLo, colorHi ) {
        colorFrameLo = colorLo
        colorFrameHi = colorHi
    }

    function changeHandColor ( colorLo, colorHi ) {
        colorHandLo = colorLo
        colorHandHi = colorHi
    }

    function changeRpmHandColor ( colorLo, colorHi ) {
        colorHandRpmLo = colorLo
        colorHandRpmHi = colorHi
    }

    function changeTachoBackColor ( colorLo, colorHi ) {
        colorTachoBackLo = colorLo
        colorTachoBackHi = colorHi
    }

    function changeRpmBackColor ( colorLo, colorHi ) {
        colorRpmBackLo = colorLo
        colorRpmBackHi = colorHi
    }

    function changeSpaceColor ( colorLo, colorHi ) {
        colorSpaceLo = colorLo
        colorSpaceHi = colorHi
    }

    ShaderEffect {
        id: base
        width: parent.width
        height: parent.height
        anchors.centerIn: parent

        property real rotationAngle: speedValue
        property variant source: Image {
            id: img_4
            source: "qrc:/resources/image/tacho_parts/tacho_base.svg"
            visible: false
        }

        readonly property alias iSource: img_4
        property color colorLo: mainTacho.colorFrameLo
        property color colorHi: mainTacho.colorFrameHi

        vertexShader: 'qrc:/resources/shadereffect/frag/hand.vert.qsb'
        fragmentShader: 'qrc:/resources/shadereffect/frag/hand.frag.qsb'
    }

    ShaderEffect {
        id: tacho_back
        width: parent.width
        height: parent.height
        anchors.centerIn: parent

        property real rotationAngle: speedValue
        property variant source: Image {
            id: img_5
            source: "qrc:/resources/image/tacho_parts/tacho_tacho_bck.svg"
            visible: false
        }

        readonly property alias iSource: img_5
        property color colorSpeedLo: mainTacho.colorTachoBackLo
        property color colorSpeedHi: mainTacho.colorTachoBackHi

        vertexShader: 'qrc:/resources/shadereffect/frag/tacho_2.vert.qsb'
        fragmentShader: 'qrc:/resources/shadereffect/frag/tacho_2.frag.qsb'
    }

    Image {
        id: rpm_back
        source: "qrc:/resources/image/tacho_parts/tacho_rpm_bck.svg"
        height: parent.height
        width: parent.width
        fillMode: Image.PreserveAspectCrop
    }

    ShaderEffect {
        id: rpm_hand
        width: parent.width
        height: parent.height
        anchors.centerIn: parent

        property real rotationAngle: mainTacho.speedValue
        property variant source: Image {
            id: img_2
            source: "qrc:/resources/image/tacho_parts/tacho_rpm_hand.svg"
            visible: false
        }

        readonly property alias iSource: img_2
        property color colorLo: mainTacho.colorHandRpmLo
        property color colorHi: mainTacho.colorHandRpmHi

        vertexShader: 'qrc:/resources/shadereffect/frag/hand.vert.qsb'
        fragmentShader: 'qrc:/resources/shadereffect/frag/hand.frag.qsb'


        Behavior on rotationAngle {
            NumberAnimation {
                duration: 1000
                easing.type: Easing.InOutQuad
            }
        }
    }

    Image {
        id: space
        source: "qrc:/resources/image/tacho_parts/tacho_space.svg"
        height: parent.height
        width: parent.width
        fillMode: Image.PreserveAspectCrop
    }

    ShaderEffect {
        id: frame
        width: parent.width
        height: parent.height
        anchors.centerIn: parent

        property real rotationAngle: mainTacho.speedValue
        property variant source: Image {
            id: img_3
            source: "qrc:/resources/image/tacho_parts/tacho_frame.svg"
            visible: false
        }



        readonly property alias iSource: img_3
        property color colorLo: mainTacho.colorFrameLo
        property color colorHi: mainTacho.colorFrameHi




        vertexShader: 'qrc:/resources/shadereffect/frag/hand.vert.qsb'
        fragmentShader: 'qrc:/resources/shadereffect/frag/hand.frag.qsb'
    }

    ShaderEffect {
        id: tacho_hand
        width: parent.width
        height: parent.height
        anchors.centerIn: parent

        property real rotationAngle: speedValue
        property variant source: Image {
            id: img
            source: "qrc:/resources/image/tacho_parts/tacho_hand.svg"
            visible: false
        }

        readonly property alias iSource: img
        property color colorLo: mainTacho.colorHandLo
        property color colorHi: mainTacho.colorHandHi

        vertexShader: 'qrc:/resources/shadereffect/frag/hand.vert.qsb'
        fragmentShader: 'qrc:/resources/shadereffect/frag/hand.frag.qsb'

        transform: Rotation {
            origin.x: tacho_hand.width / 2
            origin.y: tacho_hand.height / 2
            angle: tacho_hand.rotationAngle
        }

        Behavior on rotationAngle {
            NumberAnimation {
                duration: 1000
                easing.type: Easing.InOutQuad
            }
        }
    }

    ShaderEffect {
        id: hand_point
        width: parent.width
        height: parent.height
        anchors.centerIn: parent

        property real rotationAngle: speedValue
        property variant source: Image {
            id: img1
            source: "qrc:/resources/image/tacho_parts/tacho_hand_point.svg"
            visible: false
        }

        readonly property alias iSource: img1
        property color colorLo: mainTacho.colorHandLo
        property color colorHi: mainTacho.colorHandHi

        vertexShader: 'qrc:/resources/shadereffect/frag/hand.vert.qsb'
        fragmentShader: 'qrc:/resources/shadereffect/frag/hand.frag.qsb'
    }

    NumberAnimation {
        id: rpm_hand_anim
        target: rpm_hand
        property: "rotation"
        from: -85.0
        to: 85.0
        duration: 5000
        easing.type: Easing.InOutQuad
        running: true
        loops: Animation.Infinite
    }
}
