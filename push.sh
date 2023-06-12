#
#
# Tag and push image from running Linux machine 
# 
#   on Ubuntu 22: sudo service docker start
#
#


tag=$(date +"%Y-%m-%d_%H-%M")



docker login


#
# tag the image and push
#

for tg in "${tag}" "latest"
do
    name=pasaopasen/redos7.3:${tg}
    docker tag redos73-base $name

    echo "pushing ${name}"
    docker push $name
done