FROM hub.c.163.com/public/centos:7.2-tools
RUN yum -y install glibc-static telnet bridge-utils net-tools kde-l10n-Chinese  glibc-common \
    gcc gcc-c++ autoconf pcre pcre-devel make automake wget httpd-tools vim  git && \
    /bin/echo 'root:123456'|chpasswd && \
    localedef -c -f UTF-8 -i zh_CN zh_CN.utf8  && \
	curl --silent --location https://rpm.nodesource.com/setup_10.x | bash - && \
	yum install -y nodejs && \
	mkdir /var/yapi && cd /var/yapi &&  git clone https://github.com/YMFE/yapi.git vendors
COPY conf/yapi.json  /var/yapi/config.json
RUN  cd /var/yapi/vendors && npm install --production --registry https://registry.npm.taobao.org
COPY conf/init.sh      /var

EXPOSE 22
EXPOSE 80
EXPOSE 443

ENTRYPOINT ["/bin/bash", "/var/init.sh"]