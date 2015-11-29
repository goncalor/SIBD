drop procedure if exists blow_up_insert2;

delimiter $$

create procedure blow_up_insert2()
begin
	insert into Wears values ('2014-02-20 00:00:00'	,'2014-06-10 00:00:00'	,111111111	,'www.ist1111.com');
end$$

delimiter ;
