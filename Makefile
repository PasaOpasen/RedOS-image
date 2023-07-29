
#
#
# UPDATING TAR (usually from RedOS server)
#
#

remove_old_kernels:
	dnf -y remove --oldinstallonly kernel || true

clean_dnf_cache:
	dnf autoremove -y && dnf clean all

clean: clean_dnf_cache


# update system packages
update:
	dnf update -y


prepare: update clean


pack:
	bash ./tar-redos.sh

tar: pack

#
#
# PUSHING (usually from other operation system what has access to tar)
#
#

load:
	bash ./load.sh

push:
	bash ./push.sh

release: load push
