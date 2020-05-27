FROM centos:7
MAINTAINER BIKETRIP - Xiomara Gaona  "xiomysg1002@gmail.com"
LABEL Vendor="BIKETRIP" \
      License=Commercial \
      Version=1.0

RUN yum -y install systemd 
 
RUN (cd /lib/systemd/system/sysinit.target.wants/; for i in *; do [ $i == systemd-tmpfiles-setup.service ] || rm -f $i; done); \
rm -f /lib/systemd/system/multi-user.target.wants/*;\
rm -f /etc/systemd/system/*.wants/*;\
rm -f /lib/systemd/system/local-fs.target.wants/*; \
rm -f /lib/systemd/system/sockets.target.wants/*udev*; \
rm -f /lib/systemd/system/sockets.target.wants/*initctl*; \
rm -f /lib/systemd/system/basic.target.wants/*;\
rm -f /lib/systemd/system/anaconda.target.wants/*;

RUN yum -y --setopt=tsflags=nodocs update && \
    yum -y --setopt=tsflags=nodocs install vim sudo && \
    yum -y --setopt=tsflags=nodocs install cronie && \
    yum -y --setopt=tsflags=nodocs install epel-release yum-utils --nogpgcheck && \
    yum -y --setopt=tsflags=nodocs install wget unzip git && \
    yum -y --setopt=tsflags=nodocs install centos-release-scl && \
    yum -y --setopt=tsflags=nodocs install supervisor && \
    yum -y --setopt=tsflags=nodocs install epel-release yum-utils && \
    yum -y --setopt=tsflags=nodocs install https://download.postgresql.org/pub/repos/yum/reporpms/EL-7-x86_64/pgdg-redhat-repo-latest.noarch.rpm && \
    yum -y --setopt=tsflags=nodocs install postgresql12 postgresql12-server && \
    yum clean all && \
    systemctl enable postgresql-12 && \
    systemctl enable supervisord && \
    systemctl enable crond.service

#WORKDIR /var/lib/postgresql/

#VOLUME /var/lib/postgresql/data

EXPOSE 5432

CMD ["/usr/sbin/init"]

