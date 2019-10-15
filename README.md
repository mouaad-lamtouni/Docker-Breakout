# Docker-Breakout
First, put all files in folder:
[root@docker Breakout6]# ls
Breakout-master  Dockerfile  haproxy.pem  ha-ssl.cfg  supervisord_add.conf
[root@docker Breakout6]# 

# Build the image:
[root@docker Breakout6]# docker build -t breakout6 .
Sending build context to Docker daemon 426.5 kB
Step 1/16 : FROM oraclelinux:7
 ---> 5f993b1aafe5
Step 2/16 : LABEL maintainer "mdlamtouni@gmail.com"
 ---> Using cache
 ---> 035a5481f5be
Step 3/16 : RUN yum install -y httpd openssl* haproxy && yum clean all
 ---> Using cache
 ---> 4f399addec17
Step 4/16 : RUN yum install -y python3-pip* python-setuptools* && yum clean all
 ---> Running in 75c25daaaba7
Loaded plugins: ovl, ulninfo
Resolving Dependencies
--> Running transaction check
---> Package python-setuptools.noarch 0:0.9.8-7.el7 will be installed
--> Processing Dependency: python-backports-ssl_match_hostname for package: python-setuptools-0.9.8-7.el7.noarch
---> Package python3-pip.noarch 0:9.0.3-5.el7 will be installed
--> Processing Dependency: python(abi) = 3.6 for package: python3-pip-9.0.3-5.el7.noarch
--> Processing Dependency: python3-setuptools for package: python3-pip-9.0.3-5.el7.noarch
--> Processing Dependency: /usr/bin/python3 for package: python3-pip-9.0.3-5.el7.noarch
--> Running transaction check
---> Package python-backports-ssl_match_hostname.noarch 0:3.5.0.1-1.el7 will be installed
--> Processing Dependency: python-ipaddress for package: python-backports-ssl_match_hostname-3.5.0.1-1.el7.noarch
--> Processing Dependency: python-backports for package: python-backports-ssl_match_hostname-3.5.0.1-1.el7.noarch
---> Package python3.x86_64 0:3.6.8-10.0.1.el7 will be installed
--> Processing Dependency: python3-libs(x86-64) = 3.6.8-10.0.1.el7 for package: python3-3.6.8-10.0.1.el7.x86_64
--> Processing Dependency: libpython3.6m.so.1.0()(64bit) for package: python3-3.6.8-10.0.1.el7.x86_64
---> Package python3-setuptools.noarch 0:39.2.0-10.el7 will be installed
--> Running transaction check
---> Package python-backports.x86_64 0:1.0-8.el7 will be installed
---> Package python-ipaddress.noarch 0:1.0.16-2.el7 will be installed
---> Package python3-libs.x86_64 0:3.6.8-10.0.1.el7 will be installed
--> Processing Dependency: libtirpc.so.1()(64bit) for package: python3-libs-3.6.8-10.0.1.el7.x86_64
--> Running transaction check
---> Package libtirpc.x86_64 0:0.2.4-0.16.el7 will be installed
--> Finished Dependency Resolution

Dependencies Resolved

================================================================================
 Package                             Arch   Version            Repository  Size
================================================================================
Installing:
 python-setuptools                   noarch 0.9.8-7.el7        ol7_latest 397 k
 python3-pip                         noarch 9.0.3-5.el7        ol7_latest 1.8 M
Installing for dependencies:
 libtirpc                            x86_64 0.2.4-0.16.el7     ol7_latest  89 k
 python-backports                    x86_64 1.0-8.el7          ol7_latest 5.2 k
 python-backports-ssl_match_hostname noarch 3.5.0.1-1.el7      ol7_latest  12 k
 python-ipaddress                    noarch 1.0.16-2.el7       ol7_latest  34 k
 python3                             x86_64 3.6.8-10.0.1.el7   ol7_latest  69 k
 python3-libs                        x86_64 3.6.8-10.0.1.el7   ol7_latest 7.0 M
 python3-setuptools                  noarch 39.2.0-10.el7      ol7_latest 628 k

Transaction Summary
================================================================================
Install  2 Packages (+7 Dependent packages)

Total download size: 9.9 M
Installed size: 50 M
Downloading packages:
--------------------------------------------------------------------------------
Total                                              848 kB/s | 9.9 MB  00:11     
Running transaction check
Running transaction test
Transaction test succeeded
Running transaction
  Installing : python-ipaddress-1.0.16-2.el7.noarch                         1/9 
  Installing : python-backports-1.0-8.el7.x86_64                            2/9 
  Installing : python-backports-ssl_match_hostname-3.5.0.1-1.el7.noarch     3/9 
  Installing : libtirpc-0.2.4-0.16.el7.x86_64                               4/9 
  Installing : python3-setuptools-39.2.0-10.el7.noarch                      5/9 
  Installing : python3-pip-9.0.3-5.el7.noarch                               6/9 
  Installing : python3-3.6.8-10.0.1.el7.x86_64                              7/9 
  Installing : python3-libs-3.6.8-10.0.1.el7.x86_64                         8/9 
  Installing : python-setuptools-0.9.8-7.el7.noarch                         9/9 
  Verifying  : libtirpc-0.2.4-0.16.el7.x86_64                               1/9 
  Verifying  : python-backports-ssl_match_hostname-3.5.0.1-1.el7.noarch     2/9 
  Verifying  : python-backports-1.0-8.el7.x86_64                            3/9 
  Verifying  : python3-3.6.8-10.0.1.el7.x86_64                              4/9 
  Verifying  : python-ipaddress-1.0.16-2.el7.noarch                         5/9 
  Verifying  : python3-setuptools-39.2.0-10.el7.noarch                      6/9 
  Verifying  : python-setuptools-0.9.8-7.el7.noarch                         7/9 
  Verifying  : python3-pip-9.0.3-5.el7.noarch                               8/9 
  Verifying  : python3-libs-3.6.8-10.0.1.el7.x86_64                         9/9 

Installed:
  python-setuptools.noarch 0:0.9.8-7.el7    python3-pip.noarch 0:9.0.3-5.el7   

Dependency Installed:
  libtirpc.x86_64 0:0.2.4-0.16.el7                                              
  python-backports.x86_64 0:1.0-8.el7                                           
  python-backports-ssl_match_hostname.noarch 0:3.5.0.1-1.el7                    
  python-ipaddress.noarch 0:1.0.16-2.el7                                        
  python3.x86_64 0:3.6.8-10.0.1.el7                                             
  python3-libs.x86_64 0:3.6.8-10.0.1.el7                                        
  python3-setuptools.noarch 0:39.2.0-10.el7                                     

Complete!
Loaded plugins: ovl, ulninfo
Cleaning repos: ol7_UEKR5 ol7_developer_EPEL ol7_latest
 ---> ce63bfe06e43
Removing intermediate container 75c25daaaba7
Step 5/16 : RUN easy_install supervisor
 ---> Running in b3a6defac851
Searching for supervisor
Reading https://pypi.python.org/simple/supervisor/
Best match: supervisor 4.0.4
Downloading https://files.pythonhosted.org/packages/41/a8/41ac6efd240cde4d98068dd1b4a5172fea5dcee58d4f3496f75e40b927c6/supervisor-4.0.4.tar.gz#sha256=9644990d21a1ba03b1a7ac5e9a0c0c62e12822e258f9e98f4a0b128461b3f10a
Processing supervisor-4.0.4.tar.gz
Writing /tmp/easy_install-AU4ben/supervisor-4.0.4/setup.cfg
Running supervisor-4.0.4/setup.py -q bdist_egg --dist-dir /tmp/easy_install-AU4ben/supervisor-4.0.4/egg-dist-tmp-2vSziy
warning: no previously-included files matching '*' found under directory 'docs/.build'
Adding supervisor 4.0.4 to easy-install.pth file
Installing echo_supervisord_conf script to /usr/bin
Installing pidproxy script to /usr/bin
Installing supervisorctl script to /usr/bin
Installing supervisord script to /usr/bin

Installed /usr/lib/python2.7/site-packages/supervisor-4.0.4-py2.7.egg
Processing dependencies for supervisor
Searching for meld3>=1.0.0
Reading https://pypi.python.org/simple/meld3/
Best match: meld3 2.0.0
Downloading https://files.pythonhosted.org/packages/00/3b/023446ddc1bf0b519c369cbe88269c30c6a64bd10af4817c73f560c302f7/meld3-2.0.0.tar.gz#sha256=1efda676264490db2e30bfb81b27a918cc6d9c2de6d609491aa43410b9537eb9
Processing meld3-2.0.0.tar.gz
Writing /tmp/easy_install-a8OaIQ/meld3-2.0.0/setup.cfg
Running meld3-2.0.0/setup.py -q bdist_egg --dist-dir /tmp/easy_install-a8OaIQ/meld3-2.0.0/egg-dist-tmp-mm9h3r
zip_safe flag not set; analyzing archive contents...
Adding meld3 2.0.0 to easy-install.pth file

Installed /usr/lib/python2.7/site-packages/meld3-2.0.0-py2.7.egg
Finished processing dependencies for supervisor
 ---> eceaf3a3e13e
Removing intermediate container b3a6defac851
Step 6/16 : COPY ./Breakout-master/ /var/www/html/
 ---> 07697a54069a
Removing intermediate container e1e5ec102b88
Step 7/16 : RUN mkdir -p /etc/ssl/haproxy/ /var/log/supervisor
 ---> Running in 54104a674597
 ---> 721e3235c18c
Removing intermediate container 54104a674597
Step 8/16 : COPY haproxy.pem /etc/ssl/haproxy/
 ---> 2a0af10d8c62
Removing intermediate container 5dedfc5d2fbd
Step 9/16 : RUN chmod 600 /etc/ssl/haproxy/haproxy.pem
 ---> Running in 95f59a9e62b2
 ---> c20a18df680c
Removing intermediate container 95f59a9e62b2
Step 10/16 : COPY ha-ssl.cfg /etc/haproxy/haproxy.cfg
 ---> 58689ae03885
Removing intermediate container 74e99e662d32
Step 11/16 : RUN echo_supervisord_conf > /etc/supervisord.conf
 ---> Running in 8487aa6a78c4
 ---> 2ad14ee3dd3f
Removing intermediate container 8487aa6a78c4
Step 12/16 : ADD ./supervisord_add.conf /tmp/supervisord_add.conf
 ---> 62052cecbe26
Removing intermediate container fb0de2ddfe34
Step 13/16 : RUN cat /tmp/supervisord_add.conf >> /etc/supervisord.conf
 ---> Running in aeeb8a782378
 ---> 9c60a4180d9a
Removing intermediate container aeeb8a782378
Step 14/16 : RUN rm /tmp/supervisord_add.conf
 ---> Running in 3f9304e40533
 ---> 4fd8fd803245
Removing intermediate container 3f9304e40533
Step 15/16 : EXPOSE 80 443
 ---> Running in 2d8550f6bccf
 ---> 6be2de69b134
Removing intermediate container 2d8550f6bccf
Step 16/16 : CMD supervisord -c /etc/supervisord.conf
 ---> Running in db254b757a6a
 ---> 1690984472d8
Removing intermediate container db254b757a6a
Successfully built 1690984472d8
# Create a container based on this image:
[root@docker Breakout6]# docker run -d -p 80:80 -p 443:443 --name breakout60 breakout6
4ecb28853655cd02320f7eff472fbe7f28aac42e88df2372154686ef3e40b912
[root@docker Breakout6]# 

# Check running processes inside the container and try to access the application from a web browser:
# Please note that self signed certificate was generated for breakout common name and 'ma' as country code.
[root@docker Breakout6]# docker ps
CONTAINER ID        IMAGE               COMMAND                  CREATED             STATUS              PORTS                                      NAMES
4ecb28853655        breakout6           "supervisord -c /e..."   33 minutes ago      Up 33 minutes       0.0.0.0:80->80/tcp, 0.0.0.0:443->443/tcp   breakout60
[root@docker Breakout6]# docker container top 4ecb28853655
UID                 PID                 PPID                C                   STIME               TTY                 TIME                CMD
root                12020               12003               0                   18:39               ?                   00:00:01            /usr/bin/python /usr/bin/supervisord -c /etc/supervisord.conf
root                12037               12020               0                   18:39               ?                   00:00:00            /bin/sh /usr/sbin/apachectl -D FOREGROUND -k start
root                12038               12020               0                   18:39               ?                   00:00:00            /usr/sbin/haproxy -f /etc/haproxy/haproxy.cfg
root                12040               12037               0                   18:39               ?                   00:00:00            /usr/sbin/httpd -D FOREGROUND -k start
apache              12041               12040               0                   18:39               ?                   00:00:00            /usr/sbin/httpd -D FOREGROUND -k start
apache              12042               12040               0                   18:39               ?                   00:00:00            /usr/sbin/httpd -D FOREGROUND -k start
apache              12043               12040               0                   18:39               ?                   00:00:00            /usr/sbin/httpd -D FOREGROUND -k start
apache              12044               12040               0                   18:39               ?                   00:00:00            /usr/sbin/httpd -D FOREGROUND -k start
apache              12045               12040               0                   18:39               ?                   00:00:00            /usr/sbin/httpd -D FOREGROUND -k start
apache              12064               12040               0                   18:39               ?                   00:00:00            /usr/sbin/httpd -D FOREGROUND -k start
apache              12076               12040               0                   18:39               ?                   00:00:00            /usr/sbin/httpd -D FOREGROUND -k start
apache              12077               12040               0                   18:39               ?                   00:00:00            /usr/sbin/httpd -D FOREGROUND -k start
apache              12078               12040               0                   18:39               ?                   00:00:00            /usr/sbin/httpd -D FOREGROUND -k start
apache              12079               12040               0                   18:39               ?                   00:00:00            /usr/sbin/httpd -D FOREGROUND -k start
[root@docker Breakout6]# 

