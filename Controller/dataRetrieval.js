// Get Data Retrieval Model
var dataRetrievalModel = require('../Model/dataRetrieval.js');

/**
 * HANDLE TEST RETRIEVAL
 * @param { } req 
 * @param {*} res 
 */
function handleTestRetrieval (req, res) {

    console.log("Preparing to retrieve pump test..")
    dataRetrievalModel.retrieveTestData(null, function() {

        console.log("returned from the model");

        res.send("round trip to retrieval model complete");

    });

}

module.exports = {
    handleTestRetrieval: handleTestRetrieval
}