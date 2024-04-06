# Use an official PHP 8.3 runtime with FPM
FROM php:8.3-fpm

# Install Nginx
RUN apt-get update && apt-get install -y nginx

# Install phpMyAdmin
ENV PHPMYADMIN_VERSION 5.1.1
RUN set -ex; \
    curl -o phpmyadmin.tar.gz -fSL "https://files.phpmyadmin.net/phpMyAdmin/${PHPMYADMIN_VERSION}/phpMyAdmin-${PHPMYADMIN_VERSION}-all-languages.tar.gz"; \
    tar -xzf phpmyadmin.tar.gz -C /var/www/html --strip-components=1; \
    rm phpmyadmin.tar.gz; \
    chown -R www-data:www-data /var/www/html

# Copy Nginx and PHP-FPM configuration files
COPY nginx.conf /etc/nginx/nginx.conf
COPY www.conf /usr/local/etc/php-fpm.d/www.conf
COPY config.inc.php /var/www/html/

# Forward request and error logs to docker log collector
RUN ln -sf /dev/stdout /var/log/nginx/access.log \
    && ln -sf /dev/stderr /var/log/nginx/error.log

# Start Nginx and PHP-FPM
CMD service php8.3-fpm start && nginx -g 'daemon off;'
