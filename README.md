# RedOS-image

This repo contains commands to build docker RedOS image from installed RedOS server version (current version is 7.3)

The main idea is gotten from next sources:
* https://redos.red-soft.ru/base/arm/arm-other/docker-install/
* https://www.dmosk.ru/miniinstruktions.php?mini=docker-base-image


This repo link: https://github.com/PasaOpasen/RedOS-image

Docker image link: https://hub.docker.com/repository/docker/pasaopasen/redos7.3/general


## Prerequirements
* RedOS server version is installed on VBox
* VBox guest additions is connected
* There is common folder `/common` between VM and main system

Advices:
* do not forget to set latin password on server installation
* after installation the iso must be removed from VM
* add VBoxGuestAdditions.iso as disk

## Base packages and VBox guest additions connection

```bash
dnf install gcc make kernel-headers kernel-devel git vim ncdu htop curl -y

mkdir /opt/VBoxGuestAdditions
mount /dev/disk/by-label/VBox_GAs_7.0.6 /opt/VBoxGuestAdditions
bash /opt/VBoxGuestAdditions/VBoxLinuxAdditions.run 
```

## Commands

Update system: `make update`

Build tar of system: `make pack`



