#!/bin/bash
# author: yonglong.wyl
# date: 2021/06/05

num1=10
num2=20
if test $[num1] -eq $[num2]	#中括号[]用的有点特别，if 外层不用，用test，变量名用[]包裹
then
  echo "num1 -eq num2"
else
  echo "num1 -ne num2"
fi

#代码中[]内部无空格时，执行基本的算数运算，如：
a=5
b=6
result=$[a+b] # $[无空格算数表达式]，此时会求值
echo "result=${result}"

str1="ru1noob"
str2="runoob"
if test $str1 = $str2
then
  echo "str1 = str2"
else
  echo "str1 != str2"
fi

path="/bin/bash"
if test -e $path
then
  echo "/bin/bash exist"
else
  echo "/bin/bash not exist"
fi

if test $str1 = $str2 -o $[num1] -le $[num2]
then
  echo "str1 = str2 或 num1 <= num2"
else
  echo "str1 != str2 且 num1 >= num2"
fi
