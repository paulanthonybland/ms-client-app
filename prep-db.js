print("prep-db.js");
conn = new Mongo("mongodb:27017");
db = conn.getDB("mustard-seed");
client_coll = db.getCollection("clients");
if (client_coll.count() == 0) {
  client_coll.insert(
    [
      {
        firstname: 'Paul',
        lastname: "Bland",
        dob: "1963-10-16",
        dateOfReferral: "2014-08-22",
        stageOfProgress: "waiting",
      },
      {
        firstname: 'Francis',
        lastname: "Bland",
        dob: "1965-05-12",
        dateOfReferral: "2012-03-06",
        stageOfProgress: "open",
      },
      {
        firstname: 'Lucy',
        lastname: "Bland",
        dob: "2001-11-03",
        dateOfReferral: "2016-11-03",
        stageOfProgress: "closed",
      } 
    ]
  );
} else {
  print("clients already exist");
}

