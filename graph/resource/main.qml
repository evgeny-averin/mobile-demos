import QtQuick 2.3
import QtSensors 5.3
import QtQuick.Controls 1.2
import QtQuick.Controls.Styles 1.1
import QtQuick.LocalStorage 2.0
import QtQuick.Window 2.1
import QtGraphicalEffects 1.0
import "../../../qmlcomponents/views"

Rectangle
{
    id: mainWindow
    property real scale: Math.min(Screen.width, Screen.height) / 600.
    color: "#454545"

    PersistentGraphView
    {
        id: graphView
        anchors.fill: parent

        database: "testDatabase"
        table: "PersistentGraphViewDemo"

        Graph
        {
            id: graphAlpha
            name: "Graph alpha"
            style: graphAlpha.lines
            step: graphAlpha.stepPre
            color: "red"
            role: "alpha"
        }

        Graph
        {
            id: graphBeta
            name: "Graph beta"
            style: graphBeta.bars
            color: "steelblue"
            role: "beta"
        }

        Graph
        {
            id: graphGamma
            name: "Graph gamma"
            style: graphGamma.bars
            color: "lightgreen"
            role: "gamma"
        }

        onLoadingFinished:
        {
            //graphView.clear();
            graphView.append(Date.now(), {
                                 alpha: Math.floor(Math.random(10) * 20) + 100,
                                 beta:  Math.floor(Math.random(10) * 20) + 50,
                                 gamma: Math.floor(Math.random(10) * 10) + 40})
        }
    }
}

