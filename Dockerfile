# Use official PHP image with Apache
FROM php:8.2-apache

# Copy project files into the container
COPY . /var/www/html/

# Set working directory
WORKDIR /var/www/html

# Install required PHP extensions (MySQLi, PDO)
RUN docker-php-ext-install mysqli pdo pdo_mysql

# Enable Apache mod_rewrite (useful for clean URLs)
RUN a2enmod rewrite

# Set proper file permissions for uploads
RUN mkdir -p /var/www/html/uploads && chmod -R 777 /var/www/html/uploads

# Expose port 80
EXPOSE 80

# Start Apache
CMD ["apache2-foreground"]
