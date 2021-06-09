#!/bin/bash
#
# Author: yonglong.wyl
# Data: 2021/06/02
# Email: yonglong.wyl@alibaba-inc.com

# first hello world, save file as "hello.sh"
echo "Hello World!"
# chmod +x ./hello.sh #添加权限
# ./hello.sh #执行脚本

# 定义变量，不添加$，引用变量添加$
your_name="yonglong.wyl"
echo $your_name #引用变量
echo "my name: ${your_name}" # 引用变量
your_name="longmang" #可以给变量重新赋值
#定义只读变量不可以重新赋值
readonly my_url="https://www.runoob.com"
# my_url="https://www.baidu.com" # 运行脚本出错：This variable is read only.
# unset 删除变量
var_name="will delete"
echo $var_name
unset var_name
echo $var_name #echo nothing
# 变量类型：局部变量、环境变量、shell变量

echo "your_name length: ${#your_name}"	# 计算变量字符长度
echo "subStr1,4: ${your_name:1:4}" # 字符串截取

# 定义数组，元素之间使用空格分隔
array_name=("a" "b" "c")
echo $array_name[0] # 引用数组元素
echo ${array_name[@]} # 显示所有数据元素
echo ${#array_name[@]} # 显示数据长度

