#!/bin/bash
echo "This script will create initial config files in the ./config directory"

echo "DSE Files"

if [ ! -f "./conf/dse.yaml" ]; then
  {
   echo "copy ./conf/dse.yaml"
   docker-compose exec node cp /opt/dse/resources/dse/conf/dse.yaml /config/.
 }
fi

if [ ! -f "./conf/cassandra.yaml" ]; then
  {
   echo "copy ./conf/cassandra.yaml"
   docker-compose exec node cp /opt/dse/resources/cassandra/conf/cassandra.yaml /config/.
 }
fi

echo "Studio Files"
if [ ! -f "./conf/studio/configuration.yaml" ]; then
  {
   echo "copy ./conf/studio/configuration.yaml"
   docker-compose exec studio cp /opt/datastax-studio/conf/configuration.yaml /config/.
 }
fi
if [ ! -f "./conf/studio/server.sh" ]; then
  {
   echo "copy ./conf/studio/server.sh"
   docker-compose exec studio cp /opt/datastax-studio/bin/server.sh /config/.
 }
fi
