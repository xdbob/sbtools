LIBALPM = /usr/share/libalpm/

install:
	install -D -m 755 secure-boot-hook ${DESTDIR}/${LIBALPM}/scripts/secure-boot-hook
	install -D -m 644 95-secure-boot.hook ${DESTDIR}/${LIBALPM}/hooks/95-secure-boot.hook

uninstall:
	${RM} ${DESTDIR}/${LIBALPM}/scripts/secure-boot-hook
	${RM} ${DESTDIR}/${LIBALPM}/hooks/95-secure-boot.hook

.PHONY: install uninstall
