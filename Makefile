.PHONY: build run run-shell

DOCKER_OWNER?=zyzil
DOCKER_IMAGE_PREFIX?=python-etl
DOCKER_JUPYTER_IMAGE?=$(DOCKER_IMAGE_PREFIX)-jupyter

JUPYTER_ARGS?=
JUPYTER_HOST_PORT?=8888
JUPYTER_CONTAINER_PORT?=8888

build/%:
	docker build -t $(DOCKER_OWNER)/$(DOCKER_IMAGE_PREFIX)-$(notdir $@):latest ./$(notdir $@)

run/%:
	-docker run -it $(DOCKER_OWNER)/$(DOCKER_IMAGE_PREFIX)-$(notdir $@):latest

run-jupyter:
	-docker run -it -p $(JUPYTER_HOST_PORT):$(JUPYTER_CONTAINER_PORT) $(JUPYTER_ARGS) $(DOCKER_OWNER)/$(DOCKER_JUPYTER_IMAGE):latest

run-shell/%:
	-docker run -it -u root --entrypoint /bin/bash $(DOCKER_OWNER)/$(DOCKER_IMAGE_PREFIX)-$(notdir $@):latest