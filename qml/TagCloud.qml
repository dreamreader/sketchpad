import QtQuick 1.0

Rectangle {
    id: tagCloud

    SystemPalette { id: palette }   //we get the system default colors from this

    //public API
    property variant model
    property color baseColor: palette.base
    property color textColor: palette.text
    property int   textFontSize: 16

    color: baseColor

    Flow {
        id: flow
        width: parent.width
        spacing: 15
        anchors.margins: 4
        anchors.verticalCenter: parent.verticalCenter

        //property int maxHeight:0

        Repeater {
            id: repeater
            model: tagCloud.model

            Text {
                id: textBlock
                text: category
                font.pointSize: tagCloud.textFontSize;
            }
        }
    }
}
