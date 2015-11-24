-- What are all the readings of a patient (identified by his/her number)
-- in the last 6 months from devices with the words "blood pressure"
-- in the description field? 

drop procedure if exists queryReadings;

delimiter $$

create procedure queryReadings(in p_number varchar(255))
begin
	select datetime, value
	from Reading, Wears, Connects, Device
	where p_number = Wears.patient 
	and Wears.pan = Connects.pan 
	and Connects.snum = Reading.snum 
	and Connects.manuf = Reading.manuf 
	and Connects.snum = Device.serialnum 
	and Connects.manuf = Device.manufacturer 
	and Reading.datetime > DATE_SUB(NOW(), INTERVAL 6 MONTH)
	and lower(Device.description) like 'blood pressure';
end$$

delimiter ;
