	insert into Patient values (444444444, 'Max', 'Porto');
	insert into Patient values (555555555, 'Toecutter', 'Lisboa');
	insert into Patient values (666666666, 'Humongus', 'Faro');

	insert into PAN values ('www.porto1.com',966666666);
	insert into PAN values ('www.lisboa1.com',966666666);
	insert into PAN values ('www.faro1.com',966666666);

	insert into Device values ('P1P', 'Philips','scale');
	insert into Device values ('L1P', 'Philips','scale');
	insert into Device values ('F1P', 'Philips','scale');


	insert into Wears values ('2014-12-30 00:00:00'	,'2099-01-01 00:00:00'	,444444444	,'www.porto1.com');
	insert into Wears values ('2014-12-30 00:00:00'	,'2099-01-01 00:00:00'	,555555555	,'www.lisboa1.com');
	insert into Wears values ('2014-12-30 00:00:00'	,'2099-01-01 00:00:00'	,666666666	,'www.faro1.com');

	insert into Lives values ('2015-10-30 00:00:00'	,'2099-01-01 00:00:00'	,444444444	,11111);
	insert into Lives values ('2015-10-30 00:00:00'	,'2099-01-01 00:00:00'	,555555555	,22222);
	insert into Lives values ('2015-10-30 00:00:00'	,'2099-01-01 00:00:00'	,666666666	,33333);

	insert into Connects values('2015-10-30 00:00:00'	,'2099-01-01 00:00:00'	,'P1P'	,'Philips'		,'www.porto1.com');
	insert into Connects values('2015-10-30 00:00:00'	,'2099-01-01 00:00:00'	,'L1P'	,'Philips'		,'www.lisboa1.com');
	insert into Connects values('2015-10-30 00:00:00'	,'2099-01-01 00:00:00'	,'F1P'	,'Philips'		,'www.faro1.com');
