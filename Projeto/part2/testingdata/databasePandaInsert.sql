insert into Patient values('123456789', 'Roberto', 'Da Street, n3, 1Esq, 1000-999 Lisboa');
insert into Patient values('98765432', 'Toni', 'Da Street, n2, 4Esq, 1300-200 Oeiras');
insert into Patient values('987654322', 'Toni', 'Da Street, n2, 4Esq, 1300-200 Oeiras');
insert into Patient values('123344444', NULL, 'Da Street, n2, 4Esq, 1300-200 Oeiras');
​
insert into PAN values('pan99.healthunit.org', '914457220');
insert into PAN values('pan33.healthunit.org', '845 763 207');
insert into PAN values('pan99.healthunit.org', '+351 914457220'); -- should fail
​
​
insert into Device values('87650943', 'Philips', 'blood pressure');
insert into Device values('98765432', 'Philips', 'blood pressure');
insert into Device values('12345678', 'Philips', 'scale');
insert into Device values('12098765', 'Philips', 'scale');
insert into Device values('87650943', 'Philips', 'scale'); -- should fail
insert into Device values('35647828', 'Philips', 'rotating speed');
​
​
insert into Sensor values('87650943', 'Philips', 'mm Hg');
insert into Sensor values('98765432', 'Philips', 'mm Hg');
insert into Sensor values('12345678', 'Philips', 'kg');
insert into Sensor values('12098765', 'Philips', 'kg');
​
​
insert into Actuator values('35647828', 'Philips', 'rpm');
​
​
insert into Municipality values('12345', 'Lisboa');
insert into Municipality values('24351', 'Oeiras');
insert into Municipality values('35374','Porto');
insert into Municipality values('1234','Porto'); -- should fail
​
​
insert into Period values('2015-12-13 17:50:44','2999-12-31 23:59:59');
insert into Period values('2015-11-01 12:30:24','2999-12-31 23:59:59');
insert into Period values('2014-05-29 08:56:21','2999-12-31 23:59:59');
insert into Period values('2015-01-01 08:00:00','2015-01-30 08:00:00');
insert into Period values('2015-01-03 08:00:00','2015-01-07 08:00:00');
insert into Period values('2015-01-03 08:00:00','2015-02-03 08:00:00');
insert into Period values('2014-12-04 08:00:00','2015-01-04 08:00:00');
insert into Period values('2015-01-01 08:00:00','2015-01-15 08:00:00');
insert into Period values('2015-01-01 08:00:00','2015-02-03 08:00:00');
insert into Period values('2014-12-04 08:00:00','2015-02-03 08:00:00');
insert into Period values('2015-01-02 08:00:00','2015-01-31 08:00:00');
insert into Period values('2015-01-01 08:00:00','2015-01-01 08:00:00');
insert into Period values('2015-02-01 08:00:00','2015-03-01 08:00:00');
insert into Period values('2014-01-01 08:00:00','2015-01-30 08:00:00');
insert into Period values('2012-03-02 08:00:00','2013-05-01 08:00:00');
insert into Period values('2015-05-02 08:00:00','2015-06-02 08:00:00');
insert into Period values('2015-03-20 08:00:00','2015-04-05 08:00:00');
insert into Period values('2015-06-03 08:00:00','2020-01-01 08:00:00');
insert into Period values('2015-02-02 08:00:00','2015-02-10 08:00:00');
​
​
​
insert into Reading values('87650943', 'Philips', '2015-10-09 08:00:12', '60.3');
insert into Reading values('98765432', 'Philips', '2015-10-09 08:00:15', '60.1');
insert into Reading values('98765432', 'Philips', '2015-10-09 08:00:15', '60.1');
​
​
insert into Setting values('35647828', 'Philips', '2015-10-09 09:00:55', '50.45');
​
​
insert into Wears values('2015-01-01 08:00:00', '2015-01-30 08:00:00', '123456789', 'pan99.healthunit.org');
insert into Wears values('2015-01-03 08:00:00', '2015-01-07 08:00:00', '123456789', 'pan99.healthunit.org');
insert into Wears values('2015-01-03 08:00:00', '2015-02-03 08:00:00', '123456789', 'pan99.healthunit.org');
insert into Wears values('2014-12-04 08:00:00', '2015-01-04 08:00:00', '123456789', 'pan99.healthunit.org');
insert into Wears values('2015-01-01 08:00:00', '2015-01-15 08:00:00', '123456789', 'pan99.healthunit.org');
insert into Wears values('2015-01-01 08:00:00', '2015-02-03 08:00:00', '123456789', 'pan99.healthunit.org');
insert into Wears values('2014-12-04 08:00:00', '2015-02-03 08:00:00', '123456789', 'pan99.healthunit.org');
insert into Wears values('2015-01-01 08:00:00', '2015-01-01 08:00:00', '123456789', 'pan99.healthunit.org');
insert into Wears values('2015-02-01 08:00:00', '2015-03-01 08:00:00', '123456789', 'pan33.healthunit.org');
insert into Wears values('2015-02-02 08:00:00', '2015-02-10 08:00:00', '98765432', 'pan99.healthunit.org');
insert into Wears values('2014-03-02 08:00:00', '2015-05-01 08:00:00', '123456789', 'pan99.healthunit.org');
insert into Wears values('2015-05-02 08:00:00', '2015-06-02 08:00:00', '98765432', 'pan99.healthunit.org');
insert into Wears values('2015-06-03 08:00:00', '2020-01-01 08:00:00', '123456789', 'pan99.healthunit.org');
​
​
insert into Connects values('2015-01-01 08:00:00', '2015-01-30 08:00:00', '87650943', 'Philips','pan99.healthunit.org');
insert into Connects values('2014-01-01 08:00:00', '2015-01-30 08:00:00', '35647828', 'Philips','pan99.healthunit.org');
insert into Connects values('2015-01-03 08:00:00', '2015-01-07 08:00:00', '87650943', 'Philips','pan99.healthunit.org');
insert into Connects values('2015-01-03 08:00:00', '2015-02-03 08:00:00', '87650943', 'Philips','pan99.healthunit.org');
insert into Connects values('2014-12-04 08:00:00', '2015-01-04 08:00:00', '87650943', 'Philips','pan99.healthunit.org');
insert into Connects values('2015-01-01 08:00:00', '2015-01-15 08:00:00', '87650943', 'Philips','pan99.healthunit.org');
insert into Connects values('2015-01-01 08:00:00', '2015-02-03 08:00:00', '87650943', 'Philips','pan99.healthunit.org');
insert into Connects values('2014-12-04 08:00:00', '2015-02-03 08:00:00', '87650943', 'Philips','pan99.healthunit.org');
insert into Connects values('2015-01-01 08:00:00', '2015-01-01 08:00:00', '87650943', 'Philips','pan99.healthunit.org');
insert into Connects values('2015-01-02 08:00:00', '2015-01-31 08:00:00', '12345678', 'Philips','pan99.healthunit.org');