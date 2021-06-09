#!/bin/bash

# author: yonglong.wyl
# date: 2021/06/09

!<<EOF
#简单实例
echo "input website:"
read website	#没带任何参数，默认一直等待用户输入
echo "your website is: ${website}"
exit 0 #退出当前的Shell 进程,0:执行成功，n(n>0): 其他值代表执行失败
# 执行exit可以使shell以指定的状态值退出
# exit 也可以用在script，离开正在执行的script，回到shell
EOF

!<<EOF
# 演示 -p 参数
read -p "输入网址名：" website
echo "你输入的网站名是 ${website}"
exit 0
EOF

!<<EOF
# 演示-t 参数
if read -t 1 -p "输入网址：" website
then
  echo "你输入的网址：${website}"
else
  echo -e "\n抱歉，你输入超时了"
fi
exit 0
EOF

!<<EOF
# -n 计数输入字符
read -n1 -p "Do you want to continue [Y/N]?" answer
case $answer in
    Y|y)
        echo "fine, continue";;
    N|n)
        echo "ok, good bye";;
    *)
        echo "error chice";;
esac
exit 0;
EOF

!<<EOF
count=1
cat echo_file.txt | while read line
do
  echo "Line $count:$line"
  count=$[ $count +1 ]
done
echo "finish"
exit 0;
EOF

read -e -p "输入文件名：" str