VERSION = 2.13.0
GIT = git

build:
	docker build -t $(GIT) --build-arg VERSION=$(VERSION) .

clean:
	docker rmi $(GIT);

install:
	docker run -it --rm -v /usr/local/:/usr/local/ $(GIT)

dist: build install clean
