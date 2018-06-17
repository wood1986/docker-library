clean:
	docker-compose down

install:
	export DOMAIN=$(DOMAIN)
	docker-compose up --abort-on-container-exit

dist: install clean