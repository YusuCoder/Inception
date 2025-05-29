FROM debian:bullseye

RUN apt-get update && apt-get install -y \
    lsb-release \
    apt-transport-https \
    ca-certificates \
    gnupg2 \
    wget && \
    wget -qO - https://packages.sury.org/php/apt.gpg | apt-key add - && \
    echo "deb https://packages.sury.org/php/ $(lsb_release -sc) main" > /etc/apt/sources.list.d/php.list && \
    apt-get update && apt-get install -y \
    php8.2 \
    php8.2-fpm \
    php8.2-mysql \
    php8.2-cli \
    php8.2-mbstring \
    php8.2-gettext \
    mariadb-client \
    wget

RUN rm -f /etc/php/8.2/fpm/pool.d/www.conf && \
    mkdir -p /run/php

COPY ./conf/www.conf /etc/php/8.2/fpm/pool.d/
COPY ./tools/run.sh /tmp/

RUN chmod +x /tmp/run.sh

ENTRYPOINT ["sh", "/tmp/run.sh"]
