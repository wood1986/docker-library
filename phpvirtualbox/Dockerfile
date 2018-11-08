FROM php:apache

RUN apt-get update && apt-get -y install libxml2 libxml2-dev && docker-php-ext-install soap

ARG VERSION=

RUN curl -LO https://github.com/phpvirtualbox/phpvirtualbox/archive/$VERSION.zip  && \
    apt-get -y install unzip && \
    unzip $VERSION.zip && \
    rm -rf $VERSION.zip

RUN apt-get clean

RUN mv phpvirtualbox-$VERSION/config.php-example phpvirtualbox-$VERSION/config.php
