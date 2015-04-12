TEMPLATE = app
# Define how to create version.h
prebuild.target = phony
prebuild.commands = /usr/bin/bash "$$PWD/prebuild.sh $(QTDIR) $$PWD"
prebuild.depends = FORCE

QMAKE_EXTRA_TARGETS += prebuild
PRE_TARGETDEPS += phony

QT += quick sensors widgets sql
CONFIG += ignore_no_exist

android {
    QT += androidextras
}

ANDROID_PACKAGE_SOURCE_DIR = $$PWD/android

# Additional import path used to resolve QML modules in Creator's code model
QML_IMPORT_PATH =

QMAKE_CXXFLAGS += -std=c++1y -Werror

CONFIG(debug, debug|release) {
    QMAKE_CXXFLAGS += -DDEVELOPER_BUILD
    RCC_DIR = resource-fake
} else {
    RCC_DIR = resource
}

INCLUDEPATH += ../../qmlcomponents/src \
               ../../qmlcomponents/src/box2d

SOURCES += src/main.cpp \
           ../../qmlcomponents/src/graph/graph.cpp \
           ../../qmlcomponents/src/graph/gridnode.cpp \
           ../../qmlcomponents/src/graph/linenode.cpp \
           ../../qmlcomponents/src/graph/noisynode.cpp \


HEADERS += ../../qmlcomponents/src/application.h \
           ../../qmlcomponents/src/convenience.h \
           ../../qmlcomponents/src/fileio.h \
           ../../qmlcomponents/src/runnable.h \
           ../../qmlcomponents/src/graph/graph.h \
           ../../qmlcomponents/src/graph/gridnode.h \
           ../../qmlcomponents/src/graph/linenode.h \
           ../../qmlcomponents/src/graph/noisynode.h \

RESOURCES += $$RCC_DIR/main.qrc \
            ../../qmlcomponents/shaders/shaders.qrc

OTHER_FILES += resource/main.qml \
               ../../qmlcomponents/views/PersistentGraphView.qml \
               prebuild.sh \
               ../../qmlcomponents/shaders/line.vsh \
               ../../qmlcomponents/shaders/line.fsh \

