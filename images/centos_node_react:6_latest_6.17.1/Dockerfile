FROM centos:7
MAINTAINER BIKETRIP - Xiomara Gaona  "xiomysg1002@gmail.com"
LABEL Vendor="BIKETRIP" \
      License=Commercial \
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
    yum -y --setopt=tsflags=nodocs install gcc-c++ make && \
    yum -y --setopt=tsflags=nodocs install sudo && \
    curl -sL https://rpm.nodesource.com/setup_12.x | bash - && \
    sudo yum clean all && sudo yum makecache fast && \
    yum -y --setopt=tsflags=nodocs install gcc-c++ make && \
    yum -y --setopt=tsflags=nodocs install nodejs && \ 
    npm install -g expo-cli && \
    npm install -g react-native-cli && \
    npm install -g create-react-native-app && \
    yum clean all && \
    systemctl enable supervisord && \
    systemctl enable crond.service && \
    systemctl enable redis.service && \
    sed -i '/# unixsocket /c unixsocket /var/run/redis/redis.sock' /etc/redis.conf && \
    sed -i '/# unixsocketperm /c unixsocketperm 777' /etc/redis.conf

WORKDIR /var/www/html

COPY supervisord.conf /etc/supervisord.conf
COPY supervisord.d /etc/supervisord.d

RUN mkdir /data

VOLUME /var/www/html

EXPOSE 80 3000

CMD ["/usr/sbin/init"]
