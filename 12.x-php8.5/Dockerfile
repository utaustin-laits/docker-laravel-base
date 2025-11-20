FROM php:8.5-apache

# enable rewrite for Laravel pretty URLs
RUN a2enmod rewrite
# change apache webroot from / to /public/
RUN sed -i s/"DocumentRoot \/var\/www\/html"/"DocumentRoot \/var\/www\/html\/public"/ /etc/apache2/sites-available/000-default.conf

# install PHP, Laravel dependencies
# mbstring: libonig-dev
# intl: libicu-dev
RUN apt-get update \
    && apt-get install -y \
    unzip zip libzip-dev \
    nano \
    libxml2-dev \
    zlib1g-dev \
    libicu-dev\
    libonig-dev \
    libpng-dev \
    libldap-common \
    libldap2-dev \
    libpq-dev \
    && rm -rf /var/lib/apt/lists/*

RUN pecl install redis && \
    docker-php-ext-enable redis && \
    rm -rf /tmp/pear

RUN docker-php-ext-install \
                           gd \
                           ldap \
                           pgsql \
                           pdo_pgsql \
                           bcmath \
                           zip \
                           mbstring \
                           pdo_mysql \
                           intl \
                           xml
