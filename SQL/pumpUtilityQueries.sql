-- Queries for the Utility 

-- all info on a specific pump

SELECT p.pump_number  AS "Pump #"
		,pm.model_number AS "Model #"
		,m.name AS "Manufacturer"
FROM pump p
JOIN pump_model pm
	ON p.pump_model_id = pm.id
JOIN pump_station ps 
	ON p.pump_station_id = ps.id
JOIN manufacturer m 
	ON pm.manufacturer = m.id;


-- INSERT PUMP TEST
INSERT INTO pump_test
VALUES
(nextval(''pump_test_seq)	-- id
, (SELECT id FROM pump p
	WHERE (SELECT id FROM pump_model pm
				WHERE pm.model_number = </**/>) = p.pump_model_id
	AND (SELECT id FROM pump_station ps
				WHERE ps.station_number = </**/>) = p.pump_station_id				
	AND p.pump_number = </**/> AND p.serial_number = </**/> AND p.is_active = <>) -- pump_id
,<>		-- test_number
,<>		-- test_date
,<>		-- speed_percent
,<>		-- res_level_ft
,<>		-- pmp_flg_psi
,<>		-- header_psi
,<>		-- dis_flow_mgd
,<>		-- amps_1
,<>		-- amps_2
,<>		-- amps_3
,<>		-- volts_1
,<>		-- volts_2
,<>		-- volts_3
);

Insert into pump_test
VALUES
(nextval('pump_test_id_seq')
,(SELECT id FROM pump p
	WHERE (SELECT id FROM pump_model pm
				WHERE pm.model_number = '22BLK') = p.pump_model_id
	AND (SELECT id FROM pump_station ps
				WHERE ps.station_number = 'SBFFPS') = p.pump_station_id				
	AND p.pump_number = 1 AND p.serial_number = '78639-1-1' AND p.is_active = 't')
,1
,'2018-2-15'
,100
,23.05
,133.2
,58.5 
,0.00 
,59
,59
,59
,4070
,4070
,4070);

SELECT p.id FROM pump p													
		WHERE (SELECT pm.id FROM pump_model pm										
				WHERE pm.model_number = '22BLK') = p.pump_model_id					
		AND (SELECT ps.id FROM pump_station ps										
				WHERE ps.station_number = 'SBFFPS') = p.pump_station_id				
		AND p.pump_number = 1 											
		AND p.serial_number = '78639-1-1' 												
		AND p.is_active = 't';

Select p.id from pump p 
	JOIN pump_model pm
		ON p.pump_model_id = pm.model_number
	JOIN 

/* Data Retrieval */

SELECT id FROM pump p
	WHERE (SELECT id FROM pump_model pm
			WHERE pm.model_number = </**/>) = p.pump_model_id
					AND (SELECT id FROM pump_station ps
						WHERE ps.station_number = </**/>) = p.pump_station_id				
					AND p.pump_number = </**/> 
					AND p.serial_number = </**/> 
					AND p.is_active = <>

SELECT * FROM pump_test
WHERE pump_id = (SELECT id FROM pump p
					WHERE (SELECT id FROM pump_model pm
							WHERE pm.model_number = </**/>) = p.pump_model_id
									AND (SELECT id FROM pump_station ps
										WHERE ps.station_number = </**/>) = p.pump_station_id				
									AND p.pump_number = </**/> 
									AND p.serial_number = </**/> 
									AND p.is_active = <>)
	AND test_date > </**/>
	AND test_date < </**/>

SELECT * FROM pump_test
WHERE pump_id = (SELECT id FROM pump p
					WHERE (SELECT id FROM pump_model pm
							WHERE pm.model_number = '22BLK') = p.pump_model_id
									AND (SELECT id FROM pump_station ps
										WHERE ps.station_number = 'SBFFPS') = p.pump_station_id				
									AND p.pump_number = 1 
									AND p.serial_number = '78639-1-1' 
									AND p.is_active = 'true')
	AND test_date >= '2016-01-01'
	AND test_date <= '2017-01-01';

-- Get all test dates for a pump

SELECT DISTINCT test_date FROM pump_test pt
WHERE pump_id = (SELECT p.id FROM pump p													
		WHERE (SELECT pm.id FROM pump_model pm										
				WHERE pm.model_number = <model>) = p.pump_model_id					
		AND (SELECT ps.id FROM pump_station ps										
				WHERE ps.station_number = <station>) = p.pump_station_id				
		AND p.pump_number = <pumpNo> 											
		AND p.serial_number = <serial> 												
		AND p.is_active = 't')

SELECT DISTINCT test_date FROM pump_test pt
WHERE pump_id = (SELECT p.id FROM pump p													
		WHERE (SELECT pm.id FROM pump_model pm										
				WHERE pm.model_number = '22BLK') = p.pump_model_id					
		AND (SELECT ps.id FROM pump_station ps										
				WHERE ps.station_number = 'SBFFPS') = p.pump_station_id				
		AND p.pump_number = 1 											
		AND p.serial_number = '78639-1-3' 												
		AND p.is_active = 't');