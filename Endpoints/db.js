function remoteDbConnect() {
	const {Pool, Client} = require('pg');

		console.log(process.env.DATABASE_URL);
		
		if (process.env.DATABASE_URL) {
			const pool = new Pool({
				connectionString: process.env.DATABASE_URL,
		  	  	ssl: true
	  	  	})
	  	  	return pool;
		}
		else {
			const pool = new Pool({
				user: 'postgres',
			  	host: 'localhost',
			  	database: 'pumputility',
			  	password: 'postgres',
			  	port: 5432,
		  	})
		  	return pool;
		}
}

module.exports = {remoteDbConnect: remoteDbConnect};