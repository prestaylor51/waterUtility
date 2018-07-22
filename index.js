/*************************************
* File: INDEX.JS
*************************************/
// Use the express library and make a variable (app) to access functionality
var express = require('express');
var app = express();
var bodyParser = require('body-parser');

// Get Port
const PORT = process.env.PORT || 3000;

/* Modules */
var dbtest = require('./Db/connectdb.js');

/* Middleware */
app.use(bodyParser.json());			// Body-Parser for getting data from requests
app.use(bodyParser.urlencoded({     // Body-Parser for getting data from requests
	extended: false
})); 

/* Controller */
dataEntryControl = require('./Controller/dataEntry.js');
dataRetrievalControl = require('./Controller/dataRetrieval.js');

/* Model */
dataEntryModel = require('./Model/dataEntry.js');
dataRetrievalModel = require('./Model/dataRetrieval.js');

/* ROUTING */
//// GET ////
app.get('/', (req, res) => res.send('Mesa Water Utility')); // Home
app.get('/dbTest', dbtest.testdb);							// Test
app.get('/RetrievePumpData', dataRetrievalControl.handleTestRetrieval);
app.get('/RetrieveTestDates',); // TODO

//// POST ////
app.post('/InsertPumpTest', dataEntryControl.handlePumpTest);		// Data Entry

// Start Server
app.listen(PORT, () => console.log('Water Utility is Running on port' + PORT ));

