FROM centos:latest

RUN yum install -y gcc make

ARG VERSION=

RUN curl -LO https://ftp.gnu.org/gnu/gzip/gzip-$VERSION.tar.xz \
  && tar -xJf gzip-$VERSION.tar.xz

RUN cd gzip-$VERSION && ./configure --prefix=/usr && make

WORKDIR gzip-$VERSION

CMD ["make", "install"]

