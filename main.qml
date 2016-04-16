import QtQuick 2.3
import QtQuick.Window 2.2
import Pairs 1.0


Window {
    visible: true
    width: 800
    height: 600
    Field {
        id: field
    }

    Rectangle {
        id: board
        color: "lightgray"
        anchors.fill: parent
        anchors.margins: 10

        Grid {
            id: grid
            rows: field.width
            columns: field.height
            spacing: 4

            Repeater {
                model: field.width * field.height

                Flipable {

                    id: flipable
                        width: 40
                        height: 40
                        property bool flipped: false

                            front: Rectangle { width: 48; height: 32; color: "black"; anchors.centerIn: parent }
                            back: Rectangle {
                                id: cellItem
                                width: 48
                                height: 32
                                property Cell cell: field.cellAt(index % field.width, index / field.width)

                                Image {
                                    anchors.centerIn: parent
                                    width:40
                                    height:40
                                    id:image5
                                    property Cell cell: field.cellAt(index % field.width, index / field.width)
                                    source: "qrc:///smeshariki/" + cell.key + ".png"
                                }

                            }

                            transform: Rotation {
                                id: rotation
                                origin.x: flipable.width/2
                                origin.y: flipable.height/2
                                axis.x: 0; axis.y: 1; axis.z: 0
                                angle: 0
                            }

                            states: State {
                                name: "back"
                                PropertyChanges { target: rotation; angle: 180 }
                                when: flipable.flipped
                            }

                            transitions: Transition {
                                NumberAnimation { target: rotation; property: "angle"; duration: 4000 }
                            }

                            MouseArea {
                                anchors.fill: parent
                                onClicked: flipable.flipped = !flipable.flipped
                            }
                        }


                }


            }
        }
    }
