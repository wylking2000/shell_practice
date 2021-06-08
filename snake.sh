#!/bin/bash

# filename: snake.sh
# snake game
# author: yonglong.wyl

good_game=(
    '                                                 '
    '                G A M E  O V E R !               '
    '                                                 '
    '                   Score:                        '
    '          press   q   to quit                    '
    '          press   n   to start a new game        '
    '          press   s   to change the speed        '
    '                                                 '  
);

game_start=(
    '                                                 '
    '                ~~~ S N A K E ~~~                '
    '                                                 '
    '                  Author:  LKJ                   '
    '         space or enter   pause/play             '
    '         q                quit at any time       '
    '         s                change the speed       '
    '                                                 '
    '         Press <Enter> to start the game         '
    '                                                 '
);

# 退出游戏 
snake_exit(){
    stty echo;  #恢复回显
    tput rmcup; #恢复屏幕 rmcup=\E[?1049l
    # cvvis: https://unix.stackexchange.com/questions/220330/hide-and-unhide-cursor-with-tput
    tput cvvis; #恢复光标 cvvis=\E[34l : make cursor very visible；反向操作隐藏光标：civis - cursor invisible
    exit 0;
}
:<<EOF
tput: https://linuxcommand.org/lc3_adv_tput.php
sc: Save the Cursor position
rc: Restore the Cursor position
home: move the cursor to upper left corner(0,0)
cup <row> <col>: move the Cursor to Position row col
civis: set the Cursor to be invisible
cnorm: set the Cursor to be Normal state
EOF

#绘制界面-外框
draw_gui(){
    clear;
    color="\033[34m*\033[0m"; #\033[34: 蓝色 *:字符* \033[0m:关闭所有属性
    for((i=0; i<$1; i++)); do
        echo -ne "\033[$i;0H${color}"; #\33[y;xH设置光标位置
        echo -ne "\033[$i;$2H${color}";
    done

    for((i=0; i<=$2; i++)); do
        echo -ne "\033[0;${i}H${color}";
        echo -ne "\033[$1;${i}H${color}";
    done

    ch_speed 0;
    echo -ne "\033[$Lines;$((yscore-10))H\033[36mScores:0\033[0m"; #\33[36m: 深绿色
    echo -ne "\033[$Lines;$((Cols-50))H\033[33mPress <space> or enter to pause game\033[0m";
}

#游戏初始化
snake_init(){
    Lines=`tput lines`; Cols=`tput cols`;   #获得屏幕行数和列数
    xline=$((Lines/2)); ycols=4;            #开始的位置
    xscore=$Lines;      yscore=$((Cols/2)); #打印份数的位置
    xcent=$xline;       ycent=$yscore;      #中心点位置
    xrand=0;            yrand=0;            #随机点
    sumscore=0;         liveflag=1;         #总分和点存在标记
    sumnode=0;          foodscore=0;        #总共要加长的节点和点的份数

    snake="0000 ";                          #初始化贪吃蛇
    pos=(right right right right right);    #开始节点的方向: "right" "right" "right" "right" "right"
    xpt=($xline $xline $xline $xline $xline);   #开始的每个节点的x坐标
    ypt=(5 4 3 2 1);                        #开始的各节点的y坐标
    speed=(0.5 1 1.5);                  #速度 
    spk=${spk:-1};                          #默认速度，如果${spk}存在则spk=${spk}，如果${spk}不存在，则spk=1,{:-1}表示默认值为1

    draw_gui $((Lines-1)) $Cols
}

# 暂定游戏
game_pause(){
    echo -en "\033[$Lines;$((Cols-50))H\033[33mGame Paused, Use space or enter key to continue\033[0m";
    while read -n 1 space; do
        if [[ ${space:-enter} = enter ]]
        then
            echo -ne "\033[$Lines;$((Cols-50))H\033[33mPress <space> or enter to pause game      \033[0m";
            return 0;
        fi
        if [[ ${space:-enter} = q ]]
        then
            snake_exit;
        fi
    done
}

#更新位置
update(){
    case ${pos[$1]} in
        right)  ((ypt[$1]++));;
        left)   ((ypt[$1]--));;
        down)   ((xpt[$1]++));;
        up)     ((xpt[$1]--));;
    esac
}

#改变速度
ch_speed(){
    [[ $# -eq 0 ]] && spk=$(((spk+1)%3));   # $# 参数总数，如果入参总数为0，spk自动+1并用3取模，类似自动加一档
    case $spk in
        0) temp="Fast  ";;
        1) temp="Medium";;
        2) temp="Slow  ";;
    esac
    echo -ne "\033[$Lines;3H\033[33mSpeed: $temp\033[0m";    
}

#操控
Gooooo(){
    case ${key:-enter} in
        j|J|down) [[ ${pos[0]} != "up"     ]] && pos[0]="down";;
        k|K|up) [[ ${pos[0]} != "down"   ]] && pos[0]="up";;
        h|H|left) [[ ${pos[0]} != "right"  ]] && pos[0]="left";;
        l|L|right) [[ ${pos[0]} != "left"     ]] && pos[0]="right";;
        s|S) ch_speed;;
        q|Q) snake_exit;;
        enter) game_pause;;
    esac
}

#添加节点
add_node(){
    snake="0${snake}";  #增加节点
    pos=(${pos[0]} ${pos[@]});
    xpt=(${xpt[0]} ${xpt[@]});
    ypt=(${ypt[0]} ${ypt[@]});
    update 0;

    local x=${xpt[0]} y=${ypt[0]}
    (( ((x>=$((Lines-1)))) || ((x<=1)) || ((y>=Cols)) || ((y<=1)) )) && return 1;

    for ((i=$((${#snake}-1)); i>0; i--)); do
        (( ${xpt[0]} == ${xpt[$i]} && ${ypt[0]} == ${ypt[$i]} )) && return 1;
    done

    echo -ne "\033[${xpt[0]};${ypt[0]}H\033[32m${snake[@]:0:1}\033[0m";
    return 0;
}

#随机位置
mk_random(){
    xrand=$((RANDOM%(Lines-3)+2));
    yrand=$((RANDOM%(Cols-2)+2));
    foodscore=$((RANDOM%9+1));

    echo -ne "\033[${xrand};${yrand}H${foodscore}";
    liveflag=0;
}

#创建新游戏
new_game(){
    snake_init;
    while true; do
        read -t ${speed[$spk]} -n 1 key;    #-t 后面跟秒数，定义输入字符的等待时间。
        [[ $? -eq 0 ]] && Gooooo;   # $? 显示命令的退出状态，0表示没有错误，其他任何值表示有错误

        ((liveflag==0)) || mk_random;
        if (( sumnode > 0 )); then
            ((sumnode--));
            add_node;
            (($?==0)) || return 1;
        else
            update 0;
            echo -ne "\033[${xpt[0]};${ypt[0]}H\033[32m${snake[@]:0:1}\033[0m";

            for (( i = $((${#snake}-1)); i > 0; i-- )); do
                update $i;
                echo -ne "\033[${xpt[$i]};${ypt[$i]}H\033[32m${snake[@]:$i:1}\033[0m";

                (( ${xpt[0]} == ${xpt[$i]} && ${ypt[0]} == ${ypt[$i]} )) && return 1; #crashed
                [[ ${pos[$((i-1))]} = ${pos[$i]} ]] || pos[$i]=${pos[$((i-1))]};
            done
        fi

        local x=${xpt[0]} y=${ypt[0]}
        (( ((x>=$((Lines-1)))) || ((x<=1)) || ((y>=Cols)) || ((y<=1)) )) && return 1; #撞墙

        (( x==xrand && y==yrand )) && ((liveflag=1)) && ((sumnode+=foodscore)) && ((sumscore+=foodscore));

        echo -ne "\033[$xscore;$((yscore-2))H$sumscore";
    done
}

#打印结束界面
print_good_game(){
    local x=$((xcent-4)) y=$((ycent-25))
    for((i=0; i<8; i++)); do
        echo -ne "\033[$((x+i));${y}H\033[45m${good_game[$i]}\033[0m";
    done
    echo -ne "\033[$((x+3));$((ycent+1))H\033[45m${sumscore}\033[0m";
}

#打印开始界面
print_game_start(){

    snake_init;

    # 绘制 game_start 界面
    local x=$((xcent-5)) y=$((ycent-25))
    for((i=0; i<10; i++)); do
        echo -ne "\033[$((x+i));${y}H\033[45m${game_start[$i]}\033[0m"; #\033[45m:紫色背景
    done

    # 监听键盘
    while read -n 1 anykey; do
        # 默认enter键兜底
        [[ ${anykey:-enter} = enter ]] && break;    # 如果输入enter，退出循环
        [[ ${anykey:-enter} = q ]] && snake_exit;   # 如果输入q，则执行snake_exit函数
        [[ ${anykey:-enter} = s ]] && ch_speed;     # 如果输入s，则执行ch_speed函数
    done

    while true; do
        new_game;
        print_good_game;
        while read -n 1 anykey; do
            [[ $anykey = n ]] && break;         # 如果输入n，则跳出循环
            [[ $anykey = q ]] && snake_exit;    # 如果输入q，则执行退出游戏 snake_exit
        done
    done
}

#游戏主函数
game_main() {
    trap 'snake_exit;' SIGTERM SIGINT;
    stty -echo;
    tput civis;
    tput smcup;
    clear;

    print_game_start;
}

#运行游戏
game_main;
