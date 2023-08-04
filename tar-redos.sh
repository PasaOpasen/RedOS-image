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
    --exclude='/opt/VBoxGuestAdditions*' \
    --exclude='~/*_history' \
    --exclude='~/.git*' \
    --exclude='~/.cache' \
    --exclude='/RedOS-image/.git' \
    --exclude='/tmp/*' \
    --exclude='/var/tmp/*' \
    --exclude='/boot/*' \
    --exclude='/usr/lib/modules/*' \

    -cvf redos73-base.tar / | tee /common/in_image.txt

    # --exclude='~/.*_history' \
    # --exclude='/var/log/*' \
    # --exclude='/dev/*' \
    # --exclude='/run/udev/links/*' \
    # --exclude='/run/systemd/journal/streams/*' \