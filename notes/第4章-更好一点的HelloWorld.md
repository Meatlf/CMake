## 第4章 更好一点的HelloWorld

1. **准备工作**

2. 添加子目录src:
**Q**:使用哪个指令向当前工程添加存放源文件的子目录，并可以指定中间二进制和目标二进制存放的位置？
**A**:使用```ADD_SUBDIRECTORY()```命令，具体使用见pdf。

3. 换个地方保存目标二进制
**Q**:目标二进制（指最终生成的hello或者最终的共享库，不包含编译生成的中间文件）是我们使用CMake的最终目的，因而我们往往想把其放在特定的位置，有什么对应的指令可以使用呢？
**A**:
```
SET(EXECUTABLE_OUTPUT_PATH ${PROJECT_BINARY_DIR}/bin)SET(LIBRARY_OUTPUT_PATH ${PROJECT_BINARY_DIR}/lib)
```
这里采用的是外部编译，可执行二进制的输出路径为```build/bin```和库的输出路径为```build/lib```。

​	**Q**：上面两条命令写在哪个CMakeLists.txt呢？原则是什么？
​	**A**：把握一个简单的原则，在哪里ADD_EXECUTABLE或ADD_LIBRARY就放在哪里。

4. **如何安装**

  **Q**：CMake是如何安装的呢？

  **A**：需要使用一个新的CMake指令**INSTALL**和一个非常有用的变量**CMAKE_INSTALL_PREFIX**.

  **Q**:INSTALL指令有什么用？
  **A**:INSTALL指令用于定义**安装规则**，安装的内容可以包括目标二进制（目标文件）、动态库、静态库以及文件（普通文件）、目录、非目标文件的可执行程序安装（比如脚本）等。具体的语法看PDF吧。

  **Q**：如何设定安装目录的绝对路径或相对路径？

  **A**：设置中如果以“/”开头，那么指的是绝对路径，这时候**CMAKE_INSTALL_PREFIX**无效；如果不以“/”开头，那么就是相对路径。

5. **修改Helloworld支持安装**

   本小节使用**INSTALL**指令和**CMAKE_INSTALL_PREFIX**变量安装了文本文件、脚本、目标文件等，值得以后自己写CMakeLists.txt作参考。

6. **尝试我们修改的结果**

   本小节讲了如何修改**CMAKE_INSTALL_PREFIX**变量来改变安装的路径。

7. **一个疑问**

   本小节将了，如果不对**CMAKE_INSTALL_PREFIX**变量进行设置，则默认的定义为```/usr/local```。

8. **小结**
  **本小节要点**：使用多目录、各种安装指令以及```CMAKE_INSTALL_PREFIX```变量。
  **下一小节要点**：在CMake中构建**动态库**和**静态库**、如何使用外部头文件和外部共享库。