#
# copies local image tar to remote server
#   to provide the case to load and push the image from it
#

set -e -x

path=$(cat remote-repo-path.txt | xargs)
if [ -z "$path" ]
then
    echo "no remote path found"
    exit 1
fi

server="${path%:*}"
spath="${path#*:}"

locname=tar-location.txt

c="(cat $locname)"
remote_tar_location=$(ssh $server "cd $spath && realpath \$$c")

if [ -z "${remote_tar_location}" ]
then
    echo "no tar location specified on remote server"
    exit 1
fi

scp $(cat $locname) $server:${remote_tar_location}

