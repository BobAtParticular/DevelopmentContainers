rs.initiate({_id: 'rs0', members: [{_id: 1, 'host': 'mongodb:27017'}]});

db.createUser( { user: "root", pwd: process.env.ROOT_PASSWORD, roles: [] } );