FROM alpine:3.7

MAINTAINER Nigel Owen nigelowen2@gmail.com

RUN apk update && apk add ca-certificates emacs-gtk2 curl bash xclock

WORKDIR /home/developer

COPY init.el /root/.emacs.d/
COPY entrypoint.sh /

ENTRYPOINT [ "/entrypoint.sh" ]
CMD [ "emacs" ]
