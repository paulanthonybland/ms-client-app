print("dump-db.js");
conn = new Mongo("mongodb:27017");
db = conn.getDB("mustard-seed");
client_coll = db.getCollection("clients");

cursor = client_coll.find();
while (cursor.hasNext()) {
  printjson(cursor.next());
}

