FROM hub.c.163.com/public/centos:6.7-tools
RUN mkdir -p /var/java 
WORKDIR /var/java

#COPY jdk-8u181-linux-x64.tar.gz /var/java
RUN wget --no-check-certificate --no-cookies --header "Cookie: oraclelicense=accept-securebackup-cookie"  http://download.oracle.com/otn-pub/java/jdk/8u181-b13/96a7b8442fe848ef90c96a2fad6ed6d1/jdk-8u181-linux-x64.tar.gz 

RUN wget http://mirrors.shu.edu.cn/apache/tomcat/tomcat-8/v8.0.53/bin/apache-tomcat-8.0.53.tar.gz \
&& tar -zxvf  jdk-8u181-linux-x64.tar.gz \
&& tar -zxvf  apache-tomcat-8.0.53.tar.gz \
&& wget https://studygolang.com/dl/golang/go1.11.linux-amd64.tar.gz \
&& tar -zxvf go1.11.linux-amd64.tar.gz -C /usr/local \
&& wget http://mirrors.hust.edu.cn/apache/kafka/2.0.0/kafka_2.11-2.0.0.tgz \
&& tar -zxvf kafka_2.11-2.0.0.tgz 

COPY conf/kafka/server.properties /var/java/kafka_2.11-2.0.0/config

#设置环境变量
ENV JAVA_HOME /var/java/jdk1.8.0_181
ENV CLASSPATH .:$JAVA_HOME/lib:$JRE_HOME/lib  
ENV PATH $PATH:$JAVA_HOME/bin:/usr/local/go/bin
ENV GOPATH /var/www/gopublic:/var/www/gowork

EXPOSE 8080
EXPOSE 2181
EXPOSE 9092

COPY ./init.sh      /var
ENTRYPOINT ["/bin/bash", "/var/init.sh"]