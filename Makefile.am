### Makefile.am for kerrighedize
###
### Copyright 2010 Kerlabs, All rights reserved
###
### Author:
###   Jean Parpaillon <jean.parpaillon@kerlabs.com>
###
_INIT_KRG = $(patsubst %,init-krg/%, \
	hostname.sh network nfs-server pxelinux sshd \
	)

_DEFAULT_KRG = $(patsubst %,default-krg/%, \
	network.conf nfs-server.conf pxelinux.cfg sshd.conf \
	)

_INIT_ROOT = $(patsubst %,init-root/%, \
	halt-krg krgnfsroot reboot-krg \
	)

_DEFAULT_ROOT = $(patsubst %,default-root/%, \
	krgnfsroot.conf \
	)

_rootSCRIPTS = bin/init-krg

EXTRA_DIST= \
	$(_rootSCRIPTS) \
	$(_INIT_KRG) \
	$(_DEFAULT_KRG) \
	$(_INIT_ROOT) \
	$(_DEFAULT_ROOT)

install-exec-local:
	for file in $(_rootSCRIPTS); do \
	  $(install_sh_SCRIPTS) $$file $(DESTDIR)/sbin; \
	done
	mkdir -p $(DESTDIR)/etc/kerrighed/init.d
	for file in $(_INIT_KRG); do \
	  $(install_sh_SCRIPTS) $$file $(DESTDIR)/etc/kerrighed/init.d; \
	done
	mkdir -p $(DESTDIR)/etc/init.d
	for file in $(_INIT_ROOT); do \
	  $(install_sh_SCRIPTS) $$file $(DESTDIR)/etc/init.d; \
	done

install-data-local:
	mkdir -p $(DESTDIR)/etc/kerrighed
	for file in $(_DEFAULT_KRG); do \
	  $(install_sh_DATA) $$file $(DESTDIR)/etc/kerrighed; \
	done
	mkdir -p $(DESTDIR)/etc/default
	for file in $(_DEFAULT_ROOT); do \
	  $(install_sh_DATA) $$file $(DESTDIR)/etc/default; \
	done

uninstall-local:
	for file in $(_SCRIPTS); do \
	  rm -f $(DESTDIR)/sbin/$$file; \
	done
	for file in $(_INIT_KRG); do \
	  rm -f $(DESTDIR)/etc/kerrighed/init.d/$$file; \
	done
	for file in $(_DEFAULT_KRG); do \
	  rm -f $(DESTDIR)/etc/kerrighed/$$file; \
	done
	for file in $(_INIT_ROOT); do \
	  rm -f $(DESTDIR)/etc/init.d/$$file; \
	done
	for file in $(_DEFAULT_ROOT); do \
	  rm -f $(DESTDIR)/etc/default/$$file; \
	done
