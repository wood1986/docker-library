FROM centos:latest

RUN yum install -y gcc perl make python-six \
  openssl openssl-devel file libcap-ng-devel

ARG VERSION=

RUN curl -LO http://openvswitch.org/releases/openvswitch-$VERSION.tar.gz \
  && tar -zxf openvswitch-$VERSION.tar.gz

RUN cd openvswitch-$VERSION && ./configure && make

WORKDIR openvswitch-$VERSION

CMD ["make", "install"]
