-- Pump Assesment Utility 
-- DROP all tables and data 
DROP TABLE manufacturer, service_zone, organization, pump_model, pump_station, pump, suction, pump_test CASCADE;

-- MANUFACTURER
CREATE TABLE manufacturer
(id Serial PRIMARY KEY
,name VARCHAR(100)
);

-- SERVICE ZONE
CREATE TABLE service_zone
(
id 	SERIAL PRIMARY KEY
,name 	VARCHAR(100)
);

-- ORGANIZATION --
CREATE TABLE organization 
(id 		SERIAL		PRIMARY KEY
 ,name		VARCHAR(100) NOT NULL
 );

-- SUCTION --
CREATE TABLE suction (
id 				SERIAL		PRIMARY KEY
,suction_type	VARCHAR(100) 	NOT NULL);

-- PUMP_MODEL --
CREATE TABLE pump_model
(id 					SERIAL		PRIMARY KEY
,manufacturer 		INT 			REFERENCES manufacturer(id) 
,model_number 		VARCHAR(100)	UNIQUE
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
,specific_cap		int
,impeller_trim_in	NUMERIC(4, 2)
,manufacturer_curve BYTEA)	;
-- Need to store the manufacturer curve and test cure in BOLB column
-- Turns out there can be a multiple manufacturers that make the same model 

-- PUMP STATION
CREATE TABLE pump_station 
(id 					SERIAL			PRIMARY KEY
,station_number		VARCHAR(100)		UNIQUE NOT NULL
,organization_id	INT 				NOT NULL REFERENCES organization(id)
,flow_mgd			NUMERIC(4, 2)
,flow_gpm			INT
,tdh_ft				INT
,pump_dis_hdr_cl_elev_ft 	NUMERIC(6,2)
,res_floor_elev				NUMERIC(6,2)
,service_zone		INT  				NOT NULL REFERENCES	service_zone(id)
);

-- PUMP
CREATE TABLE pump
(id 				SERIAL PRIMARY KEY
,pump_model_id		INT NOT NULL REFERENCES pump_model(id)
,pump_station_id	INT NOT NULL REFERENCES pump_station(id)
,pump_number		int NOT NULL
,serial_number		VARCHAR(20)    -- unique????
,install_date		DATE
,test_curve			BYTEA 
,is_active			BOOL	NOT NULL
);

-- PUMP TEST
CREATE TABLE pump_test
(id  				SERIAL	PRIMARY	KEY	
,pump_id			INT NOT NULL REFERENCES pump(id)
,test_number   		INT	
,test_date  		DATE				
,speed_percent		INT	
,res_level_ft		NUMERIC(4, 2)
,pmp_flg_psi		NUMERIC(4, 1)
,header_psi			NUMERIC(3, 1)
,dis_flow_mgd		NUMERIC(2, 1)
,amps_1			NUMERIC(3, 1)
,amps_2			NUMERIC(3, 1)
,amps_3			NUMERIC(3, 1)
,volts_1			INT	
,volts_2			INT	
,volts_3			INT	
);

-- well, 
-- Where should Suction be included as foreign key