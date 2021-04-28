# PHP Dockerfile
#
# DO NOT install xdebug for site running in production! It will slow it down significantly.
# Package openssh-client is required for deployer.
# Packages wget git unzip is required for xdebug install

FROM phpdockerio/php72-fpm:latest

# Install packages
RUN apt-get update \
    && apt-get -y --no-install-recommends install \
    wget git unzip \
    openssh-client \
    php7.2-mbstring \
    php7.2-mysql \
    php7.2-intl \
    php7.2-interbase \
    php7.2-soap \
    php7.2-gd \
    php7.2-imagick \
    php7.2-opcache \
    php7.2-zip \
    php-pear php7.2-dev libmcrypt-dev gcc make autoconf libc-dev pkg-config \
    && pecl install mcrypt-1.0.4 \
    && apt-get clean; rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* /usr/share/doc/*

# Install xDebug
RUN pecl install xdebug \
    docker-php-ext-enable xdebug

# Install Docker
RUN wget https://getcomposer.org/installer -O - -q \
   | php -- --install-dir=/bin --filename=composer --quiet

# Install Deployer
RUN curl -L https://deployer.org/releases/v4.3.4/deployer.phar > /usr/local/bin/dep \
    && chmod +x /usr/local/bin/dep

# Add configs
ADD ./php.ini /etc/php/7.2/fpm/conf.d/90-php.ini
ADD ./php.ini /etc/php/7.2/cli/conf.d/90-php.ini

RUN usermod -u 1000 www-data

WORKDIR "/var/www"

EXPOSE 9000
