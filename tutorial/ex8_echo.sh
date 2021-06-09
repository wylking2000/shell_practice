#!/bin/bash
# author: yonglong.wyl
# data: 2021/06/03

# 打印普通字符串
echo "It is a echo test"

# 上面的双引号完全可以省略，等价
echo It is a echo test

# 打印转义字符
echo "\" It is a test \""

# 打印变量，read命令从标准输入中读取一行，并把输入的每个字段的值制定给shell变量
read name
echo "$name, It is a read test"

# 打印换行
echo -e "OK! \n" # -e 开启转义
echo "It is a test"

# 打印不换行
echo -e "OK! \c"
echo "It is a test"

# 打印结果定向至文件
echo "It is a write to echo_file.txt test" > echo_file.txt

# 单引号：原样输出字符串，不转义 或者 取变量
echo '$name\"'

#反引号：打印命令执行结果
echo `date`
