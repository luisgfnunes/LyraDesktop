cmake_minimum_required(VERSION 3.21)

project(LyraDesktop VERSION 0.1.0 LANGUAGES CXX)

set(CMAKE_CXX_STANDARD 20)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

set(CMAKE_AUTOMOC ON)
set(CMAKE_AUTORCC ON)
set(CMAKE_AUTOUIC ON)

find_package(Qt6 REQUIRED COMPONENTS
        Core
        Gui
        Qml
        Quick
        Network
)

# Adiciona o executável e todos os fontes C++
qt_add_executable(LyraDesktop
        src/main.cpp
        src/core/player_queue.cpp
        src/network/innertube_client.cpp
        src/network/http_worker.cpp
        src/audio/audio_engine.cpp
        src/audio/stream_buffer.cpp
        src/gui/desktop_integration.cpp
)

qt_add_resources(LyraDesktop RESOURCES src/resources.qrc)

target_link_libraries(LyraDesktop
        PRIVATE
        Qt6::Core
        Qt6::Gui
        Qt6::Qml
        Qt6::Quick
        Qt6::Network
)

include(GNUInstallDirs)
install(TARGETS LyraDesktop
        BUNDLE DESTINATION .
        RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
)