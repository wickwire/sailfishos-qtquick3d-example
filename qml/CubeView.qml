/****************************************************************************

This file is part of the Car3D project on http://www.gitorious.org.

Copyright (c) 2009 Nokia Corporation and/or its subsidiary(-ies).*
All rights reserved.

Contact:  Nokia Corporation (qt-info@nokia.com)**

You may use this file under the terms of the BSD license as follows:

"Redistribution and use in source and binary forms, with or without modification, are permitted provided that the following conditions are met:
* Redistributions of source code must retain the above copyright notice, this list of conditions and the following disclaimer.
* Redistributions in binary form must reproduce the above copyright notice, this list of conditions and the following disclaimer in the documentation and/or other materials provided with the distribution.
* Neither the name of Nokia Corporation and its Subsidiary(-ies) nor the names of its contributors may be used to endorse or promote products derived from this software without specific prior written permiss
THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A P

****************************************************************************/

import QtQuick 2.0
import Qt3D 2.0
import Qt3D.Shapes 2.0

Viewport {
    id: view

    anchors.top:   parent.top
    anchors.right: parent.right
    width:  sideLength
    height: sideLength

    property int sideLength: Math.min(parent.width,parent.height) / 4

    Cube {
        scale: 2

        RotationAnimation { target: rotateX; running: true; loops: Animation.Infinite; property: "angle"; from: 0; to : 360.0; duration: 3000; }
        RotationAnimation { target: rotateY; running: true; loops: Animation.Infinite; property: "angle"; from: 0; to : 360.0; duration: 4000; }
        RotationAnimation { target: rotateZ; running: true; loops: Animation.Infinite; property: "angle"; from: 0; to : 360.0; duration: 5000; }

        transform: [
            Rotation3D { id: rotateX; axis: Qt.vector3d(1, 0, 0) },
            Rotation3D { id: rotateY; axis: Qt.vector3d(0, 1, 0) },
            Rotation3D { id: rotateZ; axis: Qt.vector3d(0, 0, 1) }
        ]

        effect: Effect {
            blending: true
            color: "#8880C342"
            texture: "qtlogo.png"
            decal: true
        }
    }



    SequentialAnimation {id: bounceAnimi;
        NumberAnimation { target: view.anchors; properties: "rightMargin"; to: Math.abs(parent.width-parent.height)/2;
            duration: 1000; easing.type: Easing.OutBounce; easing.amplitude: 0.5 }
        NumberAnimation { target: view; properties: "width, height"; to: Math.min(parent.width,parent.height);
            duration: 3000; easing.type: Easing.OutBounce }
        NumberAnimation { target: view; properties: "width, height"; to: view.sideLength;
            duration: 3000; easing.type: Easing.OutBounce }
        NumberAnimation { target: view.anchors; properties: "rightMargin"; to: 0;
            duration: 1000; easing.type: Easing.OutBounce; easing.amplitude: 0.5 }
    }

    MouseArea {
        anchors.fill: parent
        onClicked: bounceAnimi.start()
    }

}

