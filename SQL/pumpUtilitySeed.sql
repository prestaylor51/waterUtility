-- MANUFACTURER SEED
INSERT INTO manufacturer 
VALUES
(nextval('manufacturer_id_seq')
,'Floway');

-- SERVICE ZONE SEED
INSERT INTO service_zone
VALUES
(nextval('service_zone_id_seq')
,'Desert Wells');

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
,'27 FKH'
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
,null);

-- PUMP STATION SEED
INSERT INTO pump_station
VALUES
(nextval('pump_station_id_seq')
,'SBDWPS'
,1
,1
,11.00
,7640
,207
,1473.00
,1444.50
,1
);
-- PUMP SEED
-- SUCTION SEED
-- PUMP TEST

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
