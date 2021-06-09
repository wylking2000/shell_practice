#!/bin/bash
# author: yonglong.wyl
# data: 2021/06/03

a=10
b=20

# && 逻辑AND，同时为true才返回true
if [[ $a -lt 100 && $b -gt 100 ]] #注意逻辑操作运算：两个[]嵌套
then
  echo "返回 true"
else
  echo "返回 false"
fi

# || 逻辑OR，只要有一个为true，则返回true
if [[ $a -lt 100 || $b -gt 100 ]]
then
  echo "返回 true"
else
  echo "返回 false"
fi
