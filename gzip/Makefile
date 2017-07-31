VERSION = 1.8
GZIP = gzip

build:
	docker build -t $(GZIP) --build-arg VERSION=$(VERSION) .

clean:
	docker rmi $(GZIP);

install:
	yum install gcc
	docker run -it --rm -v /usr/:/usr/ $(GZIP)

dist: build install clean
