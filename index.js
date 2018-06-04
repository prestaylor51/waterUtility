/*************************************
* File: INDEX.JS
*************************************/
// Use the express library and make a variable(app) to access functionality
var express = require('express');
var app = express();

const port = 3000;

// Modules
var dbtest = require('./Endpoints/connectdb.js');


app.get('/', (req, res) => res.send('Mesa Water Utility'));

/* 
* A simple test to get data from the database and send it back
* to Excel. 
*/
app.get('/dbTest', dbtest.testdb);

app.listen(3000, () => console.log('Water Utility is Running on port' + port ));








// Get HTTP library
// const http = require('http');
// const port = 3000;

// const requestHandler = (request, response) => {
// 	console.log(request.url);

// 	response.end('Greetings earthling.');
// }

// const server = http.createServer(requestHandler);

// server.listen(port, (err) => {

// 	if (err) {
// 		return console.log('something went wrong!', err)
// 	}

// 	console.log("Server is listening on port " + port);
// })