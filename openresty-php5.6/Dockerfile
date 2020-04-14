FROM gdchenli/openresty:1.15.8.1
RUN rpm -Uvh https://mirror.webtatic.com/yum/el7/epel-release.rpm
RUN rpm -Uvh https://mirror.webtatic.com/yum/el7/webtatic-release.rpm
RUN yum -y install php56w php56w-devel php56w-gd.x86_64 \
	php56w-ldap.x86_64 php56w-mbstring.x86_64 php56w-mcrypt.x86_64 php56w-mysql.x86_64 \
	php56w-pdo.x86_64 php56w-opcache.x86_64  php56w-xml.x86_64 php56w-fpm 
RUN curl -sS https://getcomposer.org/installer | php && mv composer.phar /usr/local/bin/composer && \
    ln -s /usr/local/openresty/nginx/conf/conf.d  /root/conf.d  && \
    ln -s /usr/local/openresty/nginx/sbin/nginx  /usr/local/bin
COPY conf/nginx/default.conf  /usr/local/openresty/nginx/conf/conf.d
COPY conf/init.sh      /var

EXPOSE 80
EXPOSE 443

ENTRYPOINT ["/bin/bash", "/var/init.sh"]