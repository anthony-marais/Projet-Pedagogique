-- MySQL dump 10.13  Distrib 5.7.32, for Linux (x86_64)
--
-- Host: localhost    Database: db_reservation
-- ------------------------------------------------------
-- Server version	5.7.32-0ubuntu0.18.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Dumping data for table `INFORMATION`
--

LOCK TABLES `INFORMATION` WRITE;
/*!40000 ALTER TABLE `INFORMATION` DISABLE KEYS */;
INSERT INTO `INFORMATION` VALUES (52,'theo@mail.com','pbkdf2:sha256:150000$eJnx7AVg$3fd16b83e282a55d7e923447b96409be1e97c990d2c1cf544bfdcee9bd099079','Theo','Valor','Élève','Lycée Tocqueville',2),(53,'anthony@mail.com','pbkdf2:sha256:150000$gIJCFzcQ$7edb7ff871783ad5128745a7d742c5e8d857feca839e4718c4073e5d1f66adcc','Anthony','Reno','Apprenant','Simplon',2),(54,'sandrine@mail.com','pbkdf2:sha256:150000$gUTdXk26$72b93cf808a89697d6b6fb6b6cee92c77d940da1fe176227166dc4fc60ce1226','Sandrine','Kaulu','Formateur','Simplon',2),(55,'samy@mail.com','pbkdf2:sha256:150000$FQvEPNpg$9d095c250ba65a30b077d39b6cc56d50d97921e71775e7fe2248db7e56848620','Samy','Lacour','Professeur','Lycée Tocqueville',2),(56,'arouf@mail.com','pbkdf2:sha256:150000$Aa8gcECX$355965a8e45a1c46a7931ddae3ff7e633c6dd7e31535c9d6f00c83c3c623d7c6','Arouf','Gangsta','Directeur','Simplon',2);
/*!40000 ALTER TABLE `INFORMATION` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `MAIL`
--

LOCK TABLES `MAIL` WRITE;
/*!40000 ALTER TABLE `MAIL` DISABLE KEYS */;
INSERT INTO `MAIL` VALUES (37,'Salut, J’ai besoin de la salle 736 le 17 janvier entre 8 h et 10 h','2021-01-11 15:59:06',52),(38,'Salut, J’ai besoin de la salle 100 le 5 fevrier entre 10 h et 12 h','2021-01-11 16:10:22',52),(39,'Salut j\'ai besoin de la salle 300 le 21 juillet entre 14 h et 17 h','2021-01-11 16:10:49',52),(40,'Salut, j\'ai besoin de la salle 200 le 19 septembre entre 17 h et 18 h','2021-01-11 16:11:28',52),(41,'Salut, j\'ai besoin de la salle 100 le 20 decembre entre 13 h et 16 h','2021-01-11 16:12:05',52),(42,'Salut, j\'ai besoin de la salle 100 le 15 janvier entre 10 h et 13 h','2021-01-11 16:13:41',53),(43,'Salut, j\'ai besoin de la salle 100 le 15 janvier entre 10 h et 13 h','2021-01-11 16:15:09',53),(44,'Salut, j\'ai besoin de la salle 100 le 16 janvier entre 10 h et 13 h','2021-01-11 16:16:58',53),(45,'Salut, j\'ai besoin de la salle 100 le 20 janvier entre 10 h et 13 h','2021-01-11 16:28:08',53),(46,'Salut, j\'ai besoin de la salle 100 le 20 janvier entre 20 h et 22 h','2021-01-11 16:30:13',53),(47,'Salut, j\'ai besoin de la salle 200 le 25 mars entre 8 h et 10 h ','2021-01-11 16:32:09',53),(48,'Salut, j\'ai besoin de la salle 300 le 13 mai entre 10 h et 13 h','2021-01-11 16:32:47',53),(49,'Salut, j\'ai besoin de la salle 736 le 12 septembre entre 14 h et 16 h','2021-01-11 16:34:42',53),(50,'Salut, j\'ai besoin de la salle 736 le 26 octobre entre 16 h et 18 h ','2021-01-11 16:35:10',53),(51,'Salut, j\'ai besoin de la salle 200 le 30 novembre entre 12 h et 15 h ','2021-01-11 16:38:53',53),(52,'Bonjour, j\'ai besoin de la salle 736 le 3 decembre entre 9 h et 12 h','2021-01-11 16:40:21',53),(53,'Bonjour, j\'ai besoin de la salle 100 le 28 janvier entre 8 h et 12 h','2021-01-11 16:41:11',54),(54,'Bonjour, j\'ai besoin de la salle 100 le 13 avril entre 11 h et 14 h','2021-01-11 16:41:34',54),(55,'Bonjour j\'ai besoin de la salle 300 le 1 juin entre 8 h et 12 h','2021-01-11 16:42:08',54),(56,'Salut, j\'ai besoin de la salle 200 le 4 decembre entre 14 h et 17 h','2021-01-11 16:42:35',54),(57,'Bonjour j\'ai besoin de la salle 300 le 2 fevrier entre 9 h et 11 h','2021-01-11 16:43:21',56),(58,'Salut, j\'ai besoin de la salle 736 le 20 fevrier entre 14 h et 15 h','2021-01-11 16:43:44',56),(59,'Salut, j\'ai besoin de la salle 736 le 20 fevrier entre 14 h et 15 h','2021-01-11 16:44:14',56),(60,'Salut, j\'ai besoin de la salle 736 le 20 fevrier entre 14 h et 18 h','2021-01-11 16:45:01',56),(61,'Salut, j\'ai besoin de la salle 736 le 20 fevrier entre 16 h et 18 h','2021-01-11 16:45:18',56),(62,'Salut, j\'ai besoin de la salle 736 le 10 fevrier entre 14 h et 15 h','2021-01-11 16:45:44',56),(63,'Salut, j\'ai besoin de la salle 100 le 10 fevrier entre 14 h et 15 h','2021-01-11 16:45:54',56),(64,'Salut, J\'ai besoin de la salle 300 le 13 juillet entre 9 h et 10 h','2021-01-11 16:46:22',56),(65,'Salut, J\'ai besoin de la salle 300 le 13 juillet entre 9 h et 13 h','2021-01-11 16:46:41',56),(66,'Salut, J\'ai besoin de la salle 300 le 13 juillet entre 11 h et 13 h','2021-01-11 16:46:48',56),(67,'Bonjour, j\'ai besoin de la salle 100 le 27 août entre 8 h et 10 h','2021-01-11 16:47:20',56),(68,'Bonjour, J\'ai besoin de la salle 100 le 27 août entre 8 h et 10 h','2021-01-11 16:48:46',56),(69,'Bonjour, J\'ai besoin de la salle 100 le 29 août entre 8 h et 10 h','2021-01-11 16:48:53',56),(70,'Bonjour, J\'ai besoin de la salle 100 le 29 août entre 14 h et 17 h','2021-01-11 16:49:03',56),(71,'Bonjour, J\'ai besoin de la salle 100 le 29 août entre 14 h et 16 h','2021-01-11 16:49:10',56),(72,'Bonjour, J\'ai besoin de la salle 100 le 29 août entre 14 h et 18 h','2021-01-11 16:49:17',56),(73,'Bonjour, J\'ai besoin de la salle 100 le 29 août entre 16 h et 18 h','2021-01-11 16:49:24',56);
/*!40000 ALTER TABLE `MAIL` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `RESERVATION`
--

LOCK TABLES `RESERVATION` WRITE;
/*!40000 ALTER TABLE `RESERVATION` DISABLE KEYS */;
INSERT INTO `RESERVATION` VALUES (1,'2021-01-17',8,10,2,1,37),(2,'2021-02-05',10,12,2,2,38),(3,'2021-07-21',14,17,3,4,39),(4,'2021-09-19',17,18,1,3,40),(5,'2021-12-20',13,16,3,2,41),(6,'2021-01-20',20,22,2,2,46),(7,'2021-03-25',8,10,2,3,47),(8,'2021-05-13',10,13,3,4,48),(9,'2021-09-12',14,16,2,1,49),(10,'2021-10-26',16,18,2,1,50),(11,'2021-11-30',12,15,3,3,51),(12,'2021-12-03',9,12,3,1,52),(13,'2021-01-28',8,12,4,2,53),(14,'2021-04-13',11,14,3,2,54),(15,'2021-06-01',8,12,4,4,55),(16,'2021-12-04',14,17,3,3,56),(17,'2021-02-02',9,11,2,4,57),(18,'2021-02-10',14,15,1,2,63),(19,'2021-07-13',11,13,2,4,66),(20,'2021-08-29',16,18,2,2,73);
/*!40000 ALTER TABLE `RESERVATION` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `ROLE`
--

LOCK TABLES `ROLE` WRITE;
/*!40000 ALTER TABLE `ROLE` DISABLE KEYS */;
INSERT INTO `ROLE` VALUES (1,'ADMIN'),(2,'USER');
/*!40000 ALTER TABLE `ROLE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `SALLE`
--

LOCK TABLES `SALLE` WRITE;
/*!40000 ALTER TABLE `SALLE` DISABLE KEYS */;
INSERT INTO `SALLE` VALUES (1,'salle 736'),(2,'salle 100'),(3,'salle 200'),(4,'salle 300');
/*!40000 ALTER TABLE `SALLE` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-01-12 13:44:45
