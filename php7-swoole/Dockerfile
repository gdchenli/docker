FROM hub.c.163.com/public/centos:6.7-tools
RUN mkdir -p /data/www

#下载php
RUN wget -P /data http://cn2.php.net/distributions/php-7.2.8.tar.gz
RUN tar -zxvf /data/php-7.2.8.tar.gz -C /data

#安装编译环境
RUN yum -y install gcc-c++ libxml2 libxml2-devel autoconf unzip openssl openssl-devel

RUN wget -P /data https://curl.haxx.se/download/curl-7.61.0.tar.gz 
RUN tar -zxvf /data/curl-7.61.0.tar.gz -C /data
WORKDIR /data/curl-7.61.0/
RUN ./configure --prefix=/usr/local/soft/curl && make && make install

#执行编译
WORKDIR /data/php-7.2.8/
RUN ./configure --prefix=/usr/local/soft/php --with-config-file-path=/usr/local/soft/php/etc --with-config-file-scan-dir=/usr/local/soft/php/etc/conf.d && make && make install
RUN cp /data/php-7.2.8/php.ini-development /usr/local/soft/php/etc/php.ini

#php-curl扩展
WORKDIR /data/php-7.2.8/ext/curl
RUN /usr/local/soft/php/bin/phpize
RUN ./configure --with-php-config=/usr/local/soft/php/bin/php-config --with-curl=/usr/local/soft/curl && make && make install
RUN mkdir -p /usr/local/soft/php/etc/conf.d
RUN echo extension=curl.so >/usr/local/soft/php/etc/conf.d/curl.ini

#php-openssl扩展
WORKDIR /data/php-7.2.8/ext/openssl
RUN cp ./config0.m4 ./config.m4
RUN /usr/local/soft/php/bin/phpize
RUN ./configure --with-php-config=/usr/local/soft/php/bin/php-config &&  make && make install
RUN echo extension=openssl.so >/usr/local/soft/php/etc/conf.d/openssl.ini

#安装phpredis 扩展
RUN wget -P /data -O /data/phpredis.zip https://github.com/phpredis/phpredis/archive/develop.zip
RUN unzip /data/phpredis.zip -d /data
WORKDIR /data/phpredis-develop
RUN /usr/local/soft/php/bin/phpize
RUN ./configure --with-php-config=/usr/local/soft/php/bin/php-config && make && make install
RUN echo extension=redis.so >/usr/local/soft/php/etc/conf.d/redis.ini

#安装hredis
RUN wget -P /data -O /data/hiredis.tar.gz https://github.com/redis/hiredis/archive/v0.13.3.tar.gz
RUN tar -zxvf /data/hiredis.tar.gz -C /data
WORKDIR /data/hiredis-0.13.3
RUN make -j && make install

#安装swoole 扩展
RUN wget -P /data -O /data/swoole.zip https://gitee.com/swoole/swoole/repository/archive/master.zip
RUN unzip /data/swoole.zip -d /data
WORKDIR /data/swoole
RUN /usr/local/soft/php/bin/phpize
RUN ./configure --with-php-config=/usr/local/soft/php/bin/php-config --enable-async-redis && make && make install
RUN echo extension=swoole.so >/usr/local/soft/php/etc/conf.d/swoole.ini

#composer
RUN /usr/local/soft/curl/bin/curl -sS https://getcomposer.org/installer | /usr/local/soft/php/bin/php && mv composer.phar /usr/local/bin/composer 

#环境变量
ENV LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/lib
ENV PATH $PATH:/usr/local/soft/php/bin

WORKDIR /data/www
EXPOSE 8811

COPY ./init.sh      /var
ENTRYPOINT ["/bin/bash", "/var/init.sh"]
