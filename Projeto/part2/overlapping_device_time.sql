
drop trigger if exists overlapping_device_time;
delimiter $$

create trigger overlapping_device_time
before insert
on Connects for each row

begin
	if exists (select * from Connects
		where new.pan = Connects.pan
		and new.snum = Connects.snum
		and new.manuf = Connects.manuf
		and start <= new.end
		and end >= new.start) then
		call overlapping_data();
end if;

end$$

delimiter ;
