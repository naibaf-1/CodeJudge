cmake_minimum_required(VERSION 3.10)
project(judger_engine C)

add_library(judger SHARED judger.c)

set_target_properties(judger PROPERTIES
    PUBLIC_HEADER judger.h
)
