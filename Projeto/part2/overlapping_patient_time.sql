delimiter $$

CREATE TRIGGER overlapping_patient_time
BEFORE INSERT
   ON Wears FOR EACH ROW

BEGIN
	if exists (select * from Wears
             where start <= new.end
             and end >= new.start) then
    signal sqlstate '45000' SET MESSAGE_TEXT = 'Overlaps with existing data';
  end if;

END$$

delimiter ;