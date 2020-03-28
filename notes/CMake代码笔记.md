# code-my

## macro_and_function

参考资料

### test1.cmake

1)用${arg1}引用变量；

2）ARGV0表示第0个参数，ARGV1表示第1个参数，以此类推；

### test3.cmake

1)CMake里的函数和宏的使用原则可以以C语言里函数和宏的使用原则来作为参考;

### test4.cmake

1)函数调用处用变量的名字var，而不是它的值${var};

2)在函数内部，set的时候，要加上作用域PARENT_SCOPE.

### test7.cmake

1)在不使用括号来包裹列表类型的参数作为函数实参时，列表参数内部的空格（或者分号）会使得这个列表的内容被当做多个参数传递给函数。

