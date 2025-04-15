
import QtQuick 2.15
import "."

Item {
  id: root
  DarkTheme {
    id: dark
  }

  LightTheme {
    id: light
  }

  GoldTheme {
    id: gold
  }

  GreenTheme {
    id: green
  }

  BlueTheme {
    id: blue
  }

  RedTheme {
    id: red
  }

  PurpleTheme {
    id: purple
  }

  property ItemTheme currentTheme: dark
  property int speed: 2000
  function themeSelector ( name ) {
    switch ( name ) {
    case "light":
      root.currentTheme = light
      break
    case "gold":
      root.currentTheme = gold
      break
    case "green":
      root.currentTheme = green
      break
    case "blue":
      root.currentTheme = blue
      break
    case "red":
      root.currentTheme = red
      break
    case "purple":
      root.currentTheme = purple
      break
    default:
      root.currentTheme = dark
    }
  }
}
