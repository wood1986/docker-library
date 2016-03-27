FROM wood1986/vboxwebsrv

RUN yum -y install openssl

ARG USERNAME=vbox

ARG PASSWORD=pass

RUN useradd $USERNAME -mp $(openssl passwd -1 $PASSWORD)
