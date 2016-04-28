VBOXWEBSRV = vboxwebsrv
PHPVIRTUALBOX = phpvirtualbox
USERNAME = vbox
PASSWORD = pass
LOCATION = http://vboxwebsrv:18083/
VOLUMES =
ARGS = -H 0.0.0.0
PORT = 80

build:
	docker build -t $(VBOXWEBSRV) --build-arg USERNAME=$(USERNAME) --build-arg PASSWORD=$(PASSWORD) -f vboxwebsrv.Dockerfile .
	docker build -t $(PHPVIRTUALBOX) --build-arg USERNAME=$(USERNAME) --build-arg PASSWORD=$(PASSWORD) --build-arg LOCATION=$(LOCATION) -f phpvirtualbox.Dockerfile .

clean:
	if [ -a $(VBOXWEBSRV).cid ]; then \
		docker rm $$(docker stop $$(cat $(VBOXWEBSRV).cid)); \
		rm -rf $(VBOXWEBSRV).cid; \
		docker rmi $(VBOXWEBSRV); \
	fi;

	if [ -a $(PHPVIRTUALBOX).cid ]; then \
		docker rm $$(docker stop $$(cat $(PHPVIRTUALBOX).cid)); \
		rm -rf $(PHPVIRTUALBOX).cid; \
		docker rmi $(PHPVIRTUALBOX); \
	fi;

run:
	docker run -dit -v /lib/modules/:/lib/modules/ $(VOLUMES) --cidfile $(VBOXWEBSRV).cid --name $(VBOXWEBSRV) --privileged $(VBOXWEBSRV) $(ARGS)
	docker run -dit -p $(PORT):80 --cidfile $(PHPVIRTUALBOX).cid --link $(VBOXWEBSRV) --name $(PHPVIRTUALBOX) $(PHPVIRTUALBOX)

dist: clean build run

.PHONY: dist
