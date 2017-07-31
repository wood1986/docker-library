VERSION = 1.8
NAME = gzip

build:
	docker build -t $(NAME) --build-arg VERSION=$(VERSION) .

clean:
	docker rmi $(NAME);

install:
	yum install gcc
	docker run -it --rm -v /usr/:/usr/ $(NAME)
	yum remove gcc

dist: build install clean
