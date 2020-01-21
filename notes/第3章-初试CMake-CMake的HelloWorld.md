## 第3章 初试CMake - CMake的HelloWorld

1. **准备工作**
**Q**:CMakeLists.txt的**基本结构**是什么样的？
**A**:
```cmake
PROJECT(HELLO)
SET(SRC_LIST main.c)
MESSAGE(STATUS "This is BINARY dir" ${HELLO_BINARY_DIR})
MESSAGE(STATUS "This is SOURCE dir" ${HELLO_SOURCE_DIR})
ADD_EXECUTABLE(hello ${SRC_LIST})
```
2. **开始构建**
Q:在有了源文件和CMakeLists.txt文件之后，如何构建工程的呢？具体步骤是什么？
A:
```shell
cmake .
make
./hello
```
3. **简单的解释**
**Q**:一个项目有多少个CMakeLists.txt文件？
**A**:如果工程存在多个目录，需要确保每个要管理的目录都存在一个CMakeLists.txt文件。
**Q**:本小节涉及了哪些命令？
**A**:下面只给出了本小节涉及到的指令，具体的语法是什么需要参考pdf。
```cmake
## 一个工程应该有一个工程的名字吧
PROJECT()

## cmake系统帮助我们预定义了以下来两个变量,这一定很有用，不然系统也不会这么定义的
PROJECT_BINARY_DIR
PROJECT_SOURCE_DIR

## SET指令给了我们自己定义变量的机会。
SET()

## 如何使用自己定义的变量呢？具体的方法如下。
${SRC_LIST}

## MESSAGE指令给了我们向终端输出用户定义的信息的功能
MESSAGE()

## 我们使用CMakeLists.txt的最终目标是得到可执行文件，以下指令给了我们这样的机会
ADD_EXECUTABLE()

```
4. **基本语法规则**
**Q**:CMakeLists.txt有哪些基本的语法规则？
**A**:变量的取值方法、指令参数的语法、指令是大小写无关的（参数和变量是大小写相关的）。

5. **关于语法的疑惑**
**Q**:如何看待CMake的灵活性？
**A**:为了考虑到各种情况，CMake的语法还是比较灵活的，但是一般情况下考虑到CMakeLists.txt文件的统一性，不使用特殊的语法。

6. **清理工程**
**Q**: 如何清理工程？
**A**: 
```
make clean
```

7. **问题？问题！**

   本小节介绍了在CMake中```make distclean```无效的原因，但这目前来讲，知不知道都没有关系。

8. **内部构建与外部构建**
  **Q**:为什么外部构建比内部构建要好？
  **A**:使用内部构建的方法产生的临时文件比源文件还多，所以采用外部构建方法将源文件和临时文件分离。

  **Q**:CMake中内置的工程路径和编译路径命令分别是什么？
  **A**:

```
PROJECT_SOURCE_DIR
PROJECT_BINARY_DIR
```
9. **小结**
本小结对本章进行了小结，需要反复玩读。

## 参考资料
Cmake实战.pdf