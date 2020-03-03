# Docker image for X11 Emacs on Alpine Linux

[![Docker Build Status](https://img.shields.io/docker/build/owenn/x11-emacs.svg)](https://hub.docker.com/r/owenn/x11-emacs/)

Emacs from Alpine community repository with MELPA setting. Running the docker 
image with the options below uses your local $HOME on the host running the 
docker image. Additionally I have added go and git functionality to the image. 
I use this image with spacemacs, and all the go functionality works.

* Alpine Linux v3.7
* Emacs v25.3

## How to use this image

```console
	docker run -ti -e DISPLAY=$DISPLAY -e MYID=$(id -u) \
	-e MYGROUP=$(id -g) -e LOGNAME=$LOGNAME -v /tmp/.X11-unix:/tmp/.X11-unix \
	-v $(HOME):/home/developer \
	-v /usr/share/fonts/:/usr/share/fonts/ owenn/x11-emacs
```

## Environment Variables

### `EMACS_PACKAGES`

This variable specifies space separated list of packages.
They are installed automatically when the container is executed.
