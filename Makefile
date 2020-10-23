.PHONY: build

DOCKER_OWNER?=zyzil
DOCKER_IMAGE_PREFIX?=python-etl

build/%:
	docker build -t $(DOCKER_OWNER)/$(DOCKER_IMAGE_PREFIX)-$(notdir $@):latest ./$(notdir $@)

run/%:
	-docker run -it $(DOCKER_OWNER)/$(DOCKER_IMAGE_PREFIX)-$(notdir $@):latest

run-shell/%:
	-docker run -it -u root --entrypoint /bin/bash $(DOCKER_OWNER)/$(DOCKER_IMAGE_PREFIX)-$(notdir $@):latest