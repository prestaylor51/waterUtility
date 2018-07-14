// Connect to Postgres
var db = require('../Db/db.js');

/**
 * RETRIEVE TEST DATA
 */
function retrieveTestData(data, callback) {
    console.log("entered retrieveTestData model");

    callback();
}

module.exports = {
    retrieveTestData : retrieveTestData
}