FROM php:apache

RUN apt-get update && apt-get -y install libxml2 libxml2-dev && docker-php-ext-install soap

RUN curl -L http://sourceforge.net/projects/phpvirtualbox/files/latest/download -o phpvirtualbox.zip && \
    apt-get -y install unzip && \
    unzip phpvirtualbox.zip && \
    rm -rf phpvirtualbox.zip

RUN apt-get clean

ARG USERNAME=vbox

ARG PASSWORD=pass

ARG LOCATION=http://vboxwebsrv:18083/

RUN mv phpvirtualbox-* phpvirtualbox && \
    mv phpvirtualbox/* ./ && \
    rm -rf phpvirtualbox && \
    mv config.php-example config.php

RUN sed "0,\|'vbox'|s||'$USERNAME'|" -i config.php && \
    sed "0,\|'pass'|s||'$PASSWORD'|" -i config.php && \
    sed "0,\|'http://127.0.0.1:18083/'|s||'$LOCATION'|" -i config.php
