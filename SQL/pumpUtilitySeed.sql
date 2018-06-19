-- MANUFACTURER SEED
INSERT INTO manufacturer 
VALUES
(nextval('manufacturer_id_seq')
,'Floway');

-- SERVICE ZONE SEED
INSERT INTO service_zone
VALUES
(nextval('service_zone_id_seq')
,'Desert Wells'),
(nextval('service_zone_id_seq')
,'Falcon Filed');

-- ORGANIZATION SEED
INSERT INTO organization 
VALUES
(nextval('organization_id_seq')
,'Resource Department');

-- PUMP MODEL SEED
INSERT INTO pump_model
VALUES
(nextval('pump_model_id_seq')
,1
,'27FKH'
,500
,4160
,1190
,0.8
,0.92
,null
,null
,null
,null
,null
,2
,null
,15.69
,null),
(nextval('pump_model_id_seq')
,1
,'22BLK'
,250
,4160
,1785
,0.8
,0.9
,null
,null
,null
,null
,null
,null
,null
,null
,null);

-- PUMP STATION SEED
INSERT INTO pump_station
VALUES
(nextval('pump_station_id_seq')
,'SBDWPS'
,1
,11.00
,7640
,207
,1473.00
,1444.50
,1),
(nextval('pump_station_id_seq')
,'SBFFPS'
,1
,8.01
,5560
,120
,1473.00
,1444.50
,2);


-- PUMP SEED
INSERT INTO pump
VALUES
(nextval('pump_id_seq')
,1
,1
,4
,'78639-9-1'
,'2018-6-5'
,null
,'true'),
(nextval('pump_id_seq')
,1
,1
,5
,'78639-9-2'
,'2018-1-1'
,null
,'true'),
(nextval('pump_id_seq')
,2
,2
,1
,'78639-1-1'
,'2018-1-1'
,null
,'true'),
(nextval('pump_id_seq')
,2
,2
,1
,'78639-1-1'
,'2018-1-1'
,null
,'true');

-- SUCTION SEED

-- PUMP TEST
INSERT INTO pump_test
VALUES 
(nextval('pump_test_id_seq')
,1
,1
,'2018-4-16'
,100
,23.05
,133.2
,58.5
,0.00
,59
,4070);

-- Seed some pump models --

-- well pumps will have:
-- 	column size 
-- 	column length 
-- 	shaft tube length 
-- 	line shaft hp loss 
-- 	column pipe c factor 
-- 	specific capacity
-- 	col piping length ? 
-- 	col piping diameter ?
