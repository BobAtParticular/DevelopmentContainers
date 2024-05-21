rs.initiate();

db.createUser( { user: "root", pwd: process.env.ROOT_PASSWORD, roles: [] } );