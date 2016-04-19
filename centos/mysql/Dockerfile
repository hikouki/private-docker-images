FROM centos:6
MAINTAINER Kouki Higashikawa

# Supervisor
RUN yum install -y epel-release
# Mysql
RUN yum install -y http://dev.mysql.com/get/mysql-community-release-el6-5.noarch.rpm

RUN yum install -y git supervisor mysql mysql-devel mysql-server mysql-utilities expect

ADD start-mysqld.sh /start-mysqld.sh
ADD run.sh /run.sh
RUN chmod 755 /*.sh
ADD supervisord.conf /etc/supervisord.conf

RUN rm -rf /var/lib/mysql/*

RUN usermod -u 1000 mysql
RUN mkdir -p /var/run/mysqld
RUN chmod -R 777 /var/run/mysqld

ADD create_mysql_admin_user.sh /create_mysql_admin_user.sh
RUN chmod 755 /*.sh

RUN mkdir -p /app

VOLUME  ["/etc/mysql", "/var/lib/mysql" ]

EXPOSE 3306
CMD ["/run.sh"]
