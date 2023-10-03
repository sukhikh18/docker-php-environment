# PHP Dockerfile
#

FROM phpdockerio/php:8.0-fpm

# Install required base packages
RUN apt-get update \
    && apt-get -y --no-install-recommends install \
        libmcrypt-dev git gcc make autoconf libc-dev pkg-config \
        php8.0-mysql \
        php8.0-intl \
        php8.0-interbase \
        php8.0-soap \
        php8.0-gd \
        php8.0-imagick \
        php8.0-dev \
        php8.0-xdebug \
    && apt-get clean; rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* /usr/share/doc/*

# Install MailHog
RUN curl -L https://github.com/mailhog/mhsendmail/releases/download/v0.2.0/mhsendmail_linux_amd64 > \
    /usr/local/bin/mhsendmail && chmod +x /usr/local/bin/mhsendmail

# Configure
ADD ./conf.d/*.ini /etc/php/8.0/fpm/conf.d/
ADD ./conf.d/*.ini /etc/php/8.0/cli/conf.d/

RUN usermod -u 1000 www-data

WORKDIR /var/www
