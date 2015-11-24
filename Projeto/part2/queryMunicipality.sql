-- Which municipality has currently (now) the highest number of
-- installed devices from manufacturer "Philips?"

drop procedure if exists queryMunicipality;

delimiter $$

create procedure queryMunicipality()
begin
	select name as 'Municipality', muni as 'Code', count(manuf) as 'Installed Devices'
	from Lives, Connects, Wears, Municipality
	where lower(Connects.manuf) = 'philips'
	and Connects.pan = Wears.pan
	and Wears.patient = Lives.patient
	and Municipality.nut4code = muni
	and NOW() BETWEEN Connects.start AND Connects.end
	and NOW() BETWEEN Wears.start AND Wears.end
	and NOW() BETWEEN Lives.start AND Lives.end
	group by muni
	having count(manuf) >= all(select count(manuf)
		from Lives, Connects, Wears
		where lower(Connects.manuf) = 'philips'
		and Connects.pan = Wears.pan
		and Wears.patient = Lives.patient
		and NOW() BETWEEN Connects.start AND Connects.end
		and NOW() BETWEEN Wears.start AND Wears.end
		and NOW() BETWEEN Lives.start AND Lives.end
		group by muni);

end$$

delimiter ;
