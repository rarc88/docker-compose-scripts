FROM    php:7.4.28-fpm

ENV     DEBIAN_FRONTEND=noninteractive
ENV     TZ=America/Guayaquil

ADD     https://github.com/mlocati/docker-php-extension-installer/releases/latest/download/install-php-extensions /usr/local/bin/
RUN     chmod +x /usr/local/bin/install-php-extensions && sync

# Install system dependencies
RUN     apt-get update -y && apt-get upgrade -y
RUN     apt-get install -y wget zip unzip curl nano git supervisor

# Install php dependencies
RUN     install-php-extensions gd xdebug zip exif mysqli pdo_mysql pgsql pdo_pgsql @composer

# Clear cache
RUN     apt-get clean && rm -rf /var/lib/apt/lists/*

COPY    supervisord.conf /etc/supervisor/conf.d/supervisord.conf

CMD     service supervisor start && supervisorctl reread && supervisorctl update && supervisorctl start laravel-worker:* &&\
        php-fpm