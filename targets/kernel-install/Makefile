KERNEL_INSTALL = /usr/lib/kernel/install.d

install:
	install -D -m 755 89-loaderentry-secureboot.install ${DESTDIR}/${KERNEL_INSTALL}/89-loaderentry-secureboot.install

uninstall:
	${RM} ${DESTDIR}/${KERNEL_INSTALL}/89-loaderentry-secureboot.install

.PHONY: install uninstall
