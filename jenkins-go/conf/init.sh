#!/bin/bash
/usr/sbin/sshd 
su - deploy -c " cd /usr/lib/jenkins && java -jar jenkins.war > /tmp/enkins.txt"
