VBOXWEBSRV = vboxwebsrv
PHPVIRTUALBOX = phpvirtualbox
USERNAME = vbox
PASSWORD = pass
LOCATION = http://vboxwebsrv:18083/

build:
	docker build -t $(VBOXWEBSRV) --build-arg USERNAME=$(USERNAME) --build-arg PASSWORD=$(PASSWORD) --pull -f vboxwebsrv.Dockerfile .

	docker build -t $(PHPVIRTUALBOX) --build-arg USERNAME=$(USERNAME) --build-arg PASSWORD=$(PASSWORD) --build-arg LOCATION=$(LOCATION) --pull -f phpvirtualbox.Dockerfile .

clean:
	if [ -a $(VBOXWEBSRV).cid ] ; \
	then \
		docker rm $$(docker stop $$(cat $(VBOXWEBSRV).cid)) ; \
		rm -rf $(VBOXWEBSRV).cid ; \
	fi;

	if [ -a $(PHPVIRTUALBOX).cid ] ; \
	then \
		docker rm $$(docker stop $$(cat ${PHPVIRTUALBOX}.cid)) ; \
		rm -rf $(PHPVIRTUALBOX).cid ; \
	fi;

run:
	docker run -dit --cidfile $(VBOXWEBSRV).cid --name $(VBOXWEBSRV) --privileged -v /lib/modules/:/lib/modules/ -p 18083:18083 $(VBOXWEBSRV) -H 0.0.0.0
	docker run -dit -p 80:80 --cidfile $(PHPVIRTUALBOX).cid --link $(VBOXWEBSRV) --name $(PHPVIRTUALBOX) $(PHPVIRTUALBOX)

dist: clean build run

.PHONY: dist
