FROM php:8.2-apache

# enable rewrite for Laravel pretty URLs
RUN a2enmod rewrite
# change apache webroot from / to /public/
RUN sed -i s/"DocumentRoot \/var\/www\/html"/"DocumentRoot \/var\/www\/html\/public"/ /etc/apache2/sites-available/000-default.conf

# install PHP, Laravel dependencies
RUN apt-get update \
    && apt-get install -y \
    unzip \
    nano \
    libxml2-dev \
    zlib1g-dev \
# for mbstring
    libonig-dev \
    && rm -rf /var/lib/apt/lists/*

RUN pecl install redis && \
    docker-php-ext-enable redis && \
    rm -rf /tmp/pear

RUN docker-php-ext-install \
                           mbstring \
                           pdo_mysql \
                           intl \
                           xml \
                           opcache
