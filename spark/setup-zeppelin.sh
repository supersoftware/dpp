#!/bin/bash

set -e
# zeppelin endpoint
read -p "Enter Zeppelin Endpoint(e.g. xxx.xxx.xxx.xxx:8080): " END_POINT
# cassandra contact points
CASSANDRA_CONTACT_POINTS=cassandra-Cassandra1-1,cassandra-Cassandra2-1,cassandra-Cassandra3-1
# spark master
SPARK_MASTER=spark://master:7077
# spark cores max
SPARK_CORES_MAX=4

# import notebook
echo "importing notebook..."
curl -vX POST http://$END_POINT/api/notebook -d @./boc_analyze.json --header "Content-Type: application/json"
curl -vX POST http://$END_POINT/api/notebook -d @./boc_schema.json --header "Content-Type: application/json"
echo "ok"

# GET current interpreter settings
echo "fetching interpreters settin..."
interpreters=$(curl http://$END_POINT/api/interpreter/setting)
echo "ok"

# alter cassandra settings
cassandra_settings=$(echo $interpreters |jq -r '.body' |jq -c 'map(select( .name | contains("cassandra")))[0]' | \
  jq --arg cc_points $CASSANDRA_CONTACT_POINTS '.properties."cassandra.hosts" |= $cc_points')
# get id to use for request
cassandra_id=$(echo $cassandra_settings | jq -r '.id')

# alter spark settings
spark_settings=$(echo $interpreters |jq -r '.body' |jq -c 'map(select( .name | contains("spark")))[0]' | \
  jq --arg s_master $SPARK_MASTER '.properties."master" |= $s_master' | \
  jq --arg s_cores_max $SPARK_CORES_MAX '.properties."spark.cores.max" |= $s_cores_max' | \
  jq --arg cc_points $CASSANDRA_CONTACT_POINTS '.properties."spark.cassandra.connection.host" |= $cc_points' | \
  jq '.dependencies |= [{"groupArtifactVersion":"com.datastax.spark:spark-cassandra-connector_2.11:2.0.2","local":false}]')

# get id to use for request
spark_id=$(echo $spark_settings | jq -r '.id')


# alter interpreter settings
echo "changing interpreter settings..."
curl -vX PUT http://$END_POINT/api/interpreter/setting/$cassandra_id -d "$cassandra_settings" --header "Content-Type: application/json"
curl -vX PUT http://$END_POINT/api/interpreter/setting/$spark_id -d "$spark_settings" --header "Content-Type: application/json"
echo "ok"

echo "complete!"
