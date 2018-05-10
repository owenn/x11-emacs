# Docker image for X11 Emacs on Alpine Linux

[![Docker Build Status](https://img.shields.io/docker/build/owenn/x11-emacs.svg)](https://hub.docker.com/r/owenn/x11-emacs/)

Emacs from Alpine community repository with MELPA setting.

* Alpine Linux v3.7
* Emacs v25.3

## How to use this image

```console
	docker run -ti -e DISPLAY=$(DISPLAY) -e MYID=$(shell id -u) \
	-e MYGROUP=$(shell id -g) -e LOGNAME=$(LOGNAME) -v /tmp/.X11-unix:/tmp/.X11-unix \
	-v $(HOME):/home/developer \
	-v /usr/share/fonts/:/usr/share/fonts/ \
	$(IMAGE_NAME)

```

## Environment Variables

### `EMACS_PACKAGES`

This variable specifies space separated list of packages.
They are installed automatically when the container is executed.
