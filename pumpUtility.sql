-- SQL for the pumputility database --


-- DROP all tables and data 
DROP TABLE pump_model, pump_description, suction CASCADE;

-- PUMP_MODEL --
CREATE TABLE pump_model(
id 					SERIAL			PRIMARY KEY
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

-- END PUMP_MODEL --

-- PUMP DESRCIPTION
CREATE TABLE pump_description (
id 					SERIAL			PRIMARY KEY
,model_id			int				NOT NULL REFERENCES pump_model(id));

-- SUCTION --
CREATE TABLE suction (
id 				SERIAL		PRIMARY KEY
,suciton_type	VARCHAR(100) 	NOT NULL);

-- well, 