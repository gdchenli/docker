#!/bin/bash
#/usr/sbin/sshd -D
/usr/sbin/sshd  #启动ssh
/usr/local/openresty/nginx/sbin/nginx -p /usr/local/openresty/nginx/  -g 'daemon off;' #启动nginx