TEMPLATE = app
# Define how to create version.h
prebuild.target = phony
prebuild.commands = /usr/bin/bash "$$PWD/prebuild.sh $(QTDIR) $$PWD"
prebuild.depends = FORCE

QMAKE_EXTRA_TARGETS += prebuild
PRE_TARGETDEPS += phony

QT += widgets quick sensors
CONFIG += ignore_no_exist

android {
    QT += androidextras
}

ANDROID_PACKAGE_SOURCE_DIR = $$PWD/android

# Additional import path used to resolve QML modules in Creator's code model
QML_IMPORT_PATH =

QMAKE_CXXFLAGS += -std=c++1y

CONFIG(debug, debug|release) {
    QMAKE_CXXFLAGS += -DDEVELOPER_BUILD
    RCC_DIR = resource-fake
} else {
    RCC_DIR = resource
}

INCLUDEPATH += ../../qmlcomponents/src \
               ../../qmlcomponents/src/box2d

SOURCES += src/main.cpp \

HEADERS += ../../qmlcomponents/src/application.h \
           ../../qmlcomponents/src/convenience.h \
           ../../qmlcomponents/src/fileio.h \
           ../../qmlcomponents/src/runnable.h

RESOURCES += $$RCC_DIR/main.qrc

OTHER_FILES += resource/main.qml \
               ../../qmlcomponents/views/Persistence.qml \
               ../../qmlcomponents/views/PersistentListView.qml \
               ../../qmlcomponents/views/PersistentListViewItem.qml \
               ../../qmlcomponents/storage/Storage.qml \
               ../../qmlcomponents/storage/SqlTableModel.qml \
               prebuild.sh

