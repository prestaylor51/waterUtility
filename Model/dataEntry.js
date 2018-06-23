// Connect to Postgres
var db = require('../Db/db.js');

/*
* INSERT PUMP TEST 
*/
function insertPumpTest (data, callback) {
	// What is the req body
	console.log(data);

	// Connect to DB
	var pool = db.remoteDbConnect();

	// Form SQL
	var sql = "Insert into pump_test 											\
	VALUES																		\
	(nextval('pump_test_id_seq')												\
		,(SELECT id FROM pump p													\
		WHERE (SELECT id FROM pump_model pm										\
				WHERE pm.model_number = $1) = p.pump_model_id				\
		AND (SELECT id FROM pump_station ps										\
				WHERE ps.station_number = $2) = p.pump_station_id			\
		AND p.pump_number = $3											\
		AND p.serial_number = $4 											\
		AND p.is_active = 't')													\
	,$5																	\
	,$6																			\
	,$7																			\
	,$8																			\
	,$9																			\
	,$10 																		\
	,$11 																		\
	,$12																		\
	,$13																		\
	,$14																		\
	,$15																		\
	,$16																		\
	,$17);"																

	var params = [/*'22BLK'
				,'SBFFPS'
				,'1'
				,'78639-1-1'*/
				data.pumpModel
				,data.pumpStation
				,data.pumpNumber
				,data.pumpSerial
				,data.testNumber
				,data.testDate
				,data.percentSpeed
				,data.resLevel
				,data.pumpFlagPsi
				,data.headerPsi
				,data.dischargeFlow
				,data.amps1
				,data.amps2
				,data.amps3
				,data.volts1
				,data.volts2
				,data.volts3]; 

	// Make INSERT											// todo
	pool.query(sql, params, (err, result) => {                                       
		pool.end();

		if (err) {
			console.log("query failed: model.dataEntry.insertPumpTestData");
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
	insertPumpTest : insertPumpTest
 }
