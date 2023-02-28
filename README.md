# docker-laravel-base
Base Docker image for Laravel apps

## Use as a web server
Should work fine as-is.  Add your code to /var/www/html and you're good to go.
```
FROM ...

ADD server /var/www/html
RUN chmod 777 -R /var/www/html/bootstrap/cache
RUN chmod 777 -R /var/www/html/storage
```

## Use as a cron runner
This image has Supercronic installed.  Add your crontab file and tell Supercronic to run it.
```
FROM ...

COPY worker/crontab /etc/cron.d/laravel

ADD server /var/www/html
RUN chmod 777 -R /var/www/html/bootstrap/cache
RUN chmod 777 -R /var/www/html/storage

CMD ["supercronic","/etc/cron.d/laravel"]
```

## CHANGELOG

### 9.x-php8.2
PHP bump; no other changes over 9.x-php8.1

### 9.x-php8.1
Laravel 9/10 release.  No major changes over 8.x-php8.1

### 8.x-php8.1
PHP 8.1 release, targeting Laravel 8
* Remove 'tokenizer' as a preinstalled mod
* Add 'intl' as a preinstalled mod
* Update Supercronic 0.1.11 -> 0.1.12

### 8.x-php8.0
PHP 8.0 release, targeting Laravel 8
