-- This trigger throws an error when inserting (PAN, patient) pair
-- whose time period overlaps an already existing record.

drop trigger if exists update_overlapping_patient_time;
delimiter $$

create trigger update_overlapping_patient_time
after update
on Wears for each row

begin
	if exists (select * from Wears
		where new.pan = Wears.pan
		and new.patient = Wears.patient
		and new.start <= end    -- trying to insert after a perior that exists
		and new.end >= start) 	-- trying to insert before a perior that exists
		and start not in(		-- removing the old row from the matching
			select start from Wears
			where old.start = start)
		and end not in(			-- removing the old row from the matching
			select end from Wears
			where old.end = end)) then

		-- call a non-existing method to raise an error
		-- TODO: solve this in a safer way
		call overlapping_data();
end if;

end$$

delimiter ;
