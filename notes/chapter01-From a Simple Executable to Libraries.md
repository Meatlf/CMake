# chapter01-From a Simple Executable to Libraries

## 1.1 Compiling a single source file into an executable

## 1.2 Switching generators

## 1.3 Building and linking static and shared libraries

**小结**:本小节介绍了如何从源码编译得到静态库`.a`

**Q**:编译得到静态库的基本语法是什么?

**A**:通过以下语句会得到名为libmessage.a的库.

```cmake
# generate a library from sources
add_library(message
  STATIC
    Message.hpp
    Message.cpp
  )
```

Q:如何将静态库链接到可执行文件?

A:

```cmake
add_executable(hello-world hello-world.cpp)

target_link_libraries(hello-world message)
```



## 1.4 Controlling compilation with conditionals

**小结**：本小节主要介绍了通过`if-elseif-else-endif`来控制编译。

### How to do it

Q：如何理解CMake中的`list`？

A：假设有一个变量`_sources`listing `Message.hpp`和`Message.cpp`：

```cmake
list(APPEND _sources Message.hpp Message.cpp)
```

Q:如何设置以下if语句中的开关?

```cmake
if(USE_LIBRARY)
  # add_library will create a static library
  # since BUILD_SHARED_LIBS is OFF
  add_library(message ${_sources})

  add_executable(hello-world hello-world.cpp)

  target_link_libraries(hello-world message)
else()
  add_executable(hello-world hello-world.cpp ${_sources})
endif()
```

A:

1)内设置:

```cmake
set(USE_LIBRARY OFF)
```

2)外设置:

```shell
cmake -DUSE_LIBRARY=ON ..
```

## 1.5 Presenting options to the user

## 1.6 Specifying the compiler

## 1.7 Switching the build type

## 1.8 Controlling compiler flags

**小结**：本小节主要介绍了控制编译选项的2种方法，第1种是从内部进行设置，第2种是从外部进行设置。

**Q**：对于所有的C++ targets，如何打印其当前的编译选项？

**A**：

```cmake
message("C++ compiler flags: ${CMAKE_CXX_FLAGS}")
```

**Q**：如何准备编译选项？

**A**：需要注意的是，需要考虑到是否为Windows环境。

```cmake
list(APPEND flags "-fPIC" "-Wall")
if(NOT WIN32)
list(APPEND flags "-Wextra" "-Wpedantic")
endif()
```

**Q**：如何编译`geometry`libray？

**A**：使用`add_library`：

```cmake
add_library(geometry
STATIC
geometry_circle.cpp
geometry_circle.hpp
geometry_polygon.cpp
geometry_polygon.hpp
geometry_rhombus.cpp
geometry_rhombus.hpp
geometry_square.cpp
geometry_square.hpp
)
```

**Q**：如何对libray target设置编译选项？

**A**：使用`target_compile_options`：

```cmake
target_compile_options(geometry
PRIVATE
${flags}
)
```

**Q**：如何增加一个名为`compute-areas`的executable？

**A**：使用`add_executable`：

```cmake
add_executable(compute-areas compute-areas.cpp)
```

**Q**：如何为executable target设置编译选项？

**A**：仍然使用`target_compile_options`：

```cmake
target_compile_options(compute-areas
PRIVATE
"-fPIC"
)
```

**Q**：如何链接executable到`geometry`library？

**A**：

```cmake
target_link_libraries(compute-areas geometry)
```

### How it works

## 1.9 Setting the standard for the language

## 1.10 Using control flow constructs

**相关章节**：1.8 Controlling compiler flags

`foreach-endforeach`

### How to do it

**Q**：如何设置source files的优化等级？

**A**：利用`list`和`foreach`共同完成：

```cmake
list(
APPEND sources_with_lower_optimization
geometry_circle.cpp
geometry_rhombus.cpp
)

message(STATUS "Setting source properties using IN LISTS syntax:")
foreach(_source IN LISTS sources_with_lower_optimization)
set_source_files_properties(${_source} PROPERTIES COMPILE_FLAGS -O2)
message(STATUS "Appending -O2 flag for ${_source}")
endforeach()
```

Q：如何打印source files的编译选项？

A：利用`foreach`和`get_source_file_property`共同完成：

```cmake
message(STATUS "Querying sources properties using plain syntax:")
foreach(_source ${sources_with_lower_optimization})
get_source_file_property(_flags ${_source} COMPILE_FLAGS)
message(STATUS "Source ${_source} has the following extra COMPILE_FLAGS: ${_flags}")
endforeach()
```

