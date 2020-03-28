# FOO作用域为当前作用域
set(F0 "x")      
message(${F0})

set(F0 "y" CACHE ...)
message(${F0})

# FOO作用域跳上一级(懂点编程的都懂哈)。
#set(F1 "y" PARENT_SCOPE) 