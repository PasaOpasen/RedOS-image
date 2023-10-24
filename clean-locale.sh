#
# reduces locale-archive size 
# https://unix.stackexchange.com/a/90016/532982
#

set -x -e

localedef --list-archive | grep -v -i -E '^(en|ru)' | xargs localedef --delete-from-archive

\mv /usr/lib/locale/locale-archive /usr/lib/locale/locale-archive.tmpl

build-locale-archive

dnf reinstall glibc-common -y

