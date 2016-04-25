import QtQuick 2.3
import QtQuick.Window 2.2
import Pairs 1.0


Flipable {

    id: flipable
    width: 40
    height: 40
    property bool flipped: cell.open

    property Cell cell: field.cellAt(
                            index % field.width,
                            index / field.width)

    front: Rectangle {
        id: cellItem1
        width: 48
        height: 32
        color: "#d5d5d5"
    }
    back: Rectangle {
        id: cellItem
        width: 40
        height: 40

        Image {
            anchors.centerIn: parent
            width: 40
            height: 40
            id: image5
            property Cell cell: field.cellAt(
                                    index % field.width,
                                    index / field.width)
            source: "qrc:///smeshariki/" + cell.key + ".png"
        }
    }

    transform: Rotation {
        id: rotation
        origin.x: flipable.width / 2
        origin.y: flipable.height / 2
        axis.x: 0
        axis.y: 1
        axis.z: 0
        angle: 0
    }

    states: State {
        name: "back"
        PropertyChanges {
            target: rotation
            angle: 180
        }
        when: flipable.flipped
    }

    transitions: Transition {
        NumberAnimation {
            target: rotation
            property: "angle"
            duration: 4000
        }
    }

    MouseArea {
        anchors.fill: parent
        onClicked: cell.open()
    }
}
