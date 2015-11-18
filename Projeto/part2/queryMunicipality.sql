-- Which municipality has currently (now) the highest number of
-- installed devices from manufacturer "Philips?"

drop procedure if exists municipality;

delimiter $$

create procedure municipality()
begin
	select name as 'Municipality', muni as 'Code', count(manuf) as 'Installed Devices'
	from Lives, Connects, Wears, Municipality
	where lower(Connects.manuf) = 'philips'
	and Connects.pan = Wears.pan
	and Wears.patient = Lives.patient
	and Municipality.nut4code = muni
	and Connects.end >= NOW()
	and Wears.end >= NOW()
	and Lives.end >= NOW()
	group by muni
	-- TODO: check what happens when two municipalities have the same count
	having count(manuf) >= all(select count(manuf)
		from Lives, Connects, Wears
		where lower(Connects.manuf) = 'philips'
		and Connects.pan = Wears.pan
		and Wears.patient = Lives.patient
		and Connects.end >= NOW()
		and Wears.end >= NOW()
		and Lives.end >= NOW()
		group by muni);

end$$

delimiter ;
