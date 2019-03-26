FROM hub.c.163.com/public/centos:6.7-tools
RUN rpm -Uvh http://mirror.webtatic.com/yum/el6/latest.rpm
RUN yum -y update && yum -y install php71w php71w-devel php71w-gd.x86_64 \
php71w-ldap.x86_64 php71w-mbstring.x86_64 php71w-mcrypt.x86_64 php71w-mysql.x86_64 \
php71w-pdo.x86_64 php71w-opcache.x86_64  php71w-xml.x86_64 php71w-fpm nginx && \
    /bin/echo 'root:123456'|chpasswd
RUN mkdir -p /var/www && mkdir -p /run
RUN curl -sS https://getcomposer.org/installer | php && mv composer.phar /usr/local/bin/composer
COPY ./php/index.php	/var/www
COPY ./nginx/default.conf /etc/nginx/conf.d
COPY ./nginx/ginx.conf	/etc/nginx
COPY ./init.sh      /var
EXPOSE 80
ENTRYPOINT ["/bin/bash", "/var/init.sh"]