-- What are all the readings of a patient (identified by his/her number)
-- in the last 6 months from devices with the words "blood pressure"
-- in the description field? 

drop procedure if exists queryReadings;

delimiter $$

create procedure queryReadings()
begin
	select distinct Wears.patient as 'Patient ID', Reading.snum, Reading.manuf, datetime, Sensor.units,Reading.value, Device.description
	from Reading, Wears, Connects, Device, Sensor
	where Wears.pan = Connects.pan 
	and Connects.snum = Reading.snum 
	and Connects.manuf = Reading.manuf 
	and Connects.snum = Device.serialnum 
	and Connects.manuf = Device.manufacturer 
	and Connects.snum = Sensor.snum
	and Reading.datetime BETWEEN DATE_SUB(NOW(), INTERVAL 6 MONTH) AND NOW()
	and Reading.datetime BETWEEN Connects.start and Connects.end
	and Reading.datetime BETWEEN Wears.start and Wears.end
	and lower(Device.description) like 'blood pressure'
	order by Wears.patient;
end$$

delimiter ;
