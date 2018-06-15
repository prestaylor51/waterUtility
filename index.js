/*************************************
* File: INDEX.JS
*************************************/
// Use the express library and make a variable(app) to access functionality
var express = require('express');
var app = express();

// Get Port
const PORT = process.env.PORT || 3000;

// Modules
var dbtest = require('./Endpoints/connectdb.js');
var dbInsert = require('./Endpoints/dataEntry.js');

/* GET */
// Home
app.get('/', (req, res) => res.send('Mesa Water Utility'));

/* 
* A simple test to get data from the database and send it back
* to Excel. 
*/
app.get('/dbTest', dbtest.testdb);

/* POST */
// Insert pump tests
app.post('/dbInsertPumpTest', dbInsert.insertPumpTest);
/*app.post('/dbInsertPumpTest',(req, res) => {
	console.log('hit endpoint!');
	res.send('made post')
});*/

// Listen
app.listen(PORT, () => console.log('Water Utility is Running on port' + PORT ));

