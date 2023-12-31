QT += widgets dbus x11extras

TEMPLATE = lib
DEFINES += PLUG_LIBRARY

DESTDIR = ../../../usr/lib/forest/panel
INCLUDEPATH += ../../library
INCLUDEPATH += ../../../library

LIBS += -lxcb-image

LIBS += -L/usr/lib/x86_64-linux-gnu/ -lKF5WindowSystem
INCLUDEPATH += /usr/include/KF5/KWindowSystem
DEPENDPATH += /usr/include/KF5/KWindowSystem

CONFIG += c++11 \
            plugin

#LIBS += $(SUBLIBS)  -L../../../usr/lib -L$$PWD/../../../usr/lib -lforestx11utills
#QMAKE_INCDIR += $$PWD/../../../library/include $$PWD/../../../library

# The following define makes your compiler emit warnings if you use
# any Qt feature that has been marked deprecated (the exact warnings
# depend on your compiler). Please consult the documentation of the
# deprecated API in order to know how to port your code away from it.
DEFINES += QT_DEPRECATED_WARNINGS

# You can also make your code fail to compile if it uses deprecated APIs.
# In order to do so, uncomment the following line.
# You can also select to disable deprecated APIs only up to a certain version of Qt.
#DEFINES += QT_DISABLE_DEPRECATED_BEFORE=0x060000    # disables all the APIs deprecated before Qt 6.0.0

SOURCES += \
    imagepopup.cpp \
    settingswidget.cpp \
    windowbutton.cpp \
    windowlist.cpp \
    ../../../library/xcbutills/xcbutills.cpp

HEADERS += \
    closebutton.h \
    imagepopup.h \
    settingswidget.h \
    windowbutton.h \
    windowlist.h \
    ../../../library/xcbutills/xcbutills.h \
    ../../library/panelbutton.h \
    ../../library/popup.h \
    ../../library/popupmenu.h

# Default rules for deployment.

target.path = /usr/lib/forest/panel

INSTALLS += target

FORMS += \
    settingswidget.ui

#unix:!macx: LIBS += -L$$OUT_PWD/../../../library/xcbutills/ -lxcbutills

#INCLUDEPATH += $$PWD/../../../library/xcbutills
#DEPENDPATH += $$PWD/../../../library/xcbutills

#unix:!macx: PRE_TARGETDEPS += $$OUT_PWD/../../../library/xcbutills/libxcbutills.a
