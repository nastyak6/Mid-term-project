-- MySQL dump 10.13  Distrib 8.0.21, for Win64 (x86_64)
--
-- Host: localhost    Database: g9_gonature
-- ------------------------------------------------------
-- Server version	8.0.21

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `canceledorders`
--

DROP TABLE IF EXISTS `canceledorders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `canceledorders` (
  `visitorsNumber` varchar(45) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `phoneNumber` varchar(45) DEFAULT NULL,
  `orderType` varchar(45) DEFAULT NULL,
  `beforeDiscountPrice` double DEFAULT NULL,
  `afterDiscountPrice` double DEFAULT NULL,
  `parkName` varchar(45) DEFAULT NULL,
  `arrivedTime` datetime DEFAULT NULL,
  `memberID` varchar(45) DEFAULT NULL,
  `ID` varchar(45) DEFAULT NULL,
  `amountArrived` varchar(45) DEFAULT NULL,
  `orderNumber` int NOT NULL,
  PRIMARY KEY (`orderNumber`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `canceledorders`
--

LOCK TABLES `canceledorders` WRITE;
/*!40000 ALTER TABLE `canceledorders` DISABLE KEYS */;
INSERT INTO `canceledorders` VALUES ('5','kim@gmail.com','0543456543','member',500,349.86,'disney','2020-12-09 12:00:00','1113','111222333','0',1112),('6','Scott@gmail.com','0543456548','member',600,466.48,'disney','2020-12-09 12:00:00','1120','111221333','0',1113),('15','Cameron@yahoo.com','0503456541','group',1500,1102.5,'disney','2020-12-28 08:00:00','1141','324321239','0',1114),('6','nastya@walla.com','0565859898','regular',600,499.8,'disney','2021-01-18 16:00:00','null','323255569','0',1115),('6','rinat@walla.com','0565555551','group',600,499.8,'disney','2021-01-31 12:00:00','null','568598889','0',1116),('6','Kanye@yahoo.com','0533456541','member',600,471.23999999999995,'universal','2021-01-10 16:00:00','1129','234543343','0',1117);
/*!40000 ALTER TABLE `canceledorders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `creditcard`
--

DROP TABLE IF EXISTS `creditcard`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `creditcard` (
  `cardNumber` varchar(45) NOT NULL,
  `cardHolderName` varchar(45) NOT NULL,
  `expiredDate` varchar(45) NOT NULL,
  `cvc` int NOT NULL,
  `orderID` varchar(45) NOT NULL,
  PRIMARY KEY (`orderID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `creditcard`
--

LOCK TABLES `creditcard` WRITE;
/*!40000 ALTER TABLE `creditcard` DISABLE KEYS */;
INSERT INTO `creditcard` VALUES ('1234234534564560','Kim Kardashian','4/2021',234,'111222333'),('1234234534564561','Kourtney Kardashian','3/2021',235,'111222334'),('1234234534564562','Khloe Kardashian','1/2021',236,'111222335'),('1234234534564563','Robert Kardashian','6/2021',345,'111222336'),('1234234534564564','Kylie Jenner','3/2021',346,'111222337'),('1234234534564565','Kendel Jenner','8/2021',678,'111222338');
/*!40000 ALTER TABLE `creditcard` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `discounts`
--

DROP TABLE IF EXISTS `discounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `discounts` (
  `parkName` varchar(45) DEFAULT NULL,
  `from` datetime DEFAULT NULL,
  `to` datetime DEFAULT NULL,
  `requestID` varchar(45) NOT NULL,
  `discountscol` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`requestID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `discounts`
--

LOCK TABLES `discounts` WRITE;
/*!40000 ALTER TABLE `discounts` DISABLE KEYS */;
INSERT INTO `discounts` VALUES ('jurasic','2021-01-08 00:00:00','2021-01-16 00:00:00','1112','0.95'),('disney','2021-01-08 00:00:00','2021-01-16 00:00:00','1113','0.98'),('universal','2021-01-08 00:00:00','2021-01-16 00:00:00','1114','0.99'),('disney','2021-01-17 00:00:00','2021-01-23 00:00:00','1115','0.97'),('jurasic','2021-01-17 00:00:00','2021-01-23 00:00:00','1116','0.94'),('universal','2021-01-17 00:00:00','2021-01-23 00:00:00','1117','0.98'),('disney','2021-01-25 00:00:00','2021-01-31 00:00:00','1118','0.97'),('jurasic','2021-01-25 00:00:00','2021-01-31 00:00:00','1119','0.97'),('universal','2021-01-25 00:00:00','2021-01-31 00:00:00','1120','0.94');
/*!40000 ALTER TABLE `discounts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee`
--

DROP TABLE IF EXISTS `employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employee` (
  `username` varchar(45) NOT NULL,
  `password` varchar(45) DEFAULT NULL,
  `firstName` varchar(45) DEFAULT NULL,
  `lastName` varchar(45) DEFAULT NULL,
  `employeeNumber` int NOT NULL,
  `email` varchar(45) DEFAULT NULL,
  `role` varchar(45) DEFAULT NULL,
  `parkName` varchar(45) DEFAULT NULL,
  `loggedin` int DEFAULT '0',
  PRIMARY KEY (`employeeNumber`,`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee`
--

LOCK TABLES `employee` WRITE;
/*!40000 ALTER TABLE `employee` DISABLE KEYS */;
INSERT INTO `employee` VALUES ('shawn','12345678','Shawn','Mendes',12341,'hey@hey.com','ParkEmployee','disney',0),('rinat','12345678','rinat','st',12343,'r@r.com','ParkManager','disney',0),('bark','12345678','bar','katz',12344,'bar@Nature.com','ParkManager','jurasic',0),('hodaya','12345678','Hodaya','Mekonen',12344,'hey@hey.com','DepartmentManager','disney',0),('harry','12345678','Harry','Styles',12345,'hey@hey.com','ServiceRepresentative','universal',0),('jennifer','12345678','Jennifer','Lopez',12346,'hey@hey.com','ServiceRepresentative','disney',0),('haim','12345678','Haim','Azulay',12347,'hey@hey.com','ParkManager','universal',0),('nastya','12345678','Nastya','Kokin',12348,'hey@hey.com','ParkEmployee','universal',0),('beyonce','12345678','Beyonce','Knowles',12349,'hey@hey.com','ParkEmployee','jurasic',0),('roia','12345678','Roi','Amar',12350,'hey@hey.com','ServiceRepresentative','jurasic',0);
/*!40000 ALTER TABLE `employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `enteryandexit`
--

DROP TABLE IF EXISTS `enteryandexit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `enteryandexit` (
  `orderNumber` int NOT NULL,
  `timeEnter` datetime DEFAULT NULL,
  `timeExit` datetime DEFAULT NULL,
  `parkName` varchar(45) DEFAULT NULL,
  `orderType` varchar(45) DEFAULT NULL,
  `amountArrived` int DEFAULT NULL,
  PRIMARY KEY (`orderNumber`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `enteryandexit`
--

LOCK TABLES `enteryandexit` WRITE;
/*!40000 ALTER TABLE `enteryandexit` DISABLE KEYS */;
INSERT INTO `enteryandexit` VALUES (1210,'2020-12-10 08:00:00','2020-12-10 09:00:00','jurasic','member',4),(1211,'2020-12-10 12:00:00','2020-12-10 14:00:00','jurasic','regular',3),(1212,'2020-12-10 16:00:00','2020-12-10 19:30:00','jurasic','group',8),(1213,'2020-12-11 08:00:00','2020-12-11 10:20:00','jurasic','regular',1),(1214,'2020-12-11 12:00:00','2020-12-11 15:00:00','jurasic','group',12),(1215,'2020-12-11 16:00:00','2020-12-11 18:00:00','jurasic','member',2),(1216,'2020-12-12 08:00:00','2020-12-12 10:00:00','jurasic','regular',2),(1217,'2020-12-12 12:00:00','2020-12-12 13:00:00','jurasic','member',3),(1218,'2020-12-12 16:00:00','2020-12-12 19:00:00','jurasic','group',5),(1219,'2020-12-13 08:00:00','2020-12-13 11:00:00','jurasic','regular',2),(1220,'2020-12-13 12:00:00','2020-12-13 15:00:00','jurasic','member',2),(1221,'2020-12-13 16:00:00','2020-12-13 19:40:00','jurasic','group',15),(1222,'2020-12-14 08:00:00','2020-12-14 11:30:00','jurasic','member',6),(1223,'2020-12-14 12:00:00','2020-12-14 15:30:00','jurasic','regular',4),(1224,'2020-12-14 16:00:00','2020-12-14 19:10:00','jurasic','group',10),(1225,'2020-12-15 08:30:00','2020-12-15 11:30:00','jurasic','regular',1),(1226,'2020-12-15 12:20:00','2020-12-15 15:30:00','jurasic','member',6),(1227,'2020-12-15 16:50:00','2020-12-15 19:10:00','jurasic','group',8),(1228,'2020-12-16 08:20:00','2020-12-16 11:20:00','jurasic','regular',2),(1229,'2020-12-16 12:40:00','2020-12-16 15:40:00','jurasic','member',1),(1230,'2020-12-16 16:20:00','2020-12-16 19:00:00','jurasic','group',5),(1231,'2020-12-17 08:20:00','2020-12-17 10:20:00','jurasic','regular',1),(1232,'2020-12-17 12:40:00','2020-12-17 14:40:00','jurasic','member',9),(1233,'2020-12-17 16:20:00','2020-12-17 19:50:00','jurasic','group',8),(1234,'2020-12-18 08:20:00','2020-12-18 09:20:00','jurasic','regular',1),(1235,'2020-12-18 12:40:00','2020-12-18 15:40:00','jurasic','group',9),(1236,'2020-12-18 16:20:00','2020-12-18 18:50:00','jurasic','member',3),(1237,'2020-12-19 08:10:00','2020-12-19 09:10:00','jurasic','member',2),(1238,'2020-12-19 12:30:00','2020-12-19 15:30:00','jurasic','regular',1),(1239,'2020-12-19 16:20:00','2020-12-19 18:20:00','jurasic','group',4),(1240,'2020-12-20 09:10:00','2020-12-20 10:10:00','jurasic','regular',8),(1241,'2020-12-20 13:30:00','2020-12-20 15:30:00','jurasic','member',2),(1242,'2020-12-20 17:20:00','2020-12-20 18:20:00','jurasic','group',8),(1243,'2020-12-21 08:20:00','2020-12-21 09:10:00','jurasic','regular',5),(1244,'2020-12-21 14:30:00','2020-12-21 15:30:00','jurasic','group',12),(1245,'2020-12-21 17:20:00','2020-12-21 19:20:00','jurasic','member',4),(1246,'2020-12-22 08:20:00','2020-12-22 11:10:00','jurasic','regular',5),(1247,'2020-12-22 12:30:00','2020-12-22 15:30:00','jurasic','member',6),(1248,'2020-12-22 16:20:00','2020-12-22 19:20:00','jurasic','group',14),(1249,'2020-12-23 08:20:00','2020-12-23 11:50:00','jurasic','member',3),(1250,'2020-12-23 12:30:00','2020-12-23 14:40:00','jurasic','member',11),(1251,'2020-12-23 16:20:00','2020-12-23 19:20:00','jurasic','group',2),(1252,'2020-12-24 09:20:00','2020-12-24 11:50:00','jurasic','regular',1),(1253,'2020-12-24 13:30:00','2020-12-24 14:40:00','jurasic','group',12),(1254,'2020-12-24 17:20:00','2020-12-24 19:20:00','jurasic','member',2),(1255,'2020-12-25 08:40:00','2020-12-25 11:10:00','jurasic','regular',6),(1256,'2020-12-25 13:40:00','2020-12-25 14:30:00','jurasic','member',5),(1257,'2020-12-25 17:10:00','2020-12-25 19:30:00','jurasic','group',9),(1258,'2020-12-26 08:40:00','2020-12-26 11:10:00','jurasic','member',6),(1259,'2020-12-26 12:40:00','2020-12-26 14:30:00','jurasic','regular',7),(1260,'2020-12-26 16:10:00','2020-12-26 19:30:00','jurasic','group',10),(1261,'2020-12-27 08:40:00','2020-12-27 11:10:00','jurasic','regular',9),(1262,'2020-12-27 12:40:00','2020-12-27 14:30:00','jurasic','group',9),(1263,'2020-12-27 16:10:00','2020-12-27 19:30:00','jurasic','member',3),(1264,'2020-12-28 08:40:00','2020-12-28 11:10:00','jurasic','member',2),(1265,'2020-12-28 12:40:00','2020-12-28 14:30:00','jurasic','group',11),(1266,'2020-12-28 16:10:00','2020-12-28 19:30:00','jurasic','regular',2),(1267,'2020-12-29 09:40:00','2020-12-29 11:10:00','jurasic','regular',1),(1268,'2020-12-29 12:40:00','2020-12-29 15:30:00','jurasic','group',12),(1269,'2020-12-29 16:10:00','2020-12-29 18:30:00','jurasic','member',4),(1270,'2020-12-30 09:00:00','2020-12-30 11:10:00','jurasic','regular',3),(1271,'2020-12-30 13:40:00','2020-12-30 15:30:00','jurasic','member',4),(1272,'2020-12-30 17:10:00','2020-12-30 18:30:00','jurasic','group',8),(1273,'2020-12-31 09:00:00','2020-12-31 11:50:00','jurasic','regular',6),(1274,'2020-12-31 13:30:00','2020-12-31 15:30:00','jurasic','member',6),(1275,'2020-12-31 16:30:00','2020-12-31 18:30:00','jurasic','group',12),(2000,'2020-12-01 16:34:43','2020-12-01 18:35:13','disney','member',2),(2002,'2020-12-02 08:36:28','2020-12-02 12:00:00','disney','regular',2),(2006,'2020-12-03 16:54:24','2020-12-03 20:00:00','disney','regular',20),(2007,'2020-12-03 08:37:30','2020-12-03 09:01:53','disney','member',2),(2009,'2020-12-04 16:56:38','2020-12-04 12:00:00','disney','group',15),(2010,'2020-12-04 08:37:45','2020-12-04 11:02:38','disney','regular',20),(2013,'2020-12-05 16:56:53','2020-12-05 20:00:00','disney','regular',7),(2014,'2020-12-06 08:38:06','2020-12-06 11:51:06','disney','regular',2),(2018,'2020-12-07 08:38:35','2020-12-07 11:51:29','disney','regular',17),(2020,'2020-12-07 16:57:14','2020-12-07 20:00:00','disney','regular',9),(2021,'2020-12-08 08:38:53','2020-12-08 11:00:54','disney','regular',1),(2023,'2020-12-08 16:57:25','2020-12-08 20:00:00','disney','group',15),(2025,'2020-12-09 08:40:39','2020-12-09 11:10:18','disney','regular',5),(2029,'2020-12-10 16:57:59','2020-12-10 19:10:32','disney','regular',20),(2031,'2020-12-11 08:41:13','2020-12-11 10:00:00','disney','member',15),(2034,'2020-12-12 08:42:33','2020-12-12 10:00:00','disney','group',15),(2035,'2020-12-12 16:58:16','2020-12-12 20:00:00','disney','group',15),(2037,'2020-12-13 08:42:48','2020-12-13 11:11:19','disney','regular',10),(2039,'2020-12-13 16:59:13','2020-12-13 19:11:30','disney','regular',17),(2042,'2020-12-14 16:59:26','2020-12-14 20:00:00','disney','regular',13),(2046,'2020-12-16 08:43:38','2020-12-16 12:00:00','disney','member',2),(2048,'2020-12-16 16:59:42','2020-12-16 20:00:00','disney','regular',16),(2050,'2020-12-17 08:44:14','2020-12-17 11:00:14','disney','regular',3),(2052,'2020-12-17 17:00:20','2020-12-17 20:00:00','disney','regular',12),(2057,'2020-12-19 17:00:33','2020-12-19 20:00:00','disney','group',15),(2061,'2020-12-20 17:01:01','2020-12-20 19:01:01','disney','regular',9),(2067,'2020-12-22 12:49:05','2020-12-22 16:00:00','disney','regular',18),(2070,'2020-12-23 12:49:35','2020-12-23 16:00:00','disney','member',7),(2071,'2020-12-23 17:01:56','2020-12-23 19:15:56','disney','member',16),(2074,'2020-12-24 17:02:20','2020-12-24 19:20:20','disney','group',10),(2076,'2020-12-25 12:49:56','2020-12-25 12:00:00','disney','regular',16),(2077,'2020-12-25 17:02:46','2020-12-25 19:02:46','disney','member',15),(2083,'2020-12-27 12:51:32','2020-12-27 15:51:32','disney','member',13),(2084,'2020-12-27 17:03:13','2020-12-27 20:00:00','disney','regular',10),(2086,'2020-12-28 12:52:10','2020-12-28 16:00:00','disney','regular',18),(2089,'2020-12-29 12:53:31','2020-12-29 16:00:00','disney','regular',20),(2093,'2020-12-30 17:03:33','2020-12-30 19:03:33','disney','regular',17),(2095,'2020-12-31 12:54:02','2020-12-31 15:54:02','disney','regular',4),(2096,'2020-12-31 17:03:56','2020-12-31 19:30:56','disney','member',2),(2097,'2020-12-02 08:36:28','2020-12-02 11:36:28','disney','regular',2),(2098,'2020-12-06 08:38:06','2020-12-06 11:51:15','disney','regular',3),(2099,'2020-12-08 08:38:53','2020-12-08 10:38:53','disney','regular',1),(2100,'2020-12-31 12:54:02','2020-12-31 14:54:02','disney','regular',3),(3029,'2020-12-01 08:25:58','2020-12-01 08:27:17','universal','regular',1),(3032,'2020-12-02 08:26:59','2020-12-02 08:27:08','universal','regular',2),(3035,'2020-12-03 08:28:08','2020-12-03 08:28:17','universal','regular',6),(3038,'2020-12-04 08:28:42','2020-12-04 09:37:42','universal','regular',2),(3045,'2020-12-06 08:30:07','2020-12-06 08:45:27','universal','regular',2),(3048,'2020-12-07 08:30:30','2020-12-07 08:45:44','universal','regular',1),(3055,'2020-12-09 08:32:03','2020-12-09 11:37:52','universal','member',4),(3056,'2020-12-09 16:31:17','2020-12-09 17:39:10','universal','group',8),(3057,'2020-12-10 08:32:26','2020-12-10 10:39:02','universal','regular',10),(3058,'2020-12-10 13:32:46','2020-12-10 13:50:06','universal','member',4),(3060,'2020-12-11 08:31:58','2020-12-11 08:38:53','universal','regular',5),(3063,'2020-12-12 08:32:13','2020-12-08 08:35:12','universal','regular',2),(3066,'2020-12-13 08:32:31','2020-12-13 08:35:19','universal','regular',6),(3069,'2020-12-14 08:32:50','2020-12-14 09:38:20','universal','regular',2),(3070,'2020-12-14 13:27:40','2020-12-14 14:30:04','universal','member',4),(3072,'2020-12-15 08:32:59','2020-12-15 12:38:28','universal','regular',2),(3073,'2020-12-15 13:27:56','2020-12-15 15:30:30','universal','group',3),(3075,'2020-12-16 08:33:15','2020-12-16 10:38:34','universal','regular',4),(3076,'2020-12-16 13:28:09','2020-12-16 14:30:51','universal','member',9),(3078,'2020-12-17 08:36:39','2020-12-17 08:46:13','universal','regular',11),(3081,'2020-12-18 08:37:21','2020-12-18 11:38:43','universal','regular',2),(3082,'2020-12-18 13:28:55','2020-12-18 13:51:01','universal','member',19),(3084,'2020-12-19 08:44:03','2020-12-19 08:45:19','universal','regular',3),(3085,'2020-12-19 13:29:20','2020-12-19 14:31:35','universal','member',1),(3087,'2020-12-20 08:44:13','2020-12-20 08:45:13','universal','regular',6),(3088,'2020-12-20 13:29:41','2020-12-20 13:31:47','universal','member',13),(3090,'2020-12-21 08:44:45','2020-12-21 08:45:04','universal','regular',11),(3095,'2020-12-22 08:50:30','2020-12-22 08:54:40','universal','regular',1),(3099,'2020-12-23 08:50:52','2020-12-23 08:54:48','universal','regular',4),(3102,'2020-12-24 08:52:02','2020-12-24 09:54:56','universal','regular',5),(3105,'2020-12-25 08:52:15','2020-12-25 09:55:04','universal','regular',1),(3108,'2020-12-26 08:52:34','2020-12-26 08:55:12','universal','regular',1),(3111,'2020-12-27 08:52:52','2020-12-27 11:55:20','universal','regular',2),(3114,'2020-12-28 08:53:10','2020-12-28 10:55:27','universal','regular',4),(3115,'2020-12-28 14:24:51','2020-12-28 16:45:53','universal','member',1),(3116,'2020-12-28 16:25:19','2020-12-28 20:45:58','universal','group',4),(3117,'2020-12-29 08:53:27','2020-12-29 08:56:45','universal','regular',1),(3118,'2020-12-29 13:52:39','2020-12-29 14:52:51','universal','member',1),(3120,'2020-12-30 08:53:49','2020-12-30 09:57:00','universal','regular',1),(3123,'2020-12-31 08:54:01','2020-12-31 12:57:16','universal','regular',2),(3126,'2020-12-23 08:50:52','2020-12-23 10:57:37','universal','regular',6),(3127,'2020-12-26 08:52:34','2020-12-26 11:57:51','universal','regular',4),(3128,'2020-12-30 08:53:49','2020-12-30 10:57:59','universal','regular',2),(3129,'2020-12-31 08:54:01','2020-12-31 09:58:06','universal','regular',2);
/*!40000 ALTER TABLE `enteryandexit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `member`
--

DROP TABLE IF EXISTS `member`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `member` (
  `ID` int DEFAULT NULL,
  `firstName` varchar(45) DEFAULT NULL,
  `lastName` varchar(45) DEFAULT NULL,
  `memberNumber` varchar(45) NOT NULL,
  `phoneNumber` varchar(45) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `payment` varchar(45) DEFAULT NULL,
  `type` varchar(45) DEFAULT NULL,
  `familtAmount` int DEFAULT NULL,
  PRIMARY KEY (`memberNumber`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `member`
--

LOCK TABLES `member` WRITE;
/*!40000 ALTER TABLE `member` DISABLE KEYS */;
INSERT INTO `member` VALUES (111222333,'Kim','Kardashian','1113','0543456543','kim@gmail.com','yes','member',4),(111222334,'Kourtney','Kardashian','1114','0543456541','Kourtney@gmail.com','yes','member',3),(111222335,'Khloe ','Kardashian','1115','0543456542','Khloe@gmail.com','yes','member',2),(111222336,'Robert ','Kardashian','1116','0543456544','Robert@gmail.com','yes','member',2),(111222337,'Kylie ','Jenner','1117','0543456545','Kylie@gmail.com','yes','member',2),(111222338,'Kendel ','Jenner','1118','0543456546','Kendel@gmail.com','yes','member',1),(111222339,'Kris','Jenner','1119','0543456547','Kris@gmail.com','yes','member',1),(111221333,'Scott','Disick','1120','0543456548','Scott@gmail.com','yes','member',2),(222333444,'Oprah','Winfrey','1121','0523456543','Oprah@yahoo.com','yes','member',2),(222333441,'Brad','Pitt','1122','0523456541','Brad@yahoo.com','yes','member',7),(222333442,'Bradley','Cooper','1123','0523456542','Bradley@yahoo.com','yes','member',1),(222333443,'Justin','Bieber','1124','0523456544','Justin@yahoo.com','yes','member',2),(222333445,'Hailey','Baldwin','1125','0523456545','Hailey@yahoo.com','yes','member',1),(222333446,'Halle','Berry','1126','0523456546','Halle@yahoo.com','yes','member',5),(234543345,'Selena','Gomez','1127','0523456547','Selena@yahoo.com','yes','member',1),(234543344,'Shawn','Carter','1128','0523456548','Shawn@yahoo.com','yes','member',4),(234543343,'Kanye','West','1129','0533456541','Kanye@yahoo.com','yes','member',2),(234543342,'Denzel','Washington','1130','0533456542','Denzel@yahoo.com','yes','member',3),(234543341,'Rihanna','Fenty','1131','0533456544','Rihanna@gmail.com','yes','member',4),(234543346,'Ciara','win','1132','0533456545','Ciara@gmail.com','yes','member',3),(234543347,'George','Clooney','1133','0533456546','George@gmail.com','yes','member',1),(234543348,'Matt','Damon','1134','0533456547','Matt@yahoo.com','yes','member',4),(234543349,'Nicole','Kidman','1135','0533456548','Nicole@yahoo.com','yes','member',3),(324321234,'Bruno','Mars','1136','0503456544','Bruno@yahoo.com','yes','member',1),(324321235,'Maluma','Arias','1137','0503456545','Maluma@yahoo.com','yes','group',0),(324321236,'Jason','Statham','1138','0503456546','Jason@gmail.com','yes','group',0),(324321237,'Liam','Payne','1139','0503456547','Liam@gmail.com','yes','group',0),(324321238,'Liam','Neeson','1140','0503456548','LiamN@gmail.com','yes','group',0),(324321239,'Cameron','Diaz','1141','0503456541','Cameron@yahoo.com','yes','group',0),(325321239,'Angelina','Jolie','1142','0503457441','Angelina@yahoo.com','no','member',8);
/*!40000 ALTER TABLE `member` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `visitorsNumber` varchar(45) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `phoneNumber` varchar(45) DEFAULT NULL,
  `orderType` varchar(45) DEFAULT NULL,
  `beforeDiscountPrice` double DEFAULT NULL,
  `afterDiscountPrice` double DEFAULT NULL,
  `parkName` varchar(45) DEFAULT NULL,
  `arrivedTime` datetime DEFAULT NULL,
  `memberID` varchar(45) DEFAULT NULL,
  `ID` varchar(45) DEFAULT NULL,
  `amountArrived` varchar(45) DEFAULT '0',
  `orderNumber` int NOT NULL,
  PRIMARY KEY (`orderNumber`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES ('8','kim@gmail.com','0543456543','member',800,581.4,'jurasic','2021-01-09 08:00:00','1113','111222333','8',1112),('4','null','null','regular',400,323,'jurasic','2021-01-09 12:00:00','null','444555666','0',1113),('10','Maluma@yahoo.com','0503456545','group',1000,712.5,'jurasic','2021-01-09 16:00:00','1137','324321235','0',1114),('10','Liam@gmail.com','0503456547','group',1000,712.5,'jurasic','2021-01-11 08:00:00','1139','324321237','0',1118),('5','Khloe@gmail.com','0543456542','member',500,371.45,'jurasic','2021-01-11 12:00:00','1115','111222335','0',1119),('1','null','null','regular',100,80.75,'jurasic','2021-01-11 16:00:00','null','897787765','0',1120),('5','nur@gmail.com','0565432345','regular',500,403.75,'jurasic','2021-01-12 08:00:00','null','777666554','0',1122),('3','Robert@gmail.com','0543456544','member',300,209.95,'jurasic','2021-01-12 12:00:00','1116','111222336','0',1123),('12','Cameron@yahoo.com','0503456541','group',1200,855,'jurasic','2021-01-12 16:00:00','1141','324321239','0',1124),('7','micha@walla.com','0564345432','regular',700,565.25,'jurasic','2021-01-13 08:00:00','null','345434565','0',1125),('15','LiamN@gmail.com','0503456548','group',1500,1068.75,'jurasic','2021-01-14 12:00:00','1140','324321238','0',1126),('3','null','null','member',300,209.95,'jurasic','2021-01-13 12:00:00','1117','111222337','0',1127),('8','Maluma@yahoo.com','0503456545','group',800,570,'jurasic','2021-01-13 16:00:00','1137','324321235','0',1128),('2','Kendel@gmail.com','0543456546','member',200,145.35,'jurasic','2021-01-14 08:00:00','1118','111222338','0',1129),('2','shir@gmail.com','0564321231','regular',200,161.5,'jurasic','2021-01-14 16:00:00','null','776655664','0',1130),('1','Kris@gmail.com','0543456547','member',100,64.6,'jurasic','2021-01-15 08:00:00','1119','111222339','0',1131),('7','Liam@gmail.com','0503456547','group',700,498.75,'jurasic','2021-01-15 12:00:00','1139','324321237','0',1132),('2','mil@gmaill.com','0532343212','regular',200,161.5,'jurasic','2021-01-15 16:00:00','null','987876765','0',1133),('14','LiamN@gmail.com','0503456548','group',1400,997.5,'jurasic','2021-01-16 08:00:00','1140','324321238','0',1135),('3','loi@gmail.com','0543456787','regular',300,242.25,'jurasic','2021-01-16 12:00:00','null','123432124','0',1137),('4','Scott@gmail.com','0543456548','member',400,290.7,'jurasic','2021-01-16 16:00:00','1120','111221333','0',1139),('8','gal@walla.com','0567654567','regular',800,646,'jurasic','2021-01-17 08:00:00','null','454323432','0',1140),('15','Jason@gmail.com','0503456546','group',1500,1068.75,'jurasic','2021-01-17 12:00:00','1138','324321236','0',1141),('5','gili@walla.com','0576789876','regular',500,403.75,'jurasic','2021-01-09 12:00:00','null','564675786','0',1142),('4','null','null','member',400,290.7,'jurasic','2021-01-17 16:00:00','1121','222333444','0',1143),('8','Brad@yahoo.com','0523456541','member',800,532.95,'jurasic','2021-01-17 12:00:00','1122','222333441','0',1145),('7','gilli@wall.com','0576789876','regular',700,565.25,'jurasic','2021-01-17 12:00:00','null','564675786','0',1146),('15','Cameron@yahoo.com','0503456541','group',1500,1068.75,'jurasic','2021-01-17 08:00:00','1141','324321239','0',1147),('15','LiamN@gmail.com','0503456548','group',1500,1068.75,'jurasic','2021-01-17 08:00:00','1140','324321238','0',1148),('10','Bradley@yahoo.com','0523456542','member',1000,791.35,'jurasic','2021-01-18 08:00:00','1123','222333442','0',1149),('15','Jason@gmail.com','0503456546','group',1500,1068.75,'jurasic','2021-01-18 08:00:00','1138','324321236','0',1150),('5','kim@gmail.com','0543456543','member',500,339.15,'jurasic','2021-01-18 08:00:00','1113','111222333','0',1151),('7','null','null','member',700,532.95,'jurasic','2021-01-18 08:00:00','1124','222333443','0',1152),('4','Hay@yahoo.com','0523459945','regular',400,323,'jurasic','2021-01-18 12:00:00','null','123432123','0',1154),('3','hila@gmail.com','0564345676','regular',300,242.25,'jurasic','2021-01-18 16:00:00','null','545434543','0',1155),('15','Maluma@yahoo.com','0503456545','group',1500,1068.75,'jurasic','2021-01-19 12:00:00','1137','324321235','0',1156),('15','Jason@gmail.com','0503456546','group',1500,1068.75,'jurasic','2021-01-19 12:00:00','1138','324321236','0',1157),('10','Kris@gmail.com','0543456547','member',1000,791.35,'jurasic','2021-01-19 12:00:00','1119','111222339','0',1159),('3','roni@yahoo.com','0528888544','regular',300,242.25,'jurasic','2021-01-19 16:00:00','null','456354635','0',1160),('4','milan@walla.com','0564345676','regular',400,323,'jurasic','2021-01-19 08:00:00','null','345432344','0',1161),('10','Selena@yahoo.com','0523456547','member',1000,791.35,'jurasic','2021-01-20 08:00:00','1127','234543345','0',1162),('8','null','null','regular',800,646,'jurasic','2021-01-20 08:00:00','null','012343212','0',1163),('12','Cameron@yahoo.com','0503456541','group',1200,855,'jurasic','2021-01-20 12:00:00','1141','324321239','0',1164),('4','gilat@gmail.com','0587656789','regular',400,323,'jurasic','2021-01-20 16:00:00','null','023454327','0',1165),('10','Shawn@yahoo.com','0523456548','member',1000,742.9,'jurasic','2021-01-20 08:00:00','1128','234543344','0',1167),('15','Liam@gmail.com','0503456547','group',1500,1068.75,'jurasic','2021-01-21 08:00:00','1139','324321237','0',1168),('3','Denzel@yahoo.com','0533456542','member',300,193.79999999999998,'jurasic','2021-01-21 12:00:00','1130','234543342','0',1169),('1','hola@walla.com','0586543456','regular',100,80.75,'jurasic','2021-01-21 16:00:00','null','098787654','0',1170),('3','eyal@gmail.com','0589876787','regular',300,242.25,'jurasic','2021-01-22 08:00:00','null','034321234','0',1172),('5','Rihanna@gmail.com','0533456544','member',500,339.15,'jurasic','2021-01-22 12:00:00','1131','234543341','0',1173),('8','Cameron@yahoo.com','0503456541','group',800,570,'jurasic','2021-01-22 16:00:00','1141','324321239','0',1174),('15','Jason@gmail.com','0503456546','group',1500,1068.75,'jurasic','2021-01-23 08:00:00','1138','324321236','0',1175),('3','null','null','member',300,193.79999999999998,'jurasic','2021-01-23 12:00:00','1132','234543346','0',1176),('2','rona@walla.com','0598767876','regular',200,161.5,'jurasic','2021-01-23 16:00:00','null','333223221','0',1177),('1','George@gmail.com','0533456546','member',100,64.6,'jurasic','2021-01-24 08:00:00','1133','234543347','0',1178),('8','Angelina@yahoo.com','0503457441','member',800,516.8,'jurasic','2021-01-24 12:00:00','1142','325321239','0',1179),('4','lior@gmail.com','0587678987','regular',400,323,'jurasic','2021-01-24 16:00:00','null','987876678','0',1181),('4','Matt@yahoo.com','0533456547','member',400,258.4,'jurasic','2021-01-25 08:00:00','1134','234543348','0',1182),('9','Angelina@yahoo.com','0503457441','member',900,597.55,'jurasic','2021-01-25 12:00:00','1142','325321239','0',1183),('1','lidan@walla.com','0535645345','regular',100,80.75,'jurasic','2021-01-25 16:00:00','null','098876565','0',1184),('6','lori@gmail.com','0598964324','regular',600,484.5,'jurasic','2021-01-26 08:00:00','null','233322212','0',1185),('3','null','null','member',300,193.79999999999998,'jurasic','2021-01-26 12:00:00','1135','234543349','0',1186),('12','Liam@gmail.com','0503456547','group',1200,855,'jurasic','2021-01-26 16:00:00','1139','324321237','0',1188),('4','flori@walla.com','0588765456','regular',400,323,'jurasic','2021-01-27 08:00:00','null','012367654','0',1189),('1','Bruno@yahoo.com','0503456544','member',100,64.6,'jurasic','2021-01-27 12:00:00','1136','324321234','0',1190),('13','Maluma@yahoo.com','0503456545','group',1300,926.25,'jurasic','2021-01-27 16:00:00','1137','324321235','0',1192),('1','liroi@gmail.com','0564345432','regular',100,80.75,'jurasic','2021-01-28 16:00:00','null','335665447','0',1194),('8','LiamN@gmail.com','0503456548','group',800,570,'jurasic','2021-01-28 08:00:00','1140','324321238','0',1195),('4','null','null','member',400,258.4,'jurasic','2021-01-28 12:00:00','1113','111222333','0',1196),('2','Khloe@gmail.com','0543456542','member',200,129.2,'jurasic','2021-01-29 08:00:00','1115','111222335','0',1197),('5','aliyah@gmail.com','0534323432','regular',500,403.75,'jurasic','2021-01-29 12:00:00','null','454433323','0',1198),('12','Maluma@yahoo.com','0503456545','group',1200,855,'jurasic','2021-01-29 16:00:00','1137','324321235','0',1199),('7','hello@gmail.com','0584678765','regular',700,565.25,'jurasic','2021-01-30 08:00:00','null','243423423','0',1201),('3','Oprah@yahoo.com','0523456543','member',300,209.95,'jurasic','2021-01-30 12:00:00','1121','222333444','0',1202),('14','Cameron@yahoo.com','0503456541','group',1400,997.5,'jurasic','2021-01-30 16:00:00','1141','324321239','0',1203),('2','miran@walla.com','0565434534','regular',200,161.5,'jurasic','2021-01-31 08:00:00','null','220330440','0',1204),('6','Bradley@yahoo.com','0523456542','member',600,468.35,'jurasic','2021-01-31 12:00:00','1123','222333442','0',1205),('15','LiamN@gmail.com','0503456548','group',1500,1068.75,'jurasic','2021-01-31 16:00:00','1140','324321238','0',1206),('6','kim@gmail.com','0543456543','member',600,419.9,'jurasic','2020-12-10 08:00:00','1113','111222333','4',1210),('3','null','null','regular',300,242.25,'jurasic','2020-12-10 12:00:00','null','120120120','3',1211),('12','Maluma@yahoo.com','0503456545','group',1200,855,'jurasic','2020-12-10 16:00:00','1137','324321235','8',1212),('1','johny@gmail.com','0534323454','regular',100,80.75,'jurasic','2020-12-11 08:00:00','null','121121121','1',1213),('14','null','null','group',1400,997.5,'jurasic','2020-12-11 12:00:00','1138','324321236','12',1214),('2','Kourtney@gmail.com','0543456541','member',200,129.2,'jurasic','2020-12-11 16:00:00','1114','111222334','2',1215),('3','jack@gmail.com','0546765432','regular',300,242.25,'jurasic','2020-12-12 08:00:00','null','897787765','2',1216),('3','null','null','member',300,209.95,'jurasic','2020-12-12 12:00:00','1115','111222335','3',1217),('12','Liam@gmail.com','0503456547','group',1200,855,'jurasic','2020-12-12 16:00:00','1139','324321237','5',1218),('4','nur@gmail.com','0565432345','regular',400,323,'jurasic','2020-12-13 08:00:00','null','777666554','2',1219),('2','Robert@gmail.com','0543456544','member',200,129.2,'jurasic','2020-12-13 12:00:00','1116','111222336','2',1220),('15','Cameron@yahoo.com','0503456541','group',1500,1068.75,'jurasic','2020-12-13 16:00:00','1141','324321239','15',1221),('7','null','null','member',700,532.95,'jurasic','2020-12-14 08:00:00','1117','111222337','6',1222),('5','micha@walla.com','0564345432','regular',500,403.75,'jurasic','2020-12-14 12:00:00','null','345434565','4',1223),('10','LiamN@gmail.com','0503456548','group',1000,712.5,'jurasic','2020-12-14 16:00:00','1140','324321238','10',1224),('1','shir@gmail.com','0564321231','regular',100,80.75,'jurasic','2020-12-15 08:00:00','null','776655664','1',1225),('6','Kendel@gmail.com','0543456546','member',600,468.35,'jurasic','2020-12-15 12:00:00','1118','111222338','6',1226),('9','Maluma@yahoo.com','0503456545','group',900,641.25,'jurasic','2020-12-15 16:00:00','1137','324321235','8',1227),('2','null','null','regular',200,161.5,'jurasic','2020-12-16 08:00:00','null','987876765','2',1228),('1','Kris@gmail.com','0543456547','member',100,64.6,'jurasic','2020-12-16 12:00:00','1119','111222339','1',1229),('5','Liam@gmail.com','0503456547','group',500,356.25,'jurasic','2020-12-16 16:00:00','1139','324321237','5',1230),('1','loi@gmail.com','0543456787','regular',100,80.75,'jurasic','2020-12-17 08:00:00','null','123432124','1',1231),('9','Jason@gmail.com','0503456546','group',900,641.25,'jurasic','2020-12-17 12:00:00','1138','324321236','9',1232),('8','null','null','member',800,613.7,'jurasic','2020-12-17 16:00:00','1120','111221333','8',1233),('4','gal@walla.com','0567654567','regular',400,323,'jurasic','2020-12-18 08:00:00','null','454323432','1',1234),('10','LiamN@gmail.com','0503456548','group',1000,712.5,'jurasic','2020-12-18 12:00:00','1140','324321238','9',1235),('3','Kourtney@gmail.com','0543456541','member',300,193.79999999999998,'jurasic','2020-12-18 16:00:00','1114','111222334','3',1236),('4','Kourtney@gmail.com','0543456541','member',400,274.54999999999995,'jurasic','2020-12-19 08:00:00','1114','111222334','2',1237),('1','lori@gmail.com','0598964324','regular',100,80.75,'jurasic','2020-12-19 12:00:00','null','233322212','1',1238),('6','Jason@gmail.com','0503456546','group',600,427.5,'jurasic','2020-12-19 16:00:00','1138','324321236','4',1239),('8','rona@walla.com','0598767876','regular',800,646,'jurasic','2020-12-20 08:00:00','null','333223221','8',1240),('2','Matt@yahoo.com','0533456547','member',200,129.2,'jurasic','2020-12-20 12:00:00','1134','234543348','2',1241),('14','Cameron@yahoo.com','0503456541','group',1400,997.5,'jurasic','2020-12-20 16:00:00','1141','324321239','8',1242),('5','hello@gmail.com','0584678765','regular',500,403.75,'jurasic','2020-12-21 08:00:00','null','243423423','5',1243),('15','Maluma@yahoo.com','0503456545','group',1500,1068.75,'jurasic','2020-12-21 12:00:00','1137','324321235','12',1244),('5','kim@gmail.com','0543456543','member',500,339.15,'jurasic','2020-12-21 16:00:00','1113','111222333','4',1245),('9','milan@walla.com','0564345676','regular',900,726.75,'jurasic','2020-12-22 08:00:00','null','345432344','5',1246),('7','null','null','member',700,500.65,'jurasic','2020-12-22 12:00:00','1134','234543348','6',1247),('15','Jason@gmail.com','0503456546','group',1500,1068.75,'jurasic','2020-12-22 16:00:00','1138','324321236','14',1248),('4','Oprah@yahoo.com','0523456543','member',400,290.7,'jurasic','2020-12-23 08:00:00','1121','222333444','3',1249),('12','Cameron@yahoo.com','0503456541','group',1200,855,'jurasic','2020-12-23 12:00:00','1141','324321239','11',1250),('2','Bradley@yahoo.com','0523456542','member',200,145.35,'jurasic','2020-12-23 16:00:00','1123','222333442','2',1251),('1','rona@walla.com','0598767876','regular',100,80.75,'jurasic','2020-12-24 08:00:00','null','333223221','1',1252),('15','LiamN@gmail.com','0503456548','group',1500,1068.75,'jurasic','2020-12-24 12:00:00','1140','324321238','12',1253),('2','Khloe@gmail.com','0543456542','member',200,129.2,'jurasic','2020-12-24 16:00:00','1115','111222335','2',1254),('6','eyal@gmail.com','0589876787','regular',600,484.5,'jurasic','2020-12-25 08:00:00','null','034321234','6',1255),('5','Rihanna@gmail.com','0533456544','member',500,339.15,'jurasic','2020-12-25 12:00:00','1131','234543341','5',1256),('14','Jason@gmail.com','0503456546','group',1400,997.5,'jurasic','2020-12-25 16:00:00','1138','324321236','9',1257),('6','null','null','member',600,387.59999999999997,'jurasic','2020-12-26 08:00:00','1142','325321239','6',1258),('8','lori@gmail.com','0598964324','regular',800,646,'jurasic','2020-12-26 12:00:00','null','233322212','7',1259),('11','Cameron@yahoo.com','0503456541','group',1100,783.75,'jurasic','2020-12-26 16:00:00','1141','324321239','10',1260),('9','Hay@yahoo.com','0523459945','regular',900,726.75,'jurasic','2020-12-27 08:00:00','null','123432123','9',1261),('14','Maluma@yahoo.com','0503456545','group',1400,997.5,'jurasic','2020-12-27 12:00:00','1137','324321235','9',1262),('3','Selena@yahoo.com','0523456547','member',300,226.1,'jurasic','2020-12-27 16:00:00','1127','234543345','3',1263),('2','Robert@gmail.com','0543456544','member',200,129.2,'jurasic','2020-12-28 08:00:00','1116','111222336','2',1264),('12','Maluma@yahoo.com','0503456545','group',1200,855,'jurasic','2020-12-28 12:00:00','1137','324321235','11',1265),('4','shir@gmail.com','0564321231','regular',400,323,'jurasic','2020-12-28 16:00:00','null','776655664','2',1266),('1','jack@gmail.com','0546765432','regular',100,80.75,'jurasic','2020-12-29 08:00:00','null','897787765','1',1267),('13','LiamN@gmail.com','0503456548','group',1300,926.25,'jurasic','2020-12-29 12:00:00','1140','324321238','12',1268),('5','Robert@gmail.com','0543456544','member',500,371.45,'jurasic','2020-12-29 16:00:00','1116','111222336','4',1269),('7','gal@walla.com','0567654567','regular',700,565.25,'jurasic','2020-12-30 08:00:00','null','454323432','3',1270),('4','Justin@yahoo.com','0523456544','member',400,290.7,'jurasic','2020-12-30 12:00:00','1124','222333443','4',1271),('11','null','null','group',1100,783.75,'jurasic','2020-12-30 16:00:00','1141','324321239','8',1272),('6','micha@walla.com','0564345432','regular',600,484.5,'jurasic','2020-12-31 08:00:00','null','345434565','6',1273),('7','Kendel@gmail.com','0543456546','member',700,549.1,'jurasic','2020-12-31 12:00:00','1118','111222338','6',1274),('14','LiamN@gmail.com','0503456548','group',1400,997.5,'jurasic','2020-12-31 16:00:00','1140','324321238','12',1275),('1','hello@howareu.com','0546585958','regular',100,84.15,'universal','2021-01-01 08:00:00','null','123456456','1',1276),('5','Angelina@yahoo.com','0503457441','member',500,336.6,'universal','2021-01-02 08:00:00','1142','325321239','5',1277),('1','Cameron@yahoo.com','0503456541','group',100,74.25,'universal','2021-01-03 08:00:00','1141','324321239','1',1278),('3','null','null','group',300,222.75,'universal','2021-01-04 08:00:00','1140','324321238','3',1279),('12','Liam@gmail.com','0503456547','group',1200,891,'universal','2021-01-05 08:00:00','1139','324321237','12',1280),('13','Jason@gmail.com','0503456546','group',1300,965.25,'universal','2021-01-06 08:00:00','1138','324321236','13',1281),('13','Jason@gmail.com','0503456546','group',1300,965.25,'universal','2021-01-07 08:00:00','1138','324321236','11',1282),('13','Jason@gmail.com','0503456546','group',1300,965.25,'universal','2021-01-08 08:00:00','1138','324321236','13',1283),('13','Jason@gmail.com','0503456546','group',1300,965.25,'universal','2021-01-09 08:00:00','1138','324321236','0',1284),('13','Jason@gmail.com','0503456546','group',1300,965.25,'universal','2021-01-01 12:00:00','1138','324321236','12',1285),('6','dsa@ew.ew','0546898988','regular',600,504.9,'universal','2021-01-11 08:00:00','null','123456455','0',1286),('3','hju@wa.ko','0565898988','regular',300,252.45,'universal','2021-01-11 08:00:00','null','325698898','0',1288),('1','mustafa@ali.com','0565898988','regular',100,84.15,'universal','2021-01-11 12:00:00','null','326598556','0',1289),('10','ahmad@ahm.ad','0546464646','regular',1000,841.5,'universal','2021-01-11 16:00:00','null','326541189','0',1290),('2','kim@gmail.com','0543456543','member',200,134.64,'universal','2021-01-12 08:00:00','1113','111222333','0',1291),('6','Kourtney@gmail.com','0543456541','member',600,454.40999999999997,'universal','2021-01-12 12:00:00','1114','111222334','0',1292),('2','Khloe@gmail.com','0543456542','member',200,134.64,'universal','2021-01-12 16:00:00','1115','111222335','0',1293),('10','Cameron@yahoo.com','0503456541','group',1000,742.5,'universal','2021-01-13 08:00:00','1141','324321239','0',1294),('1','chico@matrico.com','0503456541','member',100,67.32,'universal','2021-01-13 12:00:00','1116','111222336','0',1295),('1','chico@matrico.com','0548989898','regular',100,84.15,'universal','2021-01-13 16:00:00','null','123456126','0',1296),('12','Cameron@yahoo.com','0503456541','group',1200,891,'universal','2021-01-14 08:00:00','1141','324321239','0',1297),('6','Kylie@gmail.com','0543456545','member',600,471.23999999999995,'universal','2021-01-14 12:00:00','1117','111222337','0',1298),('5','roi@annoy.com','0546989898','regular',500,420.75,'universal','2021-01-14 16:00:00','null','369586592','0',1299),('1','Cameron@yahoo.com','0503456541','group',100,74.25,'universal','2021-01-15 08:00:00','1141','324321239','0',1300),('1','Kendel@gmail.com','0543456546','member',100,67.32,'universal','2021-01-15 08:00:00','1118','111222338','0',1301),('1','bar@hayafa.com','0659898988','regular',100,84.15,'universal','2021-01-15 16:00:00','null','235689147','0',1302),('15','Cameron@yahoo.com','0503456541','group',1500,1113.75,'universal','2021-01-18 08:00:00','1141','324321239','0',1303),('15','LiamN@gmail.com','0503456548','group',1500,1113.75,'universal','2021-01-18 08:00:00','1140','324321238','0',1304),('20','yom@kief.il','0566565656','regular',2000,1683,'universal','2021-01-17 08:00:00','null','123456123','0',1305),('5','tom@kef3.com','0568989898','regular',500,420.75,'universal','2021-01-17 12:00:00','null','456891256','0',1306),('1','Kris@gmail.com','0543456547','member',100,67.32,'universal','2021-01-18 12:00:00','1119','111222339','0',1307),('10','yom@kief.il','0503456541','regular',1000,841.5,'universal','2021-01-19 12:00:00','null','256985698','0',1308),('5','Scott@gmail.com','0543456548','member',500,387.09,'universal','2021-01-20 12:00:00','1120','111221333','0',1309),('13','Oprah@yahoo.com','0523456543','member',1300,1060.29,'universal','2021-01-21 12:00:00','1121','222333444','0',1310),('5','ofir@vaknin.com','0565656565','regular',500,420.75,'universal','2021-01-22 16:00:00','null','326598659','0',1311),('1','alon@ivsh.po','0568989898','regular',100,84.15,'universal','2021-01-24 12:00:00','null','123456128','0',1312),('1','sharon@sharon.com','0565656565','regular',100,84.15,'universal','2021-01-24 08:00:00','null','123456456','0',1313),('5','nir@pikan.vo','0565656555','regular',500,420.75,'universal','2021-01-25 08:00:00','null','789456456','0',1314),('5','meital@nir.com','0565656565','regular',500,420.75,'universal','2021-01-25 12:00:00','null','123456568','0',1315),('2','charlie@haimov.cv','0565656565','regular',200,168.3,'universal','2021-01-25 16:00:00','null','321654123','0',1316),('10','jorjet@thecat.com','0556565655','regular',1000,841.5,'universal','2021-01-26 08:00:00','null','222222221','0',1317),('1','mike@thecat.com','0565656565','regular',100,84.15,'universal','2021-01-26 12:00:00','null','123456123','0',1318),('4','marley@thedog.com','0565656555','regular',400,336.6,'universal','2021-01-26 16:00:00','null','456123568','0',1319),('2','null','null','member',200,136,'disney','2020-12-01 16:00:00','1116','111222336','2',2000),('5','hodaya@gmail.com','0546666347','regular',500,425,'disney','2020-12-01 16:00:00','null','657485947','0',2001),('2','barkayt@nana.com','0523425364','regular',200,170,'disney','2020-12-02 08:00:00','null','443546385','2',2002),('1','roiAmar@agudatStudents.co.il','0543263475','regular',100,85,'disney','2020-12-02 12:00:00','null','647584536','0',2003),('10','BarRefali@IRS.com','0564384924','regular',1000,850,'disney','2020-12-02 16:00:00','null','064537456','0',2004),('15','roiAmar@refael.com','0523453426','group',1500,1125,'disney','2020-12-02 12:00:00','1141','324321239','0',2005),('20','barkayt@nana.com','0546666352','regular',2000,1700,'disney','2020-12-03 16:00:00','null','653647583','20',2006),('2','rinatStu@rfael.com','0528756453','member',200,136,'disney','2020-12-03 08:00:00','1124','222333443','2',2007),('15','eranHaas@gmail.com','0524356475','regular',1500,1275,'disney','2020-12-03 12:00:00','null','865436577','0',2008),('15','bar@gmail.com','0564443524','group',1500,1125,'disney','2020-12-04 16:00:00','1137','324321235','15',2009),('20','saraKatz@elbit.com','0653423546','regular',2000,1700,'disney','2020-12-04 08:00:00','null','764534627','20',2010),('10','rinatStu@rfael.com','0546663547','regular',1000,850,'disney','2020-12-05 08:00:00','null','635462374','0',2011),('7','haim@yahoo.com','0543332435','member',700,527,'disney','2020-12-05 12:00:00','1128','234543344','0',2012),('7','null','null','regular',700,595,'disney','2020-12-05 16:00:00','null','534235467','7',2013),('2','bar@cyberEucation.co.il','0546663748','regular',200,170,'disney','2020-12-06 08:00:00','null','000564758','2',2014),('20','nastya@walla.com','0547776758','regular',2000,1700,'disney','2020-12-06 16:00:00','null','453748604','0',2015),('7','BarRefali@IRS.com','0453334235','regular',700,595,'disney','2020-12-06 12:00:00','null','325463748','0',2016),('7','hodayaMekonen@apple.com','0546663546','member',700,476,'disney','2020-12-06 12:00:00','1122','222333441','0',2017),('17','roiAmar@refael.com','0548887364','regular',1700,1445,'disney','2020-12-07 08:00:00','null','534235467','17',2018),('20','haim@psagot.com','0546663547','regular',2000,1700,'disney','2020-12-07 12:00:00','null','435236475','0',2019),('9','eranHaas@gmail.com','0546663745','regular',900,765,'disney','2020-12-07 16:00:00','null','341862589','9',2020),('1','barkayt@nana.com','0546663547','regular',100,85,'disney','2020-12-08 08:00:00','null','777658496','1',2021),('15','Rinat@Students.com','0546663547','group',1500,1125,'disney','2020-12-08 12:00:00','1138','324321236','0',2022),('15','barKatz@maKara.com','0546663547','group',1500,1125,'disney','2020-12-08 16:00:00','1140','324321238','15',2023),('19','Rinat@Students.com','0546663546','regular',1900,1615,'disney','2020-12-09 12:00:00','null','435463748','0',2024),('5','roiAmar@agudatStudents.co.il','0546663475','regular',500,425,'disney','2020-12-09 08:00:00','null','645364758','5',2025),('8','Rinat@Students.com','0523332435','regular',800,680,'disney','2020-12-09 16:00:00','null','543647583','0',2026),('4','barKatz@maKara.com','0546663547','member',400,272,'disney','2020-12-09 16:00:00','1131','234543341','0',2027),('3','bar@gmail.com','0546663547','regular',300,255,'disney','2020-12-10 08:00:00','null','074658364','0',2028),('20','hodaya@gmail.com','0657774637','regular',2000,1700,'disney','2020-12-10 16:00:00','null','746534523','20',2029),('4','haim@yahoo.com','0546665474','regular',400,340,'disney','2020-12-10 12:00:00','null','764534423','0',2030),('15','nastya@walla.com','0546663547','member',1500,1241,'disney','2020-12-11 08:00:00','1116','111222336','15',2031),('15','roi@hotail.co.il','0563334253','member',1500,1241,'disney','2020-12-11 12:00:00','1117','111222337','0',2032),('20','barkayt@nana.com','0653334235','member',2000,1683,'disney','2020-12-11 16:00:00','1118','111222338','0',2033),('15','roiAmar@agudatStudents.co.il','0564445346','group',1500,1125,'disney','2020-12-12 08:00:00','1137','324321235','15',2034),('15','nastyaKokim@invidia.com','0546663545','group',1500,1125,'disney','2020-12-12 16:00:00','1138','324321236','15',2035),('15','rinatStu@rfael.com','0523331243','group',1500,1125,'disney','2020-12-12 12:00:00','1139','324321237','0',2036),('10','hodayaMekonen@apple.com','0514236485','regular',1000,850,'disney','2020-12-13 08:00:00','null','546347364','10',2037),('12','haim@psagot.com','0546663456','regular',1200,1020,'disney','2020-12-13 12:00:00','null','005635462','0',2038),('17','bar@cyberEucation.co.il','0546663542','regular',1700,1445,'disney','2020-12-13 16:00:00','null','321435462','17',2039),('1','eranHaas@gmail.com','0523334253','member',100,68,'disney','2020-12-14 08:00:00','1127','234543345','0',2040),('17','BarRefali@IRS.com','0523334235','regular',1700,1445,'disney','2020-12-14 12:00:00','null','314532456','0',2041),('13','saraKatz@elbit.com','0536664274','regular',1300,1105,'disney','2020-12-14 16:00:00','null','534231234','13',2042),('8','eranHaas@physiotherapy.co.il','0546663456','regular',800,680,'disney','2020-12-15 08:00:00','null','435263475','0',2043),('15','Rinat@Students.com','0425553465','regular',1500,1275,'disney','2020-12-15 12:00:00','null','743456734','0',2044),('17','roiAmar@refael.com','0543334253','regular',1700,1445,'disney','2020-12-15 16:00:00','null','314534567','0',2045),('2','roiAmar@magshimim.co.il','0543334264','member',200,136,'disney','2020-12-16 08:00:00','1116','111222336','2',2046),('15','barKatz@maKara.com','0324443546','group',1500,1125,'disney','2020-12-16 08:00:00','1140','324321238','0',2047),('16','bar@gmail.com','0453335465','regular',1600,1360,'disney','2020-12-16 16:00:00','null','314253647','16',2048),('15','haim@yahoo.com','0543336475','group',1500,1125,'disney','2020-12-16 12:00:00','1141','324321239','0',2049),('10','null','null','regular',1000,850,'disney','2020-12-17 08:00:00','null','314253654','3',2050),('10','roi@hotail.co.il','0543336456','member',1000,833,'disney','2020-12-17 12:00:00','1123','222333442','0',2051),('12','barkayt@nana.com','0435552435','regular',1200,1020,'disney','2020-12-17 16:00:00','null','314253645','12',2052),('20','roiAmar@agudatStudents.co.il','0543332435','regular',2000,1700,'disney','2020-12-18 08:00:00','null','314253647','0',2053),('10','BarRefali@IRS.com','0546663546','member',1000,833,'disney','2020-12-18 12:00:00','1136','324321234','0',2054),('16','bar@gmail.com','0543332435','regular',1600,1360,'disney','2020-12-18 16:00:00','null','423526374','0',2055),('18','hodaya@gmail.com','0435552435','regular',1800,1530,'disney','2020-12-19 08:00:00','null','314253644','0',2056),('15','nastya@walla.com','0546663547','group',1500,1125,'disney','2020-12-19 16:00:00','1139','324321237','15',2057),('18','barkayt@nana.com','0546663745','regular',1800,1530,'disney','2020-12-19 12:00:00','null','435263475','0',2058),('7','roiAmar@agudatStudents.co.il','6475385635','member',700,561,'disney','2020-12-20 08:00:00','1115','111222335','0',2059),('4','barkayt@nana.com','0534442354','regular',400,340,'disney','2020-12-20 12:00:00','null','653426495','0',2060),('9','nastyaKokim@invidia.com','0765546354','regular',900,765,'disney','2020-12-20 16:00:00','null','436472543','9',2061),('5','rinatStu@rfael.com','0342354658','group',500,375,'disney','2020-12-21 08:00:00','1138','324321236','0',2062),('7','hodayaMekonen@apple.com','7653456789','member',700,578,'disney','2020-12-21 08:00:00','1136','324321234','0',2063),('7','BarRefali@IRS.com','0543334578','regular',700,595,'disney','2020-12-21 08:00:00','null','088774637','0',2064),('16','nastyaKokim@invidia.com','6784573955','regular',1600,1360,'disney','2020-12-21 12:00:00','null','453647583','0',2065),('17','haim@psagot.com','0654443546','regular',1700,1445,'disney','2020-12-22 08:00:00','null','554453465','0',2066),('18','saraKatz@elbit.com','0546663547','regular',1800,1530,'disney','2020-12-22 12:00:00','null','543647834','18',2067),('13','null','null','regular',1300,1105,'disney','2020-12-22 16:00:00','null','434343444','0',2068),('18','hodaya@gmail.com','0546663574','regular',1800,1530,'disney','2020-12-23 08:00:00','null','546354758','0',2069),('7','haim@yahoo.com','0654443546','member',700,578,'disney','2020-12-23 12:00:00','1118','111222338','7',2070),('16','nastya@walla.com','8645534567','member',1600,1224,'disney','2020-12-23 16:00:00','1142','325321239','16',2071),('15','barkayt@nana.com','0657774657','group',1500,1125,'disney','2020-12-24 08:00:00','1138','324321236','0',2072),('15','roiAmar@agudatStudents.co.il','0654445365','group',1500,1125,'disney','2020-12-24 12:00:00','1139','324321237','0',2073),('10','rinatStu@rfael.com','3334253645','group',1000,750,'disney','2020-12-24 16:00:00','1141','324321239','10',2074),('16','bar@cyberEucation.co.il','0547773645','regular',1600,1360,'disney','2020-12-25 08:00:00','null','735465768','0',2075),('16','hodaya@gmail.com','6534567832','regular',1600,1360,'disney','2020-12-25 12:00:00','null','546374856','16',2076),('15','null','null','member',1500,1241,'disney','2020-12-25 16:00:00','1117','111222337','15',2077),('16','nastya@walla.com','6485930456','member',1600,1343,'disney','2020-12-26 08:00:00','1118','111222338','0',2078),('16','roi@hotail.co.il','0756664758','regular',1600,1360,'disney','2020-12-26 12:00:00','null','056444374','0',2079),('14','barkayt@nana.com','5434567893','regular',1400,1190,'disney','2020-12-26 16:00:00','null','657465936','0',2080),('2','hodaya@gmail.com','0523423456','member',200,136,'disney','2020-12-26 08:00:00','1120','111221333','0',2081),('15','haim@yahoo.com','0564758345','group',1500,1125,'disney','2020-12-27 08:00:00','1137','324321235','0',2082),('13','Rinat@Students.com','0647536475','member',1300,1088,'disney','2020-12-27 12:00:00','1136','324321234','13',2083),('10','roiAmar@magshimim.co.il','0884758374','regular',1000,850,'disney','2020-12-27 16:00:00','null','746573648','10',2084),('14','saraKatz@elbit.com','0654447586','member',1400,1173,'disney','2020-12-28 08:00:00','1136','324321234','0',2085),('18','Rinat@Students.com','4345676433','regular',1800,1530,'disney','2020-12-28 12:00:00','null','434567657','18',2086),('15','eranHaas@gmail.com','0546663547','group',1500,1125,'disney','2020-12-28 16:00:00','1141','324321239','0',2087),('3','BarRefali@IRS.com','4345676543','regular',300,255,'disney','2020-12-29 08:00:00','null','654759485','0',2088),('20','null','null','regular',2000,1700,'disney','2020-12-29 12:00:00','null','657485069','20',2089),('14','hodaya@gmail.com','3343212345','regular',1400,1190,'disney','2020-12-29 16:00:00','null','546312345','0',2090),('15','haim@yahoo.com','0543332435','group',1500,1125,'disney','2020-12-30 08:00:00','1137','324321235','0',2091),('1','nastya@walla.com','0546663546','member',100,68,'disney','2020-12-30 08:00:00','1119','111222339','0',2092),('17','eranHaas@physiotherapy.co.il','0657774536','regular',1700,1445,'disney','2020-12-30 16:00:00','null','564758465','17',2093),('12','roi@hotail.co.il','0534442354','regular',1200,1020,'disney','2020-12-31 08:00:00','null','435263742','0',2094),('4','barkayt@nana.com','0764657342','regular',400,340,'disney','2020-12-31 12:00:00','null','087352434','4',2095),('2','roiAmar@agudatStudents.co.il','0543335467','member',200,136,'disney','2020-12-31 16:00:00','1120','111221333','2',2096),('0','null','null','regular',200,196,'disney','2020-12-02 08:00:00','null','null','2',2097),('0','null','null','regular',300,294,'disney','2020-12-06 08:00:00','null','null','3',2098),('0','null','null','regular',100,98,'disney','2020-12-08 08:00:00','null','null','1',2099),('0','null','null','regular',300,294,'disney','2020-12-31 12:00:00','null','null','3',2100),('3','hello@walla.com','0543456543','regular',300,249.9,'disney','2021-01-09 16:00:00','null','554455445','0',2500),('4','lital@walla.com','0574356765','regular',400,333.2,'disney','2021-01-11 08:00:00','null','099887789','0',2503),('7','Denzel@yahoo.com','0533456542','member',700,533.12,'disney','2021-01-11 12:00:00','1130','234543342','0',2504),('10','Cameron@yahoo.com','0503456541','group',1000,735,'disney','2021-01-12 08:00:00','1141','324321239','0',2505),('7','eli@hotmail.com','0587656765','regular',700,583.1,'disney','2021-01-12 12:00:00','null','345454445','0',2506),('3','moran@gmail.com','0548787654','regular',300,249.9,'disney','2021-01-12 16:00:00','null','054545654','0',2507),('1','Scott@gmail.com','0543456548','member',100,66.64,'disney','2021-01-13 08:00:00','1120','111221333','0',2508),('5','liat@walla.com','0527487675','regular',500,416.5,'disney','2021-01-13 12:00:00','null','987787767','0',2509),('10','Maluma@yahoo.com','0503456545','group',1000,735,'disney','2021-01-13 16:00:00','1137','324321235','0',2510),('8','Liam@gmail.com','0503456547','group',800,588,'disney','2021-01-14 08:00:00','1139','324321237','0',2512),('5','Kris@gmail.com','0543456547','member',500,399.84,'disney','2021-01-14 12:00:00','1119','111222339','0',2513),('4','elinor@walla.com','0565435423','regular',400,333.2,'disney','2021-01-14 16:00:00','null','765567765','0',2515),('7','lior@nana.com','0532343212','regular',700,583.1,'disney','2021-01-15 08:00:00','null','067654565','0',2517),('1','Oprah@yahoo.com','0523456543','member',100,66.64,'disney','2021-01-15 12:00:00','1121','222333444','0',2519),('8','LiamN@gmail.com','0503456548','group',800,588,'disney','2021-01-15 16:00:00','1140','324321238','0',2520),('1','ayelt@yahoo.com','0587986786','regular',100,83.3,'disney','2021-01-16 08:00:00','null','098878987','0',2521),('2','Kendel@gmail.com','0543456546','member',200,149.94,'disney','2021-01-16 12:00:00','1118','111222338','0',2522),('7','Angelina@yahoo.com','0503457441','member',700,466.48,'disney','2021-01-16 16:00:00','1142','325321239','0',2523),('5','will@yahoo.com','0578765678','regular',500,416.5,'disney','2021-01-17 08:00:00','null','065654657','0',2524),('15','Maluma@yahoo.com','0503456545','group',1500,1102.5,'disney','2021-01-17 12:00:00','1137','324321235','0',2525),('3','Kylie@gmail.com','0543456545','member',300,216.57999999999998,'disney','2021-01-17 16:00:00','1117','111222337','0',2526),('15','Liam@gmail.com','0503456547','group',1500,1102.5,'disney','2021-01-18 12:00:00','1139','324321237','0',2527),('10','gilgol@nana.com','0534321234','regular',1000,833,'disney','2021-01-18 08:00:00','null','878787878','0',2528),('1','Bradley@yahoo.com','0523456542','member',100,66.64,'disney','2021-01-18 16:00:00','1123','222333442','0',2529),('8','Justin@yahoo.com','0523456544','member',800,633.08,'disney','2021-01-19 08:00:00','1124','222333443','0',2530),('15','Jason@gmail.com','0503456546','group',1500,1102.5,'disney','2021-01-19 16:00:00','1138','324321236','0',2531),('4','vina@yahoo.com','0587678765','regular',400,333.2,'disney','2021-01-19 12:00:00','null','987654545','0',2532),('15','Cameron@yahoo.com','0503456541','group',1500,1102.5,'disney','2021-01-20 08:00:00','1141','324321239','0',2534),('2','Robert@gmail.com','0543456544','member',200,133.28,'disney','2021-01-20 12:00:00','1116','111222336','0',2536),('7','Halle@yahoo.com','0523456546','member',700,499.79999999999995,'disney','2021-01-21 08:00:00','1126','222333446','0',2537),('1','atay@nana.com','0532454345','regular',100,83.3,'disney','2021-01-21 12:00:00','null','333555655','0',2538),('10','Angelina@yahoo.com','0503457441','member',1000,699.72,'disney','2021-01-21 16:00:00','1142','325321239','0',2539),('1','eliav@yahoo.com','0567656787','regular',100,83.3,'disney','2021-01-22 08:00:00','null','232123234','0',2540),('3','Ciara@gmail.com','0533456545','member',300,199.92,'disney','2021-01-22 12:00:00','1132','234543346','0',2541),('10','Maluma@yahoo.com','0503456545','group',1000,735,'disney','2021-01-22 16:00:00','1137','324321235','0',2542),('5','avi@gmail.com','0543456543','regular',500,416.5,'disney','2021-01-23 08:00:00','null','016897654','0',2543),('1','Bruno@yahoo.com','0503456544','member',100,66.64,'disney','2021-01-23 12:00:00','1136','324321234','0',2544),('5','Jason@gmail.com','0503456546','group',500,367.5,'disney','2021-01-23 16:00:00','1138','324321236','0',2545),('1','william@yahoo.com','0576765676','regular',100,83.3,'disney','2021-01-24 08:00:00','null','078987897','0',2546),('5','Selena@yahoo.com','0523456547','member',500,399.84,'disney','2021-01-24 12:00:00','1127','234543345','0',2547),('8','Cameron@yahoo.com','0503456541','group',800,588,'disney','2021-01-24 16:00:00','1141','324321239','0',2548),('4','love@nana.com','0587656764','regular',400,333.2,'disney','2021-01-25 08:00:00','null','267678765','0',2549),('2','George@gmail.com','0533456546','member',200,149.94,'disney','2021-01-25 12:00:00','1133','234543347','0',2550),('9','LiamN@gmail.com','0503456548','group',900,661.5,'disney','2021-01-25 16:00:00','1140','324321238','0',2551),('3','rita@gmail.com','0534344565','regular',300,249.9,'disney','2021-01-26 08:00:00','null','976675657','0',2552),('12','Liam@gmail.com','0503456547','group',1200,882,'disney','2021-01-26 12:00:00','1139','324321237','0',2553),('2','Khloe@gmail.com','0543456542','member',200,133.28,'disney','2021-01-26 16:00:00','1115','111222335','0',2554),('4','madona@yahoo.com','0534567898','regular',400,333.2,'disney','2021-01-27 08:00:00','null','343454565','0',2555),('3','Kourtney@gmail.com','0543456541','member',300,199.92,'disney','2021-01-27 12:00:00','1114','111222334','0',2556),('15','Jason@gmail.com','0503456546','group',1500,1102.5,'disney','2021-01-27 16:00:00','1138','324321236','0',2557),('5','linoy@nana.com','0532121232','regular',500,416.5,'disney','2021-01-28 08:00:00','null','245456679','0',2559),('6','kim@gmail.com','0543456543','member',600,433.15999999999997,'disney','2021-01-28 12:00:00','1113','111222333','0',2560),('9','Maluma@yahoo.com','0503456545','group',900,661.5,'disney','2021-01-28 16:00:00','1137','324321235','0',2561),('3','hagit@gmail.com','0576534323','regular',300,249.9,'disney','2021-01-29 08:00:00','null','345453343','0',2563),('6','Shawn@yahoo.com','0523456548','member',600,433.15999999999997,'disney','2021-01-29 12:00:00','1128','234543344','0',2564),('12','Jason@gmail.com','0503456546','group',1200,882,'disney','2021-01-29 16:00:00','1138','324321236','0',2565),('1','miri@yahoo.com','0578987676','regular',100,83.3,'disney','2021-01-30 16:00:00','null','256765678','0',2566),('10','LiamN@gmail.com','0503456548','group',1000,735,'disney','2021-01-30 08:00:00','1140','324321238','0',2567),('2','Kanye@yahoo.com','0533456541','member',200,133.28,'disney','2021-01-30 12:00:00','1129','234543343','0',2568),('5','morani@gmail.com','0587654567','regular',500,416.5,'disney','2021-01-31 08:00:00','null','278765679','0',2569),('12','Angelina@yahoo.com','0503457441','member',1200,866.3199999999999,'disney','2021-01-31 12:00:00','1142','325321239','0',2570),('7','Matt@yahoo.com','0533456547','member',700,516.46,'disney','2021-01-31 16:00:00','1134','234543348','0',2571);
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `park`
--

DROP TABLE IF EXISTS `park`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `park` (
  `parkName` varchar(45) NOT NULL,
  `currentVisitoreAmount` varchar(45) DEFAULT NULL,
  `maxVisitorAmount` varchar(45) DEFAULT NULL,
  `maxOrderVisitorsAmount` varchar(45) DEFAULT NULL,
  `entryPrice` varchar(45) DEFAULT '100',
  `mangerDiscount` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`parkName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `park`
--

LOCK TABLES `park` WRITE;
/*!40000 ALTER TABLE `park` DISABLE KEYS */;
INSERT INTO `park` VALUES ('disney','0','50','20','100','0.98'),('jurasic','0','50','40','100','0.95'),('universal','0','50','30','100','0.99');
/*!40000 ALTER TABLE `park` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pendingmanagerrequests`
--

DROP TABLE IF EXISTS `pendingmanagerrequests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pendingmanagerrequests` (
  `employeeID` int NOT NULL,
  `requesttype` varchar(45) NOT NULL,
  `maxCapacity` int DEFAULT NULL,
  `ordersCapacity` int DEFAULT NULL,
  `discount` varchar(45) DEFAULT NULL,
  `fromdate` datetime DEFAULT NULL,
  `todate` datetime DEFAULT NULL,
  `parkname` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`employeeID`,`requesttype`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pendingmanagerrequests`
--

LOCK TABLES `pendingmanagerrequests` WRITE;
/*!40000 ALTER TABLE `pendingmanagerrequests` DISABLE KEYS */;
INSERT INTO `pendingmanagerrequests` VALUES (12344,'max_c',60,30,'','2001-01-00 00:00:00','2001-01-00 00:00:00','jurasic'),(12344,'max_o',60,20,'','2001-01-00 00:00:00','2001-01-00 00:00:00','jurasic'),(12347,'max_c',60,20,'','2001-01-00 00:00:00','2001-01-00 00:00:00','universal'),(12347,'max_o',60,10,'','2001-01-00 00:00:00','2001-01-00 00:00:00','universal');
/*!40000 ALTER TABLE `pendingmanagerrequests` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pendingwaitlist`
--

DROP TABLE IF EXISTS `pendingwaitlist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pendingwaitlist` (
  `orderNumber` varchar(45) NOT NULL,
  `timeLimit` datetime DEFAULT NULL,
  PRIMARY KEY (`orderNumber`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pendingwaitlist`
--

LOCK TABLES `pendingwaitlist` WRITE;
/*!40000 ALTER TABLE `pendingwaitlist` DISABLE KEYS */;
/*!40000 ALTER TABLE `pendingwaitlist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `waitinglist`
--

DROP TABLE IF EXISTS `waitinglist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `waitinglist` (
  `visitorsNumber` varchar(45) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `phoneNumber` varchar(45) DEFAULT NULL,
  `orderType` varchar(45) DEFAULT NULL,
  `beforeDiscountPrice` double DEFAULT NULL,
  `afterDiscountPrice` double DEFAULT NULL,
  `parkName` varchar(45) DEFAULT NULL,
  `arrivedTime` datetime DEFAULT NULL,
  `memberID` varchar(45) DEFAULT NULL,
  `ID` varchar(45) DEFAULT NULL,
  `amountArrived` varchar(45) DEFAULT '0',
  `waitlistID` int NOT NULL,
  PRIMARY KEY (`waitlistID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `waitinglist`
--

LOCK TABLES `waitinglist` WRITE;
/*!40000 ALTER TABLE `waitinglist` DISABLE KEYS */;
INSERT INTO `waitinglist` VALUES ('8','Scott@gmail.com','0543456548','member',800,613.7,'jurasic','2021-01-17 08:00:00','1120','111221333','0',1112),('8','Kylie@gmail.com','0543456545','member',800,613.7,'jurasic','2021-01-17 08:00:00','1117','111222337','0',1113),('8','Hailey@yahoo.com','0523456545','member',800,565.25,'jurasic','2021-01-18 08:00:00','1126','222333446','0',1114),('3','Justin@yahoo.com','0523456544','member',300,209.95,'jurasic','2021-01-19 12:00:00','1124','222333443','0',1115),('15','Angelina@yahoo.com','0503457441','member',1500,1082.05,'jurasic','2021-01-20 08:00:00','1142','325321239','0',1116),('35','tom@kef2.com','0568989898','regular',3500,2945.25,'universal','2021-01-17 08:00:00','null','456891237','0',1117),('35','tom@kef3.com','0568989898','regular',3500,2945.25,'universal','2021-01-18 08:00:00','null','456891256','0',1118),('35','tom@kef3.com','0568989898','regular',3500,2945.25,'universal','2021-01-19 08:00:00','null','456891256','0',1119),('35','tom@kef3.com','0568989898','regular',3500,2945.25,'universal','2021-01-20 08:00:00','null','456891256','0',1120),('35','tom@kef3.com','0568989898','regular',3500,2945.25,'universal','2021-01-21 08:00:00','null','456891256','0',1121),('35','tom@kef3.com','0568989898','regular',3500,2945.25,'universal','2021-01-22 08:00:00','null','456891256','0',1122),('20','hello@to.you','0565656555','regular',2000,1666,'disney','2021-01-17 08:00:00','null','123654456','0',1123),('20','bar@bar.com','0565656555','regular',2000,1666,'disney','2021-01-18 08:00:00','null','123654456','0',1124),('20','kar@bar.com','0565656555','regular',2000,1666,'disney','2021-01-19 08:00:00','null','123654459','0',1125),('20','zar@bar.com','0565656555','regular',2000,1666,'disney','2021-01-20 08:00:00','null','123654451','0',1126),('20','par@bar.com','0565656555','regular',2000,1666,'disney','2021-01-21 08:00:00','null','123654451','0',1127);
/*!40000 ALTER TABLE `waitinglist` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-01-09 20:16:37
