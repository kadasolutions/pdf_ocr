# The Flutter tooling requires that developers have a version of Visual Studio
# installed that includes CMake 3.14 or later. You should not increase this
# version, as doing so will cause the plugin to fail to compile for some
# customers of the plugin.
cmake_minimum_required(VERSION 3.14)

# Project-level configuration.
set(PROJECT_NAME "pdf_ocr")
project(${PROJECT_NAME} LANGUAGES CXX)

include("../cargokit/cmake/cargokit.cmake")
apply_cargokit(${PROJECT_NAME} ../rust pdf_ocr "")

# List of absolute paths to libraries that should be bundled with the plugin.
# This list could contain prebuilt libraries, or libraries created by an
# external build triggered from this build file.
set(pdf_ocr_bundled_libraries
  "${${PROJECT_NAME}_cargokit_lib}"
  PARENT_SCOPE
)

# This value is used when generating builds using this plugin, so it must
# not be changed
set(PLUGIN_NAME "pdf_ocr_sdk_plugin")

set(SOURCE_DLL "${CMAKE_CURRENT_SOURCE_DIR}/include/pdfium.dll")
set(BUILD_FOLDER "${CMAKE_BINARY_DIR}/runner/$<CONFIG>")

# Source dll is located correctly, but still don't know the ENV type
install(FILES "${SOURCE_DLL}" DESTINATION "${BUILD_FOLDER}" COMPONENT Runtime)