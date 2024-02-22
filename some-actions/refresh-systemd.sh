#
# solves the problem of broken systemd deps (several versions)
#
#

rpm -e --nodeps systemd systemd-pam systemd-networkd systemd-udev iptables-libs

dnf install systemd systemd-udev iptables-libs

