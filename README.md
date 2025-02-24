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

## Use as an artisan runner
You can override the CMD with `php artisan your:command` to run any artisan command.
### Use as a queue worker
`php artisan queue:work --queue=your-queue-name`
### Use as a schedule runner
`php artisan schedule:work`


## CHANGELOG

### 12.x-php8.4
PHP bump; no other changes over 11.x-php8.3

### 11.x-php8.3
No changes over 10.x-php8.3

### 10.x-php8.3
PHP bump; no other changes over 10.x-php8.2

### 10.x-php8.2
Removed Supercronic.  Added instructions for how to run artisan commands as replacement for cron-like functionality.

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
