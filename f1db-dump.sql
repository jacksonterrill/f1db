CREATE DATABASE  IF NOT EXISTS `f1db` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `f1db`;
-- MySQL dump 10.13  Distrib 8.0.28, for Win64 (x86_64)
--
-- Host: localhost    Database: f1db
-- ------------------------------------------------------
-- Server version	8.0.28

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
-- Table structure for table `circuit`
--

DROP TABLE IF EXISTS `circuit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `circuit` (
  `circuit_id` int NOT NULL AUTO_INCREMENT,
  `circuit_name` varchar(64) NOT NULL,
  `distance` double NOT NULL,
  `laps` int NOT NULL,
  `city` varchar(64) NOT NULL,
  `nation_id` int NOT NULL,
  PRIMARY KEY (`circuit_id`),
  KEY `circuit_fk_nation` (`nation_id`),
  CONSTRAINT `circuit_fk_nation` FOREIGN KEY (`nation_id`) REFERENCES `nation` (`nation_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `circuit`
--

LOCK TABLES `circuit` WRITE;
/*!40000 ALTER TABLE `circuit` DISABLE KEYS */;
INSERT INTO `circuit` VALUES (1,'Bahrain International Circuit',302.826,56,'Sakhir',5),(2,'Autodromo Enzo e Dino Ferrari',309.049,63,'Imola',15),(3,'Algarve Motor Park',306.826,66,'Portimao',22),(4,'Circuit de Catalunya',307.104,66,'Barcelona',29),(5,'Circuit de Monaco',260.286,78,'Monte Carlo',19),(6,'Baku City Circuit',306.049,51,'Baku',4),(7,'Circuit Gilles Villeneuve',305.27,70,'Montreal',8),(8,'Circuit Paul Ricard',309.69,53,'Le Castellet',11),(9,'Red Bull Ring',306.452,71,'Spielberg',3),(10,'Silverstone Circuit',306.198,52,'Silverstone',34),(11,'Hungaroring',306.63,70,'Mogyoród',13),(12,'Circuit National de Francorchamps',308.052,44,'Stavelot',6),(13,'Circuit Park Zandvoort',302.389,71,'Zandvoort',21),(14,'Autodromo Nazionale di Monza',306.72,53,'Monza',15),(15,'Sochi Autodrom',309.745,53,'Sochi',24),(16,'Marina Bay Street Circuit',308.706,61,'Singapore City',26),(17,'Suzuka International Racing Course',307.471,53,'Suzuka',16),(18,'Circuit of the Americas',308.405,56,'Austin',35),(19,'Autodromo Hermanos Rodriguez',305.354,71,'Mexico City',18),(20,'Autodromo Jose Carlos Pace',305.879,71,'São Paulo',7),(21,'Albert Park Circuit',307.574,58,'Melbourne',2),(22,'Jeddah Street Circuit',308.75,50,'Jeddah',25),(23,'Yas Marina Circuit',305.355,55,'Abu Dhabi',33),(24,'Istanbul Park Circuit',309.396,58,'Tuzla',32),(25,'Losail International Circuit',306.66,57,'Lusail',23);
/*!40000 ALTER TABLE `circuit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `company`
--

DROP TABLE IF EXISTS `company`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `company` (
  `company_id` int NOT NULL AUTO_INCREMENT,
  `company_name` varchar(64) NOT NULL,
  PRIMARY KEY (`company_id`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `company`
--

LOCK TABLES `company` WRITE;
/*!40000 ALTER TABLE `company` DISABLE KEYS */;
INSERT INTO `company` VALUES (1,'Pirelli'),(2,'Petronas'),(3,'Epson'),(4,'Bose'),(5,'Hewlett Packard'),(6,'Monster Energy'),(7,'Rauch'),(8,'Honda'),(9,'Mobil 1 Esso'),(10,'Tag Heuer'),(11,'Dell'),(12,'Coca Cola'),(13,'CNBC'),(14,'Cisco Webex'),(15,'Alienware'),(16,'Crypto.com'),(17,'Oakley'),(18,'Castrol'),(19,'Dupont'),(20,'Microsoft'),(21,'Boeing'),(22,'Siemens'),(23,'Ray-Ban'),(24,'UPS'),(25,'Experis'),(26,'Shell'),(27,'Giorgio Armani'),(28,'PKN Orlen'),(29,'Iveco'),(30,'Mitsubishi Electric'),(31,'1&1'),(32,'Under Armour'),(33,'Sofina'),(34,'Symantec'),(35,'Umbro');
/*!40000 ALTER TABLE `company` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `constructs`
--

DROP TABLE IF EXISTS `constructs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `constructs` (
  `team_id` int NOT NULL,
  `season` year NOT NULL,
  `car_make` varchar(64) NOT NULL,
  `car_engine` varchar(64) NOT NULL,
  PRIMARY KEY (`team_id`,`season`),
  CONSTRAINT `constructs_fk_team` FOREIGN KEY (`team_id`) REFERENCES `team` (`team_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `constructs`
--

LOCK TABLES `constructs` WRITE;
/*!40000 ALTER TABLE `constructs` DISABLE KEYS */;
INSERT INTO `constructs` VALUES (1,2021,'Mercedes F1 W12 E Performance','Mercedes F1 M12 E Performance'),(2,2021,'Red Bull RB16B','Honda RA621H'),(3,2021,'McLaren MCL35M','Mercedes F1 M12 E Performance'),(4,2021,'Aston Martin AMR21','Mercedes F1 M12 E Performance'),(5,2021,'Alpine A521','Renault E-Tech 20B'),(6,2021,'Ferrari SF21','Ferrari 065/6'),(7,2021,'AlphaTauri AT02','Honda RA621H'),(8,2021,'Alfa Romeo C41','Ferrari 065/6'),(9,2021,'Haas VF-21','Ferrari 065/6'),(10,2021,'Williams FW43B','Mercedes F1 M12 E Performance');
/*!40000 ALTER TABLE `constructs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `driver`
--

DROP TABLE IF EXISTS `driver`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `driver` (
  `driver_id` int NOT NULL AUTO_INCREMENT,
  `driver_name` varchar(64) NOT NULL,
  `driver_abbreviation` varchar(3) NOT NULL,
  `racing_number` int NOT NULL,
  `nationality` int DEFAULT NULL,
  `birthday` date NOT NULL,
  PRIMARY KEY (`driver_id`),
  KEY `driver_fk_nation` (`nationality`),
  CONSTRAINT `driver_fk_nation` FOREIGN KEY (`nationality`) REFERENCES `nation` (`nation_id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `driver`
--

LOCK TABLES `driver` WRITE;
/*!40000 ALTER TABLE `driver` DISABLE KEYS */;
INSERT INTO `driver` VALUES (1,'Lewis Hamilton','HAM',44,34,'1985-01-07'),(2,'Valtteri Bottas','BOT',77,10,'1989-08-28'),(3,'Sergio Perez','PER',11,18,'1990-01-26'),(4,'Max Verstappen','VER',33,21,'1997-09-30'),(5,'Daniel Ricciardo','RIC',3,2,'1989-07-01'),(6,'Lando Norris','NOR',4,34,'1999-11-13'),(7,'Sebastian Vettel','VET',5,12,'1987-01-03'),(8,'Lance Stroll','STR',18,8,'1998-10-29'),(9,'Fernando Alonso','ALO',14,29,'1981-07-29'),(10,'Esteban Ocon','OCO',31,11,'1996-09-17'),(11,'Charles Leclerc','LEC',16,19,'1997-10-16'),(12,'Carlos Sainz Jr.','SAI',55,29,'1994-09-01'),(13,'Pierre Gasly','GAS',10,11,'1996-02-07'),(14,'Yuki Tsunoda','TSU',22,16,'2000-05-11'),(15,'Kimi Raikkonen','RAI',7,10,'1979-10-17'),(16,'Antonio Giovinazzi','GIO',99,15,'1993-12-14'),(17,'Nikita Mazepin','MAZ',9,24,'1999-03-02'),(18,'Mick Schumacher','MSC',47,12,'1999-03-22'),(19,'Nicholas Latifi','LAT',6,8,'1995-06-29'),(20,'George Russell','RUS',63,34,'1998-02-15');
/*!40000 ALTER TABLE `driver` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `drives`
--

DROP TABLE IF EXISTS `drives`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `drives` (
  `driver_id` int NOT NULL,
  `grand_prix_id` int NOT NULL,
  `position` int DEFAULT NULL,
  `points` double NOT NULL,
  PRIMARY KEY (`driver_id`,`grand_prix_id`),
  KEY `drives_fk_grand_prix` (`grand_prix_id`),
  CONSTRAINT `drives_fk_driver` FOREIGN KEY (`driver_id`) REFERENCES `driver` (`driver_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `drives_fk_grand_prix` FOREIGN KEY (`grand_prix_id`) REFERENCES `grand_prix` (`grand_prix_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `drives`
--

LOCK TABLES `drives` WRITE;
/*!40000 ALTER TABLE `drives` DISABLE KEYS */;
INSERT INTO `drives` VALUES (1,1,1,25),(1,2,2,19),(1,3,1,25),(1,4,1,25),(1,5,7,7),(1,6,15,0),(1,7,2,18),(1,8,2,19),(1,9,4,12),(1,10,1,27),(1,11,2,18),(1,12,3,7.5),(1,13,2,19),(1,14,NULL,0),(1,15,1,25),(1,16,5,10),(1,17,2,19),(1,18,2,18),(1,19,1,25),(1,20,1,25),(1,21,1,26),(1,22,2,18),(2,1,3,16),(2,2,NULL,0),(2,3,3,16),(2,4,3,15),(2,5,NULL,0),(2,6,12,0),(2,7,4,12),(2,8,3,15),(2,9,2,18),(2,10,3,16),(2,11,NULL,0),(2,12,12,0),(2,13,3,15),(2,14,3,18),(2,15,5,10),(2,16,1,26),(2,17,6,8),(2,18,15,0),(2,19,3,18),(2,20,NULL,0),(2,21,3,15),(2,22,6,8),(3,1,5,10),(3,2,11,0),(3,3,4,12),(3,4,5,10),(3,5,4,12),(3,6,1,25),(3,7,3,15),(3,8,4,12),(3,9,6,8),(3,10,16,0),(3,11,NULL,0),(3,12,19,0),(3,13,8,4),(3,14,5,10),(3,15,9,2),(3,16,3,15),(3,17,3,15),(3,18,3,15),(3,19,4,13),(3,20,4,12),(3,21,NULL,0),(3,22,NULL,0),(4,1,2,18),(4,2,1,25),(4,3,2,18),(4,4,2,19),(4,5,1,25),(4,6,18,0),(4,7,1,26),(4,8,1,25),(4,9,1,26),(4,10,NULL,3),(4,11,9,2),(4,12,1,12.5),(4,13,1,25),(4,14,NULL,2),(4,15,2,18),(4,16,2,18),(4,17,1,25),(4,18,1,25),(4,19,2,20),(4,20,2,19),(4,21,2,18),(4,22,1,26),(5,1,7,6),(5,2,6,8),(5,3,9,2),(5,4,6,8),(5,5,12,0),(5,6,9,2),(5,7,6,8),(5,8,13,0),(5,9,7,6),(5,10,5,10),(5,11,11,0),(5,12,4,6),(5,13,11,0),(5,14,1,27),(5,15,4,12),(5,16,13,0),(5,17,5,10),(5,18,12,0),(5,19,NULL,0),(5,20,12,0),(5,21,5,10),(5,22,12,0),(6,1,4,12),(6,2,3,15),(6,3,5,10),(6,4,8,4),(6,5,3,15),(6,6,5,10),(6,7,5,10),(6,8,5,10),(6,9,3,15),(6,10,4,12),(6,11,15,0),(6,12,14,0),(6,13,10,1),(6,14,2,18),(6,15,7,7),(6,16,7,6),(6,17,8,4),(6,18,10,1),(6,19,10,1),(6,20,9,2),(6,21,10,1),(6,22,7,6),(7,1,15,0),(7,2,15,0),(7,3,13,0),(7,4,13,0),(7,5,5,10),(7,6,2,18),(7,7,9,2),(7,8,12,0),(7,9,NULL,0),(7,10,NULL,0),(7,11,NULL,0),(7,12,5,5),(7,13,13,0),(7,14,12,0),(7,15,12,0),(7,16,18,0),(7,17,10,1),(7,18,7,6),(7,19,11,0),(7,20,10,1),(7,21,NULL,0),(7,22,11,0),(8,1,10,1),(8,2,8,4),(8,3,14,0),(8,4,11,0),(8,5,8,4),(8,6,NULL,0),(8,7,10,1),(8,8,8,4),(8,9,13,0),(8,10,8,4),(8,11,NULL,0),(8,12,20,0),(8,13,12,0),(8,14,7,6),(8,15,11,0),(8,16,9,2),(8,17,12,0),(8,18,14,0),(8,19,NULL,0),(8,20,6,8),(8,21,11,0),(8,22,13,0),(9,1,NULL,0),(9,2,10,1),(9,3,8,4),(9,4,17,0),(9,5,13,0),(9,6,6,8),(9,7,8,4),(9,8,9,2),(9,9,10,1),(9,10,7,6),(9,11,4,12),(9,12,11,0),(9,13,6,8),(9,14,8,4),(9,15,6,8),(9,16,16,0),(9,17,NULL,0),(9,18,9,2),(9,19,9,2),(9,20,3,15),(9,21,13,0),(9,22,8,4),(10,1,13,0),(10,2,9,2),(10,3,7,6),(10,4,9,2),(10,5,9,2),(10,6,NULL,0),(10,7,14,0),(10,8,14,0),(10,9,NULL,0),(10,10,9,2),(10,11,1,25),(10,12,7,3),(10,13,9,2),(10,14,10,1),(10,15,14,0),(10,16,10,1),(10,17,NULL,0),(10,18,13,0),(10,19,8,4),(10,20,5,10),(10,21,4,12),(10,22,9,2),(11,1,6,8),(11,2,4,12),(11,3,6,8),(11,4,4,12),(11,5,NULL,0),(11,6,4,12),(11,7,16,0),(11,8,7,6),(11,9,8,4),(11,10,2,18),(11,11,NULL,0),(11,12,8,2),(11,13,5,10),(11,14,4,12),(11,15,15,0),(11,16,4,12),(11,17,4,12),(11,18,5,10),(11,19,5,10),(11,20,8,4),(11,21,7,6),(11,22,10,1),(12,1,8,4),(12,2,5,10),(12,3,11,0),(12,4,7,6),(12,5,2,18),(12,6,8,4),(12,7,11,0),(12,8,6,8),(12,9,5,10),(12,10,6,8),(12,11,3,15),(12,12,10,0.5),(12,13,7,6),(12,14,6,8),(12,15,3,15),(12,16,8,4),(12,17,7,6),(12,18,6,8),(12,19,6,9),(12,20,7,6),(12,21,8,4),(12,22,3,15),(13,1,17,0),(13,2,7,6),(13,3,10,1),(13,4,10,1),(13,5,6,8),(13,6,3,15),(13,7,7,6),(13,8,NULL,0),(13,9,9,2),(13,10,11,0),(13,11,5,11),(13,12,6,4),(13,13,4,12),(13,14,NULL,0),(13,15,13,0),(13,16,6,8),(13,17,NULL,0),(13,18,4,12),(13,19,7,6),(13,20,11,0),(13,21,6,8),(13,22,5,10),(14,1,9,2),(14,2,12,0),(14,3,15,0),(14,4,NULL,0),(14,5,16,0),(14,6,7,6),(14,7,13,0),(14,8,10,1),(14,9,12,0),(14,10,10,1),(14,11,6,8),(14,12,15,0),(14,13,NULL,0),(14,14,NULL,0),(14,15,17,0),(14,16,14,0),(14,17,9,2),(14,18,NULL,0),(14,19,15,0),(14,20,13,0),(14,21,14,0),(14,22,4,12),(15,1,11,0),(15,2,13,0),(15,3,NULL,0),(15,4,12,0),(15,5,11,0),(15,6,10,1),(15,7,17,0),(15,8,11,0),(15,9,15,0),(15,10,15,0),(15,11,10,1),(15,12,18,0),(15,15,8,4),(15,16,12,0),(15,17,13,0),(15,18,8,4),(15,19,12,0),(15,20,14,0),(15,21,15,0),(15,22,NULL,0),(16,1,12,0),(16,2,14,0),(16,3,12,0),(16,4,15,0),(16,5,10,1),(16,6,11,0),(16,7,15,0),(16,8,15,0),(16,9,14,0),(16,10,13,0),(16,11,13,0),(16,12,13,0),(16,13,14,0),(16,14,13,0),(16,15,16,0),(16,16,11,0),(16,17,11,0),(16,18,11,0),(16,19,14,0),(16,20,15,0),(16,21,9,2),(16,22,NULL,0),(17,1,NULL,0),(17,2,17,0),(17,3,19,0),(17,4,19,0),(17,5,17,0),(17,6,14,0),(17,7,20,0),(17,8,18,0),(17,9,NULL,0),(17,10,17,0),(17,11,NULL,0),(17,12,17,0),(17,13,NULL,0),(17,14,NULL,0),(17,15,18,0),(17,16,20,0),(17,17,17,0),(17,18,18,0),(17,19,17,0),(17,20,18,0),(17,21,NULL,0),(18,1,16,0),(18,2,16,0),(18,3,17,0),(18,4,18,0),(18,5,18,0),(18,6,13,0),(18,7,19,0),(18,8,16,0),(18,9,NULL,0),(18,10,18,0),(18,11,12,0),(18,12,16,0),(18,13,NULL,0),(18,14,15,0),(18,15,NULL,0),(18,16,19,0),(18,17,16,0),(18,18,NULL,0),(18,19,18,0),(18,20,16,0),(18,21,NULL,0),(18,22,14,0),(19,1,18,0),(19,2,NULL,0),(19,3,18,0),(19,4,16,0),(19,5,15,0),(19,6,16,0),(19,7,18,0),(19,8,17,0),(19,9,16,0),(19,10,14,0),(19,11,7,6),(19,12,9,1),(19,13,16,0),(19,14,11,0),(19,15,NULL,0),(19,16,17,0),(19,17,15,0),(19,18,17,0),(19,19,16,0),(19,20,NULL,0),(19,21,12,0),(19,22,NULL,0),(20,1,14,0),(20,2,NULL,0),(20,3,16,0),(20,4,14,0),(20,5,14,0),(20,6,17,0),(20,7,12,0),(20,8,NULL,0),(20,9,11,0),(20,10,12,0),(20,11,8,4),(20,12,2,9),(20,13,NULL,0),(20,14,9,2),(20,15,10,1),(20,16,15,0),(20,17,14,0),(20,18,16,0),(20,19,13,0),(20,20,17,0),(20,21,NULL,0),(20,22,NULL,0);
/*!40000 ALTER TABLE `drives` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employs`
--

DROP TABLE IF EXISTS `employs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employs` (
  `team_id` int NOT NULL,
  `driver_id` int NOT NULL,
  `season` year NOT NULL,
  PRIMARY KEY (`team_id`,`driver_id`,`season`),
  KEY `employs_fk_driver` (`driver_id`),
  CONSTRAINT `employs_fk_driver` FOREIGN KEY (`driver_id`) REFERENCES `driver` (`driver_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `employs_fk_team` FOREIGN KEY (`team_id`) REFERENCES `team` (`team_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employs`
--

LOCK TABLES `employs` WRITE;
/*!40000 ALTER TABLE `employs` DISABLE KEYS */;
INSERT INTO `employs` VALUES (1,1,2021),(1,2,2021),(2,3,2021),(2,4,2021),(3,5,2021),(3,6,2021),(4,7,2021),(4,8,2021),(5,9,2021),(5,10,2021),(6,11,2021),(6,12,2021),(7,13,2021),(7,14,2021),(8,15,2021),(8,16,2021),(9,17,2021),(9,18,2021),(10,19,2021),(10,20,2021);
/*!40000 ALTER TABLE `employs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grand_prix`
--

DROP TABLE IF EXISTS `grand_prix`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `grand_prix` (
  `grand_prix_id` int NOT NULL AUTO_INCREMENT,
  `grand_prix_name` varchar(64) NOT NULL,
  `race_date` date NOT NULL,
  `circuit_id` int NOT NULL,
  PRIMARY KEY (`grand_prix_id`),
  KEY `grand_prix_fk_circuit` (`circuit_id`),
  CONSTRAINT `grand_prix_fk_circuit` FOREIGN KEY (`circuit_id`) REFERENCES `circuit` (`circuit_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grand_prix`
--

LOCK TABLES `grand_prix` WRITE;
/*!40000 ALTER TABLE `grand_prix` DISABLE KEYS */;
INSERT INTO `grand_prix` VALUES (1,'Gulf Air Bahrain Grand Prix','2021-03-28',1),(2,'Pirelli Gran Premio del Made in Italy e dell\'Emilia-Romagna','2021-04-18',2),(3,'Heineken Grande Premio de Portugal','2021-05-02',3),(4,'Gran Premio de España Emirates','2021-05-09',4),(5,'Grand Prix de Monaco','2021-05-23',5),(6,'Azerbaijan Grand Prix','2021-06-06',6),(7,'Pirelli Grand Prix de France','2021-06-27',8),(8,'Styrian Grand Prix','2021-06-27',9),(9,'Eyetime Großer Preis von Österreich','2021-07-04',9),(10,'Rolex British Grand Prix','2021-07-18',10),(11,'Magyar Nagydij','2021-08-01',11),(12,'Belgian Grand Prix','2021-08-29',12),(13,'Dutch Grand Prix','2021-09-05',13),(14,'Gran Premio Heineken d\'Italia','2021-09-12',14),(15,'VTB Russian Grand Prix','2021-09-26',15),(16,'Türkiye Grand Prix','2021-10-10',23),(17,'United States Grand Prix','2021-10-24',18),(18,'Gran Premio de Mexico','2021-10-31',19),(19,'Grande Premio do Sao Paulo','2021-11-07',20),(20,'Qatar Grand Prix','2021-11-21',25),(21,'Saudi Arabia','2021-12-05',22),(22,'Etihad Airways Abu Dhabi Grand Prix','2021-12-12',23);
/*!40000 ALTER TABLE `grand_prix` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `manages`
--

DROP TABLE IF EXISTS `manages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `manages` (
  `principal_id` int NOT NULL,
  `team_id` int NOT NULL,
  `season` year NOT NULL,
  PRIMARY KEY (`principal_id`,`team_id`,`season`),
  KEY `manages_fk_team` (`team_id`),
  CONSTRAINT `manages_fk_principal` FOREIGN KEY (`principal_id`) REFERENCES `principal` (`principal_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `manages_fk_team` FOREIGN KEY (`team_id`) REFERENCES `team` (`team_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `manages`
--

LOCK TABLES `manages` WRITE;
/*!40000 ALTER TABLE `manages` DISABLE KEYS */;
INSERT INTO `manages` VALUES (1,1,2021),(2,2,2021),(3,3,2021),(4,4,2021),(5,5,2021),(6,6,2021),(7,7,2021),(8,8,2021),(9,9,2021),(10,10,2021);
/*!40000 ALTER TABLE `manages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nation`
--

DROP TABLE IF EXISTS `nation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `nation` (
  `nation_id` int NOT NULL AUTO_INCREMENT,
  `nation_name` varchar(64) NOT NULL,
  `nation_abbreviation` varchar(2) NOT NULL,
  PRIMARY KEY (`nation_id`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nation`
--

LOCK TABLES `nation` WRITE;
/*!40000 ALTER TABLE `nation` DISABLE KEYS */;
INSERT INTO `nation` VALUES (1,'Argentina','AR'),(2,'Australia','AU'),(3,'Austria','AT'),(4,'Azerbaijan','AZ'),(5,'Bahrain','BH'),(6,'Belgium','BE'),(7,'Brazil','BR'),(8,'Canada','CA'),(9,'China','CN'),(10,'Finland','FI'),(11,'France','FR'),(12,'Germany','DE'),(13,'Hungary','HU'),(14,'India','IN'),(15,'Italy','IT'),(16,'Japan','JP'),(17,'Malaysia','MY'),(18,'Mexico','MX'),(19,'Monaco','MC'),(20,'Morocco','MA'),(21,'Netherlands','NL'),(22,'Portugal','PT'),(23,'Qatar','QA'),(24,'Russia','RU'),(25,'Saudi Arabia','SA'),(26,'Singapore','SG'),(27,'South Africa','ZA'),(28,'South Korea','KR'),(29,'Spain','ES'),(30,'Sweden','SE'),(31,'Switzerland','CH'),(32,'Turkey','TR'),(33,'United Arab Emirates','AE'),(34,'United Kingdom of Great Britain and Northern Ireland','UK'),(35,'United States of America','US');
/*!40000 ALTER TABLE `nation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `principal`
--

DROP TABLE IF EXISTS `principal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `principal` (
  `principal_id` int NOT NULL AUTO_INCREMENT,
  `principal_name` varchar(64) NOT NULL,
  PRIMARY KEY (`principal_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `principal`
--

LOCK TABLES `principal` WRITE;
/*!40000 ALTER TABLE `principal` DISABLE KEYS */;
INSERT INTO `principal` VALUES (1,'Toto Wolff'),(2,'Christian Horner'),(3,'Andreas Seidl'),(4,'Otmar Szafnauer'),(5,'Laurent Rossi'),(6,'Franz Tost'),(7,'Mattia Binotto'),(8,'Frederic Vasseur'),(9,'Guenther Steiner'),(10,'Jost Capito');
/*!40000 ALTER TABLE `principal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sponsors`
--

DROP TABLE IF EXISTS `sponsors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sponsors` (
  `company_id` int NOT NULL,
  `team_id` int NOT NULL,
  `season` year NOT NULL,
  PRIMARY KEY (`company_id`,`team_id`,`season`),
  KEY `sponsors_fk_team` (`team_id`),
  CONSTRAINT `sponsors_fk_company` FOREIGN KEY (`company_id`) REFERENCES `company` (`company_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `sponsors_fk_team` FOREIGN KEY (`team_id`) REFERENCES `team` (`team_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sponsors`
--

LOCK TABLES `sponsors` WRITE;
/*!40000 ALTER TABLE `sponsors` DISABLE KEYS */;
INSERT INTO `sponsors` VALUES (1,1,2021),(2,1,2021),(3,1,2021),(4,1,2021),(5,1,2021),(6,1,2021),(1,2,2021),(7,2,2021),(8,2,2021),(9,2,2021),(10,2,2021),(22,2,2021),(1,3,2021),(11,3,2021),(12,3,2021),(13,3,2021),(14,3,2021),(15,3,2021),(1,4,2021),(16,4,2021),(17,4,2021),(1,5,2021),(18,5,2021),(19,5,2021),(20,5,2021),(21,5,2021),(22,5,2021),(1,6,2021),(8,6,2021),(22,6,2021),(1,7,2021),(23,7,2021),(24,7,2021),(25,7,2021),(26,7,2021),(27,7,2021),(1,8,2021),(28,8,2021),(29,8,2021),(30,8,2021),(1,9,2021),(31,9,2021),(32,9,2021),(1,10,2021),(33,10,2021),(34,10,2021),(35,10,2021);
/*!40000 ALTER TABLE `sponsors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `team`
--

DROP TABLE IF EXISTS `team`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `team` (
  `team_id` int NOT NULL AUTO_INCREMENT,
  `team_name` varchar(64) NOT NULL,
  PRIMARY KEY (`team_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `team`
--

LOCK TABLES `team` WRITE;
/*!40000 ALTER TABLE `team` DISABLE KEYS */;
INSERT INTO `team` VALUES (1,'Mercedes-AMG Petronas Formula One Team'),(2,'Red Bull Racing'),(3,'McLaren F1 Team'),(4,'Aston Martin Cognizant Formula One Team'),(5,'Alpine F1 Team'),(6,'Scuderia Ferrari Mission Winnow'),(7,'Scuderia AlphaTauri Honda'),(8,'Alfa Romeo Racing ORLEN'),(9,'Uralkali Haas F1 Team'),(10,'Williams Racing');
/*!40000 ALTER TABLE `team` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'f1db'
--

--
-- Dumping routines for database 'f1db'
--
/*!50003 DROP FUNCTION IF EXISTS `count_podiums` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `count_podiums`(chosen_driver_id INT) RETURNS int
    READS SQL DATA
    DETERMINISTIC
BEGIN
	DECLARE count INT;
	SELECT COUNT(*) INTO count FROM drives WHERE position <= 3 AND driver_id = chosen_driver_id;
    RETURN count;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `count_wins` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `count_wins`(chosen_driver_id INT) RETURNS int
    READS SQL DATA
    DETERMINISTIC
BEGIN
	DECLARE count INT;
	SELECT COUNT(*) INTO count FROM drives WHERE position = 1 AND driver_id = chosen_driver_id;
    RETURN count;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `driver_profiles` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `driver_profiles`()
BEGIN
	SELECT racing_number, driver_name, YEAR(NOW()) - YEAR(birthday) AS age, nation_name AS nationality, points, count_wins(driver_id) AS wins, count_podiums(driver_id) AS podiums
    FROM (SELECT driver_id, SUM(points) AS points FROM drives JOIN grand_prix USING (grand_prix_id) GROUP BY driver_id) AS total_points
    JOIN driver USING (driver_id) JOIN nation ON nationality = nation_id ORDER BY racing_number;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `driver_standings` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `driver_standings`(season YEAR)
BEGIN
	SELECT ROW_NUMBER() OVER(ORDER BY points DESC) AS position, driver_name, team_name, points 
		FROM (SELECT driver_id, SUM(points) AS points FROM drives JOIN grand_prix USING (grand_prix_id) WHERE YEAR(race_date) = season GROUP BY driver_id ORDER BY points DESC) AS total_points
        JOIN (SELECT * FROM employs JOIN driver USING (driver_id) JOIN team USING (team_id)) AS driver_team USING (driver_id);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `team_standings` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `team_standings`(season YEAR)
BEGIN
	SELECT ROW_NUMBER() OVER(ORDER BY SUM(points) DESC) AS position, team_name, SUM(points) AS points
		FROM (SELECT * FROM employs JOIN driver USING (driver_id) JOIN team USING (team_id)) AS driver_team
        JOIN (SELECT * FROM drives JOIN grand_prix USING (grand_prix_id) WHERE YEAR(race_date) = season) AS races USING (driver_id) GROUP BY team_id ORDER BY SUM(points) DESC;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-04-25 19:15:44
