# Main image for container
FROM ubuntu:latest

MAINTAINER admin
ENV DEBIAN_FRONTEND=noninteractive
COPY ./site1/* /var/www/html/
RUN  apt-get update && \
     apt-get upgrade -y && \
     apt-get install -y tzdata && \
     apt-get install -y apache2 && \
     echo "servername apache" | tee -a /etc/apache2/apache2.conf && \
     service apache2 restart
# COPY ./000-default.conf /etc/apache2/sites-available/
EXPOSE 80/tcp
CMD ["apache2ctl", "-D", "FOREGROUND"] 
