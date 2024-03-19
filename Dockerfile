FROM php:8.1.2-fpm

# Install system dependencies
RUN apt-get update && apt-get install -y \
    libzip-dev \
    libpng-dev \
    libjpeg62-turbo-dev \
    libfreetype6-dev \
    locales \
    zip \
    jpegoptim optipng pngquant gifsicle \
    vim \
    unzip \
    git \
    curl \
    libcurl4-openssl-dev \
    pkg-config \
    libssl-dev \
    software-properties-common \
    npm \
    && docker-php-ext-configure gd \
    && docker-php-ext-install -j$(nproc) gd \
    && docker-php-ext-install pdo_mysql \
    && docker-php-ext-install mysqli \
    && docker-php-ext-install zip \
    && docker-php-source delete

# Install Composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

WORKDIR /app

# Copy composer files and install dependencies
COPY composer.json composer.lock /app/
RUN composer install --no-scripts --no-autoloader

# Copy the rest of the application code
COPY . .

# Generate the Laravel application key
# RUN php artisan key:generate

# Optimize Laravel for production
RUN composer dump-autoload --optimize
RUN php artisan config:cache
RUN php artisan route:cache
RUN php artisan view:cache

# Expose port 8000 to the outside world
EXPOSE 8000

# Run Laravel application
CMD php artisan serve --host=0.0.0.0 --port=8000
