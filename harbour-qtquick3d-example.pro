# NOTICE:
#
# Application name defined in TARGET has a corresponding QML filename.
# If name defined in TARGET is changed, the following needs to be done
# to match new name:
#   - corresponding QML filename must be changed
#   - desktop icon filename must be changed
#   - desktop filename must be changed
#   - icon definition filename in desktop file must be changed
#   - translation filenames have to be changed

# The name of your application
TARGET = harbour-qtquick3d-example

CONFIG += sailfishapp

SOURCES += src/harbour-qtquick3d-example.cpp

OTHER_FILES += qml/harbour-qtquick3d-example.qml \
    qml/cover/CoverPage.qml \
    qml/pages/FirstPage.qml \
    qml/pages/SecondPage.qml \
    rpm/harbour-qtquick3d-example.changes.in \
    rpm/harbour-qtquick3d-example.spec \
    rpm/harbour-qtquick3d-example.yaml \
    translations/*.ts \
    harbour-qtquick3d-example.desktop \
    qml/Button.qml \
    qml/Car3D.qml \
    qml/Car3DMain.qml \
    qml/CubeView.qml \
    qml/SimpleSlider.qml \
    qml/qtlogo.png \
    qml/models/HyundaiGenesis_sliced_0.2/Meshes.qml \
    qml/models/*

# to disable building translations every time, comment out the
# following CONFIG line
CONFIG += sailfishapp_i18n
TRANSLATIONS += translations/harbour-qtquick3d-example-de.ts

