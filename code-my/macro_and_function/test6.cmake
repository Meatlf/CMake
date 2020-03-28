# 打印一个列表
cmake_minimum_required(VERSION 3.10)

function(print_list arg)
    foreach(v ${arg})
        message(${v})
    endforeach()
endfunction()

set(arg hello world)

# 错误做法
# print_list(${arg})

# 正确做法
print_list("${arg}")