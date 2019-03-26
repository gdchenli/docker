#!/bin/bash
nohup /var/java/kafka_2.11-2.0.0/bin/zookeeper-server-start.sh /var/java/kafka_2.11-2.0.0/config/zookeeper.properties >/dev/null 2>&1 &
nohup /var/java/kafka_2.11-2.0.0/bin/kafka-server-start.sh /var/java/kafka_2.11-2.0.0/config/server.properties >/dev/null 2>&1 &
/var/java/apache-tomcat-8.0.53/bin/startup.sh
/bin/bash