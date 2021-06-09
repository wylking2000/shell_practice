#!/bin/bash
# author: yonglong.wyl
# date: 2021/06/07

#函数定义，跟其他语言没差异
function demoFun () {
  echo "My first shell function !"
}

#函数调用，没有带括号
demoFun

#不使用function的定义
demoFun1 () {
  echo "define a function without keyword: function"
}

#函数调用
demoFun1

# 函数定义必须放在调用前
funWithReturn(){
  echo "输入2个数字相加，请输入第一个数字："
  read n1
  echo "输入2个数字相加，请输入第二个数字："
  read n2
  echo "两个数字分别是$n1 和 $n2"
  return $(($n1+$n2))
}

# 函数调用仅使用函数名称即可
funWithReturn 
# a=funWithReturn 会返回："funWithReturn"，不能调用赋值
# a=$? # 可以这样引用函数结果并赋值给另一个变量
# echo "和：$a"
# 函数返回值在调用函数之后，通过 $? 来获取
echo "输入的2个数字之和为：$? " # $? 仅可以引用一次，不能被连续多次被引用

# 函数内部通过$n 来获取参数 n>10用${n}来表示
funWitParam(){
  echo "first param: $1"
  echo "ninth param: $9"
  echo "tenth param: ${10}"
  echo "total of param: $#"
  echo "proccessID: $$"
  echo "output all of param as a string: $*"
}

funWitParam 1 2 3 4 5 6 7 8 9 10 11 12
