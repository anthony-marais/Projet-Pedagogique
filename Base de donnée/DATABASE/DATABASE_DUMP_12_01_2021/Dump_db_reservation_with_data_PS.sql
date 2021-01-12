CREATE DATABASE  IF NOT EXISTS `db_reservation` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
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
  `in_mail` varchar(300) COLLATE utf8mb4_general_ci NOT NULL,
  `in_mdp` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `in_nom` varchar(30) COLLATE utf8mb4_general_ci NOT NULL,
  `in_prenom` varchar(30) COLLATE utf8mb4_general_ci NOT NULL,
  `in_poste` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `in_organisation` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `role_id` int NOT NULL,
  PRIMARY KEY (`in_id`),
  KEY `fk_INFORMATION_1_idx` (`in_mail`),
  KEY `fk_INFORMATION_1_idx1` (`role_id`),
  CONSTRAINT `fk_INFORMATION_1` FOREIGN KEY (`role_id`) REFERENCES `ROLE` (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `INFORMATION`
--

LOCK TABLES `INFORMATION` WRITE;
/*!40000 ALTER TABLE `INFORMATION` DISABLE KEYS */;
INSERT INTO `INFORMATION` VALUES (52,'theo@mail.com','pbkdf2:sha256:150000$eJnx7AVg$3fd16b83e282a55d7e923447b96409be1e97c990d2c1cf544bfdcee9bd099079','Theo','Valor','Élève','Lycée Tocqueville',2),(53,'anthony@mail.com','pbkdf2:sha256:150000$gIJCFzcQ$7edb7ff871783ad5128745a7d742c5e8d857feca839e4718c4073e5d1f66adcc','Anthony','Reno','Apprenant','Simplon',2),(54,'sandrine@mail.com','pbkdf2:sha256:150000$gUTdXk26$72b93cf808a89697d6b6fb6b6cee92c77d940da1fe176227166dc4fc60ce1226','Sandrine','Kaulu','Formateur','Simplon',2),(55,'samy@mail.com','pbkdf2:sha256:150000$FQvEPNpg$9d095c250ba65a30b077d39b6cc56d50d97921e71775e7fe2248db7e56848620','Samy','Lacour','Professeur','Lycée Tocqueville',2),(56,'arouf@mail.com','pbkdf2:sha256:150000$Aa8gcECX$355965a8e45a1c46a7931ddae3ff7e633c6dd7e31535c9d6f00c83c3c623d7c6','Arouf','Gangsta','Directeur','Simplon',2);
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
  `ma_contenu` varchar(320) COLLATE utf8mb4_general_ci NOT NULL,
  `ma_date` datetime NOT NULL,
  `in_id` int NOT NULL,
  PRIMARY KEY (`ma_id`),
  KEY `fk_MAIL_1_idx` (`in_id`),
  CONSTRAINT `fk_MAIL_1` FOREIGN KEY (`in_id`) REFERENCES `INFORMATION` (`in_id`)
) ENGINE=InnoDB AUTO_INCREMENT=160 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `MAIL`
--

LOCK TABLES `MAIL` WRITE;
/*!40000 ALTER TABLE `MAIL` DISABLE KEYS */;
INSERT INTO `MAIL` VALUES (37,'Salut, J’ai besoin de la salle 736 le 17 janvier entre 8 h et 10 h','2021-01-11 15:59:06',52),(38,'Salut, J’ai besoin de la salle 100 le 5 fevrier entre 10 h et 12 h','2021-01-11 16:10:22',52),(39,'Salut j\'ai besoin de la salle 300 le 21 juillet entre 14 h et 17 h','2021-01-11 16:10:49',52),(40,'Salut, j\'ai besoin de la salle 200 le 19 septembre entre 17 h et 18 h','2021-01-11 16:11:28',52),(41,'Salut, j\'ai besoin de la salle 100 le 20 decembre entre 13 h et 16 h','2021-01-11 16:12:05',52),(42,'Salut, j\'ai besoin de la salle 100 le 15 janvier entre 10 h et 13 h','2021-01-11 16:13:41',53),(43,'Salut, j\'ai besoin de la salle 100 le 15 janvier entre 10 h et 13 h','2021-01-11 16:15:09',53),(44,'Salut, j\'ai besoin de la salle 100 le 16 janvier entre 10 h et 13 h','2021-01-11 16:16:58',53),(45,'Salut, j\'ai besoin de la salle 100 le 20 janvier entre 10 h et 13 h','2021-01-11 16:28:08',53),(46,'Salut, j\'ai besoin de la salle 100 le 20 janvier entre 20 h et 22 h','2021-01-11 16:30:13',53),(47,'Salut, j\'ai besoin de la salle 200 le 25 mars entre 8 h et 10 h ','2021-01-11 16:32:09',53),(48,'Salut, j\'ai besoin de la salle 300 le 13 mai entre 10 h et 13 h','2021-01-11 16:32:47',53),(49,'Salut, j\'ai besoin de la salle 736 le 12 septembre entre 14 h et 16 h','2021-01-11 16:34:42',53),(50,'Salut, j\'ai besoin de la salle 736 le 26 octobre entre 16 h et 18 h ','2021-01-11 16:35:10',53),(51,'Salut, j\'ai besoin de la salle 200 le 30 novembre entre 12 h et 15 h ','2021-01-11 16:38:53',53),(52,'Bonjour, j\'ai besoin de la salle 736 le 3 decembre entre 9 h et 12 h','2021-01-11 16:40:21',53),(53,'Bonjour, j\'ai besoin de la salle 100 le 28 janvier entre 8 h et 12 h','2021-01-11 16:41:11',54),(54,'Bonjour, j\'ai besoin de la salle 100 le 13 avril entre 11 h et 14 h','2021-01-11 16:41:34',54),(55,'Bonjour j\'ai besoin de la salle 300 le 1 juin entre 8 h et 12 h','2021-01-11 16:42:08',54),(56,'Salut, j\'ai besoin de la salle 200 le 4 decembre entre 14 h et 17 h','2021-01-11 16:42:35',54),(57,'Bonjour j\'ai besoin de la salle 300 le 2 fevrier entre 9 h et 11 h','2021-01-11 16:43:21',56),(58,'Salut, j\'ai besoin de la salle 736 le 20 fevrier entre 14 h et 15 h','2021-01-11 16:43:44',56),(59,'Salut, j\'ai besoin de la salle 736 le 20 fevrier entre 14 h et 15 h','2021-01-11 16:44:14',56),(60,'Salut, j\'ai besoin de la salle 736 le 20 fevrier entre 14 h et 18 h','2021-01-11 16:45:01',56),(61,'Salut, j\'ai besoin de la salle 736 le 20 fevrier entre 16 h et 18 h','2021-01-11 16:45:18',56),(62,'Salut, j\'ai besoin de la salle 736 le 10 fevrier entre 14 h et 15 h','2021-01-11 16:45:44',56),(63,'Salut, j\'ai besoin de la salle 100 le 10 fevrier entre 14 h et 15 h','2021-01-11 16:45:54',56),(64,'Salut, J\'ai besoin de la salle 300 le 13 juillet entre 9 h et 10 h','2021-01-11 16:46:22',56),(65,'Salut, J\'ai besoin de la salle 300 le 13 juillet entre 9 h et 13 h','2021-01-11 16:46:41',56),(66,'Salut, J\'ai besoin de la salle 300 le 13 juillet entre 11 h et 13 h','2021-01-11 16:46:48',56),(67,'Bonjour, j\'ai besoin de la salle 100 le 27 août entre 8 h et 10 h','2021-01-11 16:47:20',56),(68,'Bonjour, J\'ai besoin de la salle 100 le 27 août entre 8 h et 10 h','2021-01-11 16:48:46',56),(69,'Bonjour, J\'ai besoin de la salle 100 le 29 août entre 8 h et 10 h','2021-01-11 16:48:53',56),(70,'Bonjour, J\'ai besoin de la salle 100 le 29 août entre 14 h et 17 h','2021-01-11 16:49:03',56),(71,'Bonjour, J\'ai besoin de la salle 100 le 29 août entre 14 h et 16 h','2021-01-11 16:49:10',56),(72,'Bonjour, J\'ai besoin de la salle 100 le 29 août entre 14 h et 18 h','2021-01-11 16:49:17',56),(73,'Bonjour, J\'ai besoin de la salle 100 le 29 août entre 16 h et 18 h','2021-01-11 16:49:24',56);
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
  `res_date` date NOT NULL,
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
) ENGINE=InnoDB AUTO_INCREMENT=69 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RESERVATION`
--

LOCK TABLES `RESERVATION` WRITE;
/*!40000 ALTER TABLE `RESERVATION` DISABLE KEYS */;
INSERT INTO `RESERVATION` VALUES (1,'2021-01-17',8,10,2,1,37),(2,'2021-02-05',10,12,2,2,38),(3,'2021-07-21',14,17,3,4,39),(4,'2021-09-19',17,18,1,3,40),(5,'2021-12-20',13,16,3,2,41),(6,'2021-01-20',20,22,2,2,46),(7,'2021-03-25',8,10,2,3,47),(8,'2021-05-13',10,13,3,4,48),(9,'2021-09-12',14,16,2,1,49),(10,'2021-10-26',16,18,2,1,50),(11,'2021-11-30',12,15,3,3,51),(12,'2021-12-03',9,12,3,1,52),(13,'2021-01-28',8,12,4,2,53),(14,'2021-04-13',11,14,3,2,54),(15,'2021-06-01',8,12,4,4,55),(16,'2021-12-04',14,17,3,3,56),(17,'2021-02-02',9,11,2,4,57),(18,'2021-02-10',14,15,1,2,63),(19,'2021-07-13',11,13,2,4,66),(20,'2021-08-29',16,18,2,2,73);
/*!40000 ALTER TABLE `RESERVATION` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ROLE`
--

DROP TABLE IF EXISTS `ROLE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ROLE` (
  `role_id` int NOT NULL,
  `role_intitule` varchar(45) COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ROLE`
--

LOCK TABLES `ROLE` WRITE;
/*!40000 ALTER TABLE `ROLE` DISABLE KEYS */;
INSERT INTO `ROLE` VALUES (1,'ADMIN'),(2,'USER');
/*!40000 ALTER TABLE `ROLE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SALLE`
--

DROP TABLE IF EXISTS `SALLE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `SALLE` (
  `sa_id` int NOT NULL AUTO_INCREMENT,
  `sa_name` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`sa_id`)
) ENGINE=InnoDB AUTO_INCREMENT=140 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SALLE`
--

LOCK TABLES `SALLE` WRITE;
/*!40000 ALTER TABLE `SALLE` DISABLE KEYS */;
INSERT INTO `SALLE` VALUES (1,'salle 736'),(2,'salle 100'),(3,'salle 200'),(4,'salle 300');
/*!40000 ALTER TABLE `SALLE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'db_reservation'
--
/*!50003 DROP PROCEDURE IF EXISTS `PD_INFORMATION` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `PD_INFORMATION`(IN ID INT(11))
BEGIN

DELETE

FROM INFORMATION

WHERE in_id = ID;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `PD_MAIL` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `PD_MAIL`(IN MailId int(11))
BEGIN

#--verification des clés étrangères pointant sur ma_id

IF EXISTS (SELECT * FROM RESERVATION WHERE ma_id = MailId) THEN
SIGNAL SQLSTATE '50005' SET MESSAGE_TEXT = 'Le mail a son identifiant référencé dans la table reservation; toutes ces entrées sont à supprimer au préalable';

END IF;

#--suppression

DELETE

FROM MAIL

WHERE ma_id = MailId;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `PD_RES` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `PD_RES`(IN RESID INT(11))
BEGIN

DELETE

FROM RESERVATION

WHERE res_id = RESID;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `PD_ROLE` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `PD_ROLE`(IN ID INT)
BEGIN

DELETE


FROM role

WHERE role_id = ID;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `PD_SALLE` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `PD_SALLE`(IN ID INT)
IF EXISTS(SELECT * FROM SALLE WHERE sa_id = ID)
    THEN
		# Si l'identifiant de la salle est référencé dans la table reservation
        -- Test à supprimer si DELETE SET NULL
        -- ID (colonne dans RESERVATION) = ID (entrée de la procédure)
		IF EXISTS(SELECT * FROM RESERVATION WHERE ID = ID)
        THEN
			SIGNAL SQLSTATE '45000'
				SET MESSAGE_TEXT = "La salle a son identifiant référencé dans la table RESERVATION; toutes ces entrées sont à rectifier au préalable";
		ELSE
			DELETE FROM SALLE WHERE sa_id = ID;
		END IF;
	ELSE
		SIGNAL SQLSTATE '45000'
			SET MESSAGE_TEXT = "La salle que vous essayez de supprimer n'existe pas";
	END IF ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `PFind_INFORMATION` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `PFind_INFORMATION`()
BEGIN

		SELECT in_id, in_mail, in_nom, in_prenom, in_poste, in_organisation, in_mdp, role_id
		FROM INFORMATION;
		
        
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `PFind_MAIL` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `PFind_MAIL`()
BEGIN

	SELECT ma_id, ma_contenu, ma_date, in_id
		FROM MAIL;
        
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `PFind_RES` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `PFind_RES`()
BEGIN

	SELECT res_id, res_date, res_heure_arrive, res_heure_depart,res_temps_reserver, sa_id, ma_id
		FROM RESERVATION;
        
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `PFind_ROLE` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `PFind_ROLE`()
SELECT role_id, role_intitule FROM ROLE ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `PFind_SALLE` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `PFind_SALLE`()
SELECT sa_id, sa_name FROM SALLE ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `PI_INFORMATION` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `PI_INFORMATION`(IN ID INT,mail VARCHAR(300), nom VARCHAR(30), prenom VARCHAR(30), poste VARCHAR(50), organisation VARCHAR(100), mdp VARCHAR(100), ROLE_ID INT(11))
BEGIN
    # verification de l'existence de l'utilisateur 
    IF EXISTS (SELECT * FROM INFORMATION WHERE role_id = ROLE_ID AND mail = in_mail )
    THEN
        SIGNAL SQLSTATE '45000'
		SET MESSAGE_TEXT = "un compte lié à cette adresse email existe déjà";
	END IF;
    ## 
     IF EXISTS (SELECT * FROM INFORMATION WHERE  in_id = ID ) 
    THEN
        SIGNAL SQLSTATE '45000'
		SET MESSAGE_TEXT = "Le compte existe déjà";
	END IF;
    
    
	IF NOT EXISTS (SELECT * FROM ROLE WHERE role_id = ROLE_ID)
    #  message d'erreur
	THEN
		SIGNAL SQLSTATE '45000'
		SET MESSAGE_TEXT = "role_id non trouvé";
	END IF;
   
    
    
	# nouvelle données de reservation
	INSERT INTO INFORMATION(in_id, in_mail, in_nom, in_prenom, in_poste, in_organisation, in_mdp, role_id) VALUES( ID ,mail , nom , prenom , poste , organisation , mdp , ROLE_ID);
			
	END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `PI_INFORMATION_SIMPLE` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `PI_INFORMATION_SIMPLE`(mail VARCHAR(300), nom VARCHAR(30), prenom VARCHAR(30), poste VARCHAR(50), organisation VARCHAR(100), mdp VARCHAR(100), ROLE_ID INT(11))
BEGIN
    
    IF EXISTS (SELECT * FROM INFORMATION WHERE mail = in_mail )
    
    THEN
		
	SIGNAL SQLSTATE '45000'
       
	SET MESSAGE_TEXT = "un compte lié à cette adresse email  existe déjà";
	END IF;
    
 INSERT INTO INFORMATION( in_mail, in_nom, in_prenom, in_poste, in_organisation, in_mdp, role_id) VALUES(mail , nom , prenom , poste , organisation , mdp , ROLE_ID);	
	END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `PI_MAIL` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `PI_MAIL`(IN ID int, CONTENU varchar(300), MA_DATE datetime, INFO_ID int)
BEGIN
    # Si l'identifiant est déjà attribué
    IF EXISTS (SELECT * FROM MAIL WHERE ma_id = ID)
    # Alors on renvoie un message d'erreur
    THEN
        # un numéro d'erreur 
	SIGNAL SQLSTATE '45000'
        # avec son message perso
	SET MESSAGE_TEXT = "L'identifiant existe déjà";
	END IF;
    #-- vérifier l'existence des valeurs des paramètres destinés à des clés étrangères
	IF NOT EXISTS (SELECT * FROM INFORMATION WHERE in_id = INFO_ID)
    # Alors on renvoie un message d'erreur
	THEN
        # un numéro d'erreur 
	SIGNAL SQLSTATE '45000'
        # avec son message perso
	SET MESSAGE_TEXT = "in_id non trouvé";
	END IF;
	# On insère le nouveau mail dans la table
	INSERT INTO MAIL(ma_id, ma_contenu, ma_date, in_id) VALUES(ID, CONTENU, NOW(), INFO_ID);
			
	END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `PI_MAIL_SIMPLE` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `PI_MAIL_SIMPLE`(CONTENU varchar(300), INFO_ID int)
BEGIN
    # On vérifie que le contenu et la date du mail n'existe pas déjà
    IF EXISTS (SELECT * FROM MAIL WHERE ma_contenu = CONTENU and ma_date = NOW())
    # Alors on renvoie un message d'erreur
    THEN
        # un numéro d'erreur 
	SIGNAL SQLSTATE '45000'
        # avec son message perso
	SET MESSAGE_TEXT = "Le contenu et la date du mail existe déjà";
	END IF;
    # On insere le nouveau contenu mail dans la table
	INSERT INTO MAIL (ma_contenu, ma_date, in_id ) VALUES(CONTENU, NOW(), INFO_ID);
		
	END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `PI_RES` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `PI_RES`(IN ID INT, RES_DATE DATE, heure_arrive INT, heure_depart INT, temps_reserver INT, SALLE_id INT, MAIL_id INT)
BEGIN
    # Si la salle est déjà réservé à cet heure ci 
    IF EXISTS (SELECT * FROM RESERVATION WHERE sa_id = SALLE_ID AND heure_arrive = res_heure_arrive AND res_date = RES_DATE )
    THEN
        SIGNAL SQLSTATE '45000'
		SET MESSAGE_TEXT = "La salle à déjà été reservée à cet heure ci";
	END IF;
    ## Si une reservation est déjà effectué
     IF EXISTS (SELECT * FROM RESERVATION WHERE  ma_id = MAIL_ID ) or (SELECT * FROM RESERVATION WHERE res_id= ID)
    THEN
        SIGNAL SQLSTATE '45000'
		SET MESSAGE_TEXT = "Une réservation à déjà été effectué";
	END IF;
    
    
	IF NOT EXISTS (SELECT * FROM MAIL WHERE ma_id = MAIL_ID)
    #  message d'erreur
	THEN
		SIGNAL SQLSTATE '45000'
		SET MESSAGE_TEXT = "ma_id non trouvé";
	END IF;
    IF NOT EXISTS (SELECT * FROM SALLE WHERE sa_id = SALLE_ID)
    ##message d'erreur
	THEN
		SIGNAL SQLSTATE '45000'
		SET MESSAGE_TEXT = "sa_id non trouvé";
	END IF;
    
    
	# nouvelle données de reservation
	INSERT INTO RESERVATION(res_id, res_date, res_heure_arrive, res_heure_depart,res_temps_reserver, sa_id, ma_id) VALUES(ID, DATE(now()), heure_arrive , heure_depart , temps_reserver , SALLE_id , MAIL_id );
			
	END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `PI_RES_SIMPLE` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `PI_RES_SIMPLE`(RES_DATE DATE, heure_arrive INT, heure_depart INT, temps_reserver INT, SALLE_id INT, MAIL_id INT )
BEGIN
    
    IF EXISTS (SELECT * FROM RESERVATION WHERE (RES_DATE = res_date and SALLE_id = sa_id and MAIL_id = ma_id))
    
    THEN
		
	SIGNAL SQLSTATE '45000'
       
	SET MESSAGE_TEXT = "La reservation existe déjà";
	END IF;
    
 INSERT INTO RESERVATION(res_date, res_heure_arrive, res_heure_depart,res_temps_reserver, sa_id, ma_id) VALUES( RES_DATE, heure_arrive , heure_depart , temps_reserver , SALLE_id , MAIL_id );
		
	END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `PI_ROLE` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `PI_ROLE`(IN ID INT, IN ROLE VARCHAR(45))
IF EXISTS(SELECT * FROM ROLE WHERE role_id = ID)
    # Alors on renvoie un message d'erreur
    THEN 
        ## un numéro d'erreur bidon
        SIGNAL SQLSTATE '45000'
            # avec son message perso
            SET MESSAGE_TEXT = "L'identifiant existe déjà";
    # Sinon
    ELSE
        # Si le role existe déjà
        IF EXISTS(SELECT * FROM ROLE WHERE role_intitule = ROLE)
        THEN
            SIGNAL SQLSTATE '45000'
                SET MESSAGE_TEXT = "Ce ROLE existe déjà";
        ELSE
            # On insère un nouveau role dans la table
            INSERT INTO ROLE VALUES(ID, ROLE);
        END IF;
	END IF ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `PI_SALLE` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `PI_SALLE`(IN ID INT, IN SALLE VARCHAR(50))
IF EXISTS(SELECT * FROM SALLE WHERE sa_id = ID)
    # Alors on renvoie un message d'erreur
	THEN 
		## un numéro d'erreur bidon
		SIGNAL SQLSTATE '45000'
			# avec son message perso
			SET MESSAGE_TEXT = "L'identifiant existe déjà";
	# Sinon
	ELSE
		# Si la salle existe déjà
		IF EXISTS(SELECT * FROM SALLE WHERE sa_name = SALLE)
		THEN
			SIGNAL SQLSTATE '45000'
				SET MESSAGE_TEXT = "Cette salle existe déjà";
		ELSE
			# On insère la nouvelle catégorie dans la table
			INSERT INTO SALLE VALUES(ID, SALLE);
		END IF;
    # Fin du 1er IF    
	END IF ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `PI_SALLE_SIMPLE` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `PI_SALLE_SIMPLE`(IN SALLE VARCHAR(50))
IF EXISTS(SELECT * FROM SALLE WHERE sa_name = SALLE)
	THEN
		SIGNAL SQLSTATE '45000'
			SET MESSAGE_TEXT = "La salle existe déjà";
	ELSE
		INSERT INTO SALLE (sa_name) VALUES(SALLE);
	END IF ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `PSGetCheckSalleBetween` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `PSGetCheckSalleBetween`(IN SA_NAME VARCHAR(50), IN RES_DATE DATE, IN RES_HEURE_DEB INT, IN RES_HEURE_FIN INT)
BEGIN

SELECT res_id, res_date, res_heure_arrive, res_heure_depart, S.sa_name ,S.sa_id
FROM RESERVATION R 
INNER JOIN SALLE S ON S.sa_id=R.sa_id 
WHERE S.sa_name = SA_NAME
AND R.res_date = RES_DATE
AND(( RES_HEURE_DEB BETWEEN R.res_heure_arrive AND R.res_heure_depart ) 
OR 
(RES_HEURE_FIN BETWEEN R.res_heure_arrive AND R.res_heure_depart));


END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `PSGetCheckSalleDebutToFin` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `PSGetCheckSalleDebutToFin`(IN SA_NAME VARCHAR(50), IN RES_DATE DATE, IN RES_HEURE_DEB_1 INT,IN RES_HEURE_DEB_2 INT, IN RES_HEURE_FIN_1 INT, IN RES_HEURE_FIN_2 INT)
BEGIN


SELECT res_id, res_date, res_heure_arrive, res_heure_depart, S.sa_name ,S.sa_id
FROM RESERVATION R 
INNER JOIN SALLE S ON S.sa_id=R.sa_id 
WHERE S.sa_name = SA_NAME
AND R.res_date = RES_DATE
AND ((RES_HEURE_DEB_1 >= R.res_heure_arrive AND RES_HEURE_DEB_2 <= R.res_heure_depart) 
OR 
(RES_HEURE_FIN_1 > R.res_heure_arrive AND RES_HEURE_FIN_2 < R.res_heure_depart));








END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `PSGetCheckSalleFintoDebut` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `PSGetCheckSalleFintoDebut`(IN SA_NAME VARCHAR(50), IN RES_DATE DATE, IN RES_HEURE_DEB_1 INT,IN RES_HEURE_DEB_2 INT, IN RES_HEURE_FIN_1 INT, IN RES_HEURE_FIN_2 INT)
BEGIN

SELECT res_id, res_date, res_heure_arrive, res_heure_depart, S.sa_name  ,S.sa_id
FROM RESERVATION R 
INNER JOIN SALLE S ON S.sa_id=R.sa_id 
WHERE S.sa_name = SA_NAME 
AND R.res_date = RES_DATE
AND (( RES_HEURE_DEB_1 > R.res_heure_arrive AND RES_HEURE_DEB_1 < R.res_heure_depart) 
OR 
( RES_HEURE_FIN_1 >= R.res_heure_arrive AND RES_HEURE_FIN_2 <= R.res_heure_depart));




END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `PSGetINFORMATIONmail` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `PSGetINFORMATIONmail`(IN MAIL VARCHAR(300))
SELECT in_id , in_mail, in_nom,in_prenom,in_poste,in_organisation FROM INFORMATION 
    WHERE in_mail = MAIL ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `PSGetLATESTmailUSER` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `PSGetLATESTmailUSER`(IN IN_ID INT)
BEGIN

SELECT ma_id FROM MAIL WHERE in_id = IN_ID ORDER BY ma_date DESC LIMIT 1;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `PSGetROLE` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `PSGetROLE`(IN ID INT)
SELECT role_id , role_intitule FROM ROLE 
    WHERE role_id = ID ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `PSGetSALLE` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `PSGetSALLE`(IN ID INT)
SELECT sa_id , sa_name FROM SALLE 
    WHERE sa_id = ID ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `PSGetSALLEbyNAME` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `PSGetSALLEbyNAME`(IN SA_NAME VARCHAR(50))
BEGIN

SELECT sa_name FROM SALLE WHERE sa_name = SA_NAME LIMIT 1;


END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `PSGetSalleIDbyNAME` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `PSGetSalleIDbyNAME`(IN NAME_SALLE VARCHAR (50))
BEGIN

SELECT sa_id FROM SALLE WHERE sa_name = NAME_SALLE ;


END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `PSGet_INFORMATION` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `PSGet_INFORMATION`(IN ID int(11))
BEGIN

	SELECT in_id, in_mail, in_nom, in_prenom, in_poste, in_organisation, in_mdp, role_id
		FROM INFORMATION
		WHERE in_id = ID;
        
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `PSGet_MAIL` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `PSGet_MAIL`(IN MailId int(11))
BEGIN

	SELECT ma_id, ma_contenu, ma_date, in_id
		FROM MAIL
		WHERE ma_id = MailId;
        
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `PSGet_RES` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `PSGet_RES`(IN RESID int(11))
BEGIN

	SELECT res_id, res_date, res_heure_arrive, res_heure_depart,res_temps_reserver, sa_id, ma_id
		FROM RESERVATION
		WHERE res_id = RESID;
        
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `PU_INFORMATION` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `PU_INFORMATION`(IN ID INT, mail VARCHAR(300), nom VARCHAR(30), prenom VARCHAR(30), poste VARCHAR(50), organisation VARCHAR(100), mdp VARCHAR(100), ROLE_ID INT(11))
BEGIN

IF NOT EXISTS (SELECT * FROM INFORMATION WHERE in_id = ID) THEN
			SIGNAL SQLSTATE '50001' SET MESSAGE_TEXT = 'Information utilisateur non trouvé';
END IF;

IF NOT EXISTS (SELECT * FROM ROLE WHERE role_id = ROLE_ID) THEN
			SIGNAL SQLSTATE '50002' SET MESSAGE_TEXT = 'type utilisateur  non trouvées';
END IF;



#-- mise à jour

UPDATE INFORMATION

SET in_mail = mail, in_nom = nom, in_prenom = prenom, in_poste = poste, in_organisation = organisation, in_mdp = mdp, role_id = ROLE_ID


WHERE in_id = ID ;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `PU_MAIL` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `PU_MAIL`(
						IN MailId int(11),
						CONTENU varchar(320),
                        MA_DATE datetime,
						INFO_ID int(11))
BEGIN
#-- vérifier que le mail que l'on souhaite mettre à jour existe bien
IF NOT EXISTS (SELECT * FROM MAIL WHERE ma_id = MailId) THEN
			SIGNAL SQLSTATE '50001' SET MESSAGE_TEXT = 'Mail non trouvé';
END IF;
#-- vérifier l'existence des valeurs des paramètres destinés à des clés étrangères
IF NOT EXISTS (SELECT * FROM INFORMATION WHERE in_id = INFO_ID) THEN
			SIGNAL SQLSTATE '50002' SET MESSAGE_TEXT = 'Infomations non trouvées';
END IF;

#-- mise à jour

UPDATE MAIL

SET CONTENU=ma_contenu, MA_DATE=ma_date, INFO_ID=in_id

WHERE ma_id = MailId ;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `PU_RES` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `PU_RES`(IN RESID INT,
						RES_DATE DATE,
						heure_arrive INT,
						heure_depart INT,
						temps_reserver INT,
						SALLE_id INT,
						MAIL_id INT)
BEGIN

IF NOT EXISTS (SELECT * FROM RESERVATION WHERE res_id = RESID) THEN
			SIGNAL SQLSTATE '50001' SET MESSAGE_TEXT = 'Reservation non trouvé';
END IF;

IF NOT EXISTS (SELECT * FROM SALLE WHERE sa_id = SALLE_id) THEN
			SIGNAL SQLSTATE '50002' SET MESSAGE_TEXT = 'Salle non trouvées';
END IF;

IF NOT EXISTS (SELECT * FROM MAIL WHERE ma_id = MAIL_id) THEN
			SIGNAL SQLSTATE '50002' SET MESSAGE_TEXT = 'Mail non trouvées';
END IF;

#-- mise à jour

UPDATE RESERVATION 

SET res_date = RES_DATE, res_heure_arrive = heure_arrive, res_heure_depart = heure_depart, res_temps_reserver = temps_reserver, sa_id = SALLE_id, ma_id = MAIL_id


WHERE res_id = RESID ;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `PU_ROLE` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `PU_ROLE`(IN ID INT, IN ROLE VARCHAR(45))
IF EXISTS(SELECT * FROM ROLE WHERE role_id = ID)
    # Alors
	THEN 
		
		IF EXISTS(SELECT * FROM ROLE WHERE role_intule = USER)
		THEN
			SIGNAL SQLSTATE '45000'
				SET MESSAGE_TEXT = "compte user";
		ELSE
		# On met à jour le nom de la salle
			UPDATE ROLE
				SET role_intitule = USERS
			# de la catégorie d'identifiant idCategorie         
			WHERE role_id = ID;
		END IF;
	ELSE 
		SIGNAL SQLSTATE '45000'
			SET MESSAGE_TEXT = "Le role que vous essayez de modifier n'existe pas";
	END IF ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `PU_SALLE` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `PU_SALLE`(IN ID INT, IN SALLE VARCHAR(50))
IF EXISTS(SELECT * FROM SALLE WHERE sa_id = ID)
    # Alors
	THEN 
		# On vérifie que la salle n'existe pas déjà
		IF EXISTS(SELECT * FROM SALLE WHERE sa_name = SALLE)
		THEN
			SIGNAL SQLSTATE '45000'
				SET MESSAGE_TEXT = "La salle existe déjà";
		ELSE
		# On met à jour le nom de la salle
			UPDATE SALLE
				SET sa_name = SALLE
			# de la catégorie d'identifiant idCategorie         
			WHERE sa_id = ID;
		END IF;
	ELSE 
		SIGNAL SQLSTATE '45000'
			SET MESSAGE_TEXT = "La salle que vous essayez de modifier n'existe pas";
	END IF ;;
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

-- Dump completed on 2021-01-12 14:00:55
