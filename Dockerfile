# Use the PHP 8.3 FPM image from the official PHP Docker Hub repository
FROM php:8.3-fpm-alpine

# Install Nginx
RUN apk add --no-cache nginx

# Configure Nginx
COPY nginx.conf /etc/nginx/nginx.conf

# Install necessary PHP extensions
RUN docker-php-ext-install mysqli pdo pdo_mysql

# Set up working directory
WORKDIR /var/www/html

# Download and install phpMyAdmin
ARG PMA_VERSION=5.1.1
RUN wget https://files.phpmyadmin.net/phpMyAdmin/${PMA_VERSION}/phpMyAdmin-${PMA_VERSION}-all-languages.tar.gz \
    && tar xzf phpMyAdmin-${PMA_VERSION}-all-languages.tar.gz \
    && mv phpMyAdmin-${PMA_VERSION}-all-languages/* /var/www/html \
    && rm phpMyAdmin-${PMA_VERSION}-all-languages.tar.gz

# Copy config file for phpMyAdmin
# Ensure that config.inc.php is in the same directory as your Dockerfile
COPY config.inc.php /var/www/html/config.inc.php

# Change ownership of the files to the nginx user
RUN chown -R nginx:nginx /var/www/html

# Expose port 80
EXPOSE 80

# Start Nginx and PHP-FPM services
CMD ["sh", "-c", "php-fpm & nginx -g 'daemon off;'"]
