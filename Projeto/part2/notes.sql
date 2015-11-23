select start, end, snum, manuf, pan from Connects where pan = 'www.ist1111.com';
update Connects set start='2015-11-23 16:36:45', end='2099-01-01 00:00:00', pan='www.ist4444.com' where snum='B3333' and manuf='Aki';
select * from Period orderby start desc;
