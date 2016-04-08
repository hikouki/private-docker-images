FROM centos:6
MAINTAINER Kouki Higashikawa

RUN yum install -y epel-release

RUN yum install -y git supervisor httpd

ADD start-httpd.sh /start-httpd.sh
ADD run.sh /run.sh
RUN chmod 755 /*.sh
ADD supervisord.conf /etc/supervisord.conf

RUN chmod 755 /*.sh

RUN mkdir -p /app && rm -fr /var/www/html && ln -s /app /var/www/html

EXPOSE 80
CMD ["/run.sh"]
