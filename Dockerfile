FROM ubuntu:18.04
LABEL maintainer = "Matthew Ahrenstein <matt@ahrenstein.com>"

# Install packages needed
RUN apt-get update
RUN DEBIAN_FRONTEND=noninteractive apt-get -y install vim curl wget dnsutils telnet apache2-utils apache2 libapache2-mod-php iputils-ping

# Configure Apache2
RUN rm -f /var/www/html/index.html
COPY ./config/index.php /var/www/html/

# Configure user environment
COPY ./config/bash_profile /root/.bashrc
#RUN rm -f /root/.bashrc
WORKDIR /root/

# Start the container with apache in the foreground
EXPOSE 80
CMD ["/usr/sbin/apache2ctl", "-DFOREGROUND"]

