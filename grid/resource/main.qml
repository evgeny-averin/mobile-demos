import QtQuick 2.3
import QtSensors 5.3
import QtQuick.Controls 1.2
import QtQuick.Controls.Styles 1.1
import QtQuick.LocalStorage 2.0
import QtQuick.Window 2.1
import "../../../qmlcomponents/views"

Rectangle
{
    id: mainWindow
    property real scale: Screen.width / 600.
    color: "green"

    PersistentGridView
    {
        id: list
        database: "testDatabase"
        table: "PersistentGridViewDemo"
        roles: [
            "role1",
            "role2",
            "role3",
            "role4"
        ]

        anchors.fill: parent
        columnCount: 3

        onLoadingFinished:
        {
            list.append({role1: Math.floor(Math.random(10) * 100), role2: 4, role3: 5, role4: 6})
        }
    }
}
