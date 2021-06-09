#!/bin/bash
# author: yonglong.wyl
# data: 2021/06/03

a="abc"
b="efg"

# [ = ] 检测两个字符串是否相等，相等返回 true，注意：一个等号= + [] 组成
if [ $a = $b ]
then
  echo "$a = $b: a 等于 b"
else
  echo "$a = $b: a 不等于 b"
fi

# [ != ] 检测两个字符串是否不相等，不相等返回 true
if [ $a != $b ]
then
  echo "$a != $b : a 不等于 b"
else
  echo "$a != $b : a 等于 b"
fi

# [ -z ] 检测字符串长度是否为0，为0返回 true
if [ -z $a ]
then
  echo "-z $a : 字符串长度为 0"
else
  echo "-z $a : 字符串长度不为 0"
fi

# [ -n ] 检测字符串长度是否不为0，不为0则返回 true
if [ -n $a ]
then
  echo "-n $a : 字符串长度不为 0"
else
  echo "-n $a : 字符串长度为 0"
fi

# [ $ ] 直接引用变量，检测变量是否为空，不为空返回 true
if [ $a ]
then
  echo "$a : 字符串不为空"
else
  echo "$a : 字符串为空"
fi
