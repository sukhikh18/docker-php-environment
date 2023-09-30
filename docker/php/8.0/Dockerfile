# PHP Dockerfile
#

FROM phpdockerio/php:8.0-fpm

# Install required base packages
RUN apt-get update \
    && apt-get -y --no-install-recommends install \
    wget git unzip libmcrypt-dev gcc make autoconf libc-dev pkg-config \
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
    php8.0-dev \
    php8.0-xdebug \
    && apt-get clean; rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* /usr/share/doc/*

# Install Composer
RUN wget https://getcomposer.org/installer -q -O composer-setup.php && \
    php composer-setup.php --install-dir=/usr/local/bin --filename=composer && \
    chmod +x /usr/local/bin/composer
# Composer no polit FIX
RUN git clone https://github.com/composer/composer.git --branch 2.6.0  ~/composer-build && \
    composer install  -o -d ~/composer-build && \
    wget https://raw.githubusercontent.com/politsin/snipets/master/patch/composer.patch -q -O ~/composer-build/composer.patch  && \
    cd ~/composer-build && patch -p1 < composer.patch && \
    php -d phar.readonly=0 bin/compile && \
    rm /usr/local/bin/composer && \
    php composer.phar install && \
    php composer.phar update && \
    mv ~/composer-build/composer.phar /usr/local/bin/composer && \
    rm -rf ~/composer-build  && \
    chmod +x /usr/local/bin/composer

# Install MailHog
RUN curl -L https://github.com/mailhog/mhsendmail/releases/download/v0.2.0/mhsendmail_linux_amd64 > \
    /usr/local/bin/mhsendmail && chmod +x /usr/local/bin/mhsendmail

# Configure
ADD ./conf.d/*.ini /etc/php/8.0/fpm/conf.d/
ADD ./conf.d/*.ini /etc/php/8.0/cli/conf.d/

RUN usermod -u 1000 www-data

WORKDIR /var/www

EXPOSE 9000
