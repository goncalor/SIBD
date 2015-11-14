
drop trigger if exists overlapping_patient_time;
delimiter $$

create trigger overlapping_patient_time
before insert
on Wears for each row

begin
	if exists (select * from Wears
		where new.pan = Wears.pan
		and new.patient = Wears.patient
		and start <= new.end
		and end >= new.start) then
		call overlapping_data();
end if;

end$$

delimiter ;
