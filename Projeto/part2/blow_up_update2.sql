drop procedure if exists blow_up_update2;

delimiter $$

create procedure blow_up_update2()
begin
	update Wears set start='2015-02-11 00:00:00', end='2015-03-11 00:00:00'
	where patient=333333333
	and pan = 'www.ist6666.com'
	and pan='www.ist2222.com'
	and start='2014-12-30 00:00:00'
	and end = '2099-01-01 00:00:00';
end$$

delimiter ;
