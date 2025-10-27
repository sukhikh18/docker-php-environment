# PHP Dockerfile
#

### CLI ###

FROM ubuntu:noble AS cli

# Fixes some weird terminal issues such as broken clear / CTRL+L
ENV TERM=linux

# Ensure apt doesn't ask questions when installing stuff
ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update \
    && apt-get install -y --no-install-recommends gnupg \
    && echo "deb http://ppa.launchpad.net/ondrej/php/ubuntu noble main" > /etc/apt/sources.list.d/ondrej-php.list \
    && apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 4F4EA0AAE5267A6C \
    && apt-get update \
    && apt-get -y --no-install-recommends install \
        ca-certificates \
        curl \
        unzip \
        php8.4-apcu \
        php8.4-cli \
        php8.4-curl \
        php8.4-mbstring \
        php8.4-opcache \
        php8.4-readline \
        php8.4-xml \
        php8.4-zip \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* /usr/share/doc/* ~/.composer

COPY --from=composer:2 /usr/bin/composer /usr/bin/composer

CMD ["php", "-a"]

### FPM ###

FROM cli AS fpm

# Install FPM and required base packages
RUN apt-get update \
    && apt-get -y --no-install-recommends install \
#   libmcrypt-dev git gcc make autoconf libc-dev pkg-config \
    php8.4-fpm \
    php8.4-mysql \
#    php8.4-intl \
#    php8.4-interbase \
#    php8.4-soap \
#    php8.4-gd \
#    php8.4-imagick \
#    php8.4-dev \
    php8.4-xdebug \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* /usr/share/doc/*

STOPSIGNAL SIGQUIT

# PHP-FPM packages need a nudge to make them docker-friendly
COPY overrides.conf /etc/php/8.4/fpm/pool.d/z-overrides.conf

CMD ["/usr/sbin/php-fpm8.4", "-O" ]

# Open up fcgi port
EXPOSE 9000

# Install MailHog
RUN curl -L https://github.com/mailhog/mhsendmail/releases/download/v0.2.0/mhsendmail_linux_amd64 > \
    /usr/local/bin/mhsendmail && chmod +x /usr/local/bin/mhsendmail

# Configure
ADD ./conf.d/*.ini /etc/php/8.4/fpm/conf.d/
ADD ./conf.d/*.ini /etc/php/8.4/cli/conf.d/

# RUN usermod -u 1000 www-data

WORKDIR /var/www
