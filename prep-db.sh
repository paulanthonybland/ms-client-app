#!/bin/bash

DB_RUNNING="no"
CHECK_COUNT=0
while [ "$DB_RUNNING" = "no" -a $CHECK_COUNT -lt 5 ]; do
  sleep 5
  #With the mongodb instance in the same virtual network as us, 'mongodb' should be a resolvable host name for it
  echo "Calling \'mongo --nodb --norc --host db --port 27017 --eval \"new Mongo(mongodb:27017')\"\'"
  mongo --nodb --norc --host mongodb --port 27017 --eval "new Mongo('mongodb:27017')"
  if [ $? -ne 0 ]; then
    echo "DB still not running"
  else 
    echo "DB running"
    DB_RUNNING="yes"
  fi
  let CHECK_COUNT=$CHECK_COUNT+1
done

echo "DB running? $DB_RUNNING"

if [ "$DB_RUNNING" = "yes" ]; then
  mongo --host mongodb --port 27017 /var/tmp/client-db/prep-db.js
  mongo --host mongodb --port 27017 /var/tmp/client-db/dump-db.js
  #mongo --host db --port 27017 --eval 'db = connect("db:27017/mustard-seed"); printjson(db.getCollectonNames())'
else
  echo "DB not running"
fi

echo "Leaving prep-db.sh"
