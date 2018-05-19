/*************************************
* File: INDEX.JS
*************************************/
// Use the express library and make a variable(app) to access functionality
var express = require('express');
var app = express();

// Get HTTP library
const http = require('http');
const port = 3000;

const requestHandler = (request, response) => {
	console.log(request.url);

	response.end('Greetings earthling.');
}

const server = http.createServer(requestHandler);

server.listen(port, (err) => {

	if (err) {
		return console.log('something went wrong!', err)
	}

	console.log("Server is listening on port " + port);
})