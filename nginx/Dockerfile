FROM hub.c.163.com/public/centos:7.2-tools
COPY conf/nginx.repo /etc/yum.repos.d/
RUN yum -y install gcc gcc-c++ autoconf pcre pcre-devel make automake && \
	yum -y install wget httpd-tools vim && \
    yum -y install nginx && \
    /bin/echo 'root:123456'|chpasswd
COPY conf/init.sh      /var


EXPOSE 22
EXPOSE 80
EXPOSE 443

ENTRYPOINT ["/bin/bash", "/var/init.sh"]


