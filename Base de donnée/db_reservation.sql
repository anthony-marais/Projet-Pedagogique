CREATE DATABASE  IF NOT EXISTS `db_reservation` /*!40100 DEFAULT CHARACTER SET latin1 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `db_reservation`;
-- MySQL dump 10.13  Distrib 8.0.22, for Linux (x86_64)
--
-- Host: 127.0.0.1    Database: db_reservation
-- ------------------------------------------------------
-- Server version	8.0.22

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
-- Table structure for table `INFORMATION`
--

DROP TABLE IF EXISTS `INFORMATION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `INFORMATION` (
  `in_id` int NOT NULL,
  `in_mail` varchar(300) DEFAULT NULL,
  `in_nom` varchar(30) DEFAULT NULL,
  `in_prenom` varchar(30) DEFAULT NULL,
  `in_poste` varchar(50) DEFAULT NULL,
  `in_organisation` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`in_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `INFORMATION`
--

LOCK TABLES `INFORMATION` WRITE;
/*!40000 ALTER TABLE `INFORMATION` DISABLE KEYS */;
/*!40000 ALTER TABLE `INFORMATION` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `MAIL`
--

DROP TABLE IF EXISTS `MAIL`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `MAIL` (
  `ma_id` int NOT NULL AUTO_INCREMENT,
  `ma_contenu` varchar(320) NOT NULL,
  `in_id` int DEFAULT NULL,
  PRIMARY KEY (`ma_id`),
  KEY `fk_MAIL_1_idx` (`in_id`),
  CONSTRAINT `fk_MAIL_1` FOREIGN KEY (`in_id`) REFERENCES `INFORMATION` (`in_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `MAIL`
--

LOCK TABLES `MAIL` WRITE;
/*!40000 ALTER TABLE `MAIL` DISABLE KEYS */;
/*!40000 ALTER TABLE `MAIL` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RESERVATION`
--

DROP TABLE IF EXISTS `RESERVATION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `RESERVATION` (
  `res_id` int NOT NULL AUTO_INCREMENT,
  `res_date` datetime NOT NULL,
  `res_heure_arrive` int NOT NULL,
  `res_heure_depart` int NOT NULL,
  `res_temps_reserver` int NOT NULL,
  `sa_id` int DEFAULT NULL,
  `ma_id` int DEFAULT NULL,
  PRIMARY KEY (`res_id`),
  KEY `fk_RESERVATION_1_idx` (`ma_id`),
  KEY `fk_RESERVATION_2_idx` (`sa_id`),
  CONSTRAINT `fk_RESERVATION_1` FOREIGN KEY (`ma_id`) REFERENCES `MAIL` (`ma_id`),
  CONSTRAINT `fk_RESERVATION_2` FOREIGN KEY (`sa_id`) REFERENCES `SALLE` (`sa_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RESERVATION`
--

LOCK TABLES `RESERVATION` WRITE;
/*!40000 ALTER TABLE `RESERVATION` DISABLE KEYS */;
/*!40000 ALTER TABLE `RESERVATION` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SALLE`
--

DROP TABLE IF EXISTS `SALLE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `SALLE` (
  `sa_id` int NOT NULL AUTO_INCREMENT,
  `sa_name` varchar(50) NOT NULL,
  PRIMARY KEY (`sa_id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SALLE`
--

LOCK TABLES `SALLE` WRITE;
/*!40000 ALTER TABLE `SALLE` DISABLE KEYS */;
INSERT INTO `SALLE` VALUES (12,'SIMPLON'),(13,'SIMPLON_BIS'),(15,'SIMPLON');
/*!40000 ALTER TABLE `SALLE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'db_reservation'
--

--
-- Dumping routines for database 'db_reservation'
--
/*!50003 DROP PROCEDURE IF EXISTS `CREATE_SALLE_no_ID` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `CREATE_SALLE_no_ID`(IN SALLE VARCHAR(45))
BEGIN
	IF EXISTS (SELECT * FROM SALLE WHERE sa_name = SALLE)
	THEN 
		SIGNAL SQLSTATE "64646"
			SET MESSAGE_TEXT = 'choissisez un autre nom pour la salle';
	ELSE
		INSERT INTO SALLE(sa_name)
		VALUES(SALLE);
	END IF;
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

-- Dump completed on 2020-11-25 15:42:06
