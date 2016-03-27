FROM wood1986/phpvirtualbox

ARG USERNAME=vbox

ARG PASSWORD=pass

ARG LOCATION=http://vboxwebsrv:18083/

RUN sed "0,\|'vbox'|s||'$USERNAME'|" -i config.php && \
    sed "0,\|'pass'|s||'$PASSWORD'|" -i config.php && \
    sed "0,\|'http://127.0.0.1:18083/'|s||'$LOCATION'|" -i config.php
