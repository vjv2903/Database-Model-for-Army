-- MySQL dump 10.13  Distrib 8.0.17, for Linux (x86_64)
--
-- Host: localhost    Database: ARMY
-- ------------------------------------------------------
-- Server version	8.0.17-0ubuntu2

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Current Database: `ARMY`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `ARMY` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `ARMY`;

--
-- Table structure for table `CHIEF_OF_ARMY_STAFF`
--

DROP TABLE IF EXISTS `CHIEF_OF_ARMY_STAFF`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CHIEF_OF_ARMY_STAFF` (
  `ID` int(11) NOT NULL,
  `ChronologicalPosition` int(11) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CHIEF_OF_ARMY_STAFF`
--

LOCK TABLES `CHIEF_OF_ARMY_STAFF` WRITE;
/*!40000 ALTER TABLE `CHIEF_OF_ARMY_STAFF` DISABLE KEYS */;
/*!40000 ALTER TABLE `CHIEF_OF_ARMY_STAFF` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `COMMANDER_OF_CORP`
--

DROP TABLE IF EXISTS `COMMANDER_OF_CORP`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `COMMANDER_OF_CORP` (
  `ID` int(11) NOT NULL,
  `CommandID` int(11) NOT NULL,
  `CorpID` int(11) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `COMMANDER_OF_CORP`
--

LOCK TABLES `COMMANDER_OF_CORP` WRITE;
/*!40000 ALTER TABLE `COMMANDER_OF_CORP` DISABLE KEYS */;
/*!40000 ALTER TABLE `COMMANDER_OF_CORP` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `COMMANDER_OF_DIVISION`
--

DROP TABLE IF EXISTS `COMMANDER_OF_DIVISION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `COMMANDER_OF_DIVISION` (
  `ID` int(11) NOT NULL,
  `CommandID` int(11) NOT NULL,
  `CorpID` int(11) NOT NULL,
  `DivisionID` int(11) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `COMMANDER_OF_DIVISION`
--

LOCK TABLES `COMMANDER_OF_DIVISION` WRITE;
/*!40000 ALTER TABLE `COMMANDER_OF_DIVISION` DISABLE KEYS */;
/*!40000 ALTER TABLE `COMMANDER_OF_DIVISION` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `COMMANDS`
--

DROP TABLE IF EXISTS `COMMANDS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `COMMANDS` (
  `CommandID` int(11) NOT NULL,
  `CommandName` varchar(255) NOT NULL,
  `CommandingChiefID` int(11) DEFAULT NULL,
  `SalaryIncrement` float(22,2) NOT NULL,
  PRIMARY KEY (`CommandID`),
  UNIQUE KEY `CommandName` (`CommandName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `COMMANDS`
--

LOCK TABLES `COMMANDS` WRITE;
/*!40000 ALTER TABLE `COMMANDS` DISABLE KEYS */;
INSERT INTO `COMMANDS` VALUES (1,'General Command',1001,30.00),(2,'Eastern Command',1002,20.00),(3,'Northern Command',1003,35.00),(4,'Southern Command',1004,25.00),(5,'South-Western Command',1005,30.00),(6,'Western',1006,19.00),(7,'Army Training Command',1007,40.00);
/*!40000 ALTER TABLE `COMMANDS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CORPS`
--

DROP TABLE IF EXISTS `CORPS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CORPS` (
  `CorpID` int(11) NOT NULL,
  `CorpName` varchar(255) NOT NULL,
  `CommandID` int(11) NOT NULL,
  `CommanderID` int(11) DEFAULT NULL,
  `SalaryIncrement` float(22,2) NOT NULL,
  PRIMARY KEY (`CorpID`,`CommandID`),
  UNIQUE KEY `CorpName` (`CorpName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CORPS`
--

LOCK TABLES `CORPS` WRITE;
/*!40000 ALTER TABLE `CORPS` DISABLE KEYS */;
INSERT INTO `CORPS` VALUES (1,'xray',5,1005,555.00),(4,'dragon',3,1003,100.00),(4,'brutal',7,1009,300.00),(5,'77th Indian Infantry Brigade',1,1001,800.00),(5,'hawk',6,1008,600.00),(6,'Charlie',2,1002,90.00),(6,'killer',6,1006,666.00),(8,'reck',7,1010,500.00),(9,'gamma',4,1004,444.00),(45,'blackcat',7,1007,255.00),(66,'risky',3,1011,600.00);
/*!40000 ALTER TABLE `CORPS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `DEPENDENTS`
--

DROP TABLE IF EXISTS `DEPENDENTS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `DEPENDENTS` (
  `FirstName` varchar(255) NOT NULL,
  `LastName` varchar(255) NOT NULL,
  `MiddleInitial` varchar(255) NOT NULL,
  `SponsorID` int(11) NOT NULL,
  `Sex` varchar(3) NOT NULL,
  `Relationship` varchar(255) NOT NULL,
  `BirthDate` date NOT NULL,
  PRIMARY KEY (`SponsorID`,`FirstName`,`LastName`,`MiddleInitial`),
  CONSTRAINT `DEPENDENTS_chk_1` CHECK (((`Sex` = _utf8mb4'M') or (`Sex` = _utf8mb4'F') or (`Sex` = _utf8mb4'NA')))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DEPENDENTS`
--

LOCK TABLES `DEPENDENTS` WRITE;
/*!40000 ALTER TABLE `DEPENDENTS` DISABLE KEYS */;
INSERT INTO `DEPENDENTS` VALUES ('Jojo','Brown','K',1,'M','Father','1977-08-02'),('Danish','Silvester','M',2,'M','Father','1976-12-11'),('Ram','Singh','C',3,'M','Father','1980-09-23'),('James','John',' ',4,'M','Father','1970-12-04'),('Ramesh','Reddy','P',5,'M','Father','1978-10-17'),('Bimal','Grower',' ',6,'M','Father','1971-02-03'),('Nirmal','Jain',' ',7,'M','Father','1979-05-10'),('Paul','Jain',' ',8,'M','Father','1970-02-15'),('Thomson','Mark',' ',9,'M','Father','1979-08-12'),('Kiran','Reddy','K',10,'M','Father','1980-10-22');
/*!40000 ALTER TABLE `DEPENDENTS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `DIVISIONS`
--

DROP TABLE IF EXISTS `DIVISIONS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `DIVISIONS` (
  `DivID` int(11) NOT NULL,
  `DivName` varchar(255) NOT NULL,
  `CorpID` int(11) NOT NULL,
  `CommandID` int(11) NOT NULL,
  `CommanderID` int(11) DEFAULT NULL,
  `SalaryIncrement` float(22,2) NOT NULL,
  PRIMARY KEY (`DivID`,`CorpID`,`CommandID`),
  UNIQUE KEY `DivName` (`DivName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DIVISIONS`
--

LOCK TABLES `DIVISIONS` WRITE;
/*!40000 ALTER TABLE `DIVISIONS` DISABLE KEYS */;
INSERT INTO `DIVISIONS` VALUES (1,'15th Infantry Division',5,1,1001,800.00),(2,'pachim',6,2,1002,90.00),(3,'aage',4,3,1003,100.00),(4,'4th Cavalry Division',9,4,1004,444.00),(5,'4th Infantary Division',1,5,1005,555.00),(6,'niche',6,6,1006,666.00),(7,'charotrf',45,7,1007,255.00),(8,'hva',5,3,1008,600.00),(9,'pani',4,3,1009,300.00),(10,'jal',8,2,1010,500.00),(11,'aag',66,5,1011,600.00);
/*!40000 ALTER TABLE `DIVISIONS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `GENERAL_OFFICER_COMMANDING_IN_CHIEF`
--

DROP TABLE IF EXISTS `GENERAL_OFFICER_COMMANDING_IN_CHIEF`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `GENERAL_OFFICER_COMMANDING_IN_CHIEF` (
  `ID` int(11) NOT NULL,
  `CommandID` int(11) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `GENERAL_OFFICER_COMMANDING_IN_CHIEF`
--

LOCK TABLES `GENERAL_OFFICER_COMMANDING_IN_CHIEF` WRITE;
/*!40000 ALTER TABLE `GENERAL_OFFICER_COMMANDING_IN_CHIEF` DISABLE KEYS */;
/*!40000 ALTER TABLE `GENERAL_OFFICER_COMMANDING_IN_CHIEF` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PENSION`
--

DROP TABLE IF EXISTS `PENSION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `PENSION` (
  `RetirementDate` date NOT NULL,
  `Pension` float(22,2) DEFAULT NULL,
  PRIMARY KEY (`RetirementDate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PENSION`
--

LOCK TABLES `PENSION` WRITE;
/*!40000 ALTER TABLE `PENSION` DISABLE KEYS */;
/*!40000 ALTER TABLE `PENSION` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RANKS`
--

DROP TABLE IF EXISTS `RANKS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `RANKS` (
  `ID` int(11) NOT NULL,
  `RankName` varchar(255) NOT NULL,
  `RankInsignia` varchar(255) NOT NULL,
  `BaseSalary` float(22,2) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `RankName` (`RankName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RANKS`
--

LOCK TABLES `RANKS` WRITE;
/*!40000 ALTER TABLE `RANKS` DISABLE KEYS */;
INSERT INTO `RANKS` VALUES (1,'Field Marshal','National emblem over a crossed baton and saber in a lotus blossom wreath',250000.00),(2,'General','National emblem over a five-pointed star, both over a crossed baton and saber',220350.00),(3,'Lieutenant General','National emblem over crossed baton and saber',203500.00),(4,'Major General','Five-pointed star over crossed baton and saber',180000.00),(5,'Brigadier','National emblem over three five-pointed stars in a triangular formation',175000.00),(6,'Colonel','National emblem over two five-pointed stars',169000.00),(7,'Lieutenant Colonel','National emblem over five-pointed star',150000.00),(8,'Major','National emblem',135000.00),(9,'Captain','Three five-pointed stars',100000.00),(10,'Lieutenant','Two five-pointed stars',95000.00),(11,'Missioned Officers of the Indian Army','Gold national emblem with stripe',90000.00),(12,'Subedar (Infantry) or Risaldar (Cavalry and Armoured Regiments)','Two gold stars with stripe',85000.00),(13,'Naib Subedar (Infantry) or Naib Risaldar (Cavalry and Armoured Regiments)','One gold star with stripe',80000.00),(14,'Havildar (Infantry) or Daffadar (Cavalry and Armoured Regiments)','Three rank chevrons',70000.00),(15,'Naik (Infantry) or Lance Daffadar (Cavalry and Armoured Regiments)','Two rank chevrons',60000.00),(16,'Lance Naik (Infantry) or Acting Lance Daffadar (Cavalry and Armoured Regiments)','One rank chevron',50000.00),(17,'Sepoy','Plain shoulder badge',40000.00);
/*!40000 ALTER TABLE `RANKS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SALARY`
--

DROP TABLE IF EXISTS `SALARY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `SALARY` (
  `RankID` int(11) NOT NULL,
  `DivisionID` int(11) NOT NULL,
  `CorpID` int(11) NOT NULL,
  `CommandID` int(11) NOT NULL,
  `Salary` float(22,2) DEFAULT NULL,
  PRIMARY KEY (`RankID`,`DivisionID`,`CorpID`,`CommandID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SALARY`
--

LOCK TABLES `SALARY` WRITE;
/*!40000 ALTER TABLE `SALARY` DISABLE KEYS */;
INSERT INTO `SALARY` VALUES (1,20,5,1,100000.00),(2,19,6,2,150000.00),(3,18,4,3,120000.00),(4,17,9,4,125000.00),(5,16,1,5,100000.00),(6,15,6,6,100026.00),(7,14,45,7,150000.00),(8,13,5,3,250000.00),(9,12,4,3,90000.00),(10,11,8,2,80000.00),(11,10,66,2,50000.00),(12,9,2,5,60000.00),(13,8,44,5,80000.00),(14,7,8,6,90000.00),(15,6,44,6,70000.00),(16,5,11,2,40000.00),(17,4,44,4,55000.00),(18,3,545,5,85000.00),(19,2,525,3,62000.00),(20,1,5,1,30000.00);
/*!40000 ALTER TABLE `SALARY` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SOLDIER_ADDRESS`
--

DROP TABLE IF EXISTS `SOLDIER_ADDRESS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `SOLDIER_ADDRESS` (
  `ID` int(11) NOT NULL,
  `BuildingNo` int(11) DEFAULT NULL,
  `StreetNo` int(11) DEFAULT NULL,
  `Locality` varchar(255) DEFAULT NULL,
  `City` varchar(255) NOT NULL,
  `ZipCode` varchar(10) NOT NULL,
  `District` varchar(255) NOT NULL,
  `States` varchar(255) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SOLDIER_ADDRESS`
--

LOCK TABLES `SOLDIER_ADDRESS` WRITE;
/*!40000 ALTER TABLE `SOLDIER_ADDRESS` DISABLE KEYS */;
INSERT INTO `SOLDIER_ADDRESS` VALUES (1001,10,62,'Ibrahim Bagh','Gachibowli','500030','Adilabad','Andhra Pradesh'),(1002,13,5,'Ibrahimpatnam','Shamshabad','500049','Bhadradri-Kothagudem','Arunachal Pradesh'),(1003,14,99,'Inderbagh','Kukatpally','500004','Hyderabad','Assam'),(1004,15,5,'Indira Park','Mallapur','500032','Jagtial','Bihar'),(1005,18,1,'Jagadgirigutta','Hi Tech City','500007','Jangaon','Chhattisgarh'),(1006,92,1,'Jagdish Market','Habsiguda','500007','Jayashankar Bhoopalpally','Goa'),(1007,62,12,'Jahanuma','Jubilee Hills','500012','Jogulamba-Gadwal','Gujarat'),(1008,35,15,'Jambagh','Secunderabad','500030','Kamareddy','Haryana'),(1009,321,14,'Jamia Osmania','Banjara Hills','500028','Karimnagar','Himachal Pradesh'),(1010,54,4,'Jawahar Nagar','Manikonda','500043','Khammam','Jammu and Kashmir'),(1011,50,14,'Jawaharlal Nehru Road','Uppal Kalan','500013','Komaram Bheem Asifabad','Jharkhand'),(1012,20,4,'Jeedimetla','Ameerpet','500016','Mahabubabad','Karnataka'),(1013,69,4,'Kachi','Shamirpet','500004','Mahabubnagar','Kerala'),(1014,222,14,'Kachiguda','Sainikpuri','500044','Mancherial','Madhya Pradesh'),(1015,35,57,'Kachiguda X Road','Srinagar Colony','500049','Medchal','Maharashtra'),(1016,23,58,'Kakaguda','Quthbullapur','500020','Medak','Manipur'),(1017,8,6,'Kakatiya Nagar','A C Guards','500028','Nagarkurnool','Meghalaya'),(1018,5,5,'Kalasiguda','A S Roa Nagar','500038','Nalgonda','Mizoram'),(1019,21,1,'Kali Kabar','Abids Road','500048','Nirmal','Nagaland'),(1020,24,45,'Kali Kaman','Adarsh Nagar','500034','Nizamabad','Odisha'),(9999,12,32,'13','Hyd','400021','Hyd','Telangana');
/*!40000 ALTER TABLE `SOLDIER_ADDRESS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SOLDIER_DATES`
--

DROP TABLE IF EXISTS `SOLDIER_DATES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `SOLDIER_DATES` (
  `ID` int(11) NOT NULL,
  `BirthDate` date NOT NULL,
  `RecruitmentDate` date NOT NULL,
  `DeathDate` date DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SOLDIER_DATES`
--

LOCK TABLES `SOLDIER_DATES` WRITE;
/*!40000 ALTER TABLE `SOLDIER_DATES` DISABLE KEYS */;
INSERT INTO `SOLDIER_DATES` VALUES (1001,'1979-07-08','1999-07-08','2018-07-08'),(1002,'1973-12-20','1993-12-20',NULL),(1003,'1971-01-17','1991-01-17',NULL),(1004,'1977-05-18','1997-05-18',NULL),(1005,'1976-11-05','1996-11-05',NULL),(1006,'1977-08-02','1997-08-02',NULL),(1007,'1976-12-11','1996-12-11',NULL),(1008,'1980-09-23','2035-09-23',NULL),(1009,'1970-12-04','2035-12-04',NULL),(1010,'1978-10-17','1998-10-17',NULL),(1011,'1971-02-03','1991-02-03',NULL),(1012,'1979-05-10','1999-05-10',NULL),(1013,'1970-02-15','2035-02-15',NULL),(1014,'1979-08-12','1999-08-12',NULL),(1015,'1980-10-22','2035-10-22',NULL),(1016,'1974-09-06','1994-09-06',NULL),(1017,'1971-03-26','2035-03-26',NULL),(1018,'1972-08-06','1982-08-06','2015-08-07'),(1019,'1979-07-08','1999-07-08','2014-07-05'),(1020,'1978-04-01','1999-04-01',NULL),(9999,'1999-12-12','2019-11-13',NULL);
/*!40000 ALTER TABLE `SOLDIER_DATES` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SOLDIER_EMAIL_ID`
--

DROP TABLE IF EXISTS `SOLDIER_EMAIL_ID`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `SOLDIER_EMAIL_ID` (
  `ID` int(11) NOT NULL,
  `EmailID` varchar(255) NOT NULL,
  PRIMARY KEY (`ID`,`EmailID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SOLDIER_EMAIL_ID`
--

LOCK TABLES `SOLDIER_EMAIL_ID` WRITE;
/*!40000 ALTER TABLE `SOLDIER_EMAIL_ID` DISABLE KEYS */;
INSERT INTO `SOLDIER_EMAIL_ID` VALUES (1001,'eric.lopez@gmail.com'),(1002,'eric.lund@gmail.com'),(1003,'eric.m.boehm@gmail.com'),(1004,'eric.mack@gmail.com'),(1005,'eric.mason@gmail.com'),(1006,'eric.mathews@gmail.com'),(1007,'eric.mintz@gmail.com'),(1008,'eric.mistry@gmail.com'),(1009,'mittler22@gmail.com'),(1010,'moeller77@mail.com'),(1011,'monica654@gmail.com'),(1012,'moore34@gmail.com'),(1013,'murrell56@gmail.com'),(1014,'na75y@gmail.com'),(1015,'neilson57@gmail.com'),(1016,'nelson57@gmail.com'),(1017,'newcomer86@gmail.com'),(1018,'nghiem686@gmail.com'),(1019,'nishant999@gmail.com'),(1020,'noss678@gmail.com'),(9999,'addy@absb.com');
/*!40000 ALTER TABLE `SOLDIER_EMAIL_ID` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SOLDIER_LOGIN`
--

DROP TABLE IF EXISTS `SOLDIER_LOGIN`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `SOLDIER_LOGIN` (
  `ID` int(11) NOT NULL,
  `Pass` char(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SOLDIER_LOGIN`
--

LOCK TABLES `SOLDIER_LOGIN` WRITE;
/*!40000 ALTER TABLE `SOLDIER_LOGIN` DISABLE KEYS */;
INSERT INTO `SOLDIER_LOGIN` VALUES (9999,'9999');
/*!40000 ALTER TABLE `SOLDIER_LOGIN` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SOLDIER_MEDICAL`
--

DROP TABLE IF EXISTS `SOLDIER_MEDICAL`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `SOLDIER_MEDICAL` (
  `ID` int(11) NOT NULL,
  `Height_cm` float(5,2) NOT NULL,
  `Weight_kg` float(5,2) NOT NULL,
  `BloodGroup` varchar(4) NOT NULL,
  `MedicalTestDate` date NOT NULL,
  PRIMARY KEY (`ID`,`MedicalTestDate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SOLDIER_MEDICAL`
--

LOCK TABLES `SOLDIER_MEDICAL` WRITE;
/*!40000 ALTER TABLE `SOLDIER_MEDICAL` DISABLE KEYS */;
INSERT INTO `SOLDIER_MEDICAL` VALUES (1001,154.00,46.00,'O+','2019-10-12'),(1002,169.00,59.00,'AB-','2019-10-12'),(1003,187.00,64.00,'O+','2019-10-12'),(1004,154.00,54.00,'O-','2019-10-12'),(1005,184.00,67.00,'A+','2019-10-12'),(1006,193.00,59.00,'A-','2019-10-12'),(1007,169.00,47.00,'B+','2019-10-12'),(1008,180.00,52.00,'B-','2019-10-12'),(1009,188.00,50.00,'AB+','2019-10-12'),(1010,159.00,68.00,'AB-','2019-10-12'),(1011,164.00,45.00,'O+','2019-10-12'),(1012,181.00,49.00,'AB-','2019-10-12'),(1013,158.00,70.00,'O+','2019-10-12'),(1014,163.00,47.00,'O-','2019-10-12'),(1015,167.00,45.00,'A+','2019-10-12'),(1016,192.00,45.00,'A-','2019-10-12'),(1017,154.00,62.00,'B-','2019-10-12'),(1018,191.00,64.00,'AB+','2019-10-12'),(1019,168.00,56.00,'AB+','2019-10-12'),(1020,189.00,46.00,'O+','2019-10-12'),(9999,12.00,23.00,'O+','2019-11-13');
/*!40000 ALTER TABLE `SOLDIER_MEDICAL` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SOLDIER_MILITARY`
--

DROP TABLE IF EXISTS `SOLDIER_MILITARY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `SOLDIER_MILITARY` (
  `ID` int(11) NOT NULL,
  `RankID` int(11) DEFAULT NULL,
  `DivisionID` int(11) DEFAULT NULL,
  `CorpID` int(11) DEFAULT NULL,
  `CommandID` int(11) DEFAULT NULL,
  `RetirementDate` date DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SOLDIER_MILITARY`
--

LOCK TABLES `SOLDIER_MILITARY` WRITE;
/*!40000 ALTER TABLE `SOLDIER_MILITARY` DISABLE KEYS */;
INSERT INTO `SOLDIER_MILITARY` VALUES (1001,1,20,5,1,NULL),(1002,2,19,6,2,NULL),(1003,3,18,4,3,NULL),(1004,4,17,9,4,NULL),(1005,5,16,1,5,NULL),(1006,6,15,6,6,NULL),(1007,7,14,45,7,NULL),(1008,8,13,5,3,NULL),(1009,9,12,4,3,NULL),(1010,10,11,8,2,NULL),(1011,11,10,66,2,NULL),(1012,12,9,2,5,NULL),(1013,13,8,44,5,NULL),(1014,14,7,8,6,NULL),(1015,15,6,44,6,NULL),(1016,16,5,11,2,NULL),(1017,17,4,44,4,NULL),(1018,18,3,545,5,NULL),(1019,19,2,525,3,NULL),(1020,20,1,5,1,NULL),(9999,NULL,NULL,NULL,NULL,'2019-11-13');
/*!40000 ALTER TABLE `SOLDIER_MILITARY` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SOLDIER_MILITARY_ACCOMPLISHMENTS`
--

DROP TABLE IF EXISTS `SOLDIER_MILITARY_ACCOMPLISHMENTS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `SOLDIER_MILITARY_ACCOMPLISHMENTS` (
  `ID` int(11) NOT NULL,
  `MilitaryAccomplishments` varchar(255) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SOLDIER_MILITARY_ACCOMPLISHMENTS`
--

LOCK TABLES `SOLDIER_MILITARY_ACCOMPLISHMENTS` WRITE;
/*!40000 ALTER TABLE `SOLDIER_MILITARY_ACCOMPLISHMENTS` DISABLE KEYS */;
INSERT INTO `SOLDIER_MILITARY_ACCOMPLISHMENTS` VALUES (1001,'Videsh Seva Medal'),(1002,'Antrik Suraksha Padak'),(1003,'High Altitude Service Medal'),(1004,'Raksha Medal'),(1005,'Samar Seva Star'),(1006,'Operation Vijay Star'),(1007,'Poorvi Star'),(1008,'Operation Parakram Medal'),(1009,'Vayusena Medal(Air Force) (VM)'),(1010,'Nausena Medal(Navy) (NM)'),(1011,'Sena Medal(Army) (SM)'),(1012,'General Service Medal 1947'),(1013,'Meritorious Service Medal'),(1014,'Paschimi Star'),(1015,'General Service Medal 1947'),(1016,'Videsh Seva Medal'),(1017,'General Service Medal 1947'),(1018,'Meritorious Service Medal'),(1019,'Videsh Seva Medal'),(1020,'Antrik Suraksha Padak');
/*!40000 ALTER TABLE `SOLDIER_MILITARY_ACCOMPLISHMENTS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SOLDIER_PARENTS`
--

DROP TABLE IF EXISTS `SOLDIER_PARENTS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `SOLDIER_PARENTS` (
  `ID` int(11) NOT NULL,
  `Fathers_FirstName` varchar(255) NOT NULL,
  `Fathers_LastName` varchar(255) NOT NULL,
  `Fathers_MiddleInitial` varchar(255) DEFAULT NULL,
  `Mothers_FirstName` varchar(255) NOT NULL,
  `Mothers_LastName` varchar(255) NOT NULL,
  `Mothers_MiddleInitial` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SOLDIER_PARENTS`
--

LOCK TABLES `SOLDIER_PARENTS` WRITE;
/*!40000 ALTER TABLE `SOLDIER_PARENTS` DISABLE KEYS */;
INSERT INTO `SOLDIER_PARENTS` VALUES (1001,'Jojo','Brown','K','Leni','Brown','K'),(1002,'Danish','Silvester','M','Lucy','Silvester','M'),(1003,'Ram','Singh','C','Reni','Singh','C'),(1004,'James','John',' ','Malathy','John',' '),(1005,'Ramesh','Reddy','P','Kripa','Reddy','P'),(1006,'Bimal','Grower',' ','Rani','Grower',' '),(1007,'Nirmal','Jain',' ','Lavanya','Jain',' '),(1008,'Paul','Jain',' ','Harshika','Jain',' '),(1009,'Thomson','Mark',' ','Tina','Mark',' '),(1010,'Kiran','Reddy','K','Kalyani','Reddy','K'),(1011,'Saurabh','Reddy',' ','Riya','Reddy',' '),(1012,'Abinash','Verma',' ','Hrithika','Verma',' '),(1013,'Arun','Tony',' ','Anuja','Tony',' '),(1014,'Sarthak','Saxena','P','Ayushi','Saxena','P'),(1015,'Tom','taylor','R','Livina','taylor','R'),(1016,'Kunal','Jahanzaib',' ','Jennifer','Jahanzaib',' '),(1017,'Aditya','Goyal',' ','Jyoti','Goyal',' '),(1018,'Appan','Arya',' ','Swati','Arya',' '),(1019,'Shashank','GURU',' ','Heena','GURU',' '),(1020,'Ankit','GOEL',' ','Charu','GOEL',' '),(9999,'Addy','Na','Man','Manny','Man','Man');
/*!40000 ALTER TABLE `SOLDIER_PARENTS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SOLDIER_PERSONAL`
--

DROP TABLE IF EXISTS `SOLDIER_PERSONAL`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `SOLDIER_PERSONAL` (
  `ID` int(11) NOT NULL,
  `FirstName` varchar(255) NOT NULL,
  `LastName` varchar(255) NOT NULL,
  `MiddleInitial` varchar(255) DEFAULT NULL,
  `Sex` varchar(3) NOT NULL,
  `Aadhar_number` varchar(20) NOT NULL,
  `Marital_Status` varchar(10) NOT NULL,
  `Highest_Educational_Qualification` varchar(255) NOT NULL,
  PRIMARY KEY (`ID`),
  CONSTRAINT `SOLDIER_PERSONAL_chk_1` CHECK (((`Sex` = _utf8mb4'M') or (`Sex` = _utf8mb4'F') or (`Sex` = _utf8mb4'NA')))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SOLDIER_PERSONAL`
--

LOCK TABLES `SOLDIER_PERSONAL` WRITE;
/*!40000 ALTER TABLE `SOLDIER_PERSONAL` DISABLE KEYS */;
INSERT INTO `SOLDIER_PERSONAL` VALUES (1004,'Jimmy','John',' ','M','5477 3951 5911 ','Single',' Post Graduate'),(1005,'Sai','Reddy','P','M','5378 2951 5993 ','Single','Graduate'),(1008,'Kunwar','Jain',' ','M','9737 2923 2838 ','Single','Graduate'),(1009,'Ali','Mark',' ','M','9127 2737 2812 ','Single','Graduate'),(1010,'Prasad','Reddy','K','M','5456 2348 3245','Single','Post Graduate'),(1011,'Akash','Reddy',' ','M','7894 4564 3561','Married ','Graduate'),(1012,'Raju','Verma',' ','M','2345 5435 2313','Married ','Graduate'),(1013,'Vishal','Verma','Ramu','NA','3546 6871 4654','Married ','Graduate'),(1014,'Raman','Saxena','P','M','3243 2447 3458','Single','Post Graduate'),(1015,'Mark','taylor','R','M','6463 3564 3542','Married ','Graduate'),(1016,'Jalees','Jahanzaib',' ','M','3785 2104 6452','Married ','Graduate'),(1017,'Mayank','Goyal',' ','M','5475 4513 4566','Married ','Graduate'),(1018,'Dhruv','Arya',' ','M','2384 0132 2223','Married ','Graduate'),(1019,'SONU','GURU',' ','M','3212 3045 8963','Married ','Graduate'),(9999,'K','L','K','M','2322 2322 3222','married','Jobless');
/*!40000 ALTER TABLE `SOLDIER_PERSONAL` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SOLDIER_PHONE_NUMBER`
--

DROP TABLE IF EXISTS `SOLDIER_PHONE_NUMBER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `SOLDIER_PHONE_NUMBER` (
  `ID` int(11) NOT NULL,
  `PhoneNumber` varchar(16) NOT NULL,
  PRIMARY KEY (`ID`,`PhoneNumber`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SOLDIER_PHONE_NUMBER`
--

LOCK TABLES `SOLDIER_PHONE_NUMBER` WRITE;
/*!40000 ALTER TABLE `SOLDIER_PHONE_NUMBER` DISABLE KEYS */;
INSERT INTO `SOLDIER_PHONE_NUMBER` VALUES (1001,'+91 9636636472'),(1002,'+91 9555577586'),(1003,'+91 9955544296'),(1004,'+91 7555929884'),(1005,'+91 9755582101'),(1006,'+91 7555713441'),(1007,'+91 8555436118'),(1008,'+91 9655575155'),(1009,'+91 8555452895'),(1010,'+91 7555798175'),(1011,'+91 7555520561'),(1012,'+91 8555591746'),(1013,'+91 9255526513'),(1014,'+91 7555528119'),(1015,'+91 7555342962'),(1016,'+91 8555895390'),(1017,'+91 8555508330'),(1018,'+91 9755523943'),(1019,'+91 7555872968'),(9999,'+91 9232222222');
/*!40000 ALTER TABLE `SOLDIER_PHONE_NUMBER` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-11-13  5:10:44
