# chapter07-Structuring Projects

## 7.0 Introduction



## 7.1 Code reuse with functions and macros

**相关章节**：第4章的Recipe 8。

**Q**：CMake中的函数（functions）有什么用？

**A**：抽象（隐藏）细节和避免重复代码。

**Q**：如何理解CMake中的`macros`和`functions`？

**A**：

1）可以将CMake中的`macros`理解为C语言中的内联函数；

2）可以将CMake中的`functions`理解为黑盒，不返回值。

## 7.2 Splitting CMake sources into modules

## 7.3 Writing a function to test and set compiler flags

## 7.4 Defining a function or macro with named arguments

## 7.5 Redefining functions and macros

## 7.6 Deprecating functions, macros, and variables

## 7.7 Limiting scope with add_subdirectory

## 7.8 Avoiding global variables using target_sources

## 7.9 Organizing Fortran projects

### Getting ready

**小结**：对于一个项目而言，有多个文件夹是很正常的事情，使用cmake中的add_subdirectory变得很有必要。

non-trivial 不那么简单的

