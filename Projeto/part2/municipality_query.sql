drop procedure if exists municipality_query;

delimiter $$

create procedure municipality_query()
begin
	select name as 'Municipality', muni as 'Code', count(manuf) as 'Installed Devices'
	from Lives, Connects, Wears, Municipality
	where Connects.manuf = 'Philips'
	and Connects.pan = Wears.pan
	and Wears.patient = Lives.patient
	and Municipality.nut4code = muni
	and Connects.end >= NOW()
	and Wears.end >= NOW()
	and Lives.end >= NOW()
	group by muni
	having count(manuf) >= all(select count(manuf)
		from Lives, Connects, Wears
		where Connects.manuf = 'Philips'
		and Connects.pan = Wears.pan
		and Wears.patient = Lives.patient
		and Connects.end >= NOW()
		and Wears.end >= NOW()
		and Lives.end >= NOW()
		group by muni);

end$$

delimiter ;
