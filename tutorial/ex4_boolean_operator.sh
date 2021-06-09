#!/bin/bash
# author: yonglong.wyl
# data: 2021/06/03

a=10
b=20

# ! 非运算，表达式的值取反
if [ $a != $b ]
then
  echo "$a != $b : a 不等于b"
fi

# -a 与运算，两个表达式都为true才返回true
if [ $a -lt 100 -a $b -gt 15 ]
then
  echo "$a 小于 100 且 $b 大于 15：返回 true"
else
  echo "$a 小于 100 且 $b 大于 15：返回 false"
fi

# -o 或运算，有一个表达式为true则返回true
if [ $a -lt 100 -o $b -gt 100 ]
then
  echo "$a 小于100 或 $b 大于 100：返回 true"
else
  echo "$a 小于100 或 $b 大于100： 返回 false"
fi
