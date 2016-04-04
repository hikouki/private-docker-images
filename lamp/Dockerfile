FROM centos:6
MAINTAINER Kouki Higashikawa

# PHP
RUN rpm -Uvh http://ftp.iij.ad.jp/pub/linux/fedora/epel/6/x86_64/epel-release-6-8.noarch.rpm
RUN rpm -Uvh http://rpms.famillecollet.com/enterprise/remi-release-6.rpm
# Mysql
RUN yum install -y http://dev.mysql.com/get/mysql-community-release-el6-5.noarch.rpm

RUN yum install -y --enablerepo=remi --enablerepo=remi-php56 php php-opcache php-devel php-mbstring php-mcrypt php-mysqlnd php-phpunit-PHPUnit php-pecl-xdebug php-pecl-xhprof php-gd
RUN yum install -y git supervisor mysql mysql-devel mysql-server mysql-utilities expect sendmail

ADD start-apache2.sh /start-apache2.sh
ADD start-mysqld.sh /start-mysqld.sh
ADD start-sendmail.sh /start-sendmail.sh
ADD run.sh /run.sh
RUN chmod 755 /*.sh
ADD supervisord.conf /etc/supervisord.conf

RUN rm -rf /var/lib/mysql/*

ADD create_mysql_admin_user.sh /create_mysql_admin_user.sh
RUN chmod 755 /*.sh

RUN git clone https://github.com/fermayo/hello-world-lamp.git /app
RUN mkdir -p /app && rm -fr /var/www/html && ln -s /app /var/www/html

VOLUME  ["/etc/mysql", "/var/lib/mysql" ]

EXPOSE 80 3306 25
CMD ["/run.sh"]
