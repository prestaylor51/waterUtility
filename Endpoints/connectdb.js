// Connect to Postgres
var db = require('../Endpoints/db.js');

/* TEST DB */
function testdb(req, res,) {

	const {Pool, Client} = require('pg');

	console.log(req);
	console.log("testing tester");
	// Get pool
	pool = db.remoteDbConnect();

	// Make Query
	pool.query('                                                    \
				SELECT model_number, motor_hp, stages, voltage    	\
				FROM pump_model;',									
		(err, result) => {
		//console.log(err, res);
		console.log("Attempting connection to DB..");
		pool.end();
      
		if (err) {
				console.log('error with database');
		}

		res.send(result.rows);
		console.log("Conection Successfull.");
	})


}

module.exports = {
	testdb: testdb
}

