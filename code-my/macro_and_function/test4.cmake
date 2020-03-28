set(var "abc")                      # 定义一个变量var，初值为abc

function(f1 arg)
    set(${arg} "ABC" PARENT_SCOPE)  # ${arg} == var, 于是相当于set(var "ABC" PARENT_SCOPE)
endfunction()

message("before calling f1, var = ${var}")
f1(var)                                     # 如果写成了f1(${var})会怎样？
message("after calling f1, var = ${var}")