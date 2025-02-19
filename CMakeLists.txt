cmake_minimum_required(VERSION 3.30)

project(C++-renderer)

macro(print_all_variables)
    message(STATUS "print_all_variables------------------------------------------{")
    get_cmake_property(_variableNames VARIABLES)
    foreach (_variableName ${_variableNames})
        message(STATUS "${_variableName}=${${_variableName}}")
    endforeach()
    message(STATUS "print_all_variables------------------------------------------}")
endmacro()

file(GLOB MAIN
    "src/main.cpp"
)

include_directories("vendor/glew/include")

# GLFW
add_subdirectory("vendor/glfw")

# print_all_variables()

add_executable(executable ${MAIN})