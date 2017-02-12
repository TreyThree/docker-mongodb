#!/bin/bash


# Start MongoDB service
/usr/bin/mongod --dbpath /data/db --nojournal &
while ! nc -vz localhost 27017; do sleep 1; done

echo "Creating admin user: ..."
mongo admin --eval 'db.system.version.insert({ "_id" : "authSchema", "currentVersion" : 3 });'
mongo admin --eval 'db.createUser({ user: "adminUser", pwd: "t@PLaW/1", roles: [ { role: "userAdminAnyDatabase", db: "admin" } ] });'

echo "Creating server user: ..."
mongo taplaw --eval 'db.createUser({ user: "server", pwd: "s3rV3r/1", roles: [ { role: "dbOwner", db: "taplaw" } ] });'
mongo taplaw --eval 'db.DocumentDefs.insert({ "_id" : ObjectId("57916d19860cffad2e6e246f"), "Name" : "Welcome Letter", "Url" : "https://s3-us-west-2.amazonaws.com/taplaw-documents/WelcomeLetter.xml", "ForEachClient": true, "IsDeleted": false, "Created" : ISODate("2016-04-30T22:07:29.321Z"), "LastSaved" : ISODate("2016-04-30T22:07:29.321Z")});'

# Stop MongoDB service
/usr/bin/mongod --dbpath /data/db --shutdown

rm -f /.firstrun
