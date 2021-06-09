#!/bin/bash
# author: yonglong.wyl
# date: 2021/06/05

for loop in 1 2 3 4 5
do
  echo "current loop value is : ${loop}"
done

for str in This is a string
do
  echo $str
done

# 如果int小于5，打印数值并加1
int=1
while(( $int<=5 ))
do
  echo $int
  let "int++" # let 命令,用于执行一或多个表达式，变量计算中不需要加上$
done

# 从键盘读取信息，按<Ctrl-D>可退出循环
:<<EOF
echo -n '输入你最喜欢的网站名(<Ctrl-D>可退出)：'
while read SITE
do
  echo "是的！$SITE 是一个好网站"
  echo -n '输入你最喜欢的网站名(<Ctrl-D>可退出)：'
done
echo "\n"
EOF

# until循环，如果条件返回false，则继续执行，直到条件为true时停止跳出循环。刚好跟while相反
echo 'until loop demo：'
n=0
until [ $n -gt 10 ]
do
  echo $n
  n=`expr $n + 1`
done

echo '输入 1 到 4 之间的数字：'
read n
case $n in
  1) echo '你选择了 1'; ;;
  2) echo 'you input 2'; ;;
  3) echo 'you input 3'; ;;
  4) echo 'you input 4'; ;;
  *) echo 'you input out of 1~4'; ;;
esac

site="runoob"
case "$site" in
  "runoob") echo "runoob.com"
  ;;
  "google": echo "google.com"
  ;;
  "taobao": echo 'taobao.com'
  ;;
esac
