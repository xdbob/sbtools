DESTDIR ?= /
PREFIX ?= /usr/local

all:

clean:

install:
	install -D -m 644 src/loadconfig.sh ${DESTDIR}/${PREFIX}/share/sbtools/loadconfig.sh
	install -D -m 755 src/sb-link-boot-img ${DESTDIR}/${PREFIX}/bin/sb-link-boot-img
	install -D -m 755 src/sb-make-boot-img ${DESTDIR}/${PREFIX}/bin/sb-make-boot-img
	install -D -m 755 src/sb-sign-binary ${DESTDIR}/${PREFIX}/bin/sb-sign-binary
	install -D -m 755 src/sbmkkeys ${DESTDIR}/${PREFIX}/bin/sbmkkeys
	install -D -m 755 src/uncat ${DESTDIR}/${PREFIX}/bin/uncat

uninstall:
	${RM} ${DESTDIR}/${PREFIX}/bin/sb-link-boot-img
	${RM} ${DESTDIR}/${PREFIX}/bin/sb-make-boot-img
	${RM} ${DESTDIR}/${PREFIX}/bin/sb-sign-binary
	${RM} ${DESTDIR}/${PREFIX}/bin/sbmkkeys
	${RM} ${DESTDIR}/${PREFIX}/bin/uncat
	${RM} ${DESTDIR}/${PREFIX}/share/sbtools/loadconfig.sh

install_%:
	${MAKE} -C targets/$(subst install_,,$@) install

uninstall_%:
	${MAKE} -C targets/$(subst install_,,$@) uninstall

.PHONY: all install clean uninstall
