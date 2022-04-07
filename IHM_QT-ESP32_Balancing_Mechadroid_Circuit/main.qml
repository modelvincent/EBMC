import QtQuick
import QtQuick.Window
import QtQuick.Controls
import QtQuick.Controls.Material 2.15


Window {

    property real previous_vitesse:0.5;
    property real previous_direction:0.5;
    property real vitesse:0.5;
    property real direction:0.5;

    Image {
                id: backgroundImage
                anchors.fill: parent
                source: "qrc:/img/carbon_background"
                opacity: 1
                z: -1
            }

    id: mainWindow


    width: (Qt.platform.os=="windows") ? 640 : Screen.desktopAvailableWidth;
    height: (Qt.platform.os=="windows") ? 480 : Screen.desktopAvailableHeight;
    visible: true
    title: qsTr("Esp32 Balancing Mechadroid Cart")




    Item
    {
       Timer
       {
           interval: 100;
           running: true;
           repeat: true;
           onTriggered:
           {
               const xhr = new XMLHttpRequest()
               xhr.onreadystatechange = function()
               {
                   if (xhr.readyState === XMLHttpRequest.HEADERS_RECEIVED)
                   {
                   }
                   else if(xhr.readyState === XMLHttpRequest.DONE)
                   {
                       var response = xhr.responseText.toString();
                       updateBattery(response);
                   }
               }


               if(previous_vitesse!=vitesse)
               {
                    xhr.open("GET", "http://192.168.4.1/?fader1=" + vitesse.toString());
                    xhr.send()
                   previous_vitesse=vitesse;
               }

               if(previous_direction!=direction)
               {
                    xhr.open("GET", "http://192.168.4.1/?fader2=" + direction.toString());
                    xhr.send()
                   previous_direction=direction;
               }

               //xhr.open("GET", "http://192.168.4.1/?vide=1");

           }
       }
    }

    Rectangle{

     id:rectangleVitesse;

    anchors.left: parent.left;
    anchors.leftMargin: 20

    width: parent.width/4;
    color: "transparent";


    height: parent.height/1.4;
    anchors.verticalCenter: parent.verticalCenter;

        Button {
            id: fastFront
            x:0;
            y:0;

            width: parent.width;
            height: parent.height/4;

            text: qsTr("^^")
            onPressedChanged:
            {
                if(pressed)
                {
                    vitesse=1.0;
                }
                else
                {
                    vitesse=0.5;
                }
            }
        }
        Button {
            id: slowFront
            x:0;
            y:(parent.height/4);

            width: parent.width;
            height: parent.height/4;



            text: qsTr("^")

            onPressedChanged:
            {
                if(pressed)
                {
                    vitesse=0.75;
                }
                else
                {
                    vitesse=0.5;
                }

            }
        }

        Button {
            id: slowBack

            x:0;
            y:(parent.height/4)*2;

            width: parent.width;
            height: parent.height/4;


            text: qsTr("v")
            onPressedChanged:
            {
                if(pressed)
                {
                    vitesse=0.25;
                }
                else
                {
                    vitesse=0.5;
                }
            }
        }



        Button {
            id: fastBack

            x:0;
            y:(parent.height/4)*3;

            width: parent.width;
            height: parent.height/4;


            text: qsTr("vv")
            onPressedChanged:
            {
                if(pressed)
                {
                    vitesse=0.0;
                }
                else
                {
                    vitesse=0.5;
                }
            }
        }
    }

    Rectangle{

        id: rectangleDirection;
       // anchors.left: parent.left;
        ///anchors.rightMargin: 20


        //x: rectangleVitesse.width+rectangleVitesse.x+20;


        color: "transparent";

        //width: parent.width-(rectangleVitesse.width+rectangleVitesse.x+40);
        x: parent.width/2+20
        width: parent.width/2-40;
        height: parent.height/3;
        anchors.verticalCenter: parent.verticalCenter;



        Button {
            id: fastLeft
            x: 0
            y: 0

            height: parent.height;
            width: parent.width/4;
            text: qsTr("<<")

            onPressedChanged:
            {
                if(pressed)
                {
                    direction=1.0;
                }
                else
                {
                    direction=0.5;
                }
            }
        }

        Button {
            id: fastRight
            x: (parent.width/4)*3
            y: 0

            height: parent.height;
            width: parent.width/4;


            text: qsTr(">>")
            onPressedChanged:
            {
                if(pressed)
                {
                    direction=0.0;
                }
                else
                {
                    direction=0.5;
                }
            }
        }


        Button {
            id: slowLeft
            x: (parent.width/4)
            y: 0

            height: parent.height;
            width: parent.width/4;

            text: qsTr("<")
            onPressedChanged:
            {
                if(pressed)
                {
                    direction=0.75;
                }
                else
                {
                    direction=0.5;
                }
            }
        }

        Button
        {
            id: slowRight
            x: (parent.width/4)*2
            y: 0

            height: parent.height;
            width: parent.width/4;

            text: qsTr(">")
            onPressedChanged:
            {
                if(pressed)
                {
                    direction=0.25;
                }
                else
                {
                    direction=0.5;
                }
            }
         }
    }


    Rectangle
    {
        id: rectangleAutre;
        color: "transparent";
        width: parent.width/4
        height: parent.height/2- (parent.height/2-rectangleDirection.y+10);
        anchors.top: parent.top;

        anchors.horizontalCenter: parent.horizontalCenter;
        //anchors.bottom: rectangleDirection.height
        Text {
            anchors.horizontalCenter: parent.horizontalCenter;
            id: niveauBatterie;
            text: "Batterie: N/A"
            font.pointSize: 12;
            color: "white"
        }
        Switch {
            id: modePro
            anchors.horizontalCenter: parent.horizontalCenter;
            anchors.top: niveauBatterie.bottom
            text: qsTr("Mode PRO")


            contentItem: Text {
                  //text: modePro.text
                  // font: modePro.font
                   //opacity: enabled ? 1.0 : 0.3
                   color: modePro.checked ? "pink" : "lightgreen"
                   text: modePro.checked ? "mode PRO" : "mode EASY"
                   verticalAlignment: Text.AlignVCenter
                   leftPadding: modePro.indicator.width + modePro.spacing
               }


            onCheckedChanged:
            {
                const xhr = new XMLHttpRequest()
                xhr.onreadystatechange = function()
                {
                    if (xhr.readyState === XMLHttpRequest.HEADERS_RECEIVED)
                    {
                    }
                    else if(xhr.readyState === XMLHttpRequest.DONE)
                    {
                        var response = xhr.responseText.toString();
                        updateBattery(response);
                    }
                }


                if(checked)
                {
                    xhr.open("GET", "http://192.168.4.1/?toggle1=1");
                    xhr.send()

                }
                else
                {
                    xhr.open("GET", "http://192.168.4.1/?toggle1=0");
                    xhr.send()
                }

            }

        }

        Button {
            id: servo


            signal ueSignalButtonClicked



            anchors.top: modePro.bottom
            width: parent.width
            anchors.bottom: parent.bottom;
            anchors.horizontalCenter: parent.horizontalCenter;
            text: qsTr("Servo")


           ParallelAnimation {
                id: animatePress
                PropertyAnimation{
                                    target: servo; properties: "scale"; from: 1.0; to: 1.2; duration: 1000
                }

            }

           ParallelAnimation {
                id: animateRelease;
                PropertyAnimation{
                    target: servo; properties: "scale"; from: 1.2; to: 1.0; duration: 1000
                }

            }

            onPressedChanged:
            {
                const xhr = new XMLHttpRequest()
                xhr.onreadystatechange = function()
                {
                    if (xhr.readyState === XMLHttpRequest.HEADERS_RECEIVED)
                    {
                    }
                    else if(xhr.readyState === XMLHttpRequest.DONE)
                    {
                        var response = xhr.responseText.toString();
                        updateBattery(response);
                    }
                }

                if(pressed)
                {
                    animatePress.start();

                    xhr.open("GET", "http://192.168.4.1/?push1=1");
                    xhr.send()
                }
                else
                {
                   animateRelease.start();

                    xhr.open("GET", "http://192.168.4.1/?push1=0");
                    xhr.send()
                }

            }
        }



    }

    function updateBattery(battery)
    {
       niveauBatterie.text=("batterie : "+battery+"V");
    }

    function request() {
        const xhr = new XMLHttpRequest()
        xhr.onreadystatechange = function() {
            if (xhr.readyState === XMLHttpRequest.HEADERS_RECEIVED)
            {
            }
            else if(xhr.readyState === XMLHttpRequest.DONE)
            {
                var response = JSON.parse(xhr.responseText.toString())
            }
        }
    }

}
