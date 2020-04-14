FROM gdchenli/openresty:1.15.8.1
RUN cd /var && mkdir -p /var/www/go/src && mkdir -p /var/www/go/bin && \
	mkdir -p /var/www/go/pkg && mkdir -p /var/www/gopublic/src && \
	mkdir -p /var/www/gopublic/bin && mkdir -p /var/www/gopublic/pkg && \
	wget https://dl.google.com/go/go1.9.2.linux-amd64.tar.gz && \
	tar -C /usr/local -zxvf  go1.9.2.linux-amd64.tar.gz &&  rm go1.9.2.linux-amd64.tar.gz

#设置环境变量
ENV GOROOT /usr/local/go
ENV GOPUBLIC /var/www/gopublic
ENV GOWORKER /var/www/go
ENV GOPATH $GOPUBLIC:$GOWORKER
ENV PATH $PATH:$GOROOT/bin:$GOPUBLIC/bin:$GOWORKER\bin

EXPOSE 80
EXPOSE 443

COPY conf/init.sh	/var
ENTRYPOINT ["/bin/bash", "/var/init.sh"]
