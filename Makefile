
#
#
# UPDATING TAR
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
# PUSHING
#
#

load:
	bash ./load.sh

push:
	bash ./push.sh

release: load push
