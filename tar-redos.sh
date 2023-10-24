
set -e

#
# change dir to common folder for this VM
#
cd /common

#
# find all pipes and char files to exclude from image
#   cuz some rootless docker versions can crash on loading because of them
#
# also remove python caches
#

find / -type p -o -type c -o -type b -o -type s -o -name __pycache__ > exclude_types.txt

find /usr/share/locale \
    -not -name "ru" -not -name "ru_*" \
    -not -name "en" -not -name "en_*" -not -name "en@*" > exclude_locales.txt

#
# tar whole system with some exclusions:
#   * dynamic data
#   * my common folder for this virtual machine (/common)
#   * files with bad types
#   * VBox Guest Additions
#   * bash/python history
#   * this repo git info and user git info
#   * /tmp
#   * /boot
#   * kernels
#   * logs
#

tar --numeric-owner \
    --exclude=/proc --exclude=/sys \
    --exclude=/common \
    --exclude-from="./exclude_types.txt" \
    --exclude-from="./exclude_locales.txt" \
    --exclude='/opt/VBoxGuestAdditions*' \
    --exclude='~/*_history' \
    --exclude='~/.git*' \
    --exclude='/RedOS-image/.git' \
    --exclude='/tmp/*' \
    --exclude='/boot/*' \
    --exclude='/usr/lib/modules/*' \
    --exclude='/lib/modules/*' \
    --exclude='~/.cache' \
    --exclude='/var/cache/*' \
    --exclude='/var/tmp/*' \
    --exclude='~/.*_history' \
    --exclude='/var/log/*' \
    --exclude='/dev/*' \
    --exclude='/run/udev/links/*' \
    --exclude='/run/systemd/journal/streams/*' \
    --exclude='/usr/src/kernels/*' \
    --exclude='/usr/share/icons/*' \
    -cvf redos73-base.tar / | tee /common/in_image.txt

