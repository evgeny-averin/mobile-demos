#include <QGuiApplication>
#include <QtQuick>
#include "application.h"
#include "fileio.h"
#include "graph/graph.h"

#ifdef Q_OS_ANDROID
#include "runnable.h"
QtAndroidRunner *QtAndroidRunner::m_instance = nullptr;
#endif

World *World::_instance = nullptr;

int main(int argc, char *argv[])
{
    qmlRegisterType<Graph>("Graph", 1, 0, "Graph");

    QGuiApplication qapp(argc, argv);
    Application app("menu");

    return app.exec();
}
