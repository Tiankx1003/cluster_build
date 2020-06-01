# 基于CentOS 7.5安装
# 安装必要的配置
yum install -y vim tar rsync openssh openssh-clients libaio net-tools git ntp ntpdate ntp-doc zip unzip
# 修改主机名
vim /etc/hostname
# 修改ip
vim /etc/sysconfig/network-scripts/ifcfg-ens32
service network restart
# 关闭防火墙
systemctl stop firewalld
systemctl disable firewalld
# 新建用户
useradd tiankx
passwd tiankx
echo 'tiankx ALL=(ALL)    NOPASSWD:ALL' >> /etc/sudoers
# 安装java scala
tar -zxvf /opt/software/jdk-8u144-linux-x64.tar.gz -C /opt/module
tar -zxvf /opt/software/scala-2.11.8.tgz -C /opt/module
echo 'export JAVA_HOME=/opt/module/jdk1.8.0_144' >> /etc/profile
echo 'export PATH=$PATH:$JAVA_HOME/bin' >> /etc/profile
echo 'export SCALA_HOME=/opt/module/scala-2.11.8' >> /etc/profile
echo 'export PATH=$PATH:$SCALA_HOME/bin' >> /etc/profile
echo 'source /etc/profile' >> ~/.bashrc
source /etc/profile
# 安装mysql 5.6
rpm -qa|grep mariadb
rpm -e --nodeps  mariadb-libs
wget http://dev.mysql.com/get/Downloads/MySQL-5.7/mysql-5.7.16-1.el7.x86_64.rpm-bundle.tar

rpm -ivh mysql-community-common-5.7.16-1.el7.x86_64.rpm
rpm -ivh mysql-community-libs-5.7.16-1.el7.x86_64.rpm
rpm -ivh mysql-community-client-5.7.16-1.el7.x86_64.rpm
rpm -ivh mysql-community-server-5.7.16-1.el7.x86_64.rpm
mysqladmin --version
rpm -qa|grep -i mysql
mv /var/lib/mysql/ /var/lib/mysql_bak/
mysqld --initialize --user=mysql
chmod -R 777 /var/lib/mysql/
cat /var/log/mysqld.log
# iOae_M#l7jmn
# 启动mysql服务
systemctl start mysqld
systemctl status mysqld.service
journalctl -xe
mysql -uroot
tail -f /var/log/mysqld.log
setenforce 0 
