import QtQuick 2.3
import QtSensors 5.3
import QtQuick.Controls 1.2
import QtQuick.Controls.Styles 1.1
import QtQuick.LocalStorage 2.0
import QtQuick.Window 2.1
import QtGraphicalEffects 1.0
import Graph 1.0
import "../../../qmlcomponents/views"

Rectangle
{
    id: mainWindow

    property real scale: Math.min(Screen.width, Screen.height) / 600.

    color: "#dedede"
    width: 640
    height: 480

    PersistentGraphView
    {
        id: graphView
        anchors.fill: parent
        anchors.margins: 50
        name: "PersistentGraphView demo"

        database: "testDatabase"
        table: "PersistentGraphViewDemo"

        background: Rectangle
        {
            color: "#f0f0f0"
        }

        foregroundColor: "#232323"

        Graph
        {
            id: graphGamma
            opacity: .7
            name: "Graph gamma"
            step: Graph.Bars
            color: "lightgreen"
            role: "gamma"
            shadowOpacity: 1
        }

        Graph
        {
            id: graphBeta
            opacity: .7
            name: "Graph beta"
            step: Graph.Bars
            color: "steelblue"
            role: "beta"
            shadowOpacity: 1
        }

        Graph
        {
            id: graphAlpha
            opacity: .7
            name: "Graph alpha"
            step: Graph.Bars
            color: "red"
            role: "alpha"
            shadowOpacity: 1
        }

        onLoadingFinished:
        {
        //    graphView.clear();
            graphView.append(Date.now(), {
                                 alpha: Math.floor(Math.random(10) * 20) + 100,
                                 beta:  Math.floor(Math.random(10) * 20) + 50,
                                 gamma: Math.floor(Math.random(10) * 10) + 40})
        }
    }
}

