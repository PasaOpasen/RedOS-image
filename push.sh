#
#
# Tag and push image from running Linux machine 
# 
#   on Ubuntu 22: sudo service docker start
#
#


tag=docutable-$(date +"%Y-%m-%d_%H-%M")


#
# import tar from my paths as image
#
echo "import tar"
cat /mnt/j/VirtualBoxes/common_folders/redos/redos73-base.tar | docker import - redos73-base 



docker login


#
# tag the image and push
#

for tg in "${tag}" "latest"
do
    name=pasaopasen/redos7.3:${tg}
    docker tag redos73-base $name
    docker push $name
done