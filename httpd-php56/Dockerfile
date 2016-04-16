FROM centos:6
MAINTAINER Kouki Higashikawa

# PHP
RUN rpm -Uvh http://ftp.iij.ad.jp/pub/linux/fedora/epel/6/x86_64/epel-release-6-8.noarch.rpm
RUN rpm -Uvh http://rpms.famillecollet.com/enterprise/remi-release-6.rpm

RUN yum install -y --enablerepo=remi --enablerepo=remi-php56 php php-opcache php-devel php-mbstring php-mcrypt php-mysqlnd php-phpunit-PHPUnit php-pecl-xdebug php-pecl-xhprof php-gd
RUN yum install -y git supervisor sendmail

ADD start-httpd.sh /start-httpd.sh
ADD start-sendmail.sh /start-sendmail.sh
ADD run.sh /run.sh
RUN chmod 755 /*.sh
ADD supervisord.conf /etc/supervisord.conf

RUN chmod 755 /*.sh

RUN mkdir -p /app && rm -fr /var/www/html && ln -s /app /var/www/html

EXPOSE 80 25
CMD ["/run.sh"]
