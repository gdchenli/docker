FROM gdchenli/openresty:1.15.8.1
RUN cd /var && mkdir -p /var/www/nodejs && mkdir -p /usr/local/node && \
	wget https://nodejs.org/dist/v12.16.3/node-v12.16.3-linux-x64.tar.xz && \
	xz -d node-v12.16.3-linux-x64.tar.xz && \
	tar -C /usr/local/node -xvf  node-v12.16.3-linux-x64.tar --strip-components 1 &&  rm node-v12.16.3-linux-x64.tar

#设置环境变量
ENV PATH $PATH:/usr/local/node/bin

EXPOSE 80
EXPOSE 443
EXPOSE 5000

COPY conf/init.sh	/var
ENTRYPOINT ["/bin/bash", "/var/init.sh"]
