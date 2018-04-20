
docker network inspect demo >> /dev/null

if [ $? == 1 ]; then
  echo 'Creating external network'
  docker network create demo
fi

if [ ! -d "./cache" ]; then
   mkdir cache
fi

if [ ! -d "./conf" ]; then
   mkdir conf
fi

if [ ! -d "./conf/opscenter" ]; then
   mkdir conf/opscenter
fi

if [ ! -d "./conf/studio" ]; then
   mkdir conf/studio
fi

if [ ! -d "./data" ]; then
   mkdir data
fi


if [ ! -d "./logs" ]; then
   mkdir logs
fi

if [ ! -d "./opscenter" ]; then
   mkdir opscenter
fi

if [ ! -d "./opscenter-clusters" ]; then
   mkdir opscenter-clusters
fi

if [ ! -d "./studio" ]; then
   mkdir studio
fi

docker-compose up
