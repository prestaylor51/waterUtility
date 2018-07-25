// Get Data Retrieval Model
var dataRetrievalModel = require('../Model/dataRetrieval.js');

/**
 * HANDLE TEST RETRIEVAL
 * @param { } req
 * @param {*} res 
 */
function handleTestRetrieval(req, res) {
    
    var params = req.query;
    console.log("req.body -> " + req.query);

    console.log("Preparing to retrieve pump test..")
    dataRetrievalModel.retrieveTestData(params, function(err, result) {
        if (err) {
            console.log("Error returning from the data retrieval model.")
            res.send("Retrieval Failed")
        }
        else {
            console.log("returned from the model successfully");
            console.log("Result: " + JSON.stringify(result.rows));
            res.send(JSON.stringify(result.rows));
        }

    });
}

function handleTestDateRetrieval(req, res) {

    var params = req.query;

    dataRetrievalModel.retrieveTestDates(params, function(err, result){
        if (err) {
            console.log("ERROR retrieving test dates.");
        }
        else {
            console.log("Retrieved test dates successfully.");
            console.log("Result: " + JSON.stringify(result.rows));
            res.send(JSON.stringify(result.rows));
        }
    })

}

module.exports = {
    handleTestRetrieval: handleTestRetrieval,
    handleTestDateRetrieval : handleTestDateRetrieval
}