FROM php:8.1-fpm

RUN apt-get update && apt-get install -y curl

RUN curl -sS https://getcomposer.org/installer​ | php -- \      
    --install-dir=/usr/local/bin --filename=composer 

WORKDIR /app

COPY . .

EXPOSE 80

CMD ["php", "artisan", "serve"]
