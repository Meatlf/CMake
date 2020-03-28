# 打印一个列表
cmake_minimum_required(VERSION 3.10)

set(arg hello world)

foreach(v ${arg})
    message(${v})
endforeach()