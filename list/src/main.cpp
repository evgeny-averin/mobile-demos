#include <QGuiApplication>
#include <QtQuick>
#include "application.h"
#include "fileio.h"
#include "runnable.h"

QtAndroidRunner *QtAndroidRunner::m_instance = nullptr;
World *World::_instance = nullptr;

int main(int argc, char *argv[])
{
    QGuiApplication qapp(argc, argv);
    Application app("menu");

    return app.exec();
}
