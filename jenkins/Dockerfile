FROM hub.c.163.com/public/centos:7.2-tools
RUN yum -y install glibc-static telnet bridge-utils net-tools kde-l10n-Chinese  glibc-common \
    gcc gcc-c++ autoconf pcre pcre-devel make automake wget httpd-tools vim  git initscripts \
    zlib-devel bzip2-devel openssl-devel ncurses-devel sqlite-devel readline-devel tk-devel \
    gdbm-devel db4-devel libpcap-devel xz-devel nss curl && \
    /bin/echo 'root:123456'|chpasswd && \
    localedef -c -f UTF-8 -i zh_CN zh_CN.utf8  && \
	wget -O /etc/yum.repos.d/jenkins.repo https://pkg.jenkins.io/redhat-stable/jenkins.repo && \
	rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io.key && \
	yum install -y java  jenkins && useradd deploy && \
	sed -i 's:JENKINS_USER="jenkins":JENKINS_USER="deploy":' /etc/sysconfig/jenkins  && \
	sed -i 's:LANG="en_US.UTF-8":LANG="zh_CN.UTF-8":' /etc/locale.conf && \
	chown -R deploy:deploy /var/lib/jenkins &&  \
	chown -R deploy:deploy /var/log/jenkins && \
	chown -R deploy:deploy /var/cache/jenkins
RUN cd /tmp && wget http://www.python.org/ftp/python/3.6.5/Python-3.6.5.tar.xz && \
	tar xf  Python-3.6.5.tar.xz && cd Python-3.6.5 && \
	./configure --prefix=/usr/local --with-ensurepip=install --enable-shared LDFLAGS="-Wl,-rpath /usr/local/lib" && \
	make && make install && ln -s /usr/local/bin/pip3.6   /usr/local/bin/pip && pip install virtualenv && \
	su - deploy -c "virtualenv -p /usr/local/bin/python3.6 .py3-a2.5-env && \
	cd /home/deploy/.py3-a2.5-env  && git clone https://github.com/ansible/ansible.git && \
	cd ansible && git checkout stable-2.5 && source /home/deploy/.py3-a2.5-env/bin/activate && \
	pip install paramiko PyYAML jinja2 && source /home/deploy/.py3-a2.5-env/ansible/hacking/env-setup -q && \
	ansible --version"
COPY conf/init.sh      /var

EXPOSE 8080

ENTRYPOINT ["/bin/bash", "/var/init.sh"]