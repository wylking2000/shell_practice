#!/bin/bash
# author: yonglong.wyl
# data: 2021/06/03

file="/Users/yonglong.wyl/Works/trip/ex-shell/ex7_file_operator.sh"

# -r 文件是否可读
if [ -r $file ]
then
  echo "文件可读"
else
  echo "文件不可读"
fi

# -w 文件是否可写
if [ -w $file ]
then
  echo "文件可写"
else
  echo "文件不可写"
fi

# -x 文件是否可运行
if [ -x $file ]
then
  echo "文件可执行"
else
  echo "文件不可执行"
fi

# -f 文件是否为普通文件，非目录，非设备文件
if [ -f $file ]
then
  echo "文件为普通文件"
else
  echo "文件为特殊文件"
fi

# -d 是否是目录，目录则返回 true
if [ -d $file ]
then
  echo "文件是个目录"
else
  echo "文件不是目录"
fi

# -s 文件是否为空，文件大小是否大于0，存在返回 true
if [ -s $file ]
then
  echo "文件不为空"
else
  echo "文件为空"
fi

# -e 检测文件包括目录是否存在，存在返回 true
if [ -e $file ]
then
  echo "文件/目录 存在"
else
  echo "文件/目录 不存在"
fi
