drop procedure if exists manufacturer_query;

delimiter $$

create procedure manufacturer_query(out manuf_out varchar(255))
begin
select manufacturer into manuf_out
from Device, Lives, Connects, Wears
where description like 'scale'
and Device.serialnum = Connects.snum
and Connects.pan = Wears.pan
and Wears.patient = Lives.patient
and Wears.end > DATE_SUB(NOW(), INTERVAL 1 YEAR)
and Lives.end > DATE_SUB(NOW(), INTERVAL 1 YEAR);
end$$

delimiter ;