#! /bin/bash
#Preinstallation, docker and kubernetes services installation for centos instance.
sudo yum -y update && yum -y update && yum -y install make gcc kernel-devel kernel-headers net-tools vim
#Disable selinux 
sudosetenforce 0
sudo sed -i --follow-symlinks 's/SELINUX=enforcing/SELINUX=disabled/g' /etc/sysconfig/selinux
sudo modprobe br_netfilter
sudo echo '1' > /proc/sys/net/bridge/bridge-nf-call-iptables
#Disable swap, it’s required for kubernetes
sudo swapoff -a
#Install necessary packages for docker
sudo yum install -y yum-utils device-mapper-persistent-data lvm2
#Add repo
sudo 
yum-config-manager \
--add-repo \
https://download.docker.com/linux/centos/docker-ce.repo
#Install docker
sudo yum install -y docker-ce docker-ce-cli containerd.io docker-compose
#Enable the service and start it. 
sudo systemctl start docker && systemctl enable docker
#Allow docker command only for root 
sudo usermod -aG docker root
