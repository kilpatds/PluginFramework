#
set(CMAKE_EXE_LINKER_FLAGS "-rdynamic")
include_directories(${CMAKE_SOURCE_DIR}/include)

add_library(Bar SHARED Bar.cc)
target_compile_features(Bar PRIVATE cxx_variadic_templates)

add_library(Foo SHARED Foo.cc)
target_compile_features(Foo PRIVATE cxx_variadic_templates)

add_executable(baseTest main.cc)
target_link_libraries(baseTest dl)
target_compile_features(baseTest PRIVATE cxx_variadic_templates)
