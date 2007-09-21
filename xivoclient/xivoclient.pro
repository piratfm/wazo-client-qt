######################################################################
# Automatically generated by qmake (2.01a) jeu. f�vr. 1 18:28:19 2007
######################################################################
#
# $Revision$
# $Date$
#

COMMONDIR = ../common

VERSION = $$system(touch $${COMMONDIR}/xivoconsts.h && svn info -r HEAD .. | tail -3 | head -1 | sed "s/.*:.//")
VERSTR = '\\"$${VERSION}\\"'  # place quotes around the version string
DEFINES += SVNVER=\"$${VERSTR}\" # create a VER macro containing the version string

TEMPLATE = app
TARGET = 
DEPENDPATH += .
INCLUDEPATH += . $${COMMONDIR}
CONFIG -= debug
CONFIG += static

# Input
HEADERS += mainwidget.h
HEADERS += $${COMMONDIR}/popup.h
HEADERS += $${COMMONDIR}/xmlhandler.h
HEADERS += $${COMMONDIR}/remotepicwidget.h
HEADERS += $${COMMONDIR}/urllabel.h
HEADERS += $${COMMONDIR}/servicepanel.h
HEADERS += $${COMMONDIR}/confwidget.h
HEADERS += $${COMMONDIR}/identitydisplay.h
HEADERS += $${COMMONDIR}/baseengine.h
HEADERS += $${COMMONDIR}/dialpanel.h
HEADERS += $${COMMONDIR}/logwidget.h
HEADERS += $${COMMONDIR}/logeltwidget.h
HEADERS += $${COMMONDIR}/directorypanel.h $${COMMONDIR}/extendedtablewidget.h $${COMMONDIR}/peerchannel.h
HEADERS += $${COMMONDIR}/peerwidget.h     $${COMMONDIR}/peeritem.h            $${COMMONDIR}/searchpanel.h
HEADERS += $${COMMONDIR}/extendedlineedit.h

SOURCES += mainwidget.cpp main.cpp
SOURCES += $${COMMONDIR}/popup.cpp $${COMMONDIR}/xmlhandler.cpp $${COMMONDIR}/remotepicwidget.cpp $${COMMONDIR}/urllabel.cpp
SOURCES += $${COMMONDIR}/servicepanel.cpp $${COMMONDIR}/confwidget.cpp $${COMMONDIR}/identitydisplay.cpp
SOURCES += $${COMMONDIR}/baseengine.cpp
SOURCES += $${COMMONDIR}/logwidget.cpp           $${COMMONDIR}/searchpanel.cpp  $${COMMONDIR}/peerwidget.cpp
SOURCES += $${COMMONDIR}/dialpanel.cpp           $${COMMONDIR}/logeltwidget.cpp $${COMMONDIR}/directorypanel.cpp
SOURCES += $${COMMONDIR}/extendedlineedit.cpp
SOURCES += $${COMMONDIR}/extendedtablewidget.cpp $${COMMONDIR}/peerchannel.cpp  $${COMMONDIR}/peeritem.cpp

QT += network
QT += xml
RESOURCES += appli.qrc
TRANSLATIONS = xivoclient_fr.ts
RC_FILE = appli.rc
