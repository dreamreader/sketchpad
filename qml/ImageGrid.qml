import QtQuick 1.0

Item {

    id: imageGrid

    width: 640
    height: 750

    property variant model

    // Need to enable focuse to receive keyevents,
    // otherwise the events are just not received
//    focus:true;

//    Keys.onPressed: {

//        if (event.key == Qt.Key_Left) {
//            event.accepted = true;
//            core.prevCategory()
//        } else if (event.key == Qt.Key_Right) {
//            event.accepted = true;
//            core.nextCategory()
//        }
//    }



    Component {

        id: rectDelegate

        Rectangle {

            id: rect

            // Make the rectangle a bit smaller than each actual
            // gridcell to have a "margin" effect
            width: rect.GridView.view.cellWidth - 5
            height: rect.GridView.view.cellHeight - 5

            // Visualize the selected items by displaying
            // their border in a different color.
            // Note that by clicking on the MouseArea the
            // selection value for the current item gets changed,
            // this updates the C++ model which in turn sends a
            // signal that provides the new value here
//            border.width: 2;
//            border.color: selected ? "red" : "black"
//            color: selected ? "#89f5bb" : "white"

//            MouseArea {
//                anchors.fill: parent
//                onClicked: rect.GridView.view.model.toggleSelection(index)
//            }
            Image {
                source: url;
                fillMode: Image.PreserveAspectFit;
                width: parent.width - parent.border.width;
                height: parent.height - parent.border.height;
                anchors.centerIn: parent;
                smooth: true;
                asynchronous: true
            }
        }
    }

    GridView {

        id: grid
        anchors.fill: parent
        model: imageGrid.model
        cellWidth: 150; cellHeight: 150
        delegate: rectDelegate
    }
}
