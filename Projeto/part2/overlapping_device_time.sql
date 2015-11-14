drop trigger if exists overlapping_device_time;

delimiter $$

CREATE TRIGGER overlapping_device_time
BEFORE INSERT
   ON Connects FOR EACH ROW

BEGIN
	if exists (select * from Connects
             where new.pan = Connects.pan
             and new.snum = Connects.snum
             and new.manuf = Connects.manuf
             and start <= new.end
             and end >= new.start) then
    call overlapping_data();
  end if;

END$$

delimiter ;