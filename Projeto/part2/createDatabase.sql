-- Disable foreign key checking while dropping the tables. Otherwise
-- tables must be dropped in a specific order such that foreign
-- keys' constraints are not infringed.
set foreign_key_checks=0;
drop table if exists Actuator;
drop table if exists Connects;
drop table if exists Device;
drop table if exists Lives;
drop table if exists Municipality;
drop table if exists PAN;
drop table if exists Patient;
drop table if exists Period;
drop table if exists Reading;
drop table if exists Sensor;
drop table if exists Setting;
drop table if exists Wears;
set foreign_key_checks=1;

create table Patient(
	number		integer(9) unsigned,
	name		varchar(255),
	address		varchar(255),
	primary key(number)
);

create table PAN(
	domain			varchar(255),
	phone			integer(9) unsigned,
	primary key(domain)
);

create table Device(
	serialnum		varchar(30),
	manufacturer	varchar(30),
	description		varchar(255),
	primary key(serialnum, manufacturer)
);

create table Sensor(
	snum			varchar(30),
	manuf			varchar(30),
	units			varchar(50),
	primary key(snum, manuf),
	foreign key(snum, manuf) references Device(serialnum, manufacturer)
);

create table Actuator(
	snum			varchar(30),
	manuf			varchar(30),
	units			varchar(50),
	primary key(snum, manuf),
	foreign key(snum, manuf) references Device(serialnum, manufacturer)
);

create table Municipality(
	nut4code		integer(5) unsigned,
	name			varchar(255),
	primary key(nut4code)
);

create table Period(
	start			datetime,
	end				datetime,
	primary key(start, end)
);

create table Reading(
	snum			varchar(30),
	manuf			varchar(30),
	datetime		datetime, 
	value			decimal(5,1),
	primary key(snum, manuf, datetime),
	foreign key(snum, manuf) references Sensor(snum, manuf)
);

create table Setting ( 
	snum			varchar(30),
	manuf			varchar(30),
	datetime		datetime,
	value			decimal(5,1),
	primary key(snum, manuf, datetime),
	foreign key(snum, manuf) references Actuator(snum, manuf)
);

create table Wears(
	start			datetime,
	end				datetime,
	patient			integer(9) unsigned,
	pan				varchar(255),
	primary key(start, end, patient),
	foreign key(start, end) references Period(start, end),
	foreign key(patient) references Patient(number),
	foreign key(pan) references PAN(domain)
);

create table Lives(
	start			datetime,
	end				datetime,
	patient			integer(9) unsigned,
	muni			integer(5) unsigned,
	primary key(start, end, patient),
	foreign key(start, end) references Period(start, end),
	foreign key(patient) references Patient(number),
	foreign key(muni) references Municipality(nut4code)
);

create table Connects(
	start			datetime,
	end				datetime,
	snum			varchar(30),
	manuf			varchar(30),
	pan				varchar(21),
	primary key(start, end, snum, manuf),
	foreign key(start, end) references Period(start, end),
	foreign key(snum, manuf) references Device(serialnum, manufacturer),
	foreign key(pan) references PAN(domain)
);


-- Set up triggers
-- Trigger creation will raise warnings since we previously dropped the
--   tables the triggers were associated with. Dropping the tables also drops
--   the triggers.

source overlapping_device_time.sql;
source overlapping_patient_time.sql;

-- Set up procedures

source display_all_readings.sql;
source display_all_settings.sql;
source display_devices.sql;
