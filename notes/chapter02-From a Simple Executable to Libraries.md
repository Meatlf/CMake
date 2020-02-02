# chapter01-From a Simple Executable to Libraries

## 1.1 Compiling a single source file into an executable

**recipe-01**

## 1.2 Switching generators

## 1.3 Building and linking static and shared libraries

## 1.4 Controlling compilation with conditionals

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







