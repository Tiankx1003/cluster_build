### node0
 * install CentOS 6.8 minimal config network setting
```bash
yum install -y vim tar rsync openssh openssh-clients libaio net-tools git ntp ntpdate ntp-doc
service iptables status
service iptables stop
chkconfig iptables --list
chkconfig iptables off
chkconfig ntpd on
ntpdate pool.ntp.org
/etc/init.d/ntpd start
vim /etc/vimrc
vim /etc/hosts
useradd tian
passwd tian
mkdir /opt/module/ /opt/software/
chown tian:tian /opt/module/ /opt/software/ -R
su tian
tar -zxvf /opt/software/jdk-8u144-linux-x64.tar.gz -C /opt/module
tar -zxvf /opt/software/scala-2.11.8.tgz -C /opt/module
sed 's/timeout=5/timeout=1/' /etc/grub.conf
echo 'tian ALL=(ALL)    NOPASSWD:ALL' >> /etc/sudoers
echo 'export JAVA_HOME=/opt/module/jdk1.8.0_144' >> /etc/profile
echo 'export PATH=$PATH:$JAVA_HOME/bin' >> /etc/profile
echo 'export SCALA_HOME=/opt/module/scala-2.11.8' >> /etc/profile
echo 'export PATH=$PATH:$SCALA_HOME/bin' >> /etc/profile
echo 'source /etc/profile' >> ~/.bashrc
source /etc/profile
java -version
scala -version
mkdir -p ~/bin
```
```vim
colorscheme default
syntax on
set showmode
set showcmd
set t_Co=256
filetype on
filetype indent on
filetype plugin on
filetype plugin indent on
set autoindent
set cindent
set tabstop=4
set shiftwidth=4
set softtabstop=4
set cursorline
set linebreak
set wrapmargin=0
set incsearch
set smartcase
set nobackup
set noswapfile
set undofile
set noerrorbells
set visualbell
set history=1000
set autoread
set fileencodings=utf-8,ucs-bom,gb18030,gbk,gb2312,cp936
set termencoding=utf-8
set encoding=utf-8
au FileType c,cpp setlocal comments-=:// comments+=f://
set paste
```
```host
192.168.2.200 node0
192.168.2.201 node1
192.168.2.202 node2
192.168.2.203 node3
```
### clone vm
```bash
vim /etc/udev/rules.d/70-persistent-net.rules
vim /etc/sysconfig/network-scripts/ifcfg-eth0
vim /etc/sysconfig/network
vim ~/bin/xsync
vim ~/bin/xcall
vim ~/bin/copy-ssh
vim ~/bin/jpsall
vim ~/bin/hy
chmod 777 ~/bin/*
```
```bash
tar -zxvf hadoop-2.7.2.tar.gz -C /opt/module/
vim slaves
# node1
# node2
# node3
vim core-site.xml
vim hdfs-site.xml
vim yarn-site.xml
vim mapred-site.xml
ehco $JAVA_HOME >> /opt/module/hadoop-2.7.2/etc/hadoop/mapred-env.sh
ehco $JAVA_HOME >> /opt/module/hadoop-2.7.2/etc/hadoop/hadoop-env.sh
ehco $JAVA_HOME >> /opt/module/hadoop-2.7.2/etc/hadoop/yarn-env.sh
# export JAVA_HOME=/opt/module/jdk1.8.0_144
xsync /opt/module/hadoop-2.7.2
sudo su root
/home/tian/bin/xcall echo 'export HADOOP_HOME=/opt/module/hadoop-2.7.2' >> /etc/profile
/home/tian/bin/xcall echo 'export PATH=$PATH:$HADOOP_HOME/bin' >> /etc/profile
exit
xsync hadoopo version
hdfs namenode -format
hy 1
jpsall
hy 0
jpsall
```

