-- Which manufacturers had devices described as "scale" being worn
-- last year in all municipalities covered by the medical centre?

drop procedure if exists manufacturer_query;

delimiter $$

create procedure manufacturer_query()
begin
	select manufacturer as 'Manufacturer' -- the manufacturer was in all muni's, don't display muni?
	from Device, Lives, Connects, Wears
	where lower(description) like 'scale' 
	and Device.serialnum = Connects.snum 
	and Connects.pan = Wears.pan
	and Wears.patient = Lives.patient
	and Wears.end > DATE_SUB(NOW(), INTERVAL 1 YEAR) 
	and Lives.end > DATE_SUB(NOW(), INTERVAL 1 YEAR)
	and Wears.start <= Lives.end -- we also have to guarantee that the wear and live dates overlap
	and Wears.end >= Lives.end
	group by manufacturer -- check if each manufacturer was present in all muni's
	having count(distinct Lives.muni) = (select count(nut4code) from Municipality);
end$$

delimiter ;
