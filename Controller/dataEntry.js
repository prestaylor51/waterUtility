// Get the Model
var dataEntryModel = require('../Model/dataEntry.js');

/*
HANDLE PUMP TEST
*/
function handlePumpTest (req, res) {
	
	console.log("Preparing to enter pump test.. ");

	var params = req.body;

	dataEntryModel.insertPumpTest(params, function(err, result) {
		if (err) { // FAILURE 
			console.log("Error in returning from model.");
			res.send("FAILED");
			return;
		}
		else {     // SUCCESS
			console.log("Retured from dataEntry model successfully.");
			console.log("results: " + result + "\n" + "Sending results.");

			console.log("Result: " + JSON.stringify(result.rows));

			res.send(JSON.stringify(result.rows));
		}
		

	});

}

module.exports = {
	handlePumpTest: handlePumpTest
}