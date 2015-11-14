
drop trigger if exists overlapping_patient_time;
delimiter $$

CREATE TRIGGER overlapping_patient_time
BEFORE INSERT
   ON Wears FOR EACH ROW

BEGIN
	if exists (select * from Wears
             where new.pan = Wears.pan
             and new.patient = Wears.patient
             and start <= new.end
             and end >= new.start) then
    call overlapping_data();
  end if;

END$$

delimiter ;