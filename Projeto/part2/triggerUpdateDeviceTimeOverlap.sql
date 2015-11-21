-- This trigger throws an error when inserting
-- (serial number, nanufacturer, PAN) tuple whose time period
-- overlaps an already existing record.

drop trigger if exists update_overlapping_device_time;
delimiter $$

create trigger update_overlapping_device_time
before update
on Connects for each row

begin
	if exists (select * from Connects
		where new.pan = Connects.pan
		and new.snum = Connects.snum
		and new.manuf = Connects.manuf
		and new.start <= end    -- trying to insert after a perior that exists
		and new.end >= start	-- trying to insert before a perior that exists
		and start not in(		-- removing the old row from the matching
			select start from Connects
			where old.start = start)
		and end not in(			-- removing the old row from the matching
			select end from Connects
			where old.end = end)) then
		-- call a non-existing method to raise an error
		-- TODO: solve this in a safer way
		call overlapping_data();
end if;

end$$

delimiter ;
