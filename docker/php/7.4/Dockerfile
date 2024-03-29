# PHP Dockerfile
#
# Packages wget git unzip is required for xdebug install

FROM phpdockerio/php74-fpm:latest

# Install required base packages
RUN apt-get update \
    && apt-get -y --no-install-recommends install \
    wget git unzip \
    php7.4-mbstring \
    php7.4-mysql \
    php7.4-intl \
    php7.4-interbase \
    php7.4-soap \
    php7.4-gd \
    php7.4-imagick \
    php7.4-opcache \
    php7.4-zip \
    php7.4-xdebug \
    php-pear php7.4-dev libmcrypt-dev gcc make autoconf libc-dev pkg-config \
    && pecl install mcrypt-1.0.4 \
    && apt-get clean; rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* /usr/share/doc/*

# Install xDebug
#RUN pecl install xdebug-2.9.0 \
#    docker-php-ext-enable xdebug

# Install Composer
RUN wget https://getcomposer.org/installer -O - -q \
   | php -- --install-dir=/bin --filename=composer --quiet

# Install MailHog
RUN curl -L https://github.com/mailhog/mhsendmail/releases/download/v0.2.0/mhsendmail_linux_amd64 > \
    /usr/local/bin/mhsendmail && chmod +x /usr/local/bin/mhsendmail

# Configuration
ADD ./conf.d/*.ini /etc/php/7.4/fpm/conf.d/
ADD ./conf.d/*.ini /etc/php/7.4/cli/conf.d/
ADD ./conf.d/*.conf /etc/php/7.4/fpm/conf.d/
ADD ./conf.d/*.conf /etc/php/7.4/cli/conf.d/

RUN usermod -u 1000 www-data

WORKDIR /var/www

EXPOSE 9000
