import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15


Window {
    id: mainWindow
    width: 640
    height: 480
    visible: true
    title: qsTr("EBMC")

    Text {
        id: niveauBatterie;
        text: "Batterie: N/A"
        font.pointSize: 24;
        color: "red"
    }


    Item
    {
       Timer
       {
           interval: 1000;
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
               xhr.open("GET", "http://192.168.4.1/?vide=1");
               xhr.send()
           }
       }
    }

    Button {
        id: servo
        anchors.centerIn: parent;
        text: qsTr("Servo")

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

                xhr.open("GET", "http://192.168.4.1/?push1=1");
                xhr.send()
            }
            else
            {

                xhr.open("GET", "http://192.168.4.1/?push1=0");
                xhr.send()
            }

        }
    }

    Button {
        id: slowFront
        x: 14
        y: 194
        text: qsTr("^")

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

                xhr.open("GET", "http://192.168.4.1/?fader1=0.75");
                xhr.send()
            }
            else
            {

                xhr.open("GET", "http://192.168.4.1/?fader1=0.5");
                xhr.send()
            }

        }
    }

    Button {
        id: slowBack
        x: 14
        y: 254
        text: qsTr("v")
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

                xhr.open("GET", "http://192.168.4.1/?fader1=0.25");
                xhr.send()
            }
            else
            {

                xhr.open("GET", "http://192.168.4.1/?fader1=0.5");
                xhr.send()
            }
        }
    }

    Button {
        id: fastFront
        x: 14
        y: 148
        text: qsTr("^^")
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

                xhr.open("GET", "http://192.168.4.1/?fader1=1.0");
                xhr.send()
            }
            else
            {
                xhr.open("GET", "http://192.168.4.1/?fader1=0.5");
                xhr.send()
            }
        }
    }

    Button {
        id: fastBack
        x: 14
        y: 300
        text: qsTr("vv")
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
                xhr.open("GET", "http://192.168.4.1/?fader1=0.0");
                xhr.send()
            }
            else
            {
                xhr.open("GET", "http://192.168.4.1/?fader1=0.5");
                xhr.send()
            }
        }
    }

    Button {
        id: fastLeft
        x: 204
        y: 220
        text: qsTr("<<")

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
                xhr.open("GET", "http://192.168.4.1/?fader2=1.0");
                xhr.send()
            }
            else
            {
                xhr.open("GET", "http://192.168.4.1/?fader2=0.5");
                xhr.send()
            }
        }
    }

    Button {
        id: fastRight
        x: 531
        y: 220
        text: qsTr(">>")
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
                xhr.open("GET", "http://192.168.4.1/?fader2=0.0");
                xhr.send()
            }
            else
            {
                xhr.open("GET", "http://192.168.4.1/?fader2=0.5");
                xhr.send()
            }
        }
    }

    Button {
        id: slowLeft
        x: 310
        y: 220
        text: qsTr("<")
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
                xhr.open("GET", "http://192.168.4.1/?fader2=0.75");
                xhr.send()
            }
            else
            {
                xhr.open("GET", "http://192.168.4.1/?fader2=0.5");
                xhr.send()
            }
        }
    }

    Button {
        id: slowRight
        x: 425
        y: 220
        text: qsTr(">")
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
                xhr.open("GET", "http://192.168.4.1/?fader2=0.25");
                xhr.send()
            }
            else
            {
                xhr.open("GET", "http://192.168.4.1/?fader2=0.5");
                xhr.send()
            }
        }
    }

    Switch {
        id: modePro
        x: 293
        y: 58
        text: qsTr("Mode PRO")
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
