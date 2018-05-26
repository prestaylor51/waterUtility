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
				SELECT model, motor_hp, stages, voltage    	\
				 	FROM pump_model;						\
			   ', (err, result) => {
	  console.log(err, res);
	  pool.end();
      
      if (err) {
			console.log('error with database');
		}

	  res.send(result.rows);

	})


}

module.exports = {
	testdb: testdb
}

