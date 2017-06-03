FROM centos:latest

RUN yum install -y curl-devel expat-devel gettext-devel openssl-devel zlib-devel \
  gcc make perl-ExtUtils-MakeMaker

ARG VERSION=

RUN curl -LO https://www.kernel.org/pub/software/scm/git/git-$VERSION.tar.xz \
  && tar -xJf git-$VERSION.tar.xz

RUN cd git-$VERSION && ./configure && make

WORKDIR git-$VERSION

CMD ["make", "install"]

