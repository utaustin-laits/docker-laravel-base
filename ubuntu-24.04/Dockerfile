FROM ubuntu:24.04
ENV DEBIAN_FRONTEND noninteractive
COPY --from=phpbuild /var/www/html /var/www/html

# Apache + PHP
RUN apt-get update \
    # Tools
    && apt-get -y --no-install-recommends install \
        curl \
        ca-certificates \
        nano \
        zip \
        unzip \
    # Supervisor
    && apt-get -y --no-install-recommends install \
        supervisor \
    # Install Apache + PHP
    && apt-get -y --no-install-recommends install \
        apache2 php8.3-fpm \
    # Install Laravel dependencies (https://laravel.com/docs/12.x/deployment)
    && apt-get -y --no-install-recommends install \
#        php8.3-ctype \ # installed by default
         php8.3-curl \
         php8.3-dom \
#        php8.3-fileinfo \ # installed by default
#        php8.3-filter \ # installed by default
#        php8.3-hash \ # installed by default
         php8.3-mbstring \
#        php8.3-openssl \ # installed by default
#        php8.3-pcre \ # installed by default
#        php8.3-pdo \ # installed by default
#        php8.3-session \ # installed by default
#        php8.3-tokenizer \ # installed by default
         php8.3-xml \
    # Install other common LAITS stuff \
    && apt-get -y --no-install-recommends install \
        php8.3-intl \
        php8.3-ldap \
        php8.3-mysql \
        php8.3-sqlite \
        php8.3-zip \
    # Configure Apache + PHP
    && a2enconf php8.3-fpm \
    && a2enmod proxy \
    && a2enmod proxy_fcgi \
    && a2enmod rewrite \
    # Clean
    && rm -rf /var/lib/apt/lists/*

# Supervisor
RUN mkdir -p /run/php/
COPY config/supervisord/supervisord.conf /etc/supervisor/supervisord.conf
COPY config/supervisord/conf.d/ /etc/supervisor/conf.d/

# Configuration
COPY ./config/apache/000-default.conf /etc/apache2/sites-available/000-default.conf
COPY config/php_fpm/php.ini /etc/php/8.3/fpm/php.ini
# COPY config/php_fpm/pool.d/www.conf /etc/php/8.3/fpm/pool.d/www.conf

# logs should go to stdout/stderr
RUN ln -sfT /dev/stderr "/var/log/apache2/error.log"; \
	ln -sfT /dev/stdout "/var/log/apache2/access.log"; \
	ln -sfT /dev/stdout "/var/log/apache2/other_vhosts_access.log";

# Startup script to change uid/gid (if environment variable passed) and start supervisord in foreground
COPY ./scripts/start.sh /start.sh
RUN chmod 755 /start.sh

WORKDIR /var/www/html
EXPOSE 80

CMD ["/bin/bash", "/start.sh"]
