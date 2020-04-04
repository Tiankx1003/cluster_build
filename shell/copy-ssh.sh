#!/bin/bash
ssh-keygen -t rsa
for i in `cat $HADOOP_HOME/etc/hadoop/slaves`
do
	echo -e "\033[31m ---------- $i ---------- \033[0m"
	ssh-copy-id $pdir/$fname $user@$i:$pdir
done