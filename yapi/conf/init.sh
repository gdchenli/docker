#!/bin/bash
#/usr/sbin/sshd -D
/usr/sbin/sshd  #启动ssh
cd /var/yapi/vendors/ && npm run install-server >> /var/yapi/password.txt
node /var/yapi/vendors/server/app.js