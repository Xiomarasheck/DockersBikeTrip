FROM centos:7
MAINTAINER Xiomara Gaona Toro "xiomysg1002@gmail.com" 
LABEL Vendor="XIOMARA GAONA" \
      License=Free \
      Version=1.0

RUN (cd /lib/systemd/system/sysinit.target.wants/; for i in *; do [ $i == systemd-tmpfiles-setup.service ] || rm -f $i; done); \
rm -f /lib/systemd/system/multi-user.target.wants/*;\
rm -f /etc/systemd/system/*.wants/*;\
rm -f /lib/systemd/system/local-fs.target.wants/*; \
rm -f /lib/systemd/system/sockets.target.wants/*udev*; \
rm -f /lib/systemd/system/sockets.target.wants/*initctl*; \
rm -f /lib/systemd/system/basic.target.wants/*;\
rm -f /lib/systemd/system/anaconda.target.wants/*;

RUN yum -y --setopt=tsflags=nodocs update && \
    yum -y --setopt=tsflags=nodocs install vim && \
    yum -y --setopt=tsflags=nodocs install cronie && \
    yum -y --setopt=tsflags=nodocs install epel-release yum-utils --nogpgcheck && \
    yum -y --setopt=tsflags=nodocs install redis wget unzip git && \
    yum -y --setopt=tsflags=nodocs install centos-release-scl && \
    yum -y --setopt=tsflags=nodocs install supervisor && \
    yum -y --setopt=tsflags=nodocs install epel-release && \
    yum -y --setopt=tsflags=nodocs install python-devel python-setuptools python-pip && \
    pip install --upgrade pip && \
    pip install virtualenv && \
    pip install psycopg2-binary && \
    mkdir /var/www && \
    mkdir /var/www/html && \
    cd /var/www/html && \
    virtualenv djangoenv && \
    source djangoenv/bin/activate && \
    pip install django && \
    pip install psycopg2-binary && \
    deactivate && \
    yum clean all && \
    systemctl enable supervisord && \
    systemctl enable crond.service && \
    systemctl enable redis.service && \
    sed -i '/# unixsocket /c unixsocket /var/run/redis/redis.sock' /etc/redis.conf && \
    sed -i '/# unixsocketperm /c unixsocketperm 777' /etc/redis.conf

WORKDIR /var/www/html

COPY supervisord.conf /etc/supervisord.conf
COPY supervisord.d /etc/supervisord.d

VOLUME /var/www/html

EXPOSE 8000

CMD ["/usr/sbin/init"]

