VERSION = 2.9.0
NAME = openvswitch

build:
	docker build -t $(NAME) --build-arg VERSION=$(VERSION) .

clean:
	docker rmi $(NAME);

install:
	docker run -it --rm -v /usr/local:/usr/local $(NAME)

dist: build install clean
