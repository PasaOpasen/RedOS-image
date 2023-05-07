#
# change dir to common folder for this VM
#
cd /common

#
# find all pipes and char files to exclude from image
#   cuz some rootless docker versions can crash on loading because of them
#

find / -type p -o -type c > exclude_types.txt

#
# tar whole system with some exclusions:
#   * dynamic data
#   * my common folder for this virtual machine (/common)
#   * files with bad types
#   * VBox Guest Additions
#   * bash/python history
#

tar --numeric-owner \
    --exclude=/proc --exclude=/sys \
    --exclude=/common \
    --exclude-from="./exclude_types.txt" \
    --exclude='/opt/VBoxGuestAdditions*' \
    --exclude='~/*_history' \
    -cvf redos73-base.tar 

