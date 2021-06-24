#!/bin/sh
set -ex

#设置时区
sudo timedatectl set-timezone Asia/Shanghai

# 优化参数
echo "
vm.overcommit_memory = 1
vm.swappiness = 1

net.core.netdev_max_backlog = 10240
net.core.somaxconn = 64000
net.core.rmem_max=2500000
net.ipv4.tcp_max_syn_backlog = 10240
net.ipv4.tcp_synack_retries = 0
net.ipv4.tcp_syncookies = 1
net.ipv4.tcp_tw_reuse = 1
net.ipv4.tcp_tw_recycle = 1
net.ipv4.tcp_fin_timeout = 10
net.ipv4.ip_local_port_range = 10000 65535
" | sudo tee -a /etc/sysctl.conf

# 优化资源
echo "
* soft nofile 1048576
* hard nofile 1048576
root soft nofile 1048576
root hard nofile 1048576
* soft nproc unlimited
* hard nproc unlimited
root soft nproc unlimited
root hard nproc unlimited
" | sudo tee -a /etc/security/limits.conf

#开启自启:1
sudo touch /etc/rc.local

#添加自启脚本:关闭Transparent Huge Pages
echo "#!/bin/sh -e

echo never > /sys/kernel/mm/transparent_hugepage/enabled

exit 0
" | sudo tee /etc/rc.local

#开启自启:2
sudo chmod +x /etc/rc.local

#开启自启:3
sudo systemctl enable rc-local.service
