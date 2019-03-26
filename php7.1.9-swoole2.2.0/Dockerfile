FROM registry.cn-hangzhou.aliyuncs.com/pinguo-ops/php-msf-docker:latest

RUN cd /var/tmp && git clone https://gitee.com/swoole/swoole.git && \
cd swoole && \
git checkout v2.2.0 && \
/home/worker/php/bin/phpize  && \ 
sudo ./configure --with-php-config=/home/worker/php/bin/php-config --enable-async-redis  && \
sudo make && \
sudo make install

ENTRYPOINT ["/run.sh"]

EXPOSE 22 80 443
CMD ["/usr/sbin/sshd", "-D"]