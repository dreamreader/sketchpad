import QtQuick 1.0
import CustomComponents 1.0

Rectangle {

    id: sketchpad

    focus: true
    Keys.onEscapePressed: sketchwidget.clear = true

    // minimum/maximum sidelength of the sketcharea
    // tagcloud sizing will be relative to that
    property int maxSize: 600;
    property int minSize: 100;


//    Keys.onRightPressed:
//    {
//        if (tagcloud.visible) {
//            tagcloud.visible = false
//            imageGrid.visible = true
//        }
//        else if (imageGrid.visible) {
//            imageGrid.visible = false
//            imageGridReordered.visible = true
//        }
//        else if (imageGridReordered.visible) {
//            imageGridReordered.visible = false
//            tagcloud.visible = true
//        }
//    }


//    Keys.onLeftPressed:
//    {
//        if (tagcloud.visible) {
//            tagcloud.visible = false
//            imageGridReordered.visible = true
//        }
//        else if (imageGrid.visible) {
//            imageGrid.visible = false
//            tagcloud.visible = true
//        }
//        else if (imageGridReordered.visible) {
//            imageGridReordered.visible = false
//            imageGrid.visible = true
//        }
//    }



    Text {
        id: help
        text: "?"
        font.pointSize: 16
        anchors.left: sketchpad.left
        anchors.top: sketchpad.top
        anchors.margins: 20
        color: "grey"

        MouseArea {
            hoverEnabled: true
            anchors.fill: parent
            onEntered: { instructions.opacity=1; parent.color="black" }
            onExited:  { instructions.opacity=0; parent.color="grey"  }
        }

        Behavior on color { ColorAnimation { duration: 250 } }
    }

    Text {
        id: instructions
        text: "sketch in the box below -- left mouse button: draw, right mouse button: erase, esc: clear."
        font.pointSize: 12
        opacity: 0
        anchors.left: help.right
        anchors.verticalCenter: help.verticalCenter
        anchors.leftMargin:10

        Behavior on opacity { NumberAnimation { properties:"opacity"; duration: 250 } }
    }


        Rectangle {

            width: Math.min(sketchpad.maxSize, Math.max(sketchpad.minSize, parent.width*0.3))
            height: width
            anchors.verticalCenter: parent.verticalCenter
            anchors.right: parent.horizontalCenter
            anchors.rightMargin: Math.max(20, parent.width*0.02)
            border.color: "black"
            border.width: 1
            smooth: true

            SketchWidget {

                id: sketchwidget
                objectName: "sketchwidget"
                width:  parent.width-4
                height: parent.height-4
                anchors.centerIn: parent
                smooth: true
            }
        }


        TagCloud {


            id: tagcloud
            model: classification
            anchors.verticalCenter: parent.verticalCenter
            anchors.left: parent.horizontalCenter
            anchors.leftMargin: Math.max(20, parent.width*0.02)

            width: Math.min(sketchpad.maxSize, Math.max(sketchpad.minSize, parent.width*0.4))
            height: width*0.6
            textFontSize: 7+Math.sqrt(width)
            baseColor: "white"
            textColor: "blue"

            visible: true;
        }

//        ImageGrid {
//            id: imageGrid
//            anchors.verticalCenter: parent.verticalCenter
//            visible: false
//            model: imageSearchModel
//        }

//        ImageGrid {
//            id: imageGridReordered
//            anchors.verticalCenter: parent.verticalCenter
//            visible: false
//            model: imageSearchModelReordered
//        }
    //}
}
