FROM hub.c.163.com/public/centos:7.2-tools
RUN rpm -Uvh https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm
RUN rpm -Uvh https://mirror.webtatic.com/yum/el7/webtatic-release.rpm
RUN yum -y install glibc-static telnet bridge-utils net-tools kde-l10n-Chinese  glibc-common \
    gcc gcc-c++ autoconf pcre pcre-devel make automake wget httpd-tools vim \
    php72w php72w-devel php72w-gd \
	php72w-ldap php72w-mbstring php72w-mcrypt php72w-mysql \
	php72w-pdo php72w-opcache  php72w-xml php72w-fpm  && \
    /bin/echo 'root:123456'|chpasswd && \
    localedef -c -f UTF-8 -i zh_CN zh_CN.utf8
COPY conf/OpenResty.repo  /etc/yum.repos.d
RUN yum -y install openresty && \
    useradd nginx && mkdir /usr/local/openresty/nginx/conf/conf.d && \
    mkdir /var/log/nginx
RUN curl -sS https://getcomposer.org/installer | php && mv composer.phar /usr/local/bin/composer
COPY conf/nginx/nginx.conf  /usr/local/openresty/nginx/conf
COPY conf/nginx/default.conf  /usr/local/openresty/nginx/conf/conf.d
COPY conf/init.sh      /var
EXPOSE 22
EXPOSE 80
EXPOSE 443
ENTRYPOINT ["/bin/bash", "/var/init.sh"]