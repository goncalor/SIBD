drop procedure if exists display_all_readings;

delimiter $$

create procedure display_all_readings(in p_name varchar(255))
begin
	select Reading.datetime, Reading.snum, Reading.manuf, Sensor.units, Reading.value
	from Patient, Wears, Connects, Reading, Sensor
	where Patient.name = p_name
	and Patient.number = Wears.patient
	and Wears.pan = Connects.pan
	and Connects.snum = Reading.snum
	and Connects.manuf = Reading.manuf
	and Reading.snum = Sensor.snum
	and Reading.manuf = Sensor.manuf;
end$$

delimiter ;
