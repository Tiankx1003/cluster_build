#!/bin/bash
case $1 in
# 传参为1时开启，0关闭
"1"){ 
	mr-jobhistory-daemon.sh start historyserver
    start-dfs.sh
    ssh node2 'start-yarn.sh'
};;
"0"){
    stop-dfs.sh
    mr-jobhistory-daemon.sh stop historyserver
    ssh node2 'stop-yarn.sh'
};;
esac