FROM php:5.6.40-fpm

RUN apt update \
	&& apt install net-tools \
	&& docker-php-ext-install mysql mysqli pdo pdo_mysql \

	&& apt install -y libzip-dev \
	&& docker-php-ext-install zip \

 	&& apt install -y libjpeg-dev libpng-dev libfreetype6-dev \
	
	&& docker-php-ext-configure gd \
		--with-jpeg-dir \
		--with-png-dir \
		--with-freetype-dir \

	&& docker-php-ext-install gd

CMD ["php-fpm"]
EXPOSE 9000
