FROM hub.c.163.com/public/centos:6.7-tools
RUN rpm -Uvh http://mirror.webtatic.com/yum/el6/latest.rpm
RUN yum -y update && yum -y install php56w php56w-devel php56w-gd.x86_64 \
php56w-ldap.x86_64 php56w-mbstring.x86_64 php56w-mcrypt.x86_64 php56w-mysql.x86_64 \
php56w-pdo.x86_64 php56w-opcache.x86_64  php56w-xml.x86_64 php56w-fpm nginx && \
    /bin/echo 'root:123456'|chpasswd
RUN mkdir -p /var/www && mkdir -p /run
RUN curl -sS https://getcomposer.org/installer | php && mv composer.phar /usr/local/bin/composer
COPY ./nginx/default.conf /etc/nginx/conf.d
COPY ./nginx/nginx.conf	/etc/nginx
COPY ./nginx/www.conf     /etc/php-fpm.d
COPY ./php/php.ini     /etc
COPY ./php/index.php    /var/www
COPY ./init.sh      /var
EXPOSE 22
EXPOSE 80
EXPOSE 443
ENTRYPOINT ["/bin/bash", "/var/init.sh"]