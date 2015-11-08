create table Patient(
	number		decimal(9,0),
	name		varchar(255),
	address		varchar(255),
	primary key(number)
);

create table PAN(
	domain			varchar(255),
	phone			decimal(9,0),
	primary key(domain)
);

create table Device(
	serialnum		varchar(30),
	manufacturer	varchar(30),
	description		varchar(255),
	primary key(serialnum, manufacturer)
);

create table Sensor(
	serialnum		varchar(30),
	manufacturer	varchar(30),
	units			varchar(255),
	primary key(serialnum, manufacturer),
	foreign key(serialnum, manufacturer) references Device(serialnum, manufacturer)
);

create table Actuator(
	serialnum		varchar(30),
	manufacturer	varchar(30),
	units			varchar(255),
	primary key(serialnum, manufacturer),
	foreign key(serialnum, manufacturer) references Device(serialnum, manufacturer)
);

create table Municipality(
	nut4code		decimal(5,0),
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
	foreign key(snum, manuf) references Sensor(serialnum, manufacturer)
);

create table Setting ( 
	snum			varchar(30),
	manuf			varchar(30),
	datetime		datetime,
	value			decimal(5,1),
	primary key(snum, manuf, datetime),
	foreign key(snum, manuf) references Sensor(serialnum, manufacturer)
);

create table Wears(
	start			datetime,
	end				datetime,
	patient			decimal(9,0),
	pan				varchar(255),
	primary key(start, end, patient),
	foreign key(start, end) references Period(start, end),
	foreign key(patient) references Patient(number),
	foreign key(pan) references PAN(domain)
);

create table Lives(
	start			datetime,
	end				datetime,
	patient			decimal(9,0),
	muni			decimal(5,0),
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
