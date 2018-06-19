// Connect to Postgres
var db = require('../Endpoints/db.js');

/*
* INSERT PUMP TEST 
*/
function insertPumpTest (req, callback) {
	// What is the req body
	console.log(req.body);

	// Connect to DB
	pool = db.remoteDbConnect();

	// Make INSERT											// todo
	pool.query('SELECT * FROM pump;',(err, result) => {
		pool.end();

		if (err) {
			console.log("database connection faild: model.dataEntry");
			callback(err, null);
		}



		callback(null, result);

	});

}

 module.exports = {
	insertPumpTest : insertPumpTest
 }
