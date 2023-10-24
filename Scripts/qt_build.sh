#!/bin/bash

# 获取当前目录的最后一部分作为文件夹名
folder_name=$(basename "$(pwd)")

# 提取文件名（不包含扩展名）
file_name="${folder_name%.*}"

# Step 1: Generate the project file
qmake -project

# Step 2: Generate the Makefile
qmake

# Step 3: Build the project
make
sleep 2  # 延时2秒

# Step 4: Link the object files with Qt framework and generate the executable
objects=$(find . -name '*.o' -print)
g++ -o "$file_name" $objects -F /usr/local/Cellar/qt/6.5.2/lib -framework QtCore

# Step 5: Run executable file
./"$file_name"
