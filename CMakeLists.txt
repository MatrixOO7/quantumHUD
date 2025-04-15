cmake_minimum_required(VERSION 3.16)

project(tacho_1 VERSION 0.1 LANGUAGES CXX)

set(CMAKE_CXX_STANDARD_REQUIRED ON)

# Najdi všechny potřebné moduly Qt
find_package(Qt6 REQUIRED COMPONENTS Quick Svg ShaderTools Core 3DCore 3DQuick)

# Standardní nastavení pro Qt
qt_standard_project_setup(REQUIRES 6.8)

# Přidej spustitelný soubor pro projekt
qt_add_executable(apptacho_1
    main.cpp
)

# Přidej QML modul
qt_add_qml_module(apptacho_1
    URI tacho_1
    VERSION 1.0
    QML_FILES
        view/Main.qml
        view/tacho/Tacho.qml
        view/hndl/ColorItem.qml
        view/hndl/ColorBox.qml
        QML_FILES view/theme/ThemeManager.qml
        QML_FILES view/theme/ItemTheme.qml
        QML_FILES view/theme/DarkTheme.qml
        QML_FILES view/theme/LightTheme.qml
        QML_FILES view/theme/GoldTheme.qml
        QML_FILES view/theme/RedTheme.qml
        QML_FILES view/theme/GreenTheme.qml
        QML_FILES view/theme/PurpleTheme.qml
        QML_FILES view/theme/BlueTheme.qml
)

qt_add_resources(apptacho_1 "resources"
    PREFIX "/"
    FILES
        resources/image/tacho_parts/tacho_frame.svg
        resources/image/tacho_parts/tacho_hand.svg
        resources/image/tacho_parts/tacho_hand_point.svg
        resources/image/tacho_parts/tacho_rpm_bck.svg
        resources/image/tacho_parts/tacho_rpm_hand.svg
        resources/image/tacho_parts/tacho_space.svg
        resources/image/tacho_parts/tacho_tacho_bck.svg
        resources/image/tacho_parts/tacho_base.svg
        resources/shadereffect/frag/hand.vert.qsb
        resources/shadereffect/frag/hand.frag.qsb
        resources/shadereffect/frag/tacho_2.vert.qsb
        resources/shadereffect/frag/tacho_2.frag.qsb
)

# Zajistí, že složka resources bude zkopírována do výstupní složky
file(COPY ${CMAKE_SOURCE_DIR}/resources/ DESTINATION ${CMAKE_BINARY_DIR}/resources/)

# Nastavení vlastností pro iOS/macOS
set_target_properties(apptacho_1 PROPERTIES
    MACOSX_BUNDLE_BUNDLE_VERSION ${PROJECT_VERSION}
    MACOSX_BUNDLE_SHORT_VERSION_STRING ${PROJECT_VERSION_MAJOR}.${PROJECT_VERSION_MINOR}
    MACOSX_BUNDLE TRUE
    WIN32_EXECUTABLE TRUE
)

# Připoj všechny potřebné Qt knihovny
target_link_libraries(apptacho_1
    PRIVATE Qt6::Quick Qt6::Svg Qt6::ShaderTools Qt6::3DCore Qt6::3DQuick Qt6::Core
)

# Instalace pro projekt
include(GNUInstallDirs)
install(TARGETS apptacho_1
    BUNDLE DESTINATION .
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
    RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
)
