#
# reduces locale-archive size 
# https://unix.stackexchange.com/a/90016/532982
#

set -x -e

echo -e 'After running this script u should manually call next command:\n\tdnf reinstall glibc-common -y'
read -n 1 -p 'Press any key to continue...'

localedef --list-archive | grep -v -i -E '^(en|ru)' | xargs localedef --delete-from-archive

\mv /usr/lib/locale/locale-archive /usr/lib/locale/locale-archive.tmpl

build-locale-archive

#
# this command must be called directly cuz previous command performs logout
#
dnf reinstall glibc-common -y

