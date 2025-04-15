import QtQuick
import QtQuick.Controls

import "hndl"
import "theme"

import "tacho"

Window {
    id: quantumHUD
    width: 1800
    height: 600
    minimumWidth: 900
    minimumHeight: 300
    visible: true
    title: qsTr("QuantumHUD")

    ThemeManager {
        id: themeManager
    }

    Rectangle {
        id: background
        anchors.fill: parent
        gradient: Gradient {
            GradientStop { position: 0.0; color: "#222" }
            GradientStop { position: 1.0; color: "#444" }
        }

        Tacho {
            id: tacho
            anchors.centerIn: parent
            colorFrameLo: themeManager.currentTheme.colorFrameLo
            colorFrameHi: themeManager.currentTheme.colorFrameHi
            colorTachoBackLo: themeManager.currentTheme.colorTachoBackLo
            colorTachoBackHi: themeManager.currentTheme.colorTachoBackHi
            colorHandLo: themeManager.currentTheme.colorHandLo
            colorHandHi: themeManager.currentTheme.colorHandHi
            colorHandRpmLo: themeManager.currentTheme.colorHandRpmLo
            colorHandRpmHi: themeManager.currentTheme.colorHandRpmHi

            Behavior on colorFrameLo {
                ColorAnimation {
                    duration: themeManager.speed
                    easing.type: Easing.InOutQuad
                }
            }

            Behavior on colorFrameHi {
                ColorAnimation {
                    duration: themeManager.speed
                    easing.type: Easing.InOutQuad
                }
            }

            Behavior on colorTachoBackLo {
                ColorAnimation {
                    duration: themeManager.speed
                    easing.type: Easing.InOutQuad
                }
            }

            Behavior on colorTachoBackHi {
                ColorAnimation {
                    duration: themeManager.speed
                    easing.type: Easing.InOutQuad
                }
            }

            Behavior on colorHandLo {
                ColorAnimation {
                    duration: themeManager.speed
                    easing.type: Easing.InOutQuad
                }
            }

            Behavior on colorHandHi {
                ColorAnimation {
                    duration: themeManager.speed
                    easing.type: Easing.InOutQuad
                }
            }

            Behavior on colorHandRpmLo {
                ColorAnimation {
                    duration: themeManager.speed
                    easing.type: Easing.InOutQuad
                }
            }

            Behavior on colorHandRpmHi {
                ColorAnimation {
                    duration: themeManager.speed
                    easing.type: Easing.InOutQuad
                }
            }

        }

        Button {
            width: 100
            height: 50
            text: "Speed Up"

            onClicked: {
                let val = tacho.speedValue + 50
                val = val > tacho.speedMaximum ? tacho.speedMaximum : val
                tacho.speedValue = val
           }
        }

        Button {
            width: 100
            height: 50
            y: 60
            text: "Speed down"

            onClicked: {
                let val = tacho.speedValue - 50
                val = val < tacho.speedMinimum ? tacho.speedMinimum : val
                tacho.speedValue = val
           }
        }


        Rectangle {
            width: 500
            height: 200
            y: 120
            clip: true

            Rectangle {
                id: color_frame
                anchors.fill: parent

                Flickable {
                    anchors.fill: parent
                    contentWidth: parent.width
                    contentHeight: 1500  // Výška obsahu (včetně barviček a sliderů)

                    Column {
                        anchors.fill: parent
                        spacing: 10

                        Row {
                            width: parent.width
                            height: 200
                            spacing: 10
                            Column {
                                anchors.fill: parent
                                Row {
                                    width: parent.width
                                    Text {
                                        width: parent.width
                                        text: "Theme switch"
                                    }
                                }
                                Row {
                                    width: parent.width
                                    Text {
                                        text: "Use dark theme: "
                                    }
                                    Button {
                                        width: 50
                                        onClicked: {
                                            themeManager.themeSelector( "light" )
                                        }
                                    }
                                }
                                Row {
                                    width: parent.width
                                    Text {
                                        text: "Use light theme: "
                                    }
                                    Button {
                                        width: 50
                                        onClicked: {
                                            themeManager.themeSelector( "dark" )
                                        }
                                    }
                                }
                                Row {
                                    width: parent.width
                                    Text {
                                        text: "Use gold theme: "
                                    }
                                    Button {
                                        width: 50
                                        onClicked: {
                                            themeManager.themeSelector( "gold" )
                                        }
                                    }
                                }
                                Row {
                                    width: parent.width
                                    Text {
                                        text: "Use green theme: "
                                    }
                                    Button {
                                        width: 50
                                        onClicked: {
                                            themeManager.themeSelector( "green" )
                                        }
                                    }
                                }
                                Row {
                                    width: parent.width
                                    Text {
                                        text: "Use blue theme: "
                                    }
                                    Button {
                                        width: 50
                                        onClicked: {
                                            themeManager.themeSelector( "blue" )
                                        }
                                    }
                                }
                                Row {
                                    width: parent.width
                                    Text {
                                        text: "Use red theme: "
                                    }
                                    Button {
                                        width: 50
                                        onClicked: {
                                            themeManager.themeSelector( "red" )
                                        }
                                    }
                                }
                                Row {
                                    width: parent.width
                                    Text {
                                        text: "Use purple theme: "
                                    }
                                    Button {
                                        width: 50
                                        onClicked: {
                                            themeManager.themeSelector( "purple" )
                                        }
                                    }
                                }
                            }
                        }

                        ColorBox {
                            id: frame1Color1
                            width: parent.width
                            height: 100
                            itm.title: "Frame color1"
                            onColorChanged: {
                                tacho.changeFrameColor ( colorValue, frame1Color2.colorValue )
                            }

                        }

                        ColorBox {
                            id: frame1Color2
                            width: parent.width
                            height: 100
                            itm.title: "Frame color2"
                            onColorChanged: {
                                tacho.changeFrameColor ( frame1Color1.colorValue, colorValue )
                            }
                        }

                        ColorBox {
                            id: tachoColor1
                            width: parent.width
                            height: 100
                            itm.title: "Tacho background color1"
                            onColorChanged: {
                                tacho.changeTachoBackColor ( colorValue, tachoColor2.colorValue )
                            }
                        }

                        ColorBox {
                            id: tachoColor2
                            width: parent.width
                            height: 100
                            itm.title: "Tacho background color2"
                            onColorChanged: {
                                tacho.changeTachoBackColor ( tachoColor1.colorValue, colorValue )
                            }
                        }

                        ColorBox {
                            id: tachoColorRpm1
                            width: parent.width
                            height: 100
                            itm.title: "Tacho rpm background color1"
                            onColorChanged: {
                                tacho.changeTachoBackColor ( colorValue, tachoColorRpm2.colorValue )
                            }
                        }

                        ColorBox {
                            id: tachoColorRpm2
                            width: parent.width
                            height: 100
                            itm.title: "Tacho rpm background color2"
                            onColorChanged: {
                                tacho.changeTachoBackColor ( tachoColorRpm1.colorValue, colorValue )
                            }
                        }

                        ColorBox {
                            id: handColor1
                            width: parent.width
                            height: 100
                            itm.title: "Tacho hand color1"
                            onColorChanged: {
                                tacho.changeHandColor ( colorValue, handColor2.colorValue )
                            }
                        }

                        ColorBox {
                            id: handColor2
                            width: parent.width
                            height: 100
                            itm.title: "Tacho hand color2"
                            onColorChanged: {
                                tacho.changeHandColor ( handColor1.colorValue, colorValue )
                            }
                        }

                        ColorBox {
                            id: rpmHandColor1
                            width: parent.width
                            height: 100
                            itm.title: "Rpm hand color1"
                            onColorChanged: {
                                tacho.changeRpmHandColor ( colorValue, rpmHandColor2.colorValue )
                            }
                        }

                        ColorBox {
                            id: rpmHandColor2
                            width: parent.width
                            height: 100
                            itm.title: "Rpm hand color2"
                            onColorChanged: {
                                tacho.changeRpmHandColor ( rpmHandColor1.colorValue, colorValue )
                            }
                        }

                        ColorBox {
                            id: spaceColor1
                            width: parent.width
                            height: 100
                            itm.title: "Space color1"
                            onColorChanged: {
                                tacho.changeSpaceColor ( colorValue, spaceColor2.colorValue )
                            }
                        }

                        ColorBox {
                            id: spaceColor2
                            width: parent.width
                            height: 100
                            itm.title: "Space color2"
                            onColorChanged: {
                                tacho.changeSpaceColor ( spaceColor1.colorValue, colorValue )
                            }
                        }
                    }
                }
            }

        }
    }
}
