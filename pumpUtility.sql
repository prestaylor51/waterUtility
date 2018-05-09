-- SQL for the pumputility database --


-- DROP all tables and data 
DROP TABLE pump_model, pump_station, suction, organization CASCADE;

-- PUMP_MODEL --
CREATE TABLE pump_model
(id 					SERIAL			PRIMARY KEY
,manufacturer 		VARCHAR(100) 
,model 				VARCHAR(100)	UNIQUE
,motor_hp			INT
,voltage			INT
,rmp				INT
,pwr_factor			NUMERIC(4,3)
,efficiency			NUMERIC(4,3)
,col_length			INT
,col_size			INT
,shaft_tube_size	NUMERIC(5,3)
,line_shaft_hp_loss	int
,col_pipe_c_factor	int
,stages				int
,specific_cap		int);
-- Need to store the manufacturer curve and test cure in BOLB column
-- END PUMP_MODEL --

-- ORGANIZATION --

CREATE TABLE organization 
(id 		SERIAL		PRIMARY KEY
 ,name		VARCHAR(100) NOT NULL
 );

-- END ORGANIZATION 

-- PUMP STATION
CREATE TABLE pump_station 
(id 					SERIAL			PRIMARY KEY
,station_number		VARCHAR(100)	NOT NULL
,model_id			INT				NOT NULL REFERENCES pump_model(id)
,organization_id	INT 			NOT NULL REFERENCES organization(id)
,flow_mgd			INT
,flow_gpm			INT
,tdh_ft				INT
);

-- SUCTION --
CREATE TABLE suction (
id 				SERIAL		PRIMARY KEY
,suciton_type	VARCHAR(100) 	NOT NULL);

-- well, 