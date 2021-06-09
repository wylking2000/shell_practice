#!/bin/bash
# author:yonglong.wyl
# data:2021/06/03

# 通过终端入口传入
a=$1
b=$2

# == 数值相等运算符，等效 -eq
if [ $a == $b ]
then
  echo "$a == $b"
fi

# != 数值不相等运算符，等效 -ne
if [ $a != $b ]
then
  echo "$a != $b"
fi

# -eq 数值相等运算符，等效 ==
if [ $a -eq $b ]
then
  echo "$a -eq $b"
fi

# -ne 数值不等效运算符，等效 !=
if [ $a -ne $b ]
then
  echo "$a -ne $b"
fi

# -gt 数值大于运算符，形象类似：>
if [ $a -gt $b ]
then
  echo "$a -gt $b"
fi

# -lt 数值小于运算符，形象类似：<
if [ $a -lt $b ]
then
  echo "$a -lt $b"
fi

# -ge 数值大于等于运算符，形象类似：>=
if [ $a -ge $b ]
then 
  echo "$a -ge $b"
fi

# -le 数值小于等于运算符，形象类似：<=
if [ $a -le $b ]
then
  echo "$a -le $b"
fi
