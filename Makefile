

HELP_FUN = \
    %help; while(<>){push@{$$help{$$2//'options'}},[$$1,$$3] \
    if/^([\w-_]+)\s*:.*\#\#(?:@(\w+))?\s(.*)$$/}; \
    print"$$_:\n", map"  $$_->[0]".(" "x(20-length($$_->[0])))."$$_->[1]\n",\
    @{$$help{$$_}},"\n" for keys %help; \

help: ##@Miscellaneous Show this help
	@echo -e "Usage: make [target] ...\n"
	@perl -e '$(HELP_FUN)' $(MAKEFILE_LIST)


#
#
# UPDATING TAR (usually from RedOS server)
#
#

remove_old_kernels:       ##@Cleaning
	dnf -y remove --oldinstallonly kernel || true

clean_dnf_cache:          ##@Cleaning
	dnf autoremove -y || true
	dnf clean all

clean_python:             ##@Cleaning python2/3 pip cache
	python -m pip cache purge
	python2 -m pip cache purge || true
	

clean_home:               ##@Cleaning remove other caches
	rm -rf ~/.cache

clean: clean_dnf_cache clean_python clean_home


# update system packages
update:                   ##@Update update system and some python packages
	dnf update -y
	mandb
	python -m pip install --upgrade pip wheel setuptools cryptography
	python2 -m pip install --upgrade pip wheel setuptools cryptography


prepare: update clean     ##@Update update packages and clean cache


pack:
	bash ./tar-redos.sh

tar: pack                 ##@Update create new system tar

update-tar: prepare tar   ##@Update perform system updates and archiving


#
#
# PUSHING (usually from other operation system what has access to tar)
#
#

dockerv:                  ##@Docker start Docker
	sudo service docker start

load:                     ##@Docker load tar to Docker daemon
	bash ./load.sh

push:                     ##@Docker push image to DockerHub
	bash ./push.sh

release: dockerv load push        ##@Docker load + push
