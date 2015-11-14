drop procedure if exists display_all_settings;

delimiter $$

create procedure display_all_settings(in p_name varchar(255))
begin
select Setting.datetime, Setting.snum, Setting.manuf, Actuator.units, Setting.value
from Patient, Wears, Connects, Setting, Actuator
where Patient.name = p_name
and Patient.number = Wears.patient
and Wears.pan = Connects.pan
and Connects.snum = Setting.snum
and Connects.manuf = Setting.manuf
and Setting.snum = Actuator.snum
and Setting.manuf = Actuator.manuf;
end$$

delimiter ;