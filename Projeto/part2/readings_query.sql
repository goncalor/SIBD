drop procedure if exists readings_query;

delimiter $$

create procedure readings_query(in p_number varchar(255))
begin
select datetime, value
from Reading, Wears, Connects, Device
where p_number = Wears.patient 
and Wears.pan = Connects.pan 
and Connects.snum = Reading.snum 
and Connects.manuf = Reading.manuf 
and Reading.datetime > DATE_SUB(NOW(), INTERVAL 6 MONTH)
and Connects.snum = Device.serialnum 
and Connects.manuf = Device.manufacturer 
and Device.description LIKE 'blood pressure';
end$$
delimiter ;