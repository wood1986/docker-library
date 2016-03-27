FROM wood1986/virtualbox

RUN echo -e "#!/bin/sh\n./vboxdrv.sh setup && ./vboxwebsrv \$*" > vboxwebsrv.sh

RUN chmod +x vboxwebsrv.sh

ENTRYPOINT ["./vboxwebsrv.sh"]
