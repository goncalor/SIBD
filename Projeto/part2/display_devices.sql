drop procedure if exists display_devices;

delimiter $$

create procedure display_devices(in p_name varchar(255))
begin
select snum, manuf
from Patient, Wears, Connects
where Patient.name = p_name
and Patient.number = Wears.patient
and Wears.end > NOW()
and Wears.pan = Connects.pan
and Connects.end > NOW();
end$$

delimiter ;