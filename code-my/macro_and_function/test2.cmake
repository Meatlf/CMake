# 参考资料
# [cmake使用教程（八）-macro和function](https://juejin.im/post/5a8ab0e4f265da4e9d223972)

macro(_bar)
  foreach(arg IN LISTS ARGN)
    message(STATUS "this is in macro ${arg}")
  endforeach()
endmacro()

function(_foo)
    foreach(arg IN LISTS ARGN)
        message(STATUS "this in function is ${arg}")
    endforeach()
  _bar(x y z)
endfunction()

_foo(a b c)