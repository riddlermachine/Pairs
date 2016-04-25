import QtQuick 2.3
import QtQuick.Window 2.2
import Pairs 1.0

Item {
    id: cellItem
    width: 48
    height: 32
    property Cell cell: field.cellAt(index % field.width, index / field.width)

    Flipable {
        anchors.fill: parent

        front: Rectangle {
            anchors.fill: parent
        }

        back: Item {
            anchors.fill: parent
            Text {
                anchors.centerIn: parent
                text: cell.key
            }
            Image{
                anchors.centerIn: parent
                width:40
                height:40
                id:image5
                source: "qrc:///smeshariki/" + cell.key + ".png"
            }
        }

        transform: Rotation {
            origin.x: cellItem.width / 2
            origin.y: cellItem.height / 2
            axis.x: 1; axis.y: 0; axis.z: 0
            angle: 0
            Behavior on angle { NumberAnimation { duration: 400; easing.type: Easing.OutBack } }
        }
    }
}
