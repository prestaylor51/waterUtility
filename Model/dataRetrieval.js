// Connect to Postgres
var db = require('../Db/db.js');

/**
 * RETRIEVE TEST DATA
 */
function retrieveTestData(data, callback) {
    console.log("entered retrieveTestData model");
    console.log(data);

    // Connect to DB
    var pool = db.remoteDbConnect();

    // Form SQL query
    var sql = "SELECT * FROM pump_test                                                                          \
                WHERE pump_id = (SELECT id FROM pump p                                                          \
                                    WHERE (SELECT id FROM pump_model pm                                         \
                                            WHERE pm.model_number = $1::varchar) = p.pump_model_id                  \
                                            AND (SELECT id FROM pump_station ps                                 \
                                                     WHERE ps.station_number = $2::varchar) = p.pump_station_id    \
                                                     AND p.pump_number = $3::int                                      \
                                            AND p.serial_number = $4::varchar                                   \
                                            AND p.is_active = 'true')          \
                AND test_date = $5::date ";

    var params = [data.pumpModel
                ,data.pumpStation
                ,data.pumpNumber
                ,data.pumpSerial
                ,data.testDate];

    pool.query(sql, params, (err, result) => {
        
        pool.end();

        if (err) {
            console.log("query failed: model.dataRetrieval.retrieveTestData");
            console.log("ERROR -> " + err);
            callback(err, null);
            return;
        }
        else {
            callback(null, result);
        }

    });
    
}

function retrieveTestDates(data, callback) {
    console.log("Entered retrieveTestDates");
    // Connect to DB
    var pool = db.remoteDbConnect();

    var sql = "SELECT DISTINCT to_char(test_date, 'YYYY-MM-DD') AS test_date FROM pump_test pt                      \
    WHERE pump_id = (SELECT p.id FROM pump p                                    \
            WHERE (SELECT pm.id FROM pump_model pm                              \
                    WHERE pm.model_number = $1::varchar) = p.pump_model_id      \
            AND (SELECT ps.id FROM pump_station ps                              \
                    WHERE ps.station_number = $2::varchar) = p.pump_station_id  \
            AND p.pump_number = $3::int                                         \
            AND p.serial_number = $4::varchar                                   \
            AND p.is_active = 't')";

    params = [data.pumpModel,
            data.pumpStation,
            data.pumpNumber,
            data.pumpSerial]

    pool.query(sql, params, (err, result) => {

        pool.end();

        if (err) {
            console.log("query failed: model.dataRetrieval.retrieveTestDates");
            console.log("ERROR -> " + err);
            callback(err, null);
            return;
        }
        else {
            callback(null, result);
        }
    });
        
}

module.exports = {
    retrieveTestData : retrieveTestData,
    retrieveTestDates : retrieveTestDates
}