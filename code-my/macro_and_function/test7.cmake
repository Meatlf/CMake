# 函数里的机构有用的隐含参数
function(print_list arg)
    message("======= args count : ${ARGC} ======= ")    # 实际实参个数

    message("======= all args ======= ")                # 打印所有参数
    foreach(v IN LISTS ARGV)
        message(${v})
    endforeach()

    message("======= all extra args ======= ")          # 打印所有额外参数
    foreach(v IN LISTS ARGN)
        message(${v})
    endforeach()

    message("======= print content of ARGV0 ======= ")  # 打印第一个参数里的所有内容
    foreach(v IN LISTS ARGV0)
        message(${v})
    endforeach()
endfunction()

set(arg hello world) 

message("------------ calling with qutoes -----------")     # 使用引号来调用
print_list("${arg}")

message("------------ calling without qutoes -----------")  # 不使用引号调用
print_list(${arg})