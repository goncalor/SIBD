-- This trigger throws an error when inserting
-- (serial number, nanufacturer, PAN) tuple whose time period
-- overlaps an already existing record.

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
		and start <= new.end    -- trying to insert before a perior that exists
		and end >= new.start) then    -- trying to insert after a perior that exists

		-- call a non-existing method to raise an error
		-- TODO: solve this in a safer way
		call overlapping_data();
end if;

end$$

delimiter ;
