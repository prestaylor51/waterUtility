// Connect to Postgres
function testdb(req, res,) {

	const {Pool, Client} = require('pg');

	const pool = new Pool({
	  user: 'postgres',
	  host: 'localhost',
	  database: 'pumputility',
	  password: 'postgres',
	  port: 5432,
	})

	pool.query('                                            \
				SELECT model_number, motor_hp, stages, voltage    	\
				 	FROM pump_model;						\
			   ', (err, result) => {
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

