#! /bin/sh

EMACS_DIR=$HOME/.emacs.d/
EMACS_ELPA_DIR=$EMACS_DIR/elpa/
EMACS_INIT_FILE=$EMACS_DIR/init.el

if [ "$1" = emacs -a ! -d "$EMACS_ELPA_DIR" -a -n "$EMACS_PACKAGES" ]; then
	cat > /tmp/melpa.el <<EOF
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
(package-initialize)
EOF
	emacs -batch -l /tmp/melpa.el -f package-refresh-contents
	rm -f /tmp/melpa.el
fi


if [ ! -z $MYGROUP ]; then
    addgroup $MYGROUP
    if [ ! -z $MYID ]; then
        ln -s /home/developer /home/$LOGNAME
        adduser -s /bin/bash -u $MYID -G $MYGROUP -h /home/$LOGNAME $LOGNAME \
                -DH
    fi
fi

cd /home/$LOGNAME
su $LOGNAME -c "exec $@"
