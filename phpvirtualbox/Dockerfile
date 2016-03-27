FROM php:apache

RUN apt-get update && apt-get -y install libxml2 libxml2-dev && docker-php-ext-install soap

RUN curl -L http://sourceforge.net/projects/phpvirtualbox/files/latest/download -o phpvirtualbox.zip && \
    apt-get -y install unzip && \
    unzip phpvirtualbox.zip && \
    rm -rf phpvirtualbox.zip

RUN apt-get clean

RUN mv phpvirtualbox-* phpvirtualbox && \
    mv phpvirtualbox/* ./ && \
    rm -rf phpvirtualbox && \
    mv config.php-example config.php
