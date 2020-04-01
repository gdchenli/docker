FROM hub.c.163.com/public/centos:7.2-tools
RUN yum -y install glibc-static telnet bridge-utils net-tools kde-l10n-Chinese  glibc-common \
    gcc gcc-c++ autoconf pcre pcre-devel make automake wget httpd-tools vim initscripts git && \
    /bin/echo 'root:123456'|chpasswd && \
    localedef -c -f UTF-8 -i zh_CN zh_CN.utf8 && \
	cd /var && mkdir -p /var/www/go/src && mkdir -p /var/www/go/bin && \
	mkdir -p /var/www/go/pkg && mkdir -p /var/www/gopublic/src && \
	mkdir -p /var/www/gopublic/bin && mkdir -p /var/www/gopublic/pkg && \
	wget https://dl.google.com/go/go1.9.2.linux-amd64.tar.gz && \
	tar -C /usr/local -zxvf  go1.9.2.linux-amd64.tar.gz && \
	echo "export GOROOT=/usr/local/go" >> /etc/profile && \
	echo "export GOPUBLIC=/var/www/gopublic" >> /etc/profile && \
	echo "export GOWORKER=/var/www/go" >> /etc/profile && \
	echo "export GOPATH=\$GOPUBLIC:\$GOWORKER" >> /etc/profile && \
	echo "export PATH=\$PATH:\$GOROOT/bin:\$GOPUBLIC/bin:\$GOWORKER\bin" >> /etc/profile

#设置环境变量
ENV GOROOT /usr/local/go
ENV GOPUBLIC /var/www/gopublic
ENV GOWORKER /var/www/go
ENV GOPATH $GOPUBLIC:$GOWORKER
ENV PATH $PATH:$GOROOT/bin:$GOPUBLIC/bin:$GOWORKER\bin

EXPOSE 22
EXPOSE 80
EXPOSE 443

COPY conf/init.sh	/var
ENTRYPOINT ["/bin/bash", "/var/init.sh"]
