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

find / -type p -o -type c -o -name __pycache__ > exclude_types.txt

#
# tar whole system with some exclusions:
#   * dynamic data
#   * my common folder for this virtual machine (/common)
#   * files with bad types
#   * VBox Guest Additions
#   * bash/python history
#   * this repo git info and user git info
#

tar --numeric-owner \
    --exclude=/proc --exclude=/sys \
    --exclude=/common \
    --exclude-from="./exclude_types.txt" \
    --exclude='/opt/VBoxGuestAdditions*' \
    --exclude='~/*_history' \
    --exclude='~/.git*' \
    --exclude='/RedOS-image/.git' \
    -cvf redos73-base.tar /

