FROM php:8.1-fpm

RUN apt-get update && apt-get install -y curl

RUN curl -sS https://getcomposer.org/installer​ | php -- \      
    --install-dir=/usr/local/bin --filename=composer 

COPY . /var/www/html

WORKDIR /var/www/html

RUN composer update

EXPOSE 80

CMD ["php", "artisan", "serve"]
