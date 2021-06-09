#!/bin/bash
# author: yonglong.wyl
# data: 2021/06/04

# 简单的Hello World例子
printf "Hello, Shell\n"


# %s 输出一个字符串
# %d 输出整形数字
# %c 输出一个字符
# %f 以小数形式输出实数
# %-10s 指定一个宽度为10个字符的，-表示左对齐，没有表示右对齐，任何字符都被显示在10个字符宽度内，不足以空格填充，超过也会讲内容全部显示出来
# -4.2f 格式化为小数，.2指保留2为小数
printf "%-10s %-8s %-4s\n" 姓名 姓名 体重kg
printf "%-10s %-8s %-4.2f\n" 郭靖 男 66.1234
printf "%-10s %-8s %-4.2f\n" 郭芙 女 47.9876

# printf format-string [arguments...]
# format-string：控制格式的字符串，可以用双引号、单引号、无引号 包裹
# arguments：参数多余format-string个数时，采用format-string重用规则。无arguments参数时，%s用NULL代替，%d用0代替
printf "%d %s\n" 1 "abca" # format-string：双引号
printf '%d %s\n' 1 "abc" #format-string: 单引号
printf %s abcdef	# format-string: 无引号
printf %s abc def 	# arguments数量超过 format-string数量，format-string规则重用
printf "%s\n" abc def
printf "%s %s %s\n" a b c d e f g h i j
printf "%s and %d \n"
