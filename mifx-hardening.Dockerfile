FROM alpine:3.18

# Install necessary packages
RUN apk add --no-cache \
    nginx \
    php81 \
    php81-fpm \
    php81-mysqli \
    php81-json \
    php81-curl \
    php81-dom \
    php81-exif \
    php81-fileinfo \
    php81-mbstring \
    php81-openssl \
    php81-xml \
    php81-zip

    # Add a non-root user
    # Fix: dari yang sebelumnya tanpa primary group
    RUN adduser -D -G www-data www-data

# Adjust permissions
RUN mkdir -p /var/www/html /run/nginx /var/lib/nginx/tmp /var/log/nginx /var/lib/nginx/logs && \
    chown -R www-data:www-data /var/www/html /run/nginx /var/log/php81 /var/log/nginx /var/lib/nginx

# Copy configuration files
COPY nginx.conf /etc/nginx/nginx.conf
COPY php.ini /etc/php81/php.ini
COPY www.conf /etc/php81/php-fpm.d/www.conf

# Switch to non-root user
USER www-data

# Expose port 80
EXPOSE 80

# Start Nginx and PHP-FPM
CMD ["/bin/sh", "-c", "php-fpm81 && nginx -g 'daemon off;'"]
