cmake_minimum_required(VERSION 3.26)
project(life_sim C CXX)

set(CMAKE_C_STANDARD 11)

add_executable(life_sim
        main.c
        engine.c
        engine.h
        game.c
        game.h
)
target_link_libraries(life_sim SDL2)

add_library(pass_use SHARED pass-use.cpp)
