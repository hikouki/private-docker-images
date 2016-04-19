FROM centos:6
MAINTAINER Kouki Higashikawa

# Node
RUN yum install -y epel-release
# Mysql
RUN yum install -y http://dev.mysql.com/get/mysql-community-release-el6-5.noarch.rpm

RUN yum install -y nodejs npm --enablerepo=epel
RUN yum install -y git supervisor mysql mysql-devel mysql-server mysql-utilities expect sendmail gcc gcc-c++

ADD start-node.sh /start-node.sh
ADD start-mysqld.sh /start-mysqld.sh
ADD start-sendmail.sh /start-sendmail.sh
ADD run.sh /run.sh
RUN chmod 755 /*.sh
ADD supervisord.conf /etc/supervisord.conf

RUN rm -rf /var/lib/mysql/*

ADD create_mysql_admin_user.sh /create_mysql_admin_user.sh
RUN chmod 755 /*.sh

RUN mkdir -p /app

VOLUME  ["/etc/mysql", "/var/lib/mysql" ]

EXPOSE 3000 3306 25
CMD ["/run.sh"]
