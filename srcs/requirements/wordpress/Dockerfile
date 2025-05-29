FROM debian:buster

RUN apt update -y && \
    apt-get upgrade -y && \
    apt-get install -y php \
    php-mysql \
    php-cli \
    php-mbstring \
    php-fpm \
    php-gettext \
    mariadb-client \
    wget && \
    rm -rf /etc/php/7.3/fpm/pool.d/www.conf && \
    mkdir -p /run/PHP

COPY ./conf/www.conf /etc/php/7.3/fpm/pool.d/
COPY ./tools/run.sh /tmp/

RUN chmod +x /tmp/run.sh

ENTRYPOINT [ "sh", "/tmp/run.sh" ]

#needs improvement



# Use PHP 8.2 FPM with Alpine
# FROM php:8.4-fpm-alpine

# # Install system dependencies
# RUN apk update && apk add --no-cache \
#     bash \
#     mysql-client \
#     curl \
#     tar \
#     libpng \
#     libjpeg-turbo-dev \
#     libwebp-dev \
#     libxpm-dev \
#     freetype-dev \
#     zlib-dev \
#     libxml2-dev

# # Install PHP extensions needed for WordPress
# RUN docker-php-ext-install mysqli pdo pdo_mysql gd xml

# # Download and extract WordPress
# RUN curl -o wordpress.tar.gz https://wordpress.org/latest.tar.gz && \
#     tar -xzf wordpress.tar.gz && \
#     rm wordpress.tar.gz && \
#     mv wordpress /var/www/html

# # Set correct permissions
# RUN chown -R www-data:www-data /var/www/html

# # Expose the PHP-FPM port
# EXPOSE 9000

# # Start PHP-FPM
# CMD ["php-fpm"]

