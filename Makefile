
#
#
# UPDATING TAR
#
#

remove_old_kernels:
	dnf -y remove --oldinstallonly kernel || true

clean_dnf_cache:
	dnf autoremove -y && dnf clean all

clean: remove_old_kernels clean_dnf_cache


# update system packages
update:
	dnf update -y


prepare: update clean


pack:
	bash ./tar-redos.sh

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
