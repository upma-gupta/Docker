# Docker File to install Apache

FROM ubuntu:18.04

# Install Dependencies and Apache
RUN apt-get update && /
 apt-get -y install apache2

# Write index.html
RUN echo 'Hello World in UG!' > /var/www/html/index.html

# Configure Apache
RUN echo '. /etc/apache2/envvars' > /root/run_apache.sh && \
 echo 'mkdir -p /var/run/apache2' >> /root/run_apache.sh && \
 echo 'mkdir -p /var/lock/apache2' >> /root/run_apache.sh && \
 echo '/usr/sbin/apache2 -D FOREGROUND' >> /root/run_apache.sh && \
 chmod 755 /root/run_apache.sh

# Port Mapping
EXPOSE 80

# Run Apache
CMD /root/run_apache.sh
