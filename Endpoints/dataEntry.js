/* DATA ENTRY
*	Contains funcitons need for entering pump data into
*	the pumputility database
 */

// Connect to Postgres
var db = require('../Endpoints/db.js');

function insertPumpTest (req, res) {
	
	const {Pool, Client} = require('pg');

	// Get pool
	pool = db.remoteDbConnect();

	pool.query ('Select * from pump;', (err, result) =>{
	
	pool.end();
	
	if (err) {
		console.log("Insert Failed");
	}

	})

	//res.send(result.rows);
	res.send("made endpoint!");
	console.log("made test insert");
 }

 module.exports = {
	insertPumpTest : insertPumpTest
 }