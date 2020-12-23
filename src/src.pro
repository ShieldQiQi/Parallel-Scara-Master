lessThan(QT_MAJOR_VERSION, 5): error("requires Qt 5")

QT += core gui
QT += widgets
QT += xml
QT += charts

greaterThan(QT_MAJOR_VERSION, 4): QT += widgets printsupport

TARGET = cangaroo
TEMPLATE = app
CONFIG += warn_on
CONFIG += link_pkgconfig

DESTDIR = ../bin
MOC_DIR = ../build/moc
RCC_DIR = ../build/rcc
UI_DIR = ../build/ui
unix:OBJECTS_DIR = ../build/o/unix
win32:OBJECTS_DIR = ../build/o/win32
macx:OBJECTS_DIR = ../build/o/mac


SOURCES += main.cpp\
    camera.cpp \
    mainwindow.cpp \
    mesh.cpp \
    model.cpp \
    qcustomplot/qcustomplot.cpp \

HEADERS  += mainwindow.h \
    camera.h \
    mesh.h \
    model.h \
    qcustomplot/qcustomplot.h \

FORMS    += mainwindow.ui

RESOURCES = cangaroo.qrc

include($$PWD/core/core.pri)
include($$PWD/driver/driver.pri)
include($$PWD/parser/dbc/dbc.pri)
include($$PWD/window/TraceWindow/TraceWindow.pri)
include($$PWD/window/SetupDialog/SetupDialog.pri)
include($$PWD/window/LogWindow/LogWindow.pri)
include($$PWD/window/GraphWindow/GraphWindow.pri)
include($$PWD/window/CanStatusWindow/CanStatusWindow.pri)
include($$PWD/window/RawTxWindow/RawTxWindow.pri)
include($$PWD/window/CmdStatusPanel/CmdStatusPanel.pri)

unix:PKGCONFIG += libnl-3.0
unix:PKGCONFIG += libnl-route-3.0
unix:include($$PWD/driver/SocketCanDriver/SocketCanDriver.pri)

win32:include($$PWD/driver/CandleApiDriver/CandleApiDriver.pri)

DISTFILES +=

LIBS += -lOpengl32

win32:CONFIG(release, debug|release): LIBS += -LG:/Assimp/assimp-4.1.0/lib/ -llibassimp.dll
else:win32:CONFIG(debug, debug|release): LIBS += -LG:/Assimp/assimp-4.1.0/lib/ -llibassimp.dlld

INCLUDEPATH += G:/Assimp/assimp-4.1.0/include
DEPENDPATH += G:/Assimp/assimp-4.1.0/include
