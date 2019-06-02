#! /bin/bash
yum update -y 
yum install -y kernel-devel && yum install -y kernel-header gcc 
yum install wget -y 
 yum install centos-release-gluster -y
yum install epel-release -y
yum update -y 
yum install glusterfs gluster-cli glusterfs-libs glusterfs-server -y 
wget -P /etc/yum.repos.d/ http://download.gluster.org/pub/gluster/glusterfs/LATEST/CentOS/glusterfs-epel.repo
systemctl enable glusterd && systemctl start glusterd 
yum install -y nfs-utils nfs-utils-lib 
sytemctl start nfs && systemctl enable nfs
systemctl start rcpbind && systemctl enable rcpbind 