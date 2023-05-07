
# update system packages
update:
	dnf update -y && dnf autoremove -y && dnf clean all


pack:
	bash ./tar-redos.sh

