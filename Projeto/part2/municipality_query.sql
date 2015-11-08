drop procedure if exists municipality_query;

delimiter $$

create procedure municipality_query(out muni_out varchar(255))
begin
declare m_count integer;
select muni, count(manuf) into muni_out, m_count
from Lives, Connects, Wears
where Connects.manuf = 'Philips'
and Connects.pan = Wears.pan
and Wears.patient = Lives.patient
and Connects.end >= NOW()
and Wears.end >= NOW()
and Lives.end >= NOW()
group by muni
having m_count >= all(select count(manuf)
						from Lives, Connects, Wears
						where Connects.manuf = 'Philips'
						and Connects.pan = Wears.pan
						and Wears.patient = Lives.patient
						group by muni);

end$$
delimiter ;