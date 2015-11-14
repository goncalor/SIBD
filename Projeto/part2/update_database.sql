	insert into Patient values (111111111, 'Ana', 'Porto');
	insert into Patient values (222222222,'Beatriz','Lisboa');
	insert into Patient values (333333333, 'Xavier', 'Faro');

	insert into PAN values ('www.ist1111.com',911111111);
	insert into PAN values ('www.ist2222.com',922222222);
	insert into PAN values ('www.ist3333.com',933333333);
	insert into PAN values ('www.ist4444.com',944444444);
	insert into PAN values ('www.ist5555.com',955555555);
	insert into PAN values ('www.ist6666.com',966666666);

	insert into Device values ('A1111', 'Ola','blood pressure');
	insert into Device values ('B1111', 'Aki','scale');
	insert into Device values ('C1111', 'Philips','scale');
	insert into Device values ('A2222', 'Ola','scale');
	insert into Device values ('B2222', 'Aki','blood pressure');
	insert into Device values ('C2222', 'Philips','blood pressure');
	insert into Device values ('A3333', 'Ola','blood pressure');
	insert into Device values ('B3333', 'Aki','scale');
	insert into Device values ('C3333', 'Philips','blood pressure');

	insert into Sensor values ('A1111', 'Ola','Pa');
	insert into Sensor values ('B1111', 'Aki','gram');
	insert into Sensor values ('C1111', 'Philips','gram');
	insert into Sensor values ('A2222', 'Ola','gram');
	insert into Sensor values ('B2222', 'Aki','Pa');
	insert into Sensor values ('C2222', 'Philips','Pa');
	insert into Sensor values ('A3333', 'Ola','Pa');
	insert into Sensor values ('B3333', 'Aki','gram');
	insert into Sensor values ('C3333', 'Philips','Pa');

	insert into Actuator values ('A1111', 'Ola','miligram');
	insert into Actuator values ('B2222', 'Aki','miligram');
	insert into Actuator values ('C2222', 'Philips','miligram');
	insert into Actuator values ('A3333', 'Ola','miligram');
	insert into Actuator values ('C3333', 'Philips','miligram');

	insert into Municipality values (11111, 'Porto');
	insert into Municipality values (22222, 'Lisboa');
	insert into Municipality values (33333, 'Faro');

	insert into Period values ('2014-01-20 00:00:00','2014-06-10 00:00:00');
	insert into Period values ('2014-06-20 00:00:00','2099-01-01 00:00:00');
	insert into Period values ('2015-10-30 00:00:00','2099-01-01 00:00:00');
	insert into Period values ('2015-01-10 00:00:00','2015-02-22 00:00:00');
	insert into Period values ('2014-12-30 00:00:00','2099-01-01 00:00:00');
	insert into Period values ('2014-12-01 00:00:00','2099-01-01 00:00:00');
	insert into Period values ('2015-02-11 00:00:00','2015-03-11 00:00:00');
	insert into Period values ('2014-01-01 00:00:00','2014-03-02 00:00:00');
	insert into Period values ('2014-08-09 00:00:00','2099-01-01 00:00:00');
	insert into Period values ('2014-02-23 00:00:00','2014-06-10 00:00:00');
	insert into Period values ('2014-02-20 00:00:00','2014-06-10 00:00:00');
	insert into Period values ('2014-02-28 00:00:00','2014-06-10 00:00:00');

	insert into Reading values ('A1111'	,'Ola'		,'2014-01-20 00:00:00'	,10.1);
	insert into Reading values ('A1111'	,'Ola'		,'2015-10-30 00:00:00'	,20.8);
	insert into Reading values ('A1111'	,'Ola'		,'2014-12-01 00:00:00'	,1.2);
	insert into Reading values ('B1111'	,'Aki'		,'2015-02-22 00:00:00'	,11);
	insert into Reading values ('B1111'	,'Aki'		,'2014-03-02 00:00:00'	,22);
	insert into Reading values ('B1111'	,'Aki'		,'2014-06-10 00:00:00'	,33);
	insert into Reading values ('C1111'	,'Philips'	,'2015-03-11 00:00:00'	,10);
	insert into Reading values ('C1111'	,'Philips'	,'2015-01-10 00:00:00'	,5);
	insert into Reading values ('C1111'	,'Philips'	,'2014-08-09 00:00:00'	,9);
	insert into Reading values ('A2222'	,'Ola'		,'2014-01-01  00:00:00'	,22);
	insert into Reading values ('A2222'	,'Ola'		,'2014-06-20 00:00:00'	,33);
	insert into Reading values ('A2222'	,'Ola'		,'2015-10-30 00:00:00'	,44);
	insert into Reading values ('B2222'	,'Aki'		,'2014-01-20 00:00:00'	,10);
	insert into Reading values ('B2222'	,'Aki'		,'2015-10-30 00:00:00'	,5);
	insert into Reading values ('B2222'	,'Aki'		,'2014-12-01 00:00:00'	,9);
	insert into Reading values ('C2222'	,'Philips'	,'2015-02-22 00:00:00'	,22);
	insert into Reading values ('C2222'	,'Philips'	,'2014-03-02 00:00:00'	,33);
	insert into Reading values ('A3333'	,'Ola'		,'2014-06-10 00:00:00'	,44);
	insert into Reading values ('B3333'	,'Aki'		,'2015-03-11 00:00:00'	,1.2);
	insert into Reading values ('B3333'	,'Aki'		,'2015-01-10 00:00:00'	,11);
	insert into Reading values ('B3333'	,'Aki'		,'2014-08-09 00:00:00'	,22);
	insert into Reading values ('C3333'	,'Philips'	,'2014-01-01  00:00:00'	,9);
	insert into Reading values ('C3333'	,'Philips'	,'2014-06-20 00:00:00'	,44);

	insert into Setting values ('A1111'	,'Ola'		,'2014-01-20 00:00:00'	,5.1);
	insert into Setting values ('A1111'	,'Ola'		,'2015-10-30 00:00:00'	,30.1);
	insert into Setting values ('A1111'	,'Ola'		,'2014-12-01 00:00:00'	,20.1);
	insert into Setting values ('B2222'	,'Aki'		,'2014-01-20 00:00:00'	,12);
	insert into Setting values ('B2222'	,'Aki'		,'2015-10-30 00:00:00'	,4);
	insert into Setting values ('B2222'	,'Aki'		,'2014-12-01 00:00:00'	,3);
	insert into Setting values ('C2222'	,'Philips'	,'2015-02-22 00:00:00'	,11);
	insert into Setting values ('C2222'	,'Philips'	,'2014-03-02 00:00:00'	,65);
	insert into Setting values ('A3333'	,'Ola'		,'2014-06-10 00:00:00'	,31);
	insert into Setting values ('C3333'	,'Philips'	,'2014-01-01  00:00:00'	,90);
	insert into Setting values ('C3333'	,'Philips'	,'2014-06-20 00:00:00'	,66);

	insert into Wears values ('2014-01-20 00:00:00'	,'2014-06-10 00:00:00'	,111111111	,'www.ist1111.com');
	insert into Wears values ('2014-06-20 00:00:00'	,'2099-01-01 00:00:00'	,111111111	,'www.ist4444.com');
	insert into Wears values ('2015-01-10 00:00:00'	,'2015-02-22 00:00:00'	,222222222	,'www.ist2222.com');
	insert into Wears values ('2015-10-30 00:00:00'	,'2099-01-01 00:00:00'	,222222222	,'www.ist5555.com');
	insert into Wears values ('2014-01-01 00:00:00'	,'2014-03-02 00:00:00'	,333333333	,'www.ist3333.com');
	insert into Wears values ('2014-12-30 00:00:00'	,'2099-01-01 00:00:00'	,333333333	,'www.ist6666.com');

	insert into Lives values ('2014-06-20 00:00:00'	,'2099-01-01 00:00:00'	,111111111	,11111);
	insert into Lives values ('2014-12-30 00:00:00'	,'2099-01-01 00:00:00'	,222222222	,22222);
	insert into Lives values ('2015-10-30 00:00:00'	,'2099-01-01 00:00:00'	,333333333	,33333);

	insert into Connects values('2014-01-20 00:00:00'	,'2014-06-10 00:00:00'	,'C1111'	,'Philips'	,'www.ist1111.com');
	insert into Connects values('2014-02-20 00:00:00'	,'2014-06-10 00:00:00'	,'A3333'	,'Ola'		,'www.ist1111.com');
	insert into Connects values('2014-02-23 00:00:00'	,'2014-06-10 00:00:00'	,'B2222'	,'Aki'		,'www.ist1111.com');
	insert into Connects values('2014-02-28 00:00:00'	,'2014-06-10 00:00:00'	,'B3333'	,'Aki'		,'www.ist1111.com');
	insert into Connects values('2014-06-20 00:00:00'	,'2099-01-01 00:00:00'	,'C2222'	,'Philips'	,'www.ist4444.com');
	insert into Connects values('2015-01-10 00:00:00'	,'2015-02-22 00:00:00'	,'C3333'	,'Philips'	,'www.ist2222.com');
	insert into Connects values('2015-10-30 00:00:00'	,'2099-01-01 00:00:00'	,'A1111'	,'Ola'		,'www.ist5555.com');
	insert into Connects values('2014-01-01 00:00:00'	,'2014-03-02 00:00:00'	,'B1111'	,'Aki'		,'www.ist3333.com');
	insert into Connects values('2014-12-30 00:00:00'	,'2099-01-01 00:00:00'	,'A2222'	,'Ola'		,'www.ist6666.com');