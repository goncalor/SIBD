-- MySQL dump 10.13  Distrib 5.5.44, for debian-linux-gnu (x86_64)
--
-- Host: db.ist.utl.pt    Database: ist173294
-- ------------------------------------------------------
-- Server version	5.1.73-1+deb6u1-log
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Dumping data for table `Actuator`
--

INSERT INTO `Actuator` VALUES ('1','General Electric Co.','beats/min.');

--
-- Dumping data for table `Connects`
--

INSERT INTO `Connects` VALUES ('2015-08-15 00:00:00','2015-11-15 00:00:00','0','Philips','000000.hsm.pt');
INSERT INTO `Connects` VALUES ('2015-08-15 00:00:00','2015-11-15 00:00:00','1','Philips','000000.hsm.pt');
INSERT INTO `Connects` VALUES ('2015-08-15 00:00:00','2016-11-15 00:00:00','1','Philips','000000.hsm.pt');
INSERT INTO `Connects` VALUES ('2015-08-15 00:00:00','2015-11-15 00:00:00','1','General Electric Co.','000000.hsm.pt');

/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`ist173294`@`%`*/ /*!50003 trigger overlapping_device_time
before insert
on Connects for each row

begin
	if exists (select * from Connects
		where new.pan = Connects.pan
		and new.snum = Connects.snum
		and new.manuf = Connects.manuf
		and start <= new.end    
		and end >= new.start) then    

		
		
		call overlapping_data();
end if;

end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Dumping data for table `Device`
--

INSERT INTO `Device` VALUES ('0','Johnson & Johnson','Blood Pressure');
INSERT INTO `Device` VALUES ('0','Philips','Scale');
INSERT INTO `Device` VALUES ('1','Philips','Blood Pressure');
INSERT INTO `Device` VALUES ('0','General Electric Co.','Scale');
INSERT INTO `Device` VALUES ('1','General Electric Co.','Pacemaker');
INSERT INTO `Device` VALUES ('0','Medtronic Inc.','Oxygen');
INSERT INTO `Device` VALUES ('1','Medtronic Inc.','Scale');
INSERT INTO `Device` VALUES ('2','Medtronic Inc.','Lipids');

--
-- Dumping data for table `Lives`
--

INSERT INTO `Lives` VALUES ('2015-04-15 02:53:53','2015-11-15 02:53:53',0,1500);
INSERT INTO `Lives` VALUES ('2015-04-15 02:53:53','2015-11-15 02:53:53',2,1500);
INSERT INTO `Lives` VALUES ('2015-07-15 02:51:09','2015-11-15 02:51:09',0,1500);
INSERT INTO `Lives` VALUES ('2015-07-15 02:51:09','2015-11-15 02:51:09',3,1500);

--
-- Dumping data for table `Municipality`
--

INSERT INTO `Municipality` VALUES (2900,'Setubal');
INSERT INTO `Municipality` VALUES (1,'Guimaraes');
INSERT INTO `Municipality` VALUES (1500,'Lisboa');
INSERT INTO `Municipality` VALUES (1234,'Coimbra');
INSERT INTO `Municipality` VALUES (1444,'Faro');
INSERT INTO `Municipality` VALUES (2234,'Beja');
INSERT INTO `Municipality` VALUES (3234,'Castelo Branco');

--
-- Dumping data for table `PAN`
--

INSERT INTO `PAN` VALUES ('000000.hsm.pt',212122118);
INSERT INTO `PAN` VALUES ('000001.hsm.pt',212122122);
INSERT INTO `PAN` VALUES ('000002.hsm.pt',212342122);
INSERT INTO `PAN` VALUES ('000003.hsm.pt',2123421562);
INSERT INTO `PAN` VALUES ('000004.hsm.pt',213421562);
INSERT INTO `PAN` VALUES ('000005.hsm.pt',213421565);
INSERT INTO `PAN` VALUES ('000006.hsm.pt',213421562);
INSERT INTO `PAN` VALUES ('000007.hsm.pt',213421564);
INSERT INTO `PAN` VALUES ('000008.hsm.pt',213421563);
INSERT INTO `PAN` VALUES ('000009.hsm.pt',213421563);
INSERT INTO `PAN` VALUES ('000010.hsm.pt',213421563);

--
-- Dumping data for table `Patient`
--

INSERT INTO `Patient` VALUES (0,'Joao Bernardo','Lisboa');
INSERT INTO `Patient` VALUES (1,'Bernardo Figueira','Lisboa');
INSERT INTO `Patient` VALUES (2,'Luisa Barata','');
INSERT INTO `Patient` VALUES (3,'Joaquim Livre','');
INSERT INTO `Patient` VALUES (4,'Joana Joia','');
INSERT INTO `Patient` VALUES (5,'Gaspar Duque','');
INSERT INTO `Patient` VALUES (6,'Leonel Geral','');
INSERT INTO `Patient` VALUES (7,'Debora Assis','');
INSERT INTO `Patient` VALUES (8,'Manel Oliveira','');
INSERT INTO `Patient` VALUES (9,'Rafael Revez','');

--
-- Dumping data for table `Period`
--
INSERT INTO `Period` VALUES ('2014-01-15 00:00:00','2015-11-15 00:00:00');
INSERT INTO `Period` VALUES ('2014-02-15 00:00:00','2015-11-15 00:00:00');
INSERT INTO `Period` VALUES ('2014-03-15 00:00:00','2015-11-15 00:00:00');
INSERT INTO `Period` VALUES ('2014-04-15 00:00:00','2015-11-15 00:00:00');
INSERT INTO `Period` VALUES ('2014-05-15 00:00:00','2015-11-15 00:00:00');
INSERT INTO `Period` VALUES ('2014-06-15 00:00:00','2015-11-15 00:00:00');
INSERT INTO `Period` VALUES ('2014-07-15 00:00:00','2015-11-15 00:00:00');
INSERT INTO `Period` VALUES ('2014-08-15 00:00:00','2015-11-15 00:00:00');
INSERT INTO `Period` VALUES ('2014-09-15 00:00:00','2015-11-15 00:00:00');
INSERT INTO `Period` VALUES ('2014-10-15 00:00:00','2015-11-15 00:00:00');

INSERT INTO `Period` VALUES ('2015-01-15 00:00:00','2015-11-15 00:00:00');
INSERT INTO `Period` VALUES ('2015-02-15 00:00:00','2015-11-15 00:00:00');
INSERT INTO `Period` VALUES ('2015-03-15 00:00:00','2015-11-15 00:00:00');
INSERT INTO `Period` VALUES ('2015-04-15 00:00:00','2015-11-15 00:00:00');
INSERT INTO `Period` VALUES ('2015-05-15 00:00:00','2015-11-15 00:00:00');
INSERT INTO `Period` VALUES ('2015-06-15 00:00:00','2015-11-15 00:00:00');
INSERT INTO `Period` VALUES ('2015-07-15 00:00:00','2015-11-15 00:00:00');
INSERT INTO `Period` VALUES ('2015-08-15 00:00:00','2015-11-15 00:00:00');
INSERT INTO `Period` VALUES ('2015-09-15 00:00:00','2015-11-15 00:00:00');
INSERT INTO `Period` VALUES ('2015-10-15 00:00:00','2015-11-15 00:00:00');

INSERT INTO `Period` VALUES ('2015-01-15 00:00:00','2016-11-15 00:00:00');
INSERT INTO `Period` VALUES ('2015-02-15 00:00:00','2016-11-15 00:00:00');
INSERT INTO `Period` VALUES ('2015-03-15 00:00:00','2016-11-15 00:00:00');
INSERT INTO `Period` VALUES ('2015-04-15 00:00:00','2016-11-15 00:00:00');
INSERT INTO `Period` VALUES ('2015-05-15 00:00:00','2016-11-15 00:00:00');
INSERT INTO `Period` VALUES ('2015-06-15 00:00:00','2016-11-15 00:00:00');
INSERT INTO `Period` VALUES ('2015-07-15 00:00:00','2016-11-15 00:00:00');
INSERT INTO `Period` VALUES ('2015-08-15 00:00:00','2016-11-15 00:00:00');
INSERT INTO `Period` VALUES ('2015-09-15 00:00:00','2016-11-15 00:00:00');
INSERT INTO `Period` VALUES ('2015-10-15 00:00:00','2016-11-15 00:00:00');

--
-- Dumping data for table `Reading`
--

INSERT INTO `Reading` VALUES ('0','Medtronic Inc.','2015-10-10 00:00:00',0.1);
INSERT INTO `Reading` VALUES ('0','Medtronic Inc.','2015-10-12 00:00:00',0.1);
INSERT INTO `Reading` VALUES ('0','Medtronic Inc.','2015-10-7 00:00:00',0.1);
INSERT INTO `Reading` VALUES ('0','Medtronic Inc.','2015-10-8 00:00:00',0.1);
INSERT INTO `Reading` VALUES ('0','Philips','2015-10-10 00:00:00',66);
INSERT INTO `Reading` VALUES ('0','Philips','2015-10-11 00:00:00',64);
INSERT INTO `Reading` VALUES ('0','Philips','2015-10-13 00:00:00',62);
INSERT INTO `Reading` VALUES ('0','Philips','2015-10-13 00:00:01',63);
INSERT INTO `Reading` VALUES ('0','Philips','2015-10-14 00:00:00',61);
INSERT INTO `Reading` VALUES ('0','Philips','2015-10-15 00:00:00',60);
INSERT INTO `Reading` VALUES ('0','Philips','2015-10-7 00:00:00',68);

--
-- Dumping data for table `Sensor`
--

INSERT INTO `Sensor` VALUES ('0','Philips','Kg');
INSERT INTO `Sensor` VALUES ('1','Philips','Pa');
INSERT INTO `Sensor` VALUES ('0','Medtronic Inc.','g/l');
INSERT INTO `Sensor` VALUES ('1','Medtronic Inc.','Kg');
INSERT INTO `Sensor` VALUES ('2','Medtronic Inc.','g/l');

--
-- Dumping data for table `Setting`
--

INSERT INTO `Setting` VALUES ('1','General Electric Co.','2015-10-7 00:00:00', 70);

--
-- Dumping data for table `Wears`
--

INSERT INTO `Wears` VALUES ('2015-04-15 00:00:00','2015-11-15 00:00:00',0,'000000.hsm.pt');
INSERT INTO `Wears` VALUES ('2015-04-15 00:00:00','2015-11-15 00:00:00',1,'000001.hsm.pt');
INSERT INTO `Wears` VALUES ('2015-08-15 00:00:00','2015-11-15 00:00:00',2,'000002.hsm.pt');

/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`ist173294`@`%`*/ /*!50003 trigger overlapping_patient_time
before insert
on Wears for each row

begin
	if exists (select * from Wears
		where new.pan = Wears.pan
		and new.patient = Wears.patient
		and start <= new.end    
		and end >= new.start) then    

		
		
		call overlapping_data();
end if;

end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-11-15  3:30:24
