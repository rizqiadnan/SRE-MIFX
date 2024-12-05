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

# Copy Nginx configuration
COPY nginx.conf /etc/nginx/nginx.conf

# Expose port 80
EXPOSE 80

# Start Nginx and PHP-FPM
CMD ["/bin/sh", "-c", "php-fpm81 && nginx -g 'daemon off;'"]