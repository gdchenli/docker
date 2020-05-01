#!/bin/bash
/var/java/apache-tomcat-8.0.53/bin/startup.sh
/usr/local/openresty/nginx/sbin/nginx -p /usr/local/openresty/nginx/  -g 'daemon off;' #启动nginx