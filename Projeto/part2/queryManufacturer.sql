drop procedure if exists manufacturer_query;

delimiter $$

create procedure manufacturer_query()
begin
select distinct manufacturer
from Device as d
where not exists(
	select nut4code
	from Municipality
	where nut4code not in(
		select muni
		from Connects, Device as d2, Wears, Lives
		where description like 'scale'
		and d2.serialnum = Connects.snum
		and Connects.pan = Wears.pan
		and Wears.patient = Lives.patient
		and d2.manufacturer = d.manufacturer
		and Wears.end > DATE_SUB(NOW(), INTERVAL 1 YEAR) 
and Lives.end > DATE_SUB(NOW(), INTERVAL 1 YEAR)
and Connects.end > DATE_SUB(NOW(), INTERVAL 1 YEAR)));

end$$

delimiter ;