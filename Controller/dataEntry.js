// Get the Model
var dataEntryModel = require('../Model/dataEntry.js');

/*
HANDLE PUMP TEST
*/
function handlePumpTest (req, res) {
	
	console.log("Preparing to enter pump test.. ");

	dataEntryModel.insertPumpTest(req, function(err, result) {
		if (err) {
			console.log("Error returning from the model.");

		}

		console.log("Retured from dataEntry model successfully.");
		console.log("results: " + result + "\n" + "Sending results.");

		console.log("Result: " + JSON.stringify(result.rows));

		res.send(result);

	});

}

module.exports = {
	handlePumpTest: handlePumpTest
}