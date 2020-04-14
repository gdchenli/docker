#!/bin/bash
/usr/sbin/php-fpm #启动php-fpm
/usr/local/openresty/nginx/sbin/nginx -p /usr/local/openresty/nginx/  -g 'daemon off;' #启动nginx