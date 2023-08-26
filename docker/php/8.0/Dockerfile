# PHP Dockerfile
#
# Packages wget git unzip is required for xdebug install

FROM phpdockerio/php:8.0-fpm

# Install required base packages
RUN apt-get update \
    && apt-get -y --no-install-recommends install \
    wget git unzip \
    php8.0-memcached \
    php8.0-memcache \
    php8.0-mbstring \
    php8.0-mysql \
    php8.0-intl \
    php8.0-interbase \
    php8.0-soap \
    php8.0-gd \
    php8.0-imagick \
    php8.0-opcache \
    php8.0-zip \
    php8.0-pear php8.0-dev libmcrypt-dev gcc make autoconf libc-dev pkg-config \
    && pecl install mcrypt-1.0.4 \
    && apt-get clean; rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* /usr/share/doc/* \

# Install xDebug
#RUN pecl install xdebug \
#    docker-php-ext-enable xdebug

# Install Composer
RUN wget https://getcomposer.org/installer -O - -q \
   | php -- --install-dir=/bin --filename=composer --quiet

# Install MailHog
RUN curl -L https://github.com/mailhog/mhsendmail/releases/download/v0.2.0/mhsendmail_linux_amd64 > \
    /usr/local/bin/mhsendmail && chmod +x /usr/local/bin/mhsendmail

ADD ./conf.d/*.ini /etc/php/8.0/fpm/conf.d/
ADD ./conf.d/*.ini /etc/php/8.0/cli/conf.d/

RUN usermod -u 1000 www-data

WORKDIR /var/www

EXPOSE 9000
