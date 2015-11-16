-- This trigger throws an error when inserting (PAN, patient) pair
-- whose time period overlaps an already existing record.

drop trigger if exists overlapping_patient_time;
delimiter $$

create trigger overlapping_patient_time
before insert
on Wears for each row

begin
	if exists (select * from Wears
		where new.pan = Wears.pan
		and new.patient = Wears.patient
		and new.start <= end    -- trying to insert after a perior that exists
		and new.end >= start) then    -- trying to insert before a perior that exists

		-- call a non-existing method to raise an error
		-- TODO: solve this in a safer way
		call overlapping_data();
end if;

end$$

delimiter ;
