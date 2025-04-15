import QtQuick
import QtQuick.Controls

Item {
    id: mainItem
    ColorItem {
        id: color1
    }

    property int heightItem: 20
    property int widthItem: 200
    property alias itm: color1
    property int widthValue: 50
    property int widthName: 50
    property int widthSlider: width - widthName - widthValue
    readonly property color colorValue: color1.colorValue

    signal colorChanged(color newColor)

    height: heightItem
    width: widthItem

    Column {
        height: parent.height
        width: parent.width
        Row {
            height: 20
            width: parent.width
            Text {
               // anchors.fill: parent
                text: color1.title
            }
        }

        Row {
            id: rowRed
            height: 20
            width: parent.width
            spacing: 10
            Text {
              width: mainItem.widthName
              text: "Red: "
            }
            Slider {
                id: sliderRed
                width: mainItem.widthSlider
                from: 0.0
                to: 1.0
                value: color1.red
                onValueChanged: {
                    color1.red = value
                    mainItem.colorChanged ( mainItem.colorValue )
                }
            }
            Text {
                width: mainItem.widthValue
                text: sliderRed.value
                clip: true
            }
        }
        Row {
            id: rowGreen
            spacing: 10
            Text {
              width: mainItem.widthName
              text: "Green: "
            }
            Slider {
                id: sliderGreen
                width: mainItem.widthSlider
                from: 0.0
                to: 1.0
                value: color1.green
                onValueChanged: {
                    color1.green = value
                    mainItem.colorChanged ( mainItem.colorValue )
                }
            }
            Text {
                width: mainItem.widthValue
                text: sliderGreen.value
                clip: true
            }
        }
        Row {
            id: rowBlue
            spacing: 10
            Text {
              width: mainItem.widthName
              text: "Blue: "
            }
            Slider {
                id: sliderBlue
                width: mainItem.widthSlider
                from: 0.0
                to: 1.0
                value: color1.blue
                onValueChanged: {
                    color1.blue = value
                    mainItem.colorChanged ( mainItem.colorValue )
                }
            }
            Text {
                width: mainItem.widthValue
                text: sliderBlue.value
                clip: true
            }
        }
    }
}
