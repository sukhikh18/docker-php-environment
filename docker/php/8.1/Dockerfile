# PHP Dockerfile
#

FROM phpdockerio/php:8.1-fpm

# Install required base packages
RUN apt-get update \
    && apt-get -y --no-install-recommends install \
        libmcrypt-dev git gcc make autoconf libc-dev pkg-config \
        php8.1-mysql \
        php8.1-intl \
        php8.1-interbase \
        php8.1-soap \
        php8.1-gd \
        php8.1-imagick \
        php8.1-dev \
        php8.1-xdebug \
    && apt-get clean; rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* /usr/share/doc/*

# Install MailHog
RUN curl -L https://github.com/mailhog/mhsendmail/releases/download/v0.2.0/mhsendmail_linux_amd64 > \
    /usr/local/bin/mhsendmail && chmod +x /usr/local/bin/mhsendmail

# Configure
ADD ./conf.d/*.ini /etc/php/8.1/fpm/conf.d/
ADD ./conf.d/*.ini /etc/php/8.1/cli/conf.d/

RUN usermod -u 1000 www-data

WORKDIR /var/www
