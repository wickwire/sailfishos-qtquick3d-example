/****************************************************************************

This file is part of the Car3D project on http://www.gitorious.org.

Copyright (c) 2009 Nokia Corporation and/or its subsidiary(-ies).*
All rights reserved.

Contact:  Nokia Corporation (qt-info@nokia.com)**

You may use this file under the terms of the BSD license as follows:

"Redistribution and use in source and binary forms, with or without modification, are permitted provided that the following conditions are met:
* Redistributions of source code must retain the above copyright notice, this list of conditions and the following disclaimer.
* Redistributions in binary form must reproduce the above copyright notice, this list of conditions and the following disclaimer in the documentation and/or other materials provided with the distribution.
* Neither the name of Nokia Corporation and its Subsidiary(-ies) nor the names of its contributors may be used to endorse or promote products derived from this software without specific prior written permission.
THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE."

****************************************************************************/

import QtQuick 2.0
import Qt3D 2.0

Rectangle {
    id: root
    color: "grey"
    width: 540
    height: 960

    Viewport {
        id: view
        anchors.fill: parent

        blending: true

        navigation: false
        camera: Camera {
            id: viewCamera
            eye: cameraVectorStandartLeft

            property variant cameraVectorTop:             Qt.vector3d(0,20,5)
            property variant cameraVectorStandartLeft:    Qt.vector3d(10,10,10)
            property variant cameraVectorStandartRight:   Qt.vector3d(-10,10,10)
            property variant cameraVectorLeftRearWheel:   Qt.vector3d( 4.89538955688476, 2.487582445144653, -7.030121326446533)
            property variant cameraVectorLeftFrontWheel:  Qt.vector3d( 4.07279634475708, 2.412682294845581,  7.560872077941894)
            property variant cameraVectorRightFrontWheel: Qt.vector3d(-5.73993539810180, 0.945290386676788,  6.762771129608154)
            property variant cameraVectorRightRearWheel:  Qt.vector3d(-7.72863006591796, 2.758852243423462, -5.922982215881348)


            property variant cameraVectorRightFrontHeadlight: Qt.vector3d(-2.625450372695923, 0.09611012041568756, 8.244413375854492)
            property variant cameraVectorLeftFrontHeadlight:  Qt.vector3d( 2.7446298599243164, 0.20685024559497833, 8.203463554382324)

            Behavior on eye {
                SequentialAnimation {
                    Vector3dAnimation { duration:  300; easing.type:   "OutQuad"; to: viewCamera.cameraVectorTop }
                    Vector3dAnimation { duration: 1000; easing.type: "InOutQuad" }
                }
            }
        }

        Car3D {
            id: car
            leftFrontGlassOpeningDegree:  leftFrontGlassSlider.value
            leftRearGlassOpeningDegree:   leftRearGlassSlider.value
            rightFrontGlassOpeningDegree: rightFrontGlassSlider.value
            rightRearGlassOpeningDegree:  rightRearGlassSlider.value
        }
    }

    Column {
        id: checkButtonColumn
        anchors.bottom: parent.bottom
        anchors.right: parent.right
        anchors.margins: 2
        spacing:  2

        Button {
            id: wheelBtn
                textItem.text: "Check Wheel"
            textItem.font.pixelSize: 22
            textItem.font.bold: true
            textItem.anchors.verticalCenter: wheelBtn.verticalCenter
            textItem.anchors.left: wheelBtn.left
            onClicked: {console.debug("Camera:: " + "(" + viewCamera.eye.x + "," + viewCamera.eye.y + "," + viewCamera.eye.z + ")" );  }
        }

        Button {
            id: frontLeftWheelBtn
            textItem.text: "front left"
            textItem.font.pixelSize: 20
            textItem.anchors.verticalCenter: frontLeftWheelBtn.verticalCenter
            textItem.anchors.right: frontLeftWheelBtn.right

            onClicked: { viewCamera.eye = viewCamera.cameraVectorLeftFrontWheel; car.blinkWheel(0) }
        }

        Button {
            id: frontRightWheelBtn
            textItem.text: "front right"
            textItem.font.pixelSize: 20
            textItem.anchors.verticalCenter: frontRightWheelBtn.verticalCenter
            textItem.anchors.right: frontRightWheelBtn.right
            onClicked: { viewCamera.eye = viewCamera.cameraVectorRightFrontWheel; car.blinkWheel(1) }
        }

        Button {
            id: rearLeftWheelBtn
            textItem.text: "rear left"
            textItem.font.pixelSize: 20
            textItem.anchors.verticalCenter: rearLeftWheelBtn.verticalCenter
            textItem.anchors.right: rearLeftWheelBtn.right
            onClicked: { viewCamera.eye = viewCamera.cameraVectorLeftRearWheel; car.blinkWheel(2) }
        }

        Button {
            id: rearRightWheelBtn
            textItem.text: "rear right"
            textItem.font.pixelSize: 20
            textItem.anchors.verticalCenter: rearRightWheelBtn.verticalCenter
            textItem.anchors.right: rearRightWheelBtn.right
            onClicked: { viewCamera.eye = viewCamera.cameraVectorRightRearWheel; car.blinkWheel(3) }
        }
        Item { id: spacer1; height: 3; width: 1 }


        Button {
            id: doorBtn
            textItem.text: "Check Door"
            textItem.font.pixelSize: 22
            textItem.font.bold: true
            textItem.anchors.verticalCenter: doorBtn.verticalCenter
            textItem.anchors.left: doorBtn.left
            onClicked: { }
        }

        Button {
            id: frontLeftDoorBtn
            textItem.text: "front left"
            textItem.font.pixelSize: 20
            textItem.anchors.verticalCenter: frontLeftDoorBtn.verticalCenter
            textItem.anchors.right: frontLeftDoorBtn.right
            onClicked: { viewCamera.eye = viewCamera.cameraVectorStandartLeft; car.swingDoor(0) }
        }

        Button {
            id: frontRightDoorBtn
            textItem.text: "front right"
            textItem.font.pixelSize: 20
            textItem.anchors.verticalCenter: frontRightDoorBtn.verticalCenter
            textItem.anchors.right: frontRightDoorBtn.right
            onClicked: { viewCamera.eye = viewCamera.cameraVectorStandartRight; car.swingDoor(1) }
        }

        Button {
            id: rearLeftDoorBtn
            textItem.text: "rear left"
            textItem.font.pixelSize: 20
            textItem.anchors.verticalCenter: rearLeftDoorBtn.verticalCenter
            textItem.anchors.right: rearLeftDoorBtn.right
            onClicked: { viewCamera.eye = viewCamera.cameraVectorStandartLeft; car.swingDoor(2) }
        }

        Button {
            id: rearRightDoorBtn
            textItem.text: "rear right"
            textItem.font.pixelSize: 20
            textItem.anchors.verticalCenter: rearRightDoorBtn.verticalCenter
            textItem.anchors.right: rearRightDoorBtn.right
            onClicked: { viewCamera.eye = viewCamera.cameraVectorStandartRight; car.swingDoor(3) }
        }
        Item { id: spacer2; height: 3; width: 1 }


        Button {
            id: normal
            textItem.text: "Reset"
            textItem.font.pixelSize: 22
            textItem.font.bold: true
            textItem.anchors.verticalCenter: normal.verticalCenter
            textItem.anchors.left: normal.left
            onClicked: { viewCamera.eye = viewCamera.cameraVectorStandartLeft; car.stopAnimation() }
        }
    }

    Column {
        anchors.bottom: parent.bottom
        anchors.right: checkButtonColumn.left
        anchors.margins: 2
        spacing:  2

        SimpleSlider { id: leftFrontGlassSlider }
        SimpleSlider { id: rightFrontGlassSlider }
        SimpleSlider { id: leftRearGlassSlider }
        SimpleSlider { id: rightRearGlassSlider }
    }


    CubeView { }
}
