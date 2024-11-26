cmake_minimum_required(VERSION 3.5)

project(Serial_Test LANGUAGES CXX)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

add_executable(Serial_Test main.cpp)

# Cmake modules path
set(CMAKE_MODULE_PATH "${PROJECT_SOURCE_DIR}/cmake_modules")


# libserialport
find_package(Libserialport REQUIRED)
target_link_libraries(${PROJECT_NAME} PRIVATE Libserialport::Libserialport)


include(GNUInstallDirs)
install(TARGETS Serial_Test
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
    RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
)
