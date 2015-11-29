drop procedure if exists blow_up_update1;

delimiter $$

create procedure blow_up_update1()
begin
	update Connects set start='2014-12-30 00:00:00', end='2099-01-01 00:00:00'
	where snum='C3333'
	and manuf='Philips'
	and pan='www.ist2222.com'
	and start='2015-01-10 00:00:00'
	and end = '2015-02-22 00:00:00';
end$$

delimiter ;
