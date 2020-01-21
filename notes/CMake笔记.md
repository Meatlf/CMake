**功能**：相比较于一般的Make工具，CMake是一种更高级的编译配置工具。

##### CMake最低版本要求

```cmake_minimum_required(version 2.8)```  

##### 项目信息
```project(Demo)```  


##### 查找目录下的所有源文件,并将名称保存到 DIR_SRCS 变量
```aux_source_directory(. DIR_SRCS)```

##### 设置变量
```
SET(LIBHELLLO_SRC hello.c)
```

##### 使用变量
```
ADD_LIBRARY(hello SHARED ${LIBHELLO_SRC})
```
##### 指定生成 MathFunctions 链接库
```add_library(MathFunctions ${DIR_LIB_SRCS})```

##### 指定生成目标
```add_executable(Demo ${DIR_SRCs})```

##### 添加子目录
```add_subdirectory(math)```  
或  
```add_subdirectory(math bin)```  
**说明**：  
（1）即使子目录里面将要生成库，也只是需要使用这句命令即可；
（2）第二条可以将生成的目标文件位于**build/bin**中。

##### 添加链接库
```target_link_libraries(Demo MathFunctions)```

##### 链接库
```
find_library(MathFunctions_Libraries libMathFunctions.a /home/ttz/Documents/LAB/CMake/Demo3.4/src/function/math/build)
```
**说明**：该命令里的路径为绝对路径。

##### 条件语句
```
IF(NOT  MathFunctions_Libraries)
    message(FATAL_ERROR "lib MathFunctions not found")
ELSE(MathFunctions_Libraries)
    message(STATUS "Congratulations, lib MathFunctions  found")
ENDIF(NOT MathFunctions_Libraries)
```

##### 设置C和C++的编译选项
```
set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS}  -Wall  -O3 -pthread")
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Wall  -O3 -pthread")
```
## 经验
#### 1. 到目前为止，我在CMake里的路径都用完全路径表示。  
#### 2. 除了只有头文件的文件夹，其他文件夹下都要有CMakeLists。

## 错误集锦
#### 1. undefined reference to '***'
答：链接库失败，注意要确保库名和库路径的正确性。