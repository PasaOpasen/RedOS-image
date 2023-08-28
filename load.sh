
set -e 

#
# import tar from my paths as image
#
echo "import tar"

file=/mnt/j/VirtualBoxes/common_folders/redos/redos73-base.tar

if [ ! -f $file ]
then
    echo "No such file $file"
    exit 1
fi

cat $file | docker import - redos73-base 

