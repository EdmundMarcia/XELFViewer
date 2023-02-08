QT       += core gui widgets sql

TARGET = xelfviewer

macx {
    TARGET = XELFViewer
}

TEMPLATE = app

CONFIG += c++11

SOURCES += \
        guimainwindow.cpp \
        main_gui.cpp \
        dialogoptions.cpp \
        dialogabout.cpp

HEADERS += \
        ../global.h \
        dialogoptions.h \
        dialogabout.h \
        guimainwindow.h

FORMS += \
        dialogoptions.ui \
        dialogabout.ui \
        guimainwindow.ui

include(../build.pri)

XCONFIG += use_disasm
XCONFIG += use_extrabuttons

!contains(XCONFIG, archive_widget) {
    XCONFIG += archive_widget
    include(../archive_widget/archive_widget.pri)
}

!contains(XCONFIG, xaboutwidget) {
    XCONFIG += xaboutwidget
    include(../XAboutWidget/xaboutwidget.pri)
}

win32 {
    RC_ICONS = ../icons/main.ico
    CONFIG -= embed_manifest_exe
    QMAKE_MANIFEST = windows.manifest.xml
    VERSION = 0.06.0.0
    QMAKE_TARGET_COMPANY = NTInfo
    QMAKE_TARGET_PRODUCT = XELFViewer
    QMAKE_TARGET_DESCRIPTION = XELFViewer is a ELF file viewer/editor.
    QMAKE_TARGET_COPYRIGHT = horsicq@gmail.com
}
macx {
    ICON = ../icons/main.icns
}

RESOURCES += \
    rsrc.qrc

DISTFILES += \
    ../CMakeLists.txt \
    ../LICENSE \
    ../README.md \
    ../changelog.txt \
    ../release_version.txt \
    CMakeLists.txt
