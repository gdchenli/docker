FROM hub.c.163.com/public/centos:7.2-tools
RUN yum -y install glibc-static telnet bridge-utils net-tools kde-l10n-Chinese  glibc-common \
    gcc gcc-c++ autoconf pcre pcre-devel make automake wget httpd-tools vim  git && \
    /bin/echo 'root:123456'|chpasswd && \
    localedef -c -f UTF-8 -i zh_CN zh_CN.utf8  && \
	wget -O /etc/yum.repos.d/jenkins.repo https://pkg.jenkins.io/redhat-stable/jenkins.repo && \
	rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io.key && \
	yum install -y java  jenkins && useradd deploy && sed -i 's:JENKINS_USER="jenkins":JENKINS_USER="deploy":' /etc/sysconfig/jenkins  && \
	chown -R deploy:deploy /var/lib/jenkins &&  chown -R deploy:deploy /var/log/jenkins && chown -R deploy:deploy /var/cache/jenkins
COPY conf/init.sh      /var

EXPOSE 8080

ENTRYPOINT ["/bin/bash", "/var/init.sh"]