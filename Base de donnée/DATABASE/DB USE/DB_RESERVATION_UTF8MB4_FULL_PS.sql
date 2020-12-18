CREATE DATABASE  IF NOT EXISTS `db_reservation` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `db_reservation`;
-- MySQL dump 10.13  Distrib 8.0.22, for Linux (x86_64)
--
-- Host: localhost    Database: db_reservation
-- ------------------------------------------------------
-- Server version	8.0.22-0ubuntu0.20.04.3

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
  `in_mdp` varchar(100) NOT NULL,
  `in_nom` varchar(30) NOT NULL,
  `in_prenom` varchar(30) NOT NULL,
  `in_poste` varchar(50) NOT NULL,
  `in_organisation` varchar(100) NOT NULL,
  `role_id` int NOT NULL,
  PRIMARY KEY (`in_id`),
  KEY `fk_INFORMATION_1_idx` (`in_mail`),
  KEY `fk_INFORMATION_1_idx1` (`role_id`),
  CONSTRAINT `fk_INFORMATION_1` FOREIGN KEY (`role_id`) REFERENCES `ROLE` (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `INFORMATION`
--

LOCK TABLES `INFORMATION` WRITE;
/*!40000 ALTER TABLE `INFORMATION` DISABLE KEYS */;
INSERT INTO `INFORMATION` VALUES (32,'anthony.marais@icloud.com','passwordmatch','Anthony','MARAIS','PDG','BOOKING',2),(33,'melleAlisson@icloud.com','supermdp','Alisson','Marais','PDG','BOOKING',2),(34,'testingdb@icloud.com','baee6206dfe8af3451bd66f68a7fe76ab4cf1743','Anthony','Marais','PDG','BOOKING',2),(35,'alisson.duranton@icloud.com','940c0f26fd5a30775bb1cbd1f6840398d39bb813','Alisson','Marais','Assistante éducative','Mairie Antibes',2),(36,'anthony.marais@gmail.com','940c0f26fd5a30775bb1cbd1f6840398d39bb813','Anthony Luc MARAIS','tony','popo','popoe',2),(37,'maxime.salacroup@gmail.com','77a3967e5631285bf99c3fbb1754a172fe6a5d79','maxime','salacroup','collégien','Gérard Philipe',2),(38,'anthony.marais@hotmail.com','dc724af18fbdd4e59189f5fe768a5f8311527050','Anthony Luc MARAIS','toto','totot','rororo',2),(39,'toto.toto@gmail.com','5baa61e4c9b93f3f0682250b6cf8331b7ee68fd8','toto','toto','toto','totoR',2),(40,'max.test@gmail.com','pbkdf2:sha256:150000$4eXX2ukj$9b1f1b9ab7601b3cf82e6efec18956c45e3b7aa81451ceb4a14099415d94c473','test','test','pdg','testing',2),(41,'testing@tutu.com','pbkdf2:sha256:150000$ZvyC7GXs$7a49c436de2cfd1a7dab853f7fc401bd97eb2723d30f29ef27da76f53a5cdde7','Anthony Luc MARAIS','sjsjjs','jjsjsjsj','jsjdjdjdj',2),(42,'alisson.marais@gmail.com','112bb791304791ddcf692e29fd5cf149b35fea37','alisson','marais','PDG','BOOKING',2),(43,'xx.xxx@xx.xxx','pbkdf2:sha256:150000$jcBAC5tw$c587571cf926282c88d45a34c2b79405c8559898e9e647fa7e9b41e37cd93e55','ccccc','ldlklk','lklklkl','lklklll',2),(44,'anthony.marais@amazon.com','pbkdf2:sha256:150000$TZYBOn7A$bd98698c8019e138629ca43d0e86b034b97bb9b80c86898cd73330bf8032fa09','Anthony Luc MARAIS','anthony','jkdjdkj','jkdjkdj',2);
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
  `ma_date` datetime NOT NULL,
  `in_id` int NOT NULL,
  PRIMARY KEY (`ma_id`),
  KEY `fk_MAIL_1_idx` (`in_id`),
  CONSTRAINT `fk_MAIL_1` FOREIGN KEY (`in_id`) REFERENCES `INFORMATION` (`in_id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `MAIL`
--

LOCK TABLES `MAIL` WRITE;
/*!40000 ALTER TABLE `MAIL` DISABLE KEYS */;
INSERT INTO `MAIL` VALUES (21,'Salut, J’ai besoin de la salle 736 le 17 janvier entre 8 h et 10 h','2020-12-18 13:01:53',32),(22,'Salut, J’ai besoin de la salle 736 le 14 janvier entre 8 h et 10 h','2020-12-18 13:04:02',32),(23,'Salut, J’ai besoin de la salle 736 le 17 janvier entre 8 h et 10 h','2020-12-18 14:26:09',32),(26,'Salut, J’ai besoin de la salle 736 le 17 janvier entre 8 h et 10 h','2020-12-18 14:26:45',32),(27,'BALABALABKABLABALALB','2020-12-18 14:48:00',32),(28,'Salut, J’ai besoin de la salle 736 le 17 janvier entre 8 h et 10 h','2020-12-18 14:51:09',32),(29,'Salut, J’ai besoin de la salle 736 le 17 janvier entre 8 h et 10 h','2020-12-18 14:52:39',32),(30,'Salut, J’ai besoin de la salle 736 le 17 janvier entre 8 h et 10 h','2020-12-18 14:53:00',32);
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
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RESERVATION`
--

LOCK TABLES `RESERVATION` WRITE;
/*!40000 ALTER TABLE `RESERVATION` DISABLE KEYS */;
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
  `role_intitule` varchar(45) NOT NULL,
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
  `sa_name` varchar(50) NOT NULL,
  PRIMARY KEY (`sa_id`)
) ENGINE=InnoDB AUTO_INCREMENT=132 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SALLE`
--

LOCK TABLES `SALLE` WRITE;
/*!40000 ALTER TABLE `SALLE` DISABLE KEYS */;
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
CREATE DEFINER=`root`@`localhost` PROCEDURE `PI_INFORMATION_SIMPLE`(IN ID INT,mail VARCHAR(300), nom VARCHAR(30), prenom VARCHAR(30), poste VARCHAR(50), organisation VARCHAR(100), mdp VARCHAR(100), ROLE_ID INT(11))
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
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `PI_RES_SIMPLE`(IN RESID int,RES_DATE DATE, heure_arrive INT, heure_depart INT, temps_reserver INT, SALLE_id INT, MAIL_id INT )
BEGIN
    
    IF EXISTS (SELECT * FROM RESERVATION WHERE RES_DATE = res_date and SALLE_id = sa_id and heure_arrive = res_heure_arrive)
    
    THEN
		
	SIGNAL SQLSTATE '45000'
       
	SET MESSAGE_TEXT = "La reservation existe déjà";
	END IF;
    
 INSERT INTO RESERVATION(res_date, res_heure_arrive, res_heure_depart,res_temps_reserver, sa_id, ma_id) VALUES( DATE(now()), heure_arrive , heure_depart , temps_reserver , SALLE_id , MAIL_id );
		
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
/*!50003 DROP PROCEDURE IF EXISTS `PFind_SALLE` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `PFind_SALLE`()
SELECT sa_id, sa_name FROM SALLE ;;
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
    WHERE role_id = ID; ;;
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

-- Dump completed on 2020-12-18 16:27:21
