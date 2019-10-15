# Dockerfile for creating a Docker image for OL 7, httpd and HAproxy for SSL support
FROM oraclelinux:7
LABEL maintainer="mdlamtouni@gmail.com"
RUN yum install -y httpd openssl* haproxy && yum clean all
RUN yum install -y python3-pip* python-setuptools* && yum clean all
RUN easy_install supervisor
COPY ./Breakout-master/ /var/www/html/
RUN mkdir -p /etc/ssl/haproxy/ /var/log/supervisor
COPY haproxy.pem /etc/ssl/haproxy/
RUN chmod 600 /etc/ssl/haproxy/haproxy.pem
COPY ha-ssl.cfg /etc/haproxy/haproxy.cfg
RUN echo_supervisord_conf > /etc/supervisord.conf
ADD ./supervisord_add.conf /tmp/supervisord_add.conf
RUN cat /tmp/supervisord_add.conf >> /etc/supervisord.conf
RUN rm /tmp/supervisord_add.conf
EXPOSE 80 443
CMD ["supervisord","-c","/etc/supervisord.conf"]
