#!/bin/bash
#/usr/sbin/sshd -D
/usr/sbin/sshd  #启动ssh
cd /usr/lib/jenkins &&  java -jar jenkins.war > /var/jenkins.txt
