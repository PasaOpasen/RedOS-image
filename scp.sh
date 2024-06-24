#
# copies local image tar to remote server
#   to provide the case to load and push the image from it
#

set -e

path=$(cat remote-repo-path.txt | xargs)
if [ -z "$path" ]
then
    echo "no remote path found"
    exit 1
fi

locname=tar-location.txt

remote_tar_location=$(ssh $path realpath $locname)

if [ -z "${remote_tar_location}" ]
then
    echo "no tar location specified on remote server"
    exit 1
fi

scp $(cat $locname) ${remote_tar_location}

