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
