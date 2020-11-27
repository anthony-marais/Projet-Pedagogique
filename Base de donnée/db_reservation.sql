CREATE DATABASE  IF NOT EXISTS `db_reservation` /*!40100 DEFAULT CHARACTER SET latin1 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `db_reservation`;
-- MySQL dump 10.13  Distrib 8.0.22, for Linux (x86_64)
--
-- Host: localhost    Database: db_reservation
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
  `in_id` int NOT NULL AUTO_INCREMENT,
  `in_mail` varchar(300) NOT NULL,
  `in_nom` varchar(30) NOT NULL,
  `in_prenom` varchar(30) NOT NULL,
  `in_poste` varchar(50) NOT NULL,
  `in_organisation` varchar(100) NOT NULL,
  PRIMARY KEY (`in_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `MAIL`
--

DROP TABLE IF EXISTS `MAIL`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `MAIL` (
  `ma_id` int NOT NULL AUTO_INCREMENT,
  `ma_contenu` varchar(320) NOT NULL,
  `in_id` int NOT NULL,
  PRIMARY KEY (`ma_id`),
  KEY `fk_MAIL_1_idx` (`in_id`),
  CONSTRAINT `fk_MAIL_1` FOREIGN KEY (`in_id`) REFERENCES `INFORMATION` (`in_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

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
  `sa_id` int NOT NULL,
  `ma_id` int NOT NULL,
  PRIMARY KEY (`res_id`),
  KEY `fk_RESERVATION_1_idx` (`ma_id`),
  KEY `fk_RESERVATION_2_idx` (`sa_id`),
  CONSTRAINT `fk_RESERVATION_1` FOREIGN KEY (`ma_id`) REFERENCES `MAIL` (`ma_id`),
  CONSTRAINT `fk_RESERVATION_2` FOREIGN KEY (`sa_id`) REFERENCES `SALLE` (`sa_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

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
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-11-27 15:28:15
