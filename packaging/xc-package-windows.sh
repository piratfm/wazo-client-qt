#!/usr/bin/env bash

set -e

function usage {
    echo $0 wazoclient_dir mingw_dir qt_dir
}

if [ -r versions.mak ]
then
    source versions.mak
else
    echo "No versions.mak file found. Please run qmake."
    exit 1
fi

source build-deps

XC_DIR=.
MINGW_DIR=${WIN_MINGW_PATH}
QT_DIR=${WIN_QT_PATH}
RES_DIR=${XC_DIR}/packaging/resources
TEMPLATES_DIR=${XC_DIR}/packaging/templates
DEST_DIR=/tmp/wazoclient-win

rm -rf $DEST_DIR
mkdir $DEST_DIR

# Resources
cp -r ${RES_DIR}/{gpl.txt,wazoicon.ico,wazo.bmp} $DEST_DIR

# Qt libs
rm -rf $DEST_DIR/qtlibs
mkdir $DEST_DIR/qtlibs
cp $MINGW_DIR/bin/\
{libstdc++-6.dll,\
libgcc_s_sjlj-1.dll,\
zlib1.dll,\
libpng16-16.dll,\
libharfbuzz-1.dll,\
libfreetype-6.dll,\
libbz2.dll,\
libglib-2.0-0.dll,\
libintl-8.dll,\
libiconv-2.dll,\
libeay32.dll,\
ssleay32.dll,\
libpcre-1.dll,\
libpcre16-0.dll} $DEST_DIR/qtlibs
cp $QT_DIR/bin/\
{Qt5Core.dll,\
Qt5Gui.dll,\
Qt5Network.dll,\
Qt5Sql.dll,\
Qt5Svg.dll,\
Qt5Widgets.dll,\
Qt5Xml.dll,\
Qt5XmlPatterns.dll} $DEST_DIR/qtlibs
rm -rf $DEST_DIR/qtlibs/{imageformats,platforms,sqldrivers}
mkdir $DEST_DIR/qtlibs/{imageformats,platforms,sqldrivers}
cp -r $QT_DIR/plugins/imageformats/*.dll $DEST_DIR/qtlibs/imageformats
cp -r $QT_DIR/plugins/platforms/*.dll $DEST_DIR/qtlibs/platforms
cp -r $QT_DIR/plugins/sqldrivers/*.dll $DEST_DIR/qtlibs/sqldrivers

# Qt translations
rm -rf $DEST_DIR/qtlibs/translations
cp -r $QT_DIR/translations $DEST_DIR/qtlibs
cp ${RES_DIR}/qt.conf $DEST_DIR/qtlibs

# Wazo Client binaries
rm -rf $DEST_DIR/wazoclient
mkdir $DEST_DIR/wazoclient
cp -r $XC_DIR/bin/*.dll $XC_DIR/bin/*.exe $DEST_DIR/wazoclient
mkdir $DEST_DIR/wazoclient/plugins
cp -r $XC_DIR/bin/plugins/*.dll $DEST_DIR/wazoclient/plugins

# Reset permissions in case they are broken by ACL
find $DEST_DIR -type d -exec chmod 0755 {} \;
find $DEST_DIR -type f -exec chmod 0644 {} \;

cp "${TEMPLATES_DIR}"/windows-installer.nsi "${DEST_DIR}"/installer.nsi
"${WIN_NSIS_PATH}"/makensis \
    -DXC_VERSION="${XC_VERSION}" \
    -DGIT_HASH="${GIT_HASH}" \
    -DGIT_DATE="${GIT_DATE}" \
    "${DEST_DIR}"/installer.nsi

mkdir -p "${XC_DIR}/bin/package-win32"
mv "${DEST_DIR}"/wazoclient-*.exe "${XC_DIR}/bin/package-win32"

rm -rf "${DEST_DIR}"
