delimiter $$

CREATE TRIGGER overlapping_device_time
BEFORE INSERT
   ON Connects FOR EACH ROW

BEGIN
	if exists (select * from Connects
             where start <= new.end
             and end >= new.start) then
    signal sqlstate '45000' SET MESSAGE_TEXT = 'Overlaps with existing data';
  end if;

END$$

delimiter ;