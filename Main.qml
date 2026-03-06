import QtQuick 2.15
import QtQuick.Controls 2.15

ApplicationWindow
{
  id: app
  visible: true

  title: "Clock"
  width: 300
  height: 400
  x: 12
  y: 48
  // flags: Qt.Window | Qt.FramelessWindowHint

  property string current_time: "00:00:00"
  property QtObject backend

  Connections
  {
    target: app.backend

    function onTimeUpdated(time)
    {
      app.current_time = time;
      // console.log(time)
    }
  }

  Rectangle
  {
    anchors.fill: parent

    Rectangle
    {
      anchors.fill: parent
      gradient: Gradient
      {
        GradientStop { position: 0.0; color: "#b5005a" }
        GradientStop { position: 1.0; color: "#5c0070" }
      }
    }

    Rectangle
    {
      anchors.fill: parent
      color: "transparent"

      Text
      {
        anchors
        {
          bottom: parent.bottom
          bottomMargin: 12
          right: parent.right
          rightMargin: 12
        }
        font { pixelSize: 38 }
        text: app.current_time
        color: "white"
      }
    }
  }
}
