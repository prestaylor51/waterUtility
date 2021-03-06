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
	var sql = "INSERT INTO pump_test 												\
	VALUES																			\
	(nextval('pump_test_id_seq')													\
	,(SELECT p.id FROM pump p 														\
				WHERE (SELECT pm.id FROM pump_model pm								\
					WHERE pm.model_number = $1::varchar) = p.pump_model_id			\
				AND (SELECT ps.id FROM pump_station ps								\
					WHERE ps.station_number = $2::varchar) = p.pump_station_id		\
				AND p.pump_number = $3::int											\
				AND p.serial_number = $4::varchar									\
				AND p.is_active = 't' )												\
	,$5::int																		\
	,$6::date																		\
	,$7::int																		\
	,$8::numeric																	\
	,$9::numeric																	\
	,$10::numeric 																	\
	,$11::numeric 																	\
	,$12::numeric 																	\
	,$13::numeric 																	\
	,$14::numeric 																	\
	,$15::int																		\
	,$16::int																		\
	,$17::int )";																

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

	console.log("Params = " + params);

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
