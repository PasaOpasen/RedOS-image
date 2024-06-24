
set -e 

#
# import tar from my paths as image
#
echo "import tar"

file=$(cat tar-location.txt)

if [ ! -f $file ]
then
    echo "No such file $file"
    exit 1
fi

cat $file | docker import - redos73-base 

