VIRTUALBOX = virtualbox
VBOXWEBSRV = vboxwebsrv
PHPVIRTUALBOX = phpvirtualbox
USERNAME = vbox
PASSWORD = pass
LOCATION = http://vboxwebsrv:18083/
VIRTUALBOX_VBOXWEBSRV = $(VIRTUALBOX).$(VBOXWEBSRV)

build:
	cp ../virtualbox/Dockerfile virtualbox.Dockerfile
	docker build -t $(VIRTUALBOX) --pull -f virtualbox.Dockerfile .

	cp ../vboxwebsrv/Dockerfile vboxwebsrv.Dockerfile
	docker build -t $(VBOXWEBSRV) -f vboxwebsrv.Dockerfile .

	docker rmi $(VIRTUALBOX_VBOXWEBSRV) || test "$$?" -eq 1
	
	cp ../virtualbox.vboxwebsrv/Dockerfile virtualbox.vboxwebsrv.Dockerfile
	docker build -t $(VIRTUALBOX_VBOXWEBSRV) --build-arg USERNAME=$(USERNAME) --build-arg PASSWORD=$$(openssl passwd -1 $(PASSWORD)) -f virtualbox.vboxwebsrv.Dockerfile .

	cp ../phpvirtualbox/Dockerfile phpvirtualbox.Dockerfile
	docker build -t $(PHPVIRTUALBOX) --build-arg USERNAME=$(USERNAME) --build-arg PASSWORD=$(PASSWORD) --build-arg LOCATION=$(LOCATION) -f phpvirtualbox.Dockerfile .

	rm -rf *.Dockerfile

clean:
	if [ -a $(VIRTUALBOX_VBOXWEBSRV).cid ] ; \
	then \
		docker rm $$(docker stop $$(cat $(VIRTUALBOX_VBOXWEBSRV).cid)) ; \
		rm -rf $(VIRTUALBOX_VBOXWEBSRV).cid ; \
	fi;

	if [ -a $(PHPVIRTUALBOX).cid ] ; \
	then \
		docker rm $$(docker stop $$(cat ${PHPVIRTUALBOX}.cid)) ; \
		rm -rf $(PHPVIRTUALBOX).cid ; \
	fi;

run:
	docker run -dit --cidfile $(VIRTUALBOX_VBOXWEBSRV).cid --name $(VIRTUALBOX_VBOXWEBSRV) --privileged -v /lib/modules/:/lib/modules/ -p 18083:18083 $(VIRTUALBOX_VBOXWEBSRV) -H 0.0.0.0
	docker run -dit -p 80:80 --cidfile $(PHPVIRTUALBOX).cid --link $(VIRTUALBOX_VBOXWEBSRV) --name $(PHPVIRTUALBOX) $(PHPVIRTUALBOX)

dist: clean build run

.PHONY: dist
