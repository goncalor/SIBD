drop procedure if exists blow_up_insert1;

delimiter $$

create procedure blow_up_insert1()
begin
	insert into Connects values ('2014-08-09 00:00:00', '2099-01-01 00:00:00', 'C3333'	,'Philips'	,'www.ist2222.com');
end$$

delimiter ;
