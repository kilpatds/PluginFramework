#
set(CMAKE_EXE_LINKER_FLAGS "-rdynamic")

add_library(Baz SHARED Baz.cc)
target_compile_features(Baz PRIVATE cxx_variadic_templates)
include_directories(Baz ${CMAKE_SOURCE_DIR}/include)

add_executable(argTest main.cc)
target_link_libraries(argTest dl)

target_compile_features(argTest PRIVATE cxx_variadic_templates)
