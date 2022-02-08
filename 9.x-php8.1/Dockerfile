FROM php:8.1-apache

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

RUN docker-php-ext-install \
                           mbstring \
                           pdo_mysql \
                           intl \
                           xml \
                           opcache

# install Supercronic for workers
ENV SUPERCRONIC_URL=https://github.com/aptible/supercronic/releases/download/v0.1.12/supercronic-linux-amd64 \
    SUPERCRONIC=supercronic-linux-amd64 \
    SUPERCRONIC_SHA1SUM=048b95b48b708983effb2e5c935a1ef8483d9e3e
RUN curl -fsSLO "$SUPERCRONIC_URL" \
 && echo "${SUPERCRONIC_SHA1SUM}  ${SUPERCRONIC}" | sha1sum -c - \
 && chmod +x "$SUPERCRONIC" \
 && mv "$SUPERCRONIC" "/usr/local/bin/${SUPERCRONIC}" \
 && ln -s "/usr/local/bin/${SUPERCRONIC}" /usr/local/bin/supercronic
