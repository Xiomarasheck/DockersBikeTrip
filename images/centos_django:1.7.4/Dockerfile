FROM centos:7
MAINTAINER SWAPI - Xiomara Gaona  "xiomysg1002@gmail.com"
LABEL Vendor="Xiomara Gaona" \
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
    yum -y --setopt=tsflags=nodocs install epel-release && \
    yum -y --setopt=tsflags=nodocs install python-devel python-setuptools python-pip && \
    yum -y --setopt=tsflags=nodocs install postgresql postgresql-devel python-devel gcc gcc-c++ make && \
    yum -y --setopt=tsflags=nodocs install postgresql-server postgresql-contrib && \
    yum -y --setopt=tsflags=nodocs install libmemcached-devel openssl-devel zlib-devel libmemcached  && \
    pip install --upgrade pip && \
    pip install virtualenv && \
    mkdir /var/www && \
    mkdir /var/www/html && \
    cd /var/www/html && \
    virtualenv djangoenv && \
    source djangoenv/bin/activate && \
    chmod u+rwx /var/www/html/* && \
    pip install psycopg2-binary && \
    pip install Django==1.7.4 && \
    pip install Django==1.7.4 && \
    pip install Padding==0.4 && \
    pip install SQLAlchemy==0.9.8 && \
    pip install dj-database-url==0.3.0 && \
    pip install dj-stripe==0.3.5 && \
    pip install django-braces==1.4.0 && \
    pip install django-clear-cache==0.3 && \
    pip install django-cors-headers==1.0.0 && \
    pip install django-heroku-memcacheify==0.8 django-jsonfield==0.9.13 && \
    pip install django-keen==0.1.3 && \
    pip install django-markdown-deux==1.0.5 && \
    pip install django-model-utils==2.2 && \
    pip install django-postgrespool==0.3.0  && \
    pip install django-pylibmc==0.5.0  && \
    pip install djangorestframework==3.0.0  && \
    pip install drf-json-api==0.1.0  && \
    pip install gunicorn==19.1.1  && \
    pip install keen==0.3.7  && \
    pip install markdown2==2.3.0  && \
    pip install psycopg2==2.5.4  && \
    pip install pycrypto==2.6.1  && \
    pip install pylibmc==1.4.1   && \
    pip install requests==2.5.1 && \
    pip install six==1.8.0 && \
    pip install stripe==1.19.1 && \
    pip install whitenoise==1.0.3 && \
    pip install wsgiref==0.1.2 && \
    deactivate && \
    yum clean all && \
    systemctl enable supervisord && \
    systemctl enable crond.service && \
    systemctl enable redis.service && \
    systemctl enable  postgresql && \
    sed -i '/# unixsocket /c unixsocket /var/run/redis/redis.sock' /etc/redis.conf && \
    sed -i '/# unixsocketperm /c unixsocketperm 777' /etc/redis.conf

WORKDIR /var/www/html

COPY supervisord.conf /etc/supervisord.conf
COPY supervisord.d /etc/supervisord.d

VOLUME /var/www/html

EXPOSE 8000

CMD ["/usr/sbin/init"]

