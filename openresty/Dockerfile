FROM centos:centos7.6.1810
COPY conf/OpenResty.repo  /etc/yum.repos.d
RUN yum -y install glibc-static telnet bridge-utils net-tools kde-l10n-Chinese  glibc-common \
    gcc gcc-c++ autoconf pcre pcre-devel make automake wget httpd-tools vim git
RUN yum -y install openresty && \
    useradd nginx && mkdir /usr/local/openresty/nginx/conf/conf.d && \
    mkdir /var/log/nginx
COPY conf/nginx/nginx.conf  /usr/local/openresty/nginx/conf
COPY conf/nginx/default.conf  /usr/local/openresty/nginx/conf/conf.d
COPY conf/init.sh      /var
EXPOSE 80
EXPOSE 443
ENTRYPOINT ["/bin/bash", "/var/init.sh"]