# mkdir -p build # 这里用了-p，表示如果有build目录了，就不创建了，这就避免了警告
# cd build
# cmake ..
# cmake --build .
# ./hello-world

mkdir -p build
cd build
cmake -DUSE_LIBRARY=ON ..
cmake --build .
./hello-world
