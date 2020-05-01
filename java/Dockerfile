FROM gdchenli/openresty:1.15.8.1
RUN mkdir -p /var/java 
WORKDIR /var/java

RUN wget --no-cookies --no-check-certificate --header "Cookie: gpw_e24=http%3A%2F%2Fwww.oracle.com%2F; oraclelicense=accept-securebackup-cookie" "http://download.oracle.com/otn-pub/java/jdk/8u141-b15/336fa29ff2bb4ef291e347e091f7f4a7/jdk-8u141-linux-x64.tar.gz" \
&& wget https://mirrors.cnnic.cn/apache/tomcat/tomcat-8/v8.5.54/bin/apache-tomcat-8.5.54.tar.gz \
&& tar -zxvf  jdk-8u141-linux-x64.tar.gz \
&& tar -zxvf  apache-tomcat-8.5.54.tar.gz \
&& rm  jdk-8u141-linux-x64.tar.gz && rm apache-tomcat-8.5.54.tar.gz

#设置环境变量
ENV JAVA_HOME /var/java/jdk1.8.0_141
ENV CLASSPATH .:$JAVA_HOME/lib:$JRE_HOME/lib  
ENV PATH $PATH:$JAVA_HOME/bin

EXPOSE 80
EXPOSE 443


COPY ./conf/init.sh      /var
ENTRYPOINT ["/bin/bash", "/var/init.sh"]