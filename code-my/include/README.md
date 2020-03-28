# include
Q:如何理解`.cmake`文件？
A：`.cmake`文件是一个模块文件，可以被`include`到`CMakeLists.txt`中。
Q:incluede指令的作用？
A：include指令一般用于语句的复用，也就是说，如果有一些语句需要在很多CMakeLists.txt文件中使用，为避免重复编写，可以将其写在.cmake文件中，然后在需要的CMakeLists.txt文件中进行include操作就行了。
Q：`.cmake`文件里面通常是什么信息？
A：.cmake文件里包含了一些cmake命令和一些宏/函数，当CMakeLists.txt包含该.cmake文件时，当编译运行时，该.cmake里的一些命令就会在该包含处得到执行，并且在包含以后的地方能够调用该.cmake里的一些宏和函数。

## 参考资料
[1] [【CMake】cmake中的include指令（.cmake文件/MACRO宏/function函数）](https://blog.csdn.net/qq_38410730/article/details/102677143)