#! /bin/bash
yum update -y 
yum install -y kernel-devel && yum install -y kernel-header gcc 
yum install wget -y 
 yum install centos-release-gluster -y
yum install epel-release -y
yum update -y 
yum install glusterfs glusterfs-server glusterfs-api glusterfs-ganesha  glusterfs-libs  -y 
wget -P /etc/yum.repos.d/ http://download.gluster.org/pub/gluster/glusterfs/LATEST/CentOS/glusterfs-epel.repo
systemctl enable glusterd && systemctl start glusterd 
systemctl start rcpbind && systemctl enable rcpbind 
yum install -y nfs-ganesha nfs-ganesha-gluster 
systemctl enable nfs-ganesha
