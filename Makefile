
# update system packages
update:
	dnf update -y && dnf autoremove -y && dnf clean all


pack:
	bash ./tar-redos.sh


load:
	bash ./load.sh

push:
	bash ./push.sh

release: load push
