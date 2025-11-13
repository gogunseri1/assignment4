# Use the latest Fedora image
FROM fedora:latest

# Update system and install required packages
RUN dnf -y upgrade && \
    dnf -y install tuxpaint vim httpd && \
    dnf clean all

# Copy the myinfo.html file into Apache’s document root
COPY myinfo.html /var/www/html/myinfo.html

# Expose port 80
EXPOSE 80

# Enable httpd service and start it in foreground
CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]
