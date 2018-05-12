IMAGE_NAME=emacs

.build:
	docker build . -t $(IMAGE_NAME)

.run_debug:
	docker run -ti -e DISPLAY=$(DISPLAY) -e MYID=$(shell id -u) \
		-e MYGROUP=$(shell id -g) \
		-v /tmp/.X11-unix:/tmp/.X11-unix  \
		-v $(HOME):/home/developer \
		$(IMAGE_NAME) /bin/bash

all: .build .run
.run:
	@docker run -ti -e DISPLAY=$(DISPLAY) -e MYID=$(shell id -u) \
	-e MYGROUP=$(shell id -g) -e LOGNAME=$(LOGNAME) -v /tmp/.X11-unix:/tmp/.X11-unix \
	-v $(HOME):/home/developer \
  -v /usr/share/fonts/:/usr/share/fonts/ \
	$(IMAGE_NAME)


