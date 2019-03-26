FROM hub.c.163.com/public/centos:7.2-tools
COPY conf/OpenResty.repo  /etc/yum.repos.d
RUN yum -y install glibc-static telnet bridge-utils net-tools kde-l10n-Chinese  glibc-common \
    gcc gcc-c++ autoconf pcre pcre-devel make automake wget httpd-tools vim  \
    /bin/echo 'root:123456'|chpasswd && \
    localedef -c -f UTF-8 -i zh_CN zh_CN.utf8
RUN yum -y install openresty && \
    useradd nginx && mkdir /usr/local/openresty/nginx/conf/conf.d && \
    mkdir /var/log/nginx
COPY conf/nginx/nginx.conf  /usr/local/openresty/nginx/conf
COPY conf/nginx/default.conf  /usr/local/openresty/nginx/conf/conf.d
COPY conf/init.sh      /var
EXPOSE 22
EXPOSE 80
EXPOSE 443
ENTRYPOINT ["/bin/bash", "/var/init.sh"]