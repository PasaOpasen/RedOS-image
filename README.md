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


## Commands

Update system: `make update`

Build tar of system: `make pack`



