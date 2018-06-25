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

	console.log(data.pumpModel + "\n" +
				data.pumpStation + "\n" +
				data.pumpNumber + "\n" +
				data.pumpSerial + "\n")

	// Form SQL
	var sql = "INSERT INTO pump_test 											\
	VALUES																		\
	(nextval('pump_test_id_seq')												\
	,(SELECT p.id FROM pump p													\
		WHERE (SELECT pm.id FROM pump_model pm										\
				WHERE pm.model_number = $1::varchar) = p.pump_model_id				\
				AND (SELECT ps.id FROM pump_station ps										\
						WHERE ps.station_number = $2::varchar) = p.pump_station_id			\
				AND p.pump_number = $3::int											\
				AND p.serial_number = $4::varchar										\
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

	var params = [data.pumpModel
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

	// Make INSERT											
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
