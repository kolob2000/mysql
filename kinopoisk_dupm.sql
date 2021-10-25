-- MySQL dump 10.13  Distrib 8.0.26, for Win64 (x86_64)
--
-- Host: localhost    Database: kinopoisk
-- ------------------------------------------------------
-- Server version	8.0.26

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
-- Table structure for table `actors`
--

DROP TABLE IF EXISTS `actors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `actors` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `birthday_at` date DEFAULT NULL,
  `country` varchar(255) DEFAULT NULL,
  `biography` text,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `actors`
--

LOCK TABLES `actors` WRITE;
/*!40000 ALTER TABLE `actors` DISABLE KEYS */;
INSERT INTO `actors` VALUES (1,'Djon','Travolta','1975-03-11','Usa','biography'),(2,'Alexandr','Bezrukov','1979-06-20','Russia','biography'),(3,'Semen','Svetlakov','1985-05-03','Russia','biography'),(4,'Evgeniy','Pchelkin','1995-05-31','Russia','biography'),(5,'Roman','Naumov','1965-05-13','Russia','biography'),(6,'Oleg','Tabakov','1972-05-25','Russia','biography'),(7,'Evgeniy','Smaktunovsky','1988-09-02','Russia','biography'),(8,'Tatyana','Fedorova','1966-08-16','Russia','biography'),(9,'Nikita','Michalkov','1954-06-22','Russia','biography'),(10,'Semen','Habibulin','1983-05-05','Russia','biography');
/*!40000 ALTER TABLE `actors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `creator_type`
--

DROP TABLE IF EXISTS `creator_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `creator_type` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  UNIQUE KEY `id` (`id`),
  UNIQUE KEY `title` (`title`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `creator_type`
--

LOCK TABLES `creator_type` WRITE;
/*!40000 ALTER TABLE `creator_type` DISABLE KEYS */;
INSERT INTO `creator_type` VALUES (7,'гриммер'),(8,'декоратор'),(4,'звукорежиссер'),(11,'коммерчиский директор'),(5,'композитор'),(6,'костюмер'),(3,'оператор'),(1,'режиссер'),(10,'свет'),(9,'стилист'),(2,'сценарист');
/*!40000 ALTER TABLE `creator_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `creators`
--

DROP TABLE IF EXISTS `creators`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `creators` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `birthday_at` date DEFAULT NULL,
  `country` varchar(255) DEFAULT NULL,
  `biography` text,
  `creator_type_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `creator_type_id` (`creator_type_id`),
  CONSTRAINT `creators_ibfk_1` FOREIGN KEY (`creator_type_id`) REFERENCES `creator_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `creators`
--

LOCK TABLES `creators` WRITE;
/*!40000 ALTER TABLE `creators` DISABLE KEYS */;
INSERT INTO `creators` VALUES (1,'Роман','Башаров','1975-03-11','Russia','biography',1),(2,'Semen','Ermolin','1954-06-22','Usa','biography',1),(3,'Mickal','Cors','1983-05-05','Usa','biography',2),(4,'Gleb','Usupov','1988-09-02','Russia','biography',2),(5,'Роман','Ivanov','1983-05-05','Australia','biography',3),(6,'Nickita','Prudnickov','1975-03-11','Russia','biography',3),(7,'Anatoly','Petrov','1988-09-02','Ukraine','biography',4),(8,'Oleg','Roy','1965-03-14','Ussr','biography',4),(9,'Tomara','Gorbacheva','1976-02-11','Estonia','biography',5),(10,'Konstantin','Hlebnick','1985-07-01','Russia','biography',5),(11,'Timur','Antonov','1995-03-15','Latvia','biography',6),(12,'Sergey','Tachko','1972-04-17','Mexica','biography',6),(13,'Elena','Panovich','0198-06-13','Francia','biography',7),(14,'Svetlana','Nevzorova','1985-12-01','Australia','biography',7),(15,'Gleb','Glebov','1934-09-19','Canada','biography',8),(16,'Ilya','Laushev','1967-11-11','Usa','biography',8),(17,'Alexandr','Boyarov','1975-05-15','Polsha','biography',9),(18,'Tom','Kurts','1955-08-12','China','biography',9),(19,'Richard','Velengton','1966-03-10','Germany','biography',10),(20,'Birma','Stuard','1999-09-09','Russia','biography',10),(21,'Patrick','Svayzy','1995-06-11','Usa','biography',11),(22,'Elena','Bautina','1992-07-07','Russia','biography',11);
/*!40000 ALTER TABLE `creators` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `genres`
--

DROP TABLE IF EXISTS `genres`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `genres` (
  `id` tinyint unsigned NOT NULL AUTO_INCREMENT,
  `genre` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `genre` (`genre`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `genres`
--

LOCK TABLES `genres` WRITE;
/*!40000 ALTER TABLE `genres` DISABLE KEYS */;
INSERT INTO `genres` VALUES (1,'аниме\r'),(2,'биографический\r'),(3,'боевик\r'),(4,'вестерн\r'),(5,'военный\r'),(6,'детектив\r'),(7,'детский\r'),(8,'документальный\r'),(9,'драма\r'),(10,'исторический\r'),(11,'кинокомикс\r'),(12,'комедия\r'),(13,'концерт\r'),(14,'короткометражный\r'),(15,'криминал\r'),(16,'мелодрама\r'),(17,'мистика\r'),(18,'музыка\r'),(19,'мультфильм\r'),(20,'мюзикл\r'),(21,'научный\r'),(22,'нуар\r'),(23,'приключения\r'),(24,'реалити-шоу\r'),(25,'семейный\r'),(26,'спорт\r'),(27,'ток-шоу\r'),(28,'триллер\r'),(29,'ужасы\r'),(30,'фантастика\r'),(31,'фэнтези\r'),(32,'эротика');
/*!40000 ALTER TABLE `genres` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `media`
--

DROP TABLE IF EXISTS `media`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `media` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `media_type_id` bigint unsigned NOT NULL,
  `filename` varchar(50) NOT NULL,
  `size` int NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  UNIQUE KEY `id` (`id`),
  KEY `media_type_id` (`media_type_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `media_ibfk_1` FOREIGN KEY (`media_type_id`) REFERENCES `media_type` (`id`),
  CONSTRAINT `media_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `media`
--

LOCK TABLES `media` WRITE;
/*!40000 ALTER TABLE `media` DISABLE KEYS */;
INSERT INTO `media` VALUES (1,1,4,'photo.jpg',222222,'2021-10-18 16:44:35','2021-10-18 16:44:35'),(2,2,4,'photo.jpg',222222,'2021-10-18 16:44:35','2021-10-18 16:44:35'),(3,3,4,'photo.jpg',222222,'2021-10-18 16:44:35','2021-10-18 16:44:35'),(4,4,4,'photo.jpg',222222,'2021-10-18 16:44:35','2021-10-18 16:44:35'),(5,5,4,'photo.jpg',222222,'2021-10-18 16:44:35','2021-10-18 16:44:35'),(6,6,4,'photo.jpg',222222,'2021-10-18 16:44:35','2021-10-18 16:44:35'),(7,7,4,'photo.jpg',222222,'2021-10-18 16:44:35','2021-10-18 16:44:35'),(8,8,4,'photo.jpg',222222,'2021-10-18 16:44:35','2021-10-18 16:44:35'),(9,9,4,'photo.jpg',222222,'2021-10-18 16:44:35','2021-10-18 16:44:35'),(10,10,4,'photo.jpg',222222,'2021-10-18 16:44:35','2021-10-18 16:44:35'),(11,11,4,'photo.jpg',222222,'2021-10-18 16:44:35','2021-10-18 16:44:35'),(12,1,1,'trailer.jpg',222222,'2021-10-18 16:44:35','2021-10-18 16:44:35'),(13,2,1,'trailer.jpg',222222,'2021-10-18 16:44:35','2021-10-18 16:44:35'),(14,3,1,'trailer.jpg',222222,'2021-10-18 16:44:35','2021-10-18 16:44:35'),(15,4,1,'trailer.jpg',222222,'2021-10-18 16:44:35','2021-10-18 16:44:35'),(16,5,1,'trailer.jpg',222222,'2021-10-18 16:44:35','2021-10-18 16:44:35'),(17,6,1,'trailer.jpg',222222,'2021-10-18 16:44:35','2021-10-18 16:44:35'),(18,7,1,'trailer.jpg',222222,'2021-10-18 16:44:35','2021-10-18 16:44:35'),(19,8,1,'trailer.jpg',222222,'2021-10-18 16:44:35','2021-10-18 16:44:35'),(20,9,1,'trailer.jpg',222222,'2021-10-18 16:44:35','2021-10-18 16:44:35'),(21,10,1,'trailer.jpg',222222,'2021-10-18 16:44:35','2021-10-18 16:44:35');
/*!40000 ALTER TABLE `media` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `media_type`
--

DROP TABLE IF EXISTS `media_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `media_type` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  UNIQUE KEY `id` (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `media_type`
--

LOCK TABLES `media_type` WRITE;
/*!40000 ALTER TABLE `media_type` DISABLE KEYS */;
INSERT INTO `media_type` VALUES (6,'Архив'),(3,'Аудио'),(1,'Видео'),(2,'Документ'),(4,'Изображение'),(5,'Таблица');
/*!40000 ALTER TABLE `media_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `movie_info`
--

DROP TABLE IF EXISTS `movie_info`;
/*!50001 DROP VIEW IF EXISTS `movie_info`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `movie_info` AS SELECT 
 1 AS `name`,
 1 AS `genre`,
 1 AS `year`,
 1 AS `average_rating`,
 1 AS `count_of_reviews`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `movie_ratings`
--

DROP TABLE IF EXISTS `movie_ratings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `movie_ratings` (
  `user_id` bigint unsigned NOT NULL,
  `movie_id` bigint unsigned NOT NULL,
  `rate` enum('1','2','3','4','5','6','7','8','9','10') NOT NULL DEFAULT '1' COMMENT 'Лучше реализовть программно ограничение либо триггер',
  PRIMARY KEY (`user_id`,`movie_id`),
  KEY `movie_id` (`movie_id`),
  CONSTRAINT `movie_ratings_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `movie_ratings_ibfk_2` FOREIGN KEY (`movie_id`) REFERENCES `movies` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movie_ratings`
--

LOCK TABLES `movie_ratings` WRITE;
/*!40000 ALTER TABLE `movie_ratings` DISABLE KEYS */;
INSERT INTO `movie_ratings` VALUES (1,1,'10'),(1,2,'10'),(1,3,'2'),(1,4,'8'),(1,5,'8'),(1,6,'8'),(1,7,'5'),(1,8,'4'),(1,9,'3'),(1,10,'4'),(2,1,'6'),(2,2,'4'),(2,3,'7'),(2,4,'3'),(2,5,'9'),(2,6,'5'),(2,7,'9'),(2,8,'2'),(2,9,'8'),(2,10,'6'),(3,1,'9'),(3,2,'3'),(3,3,'6'),(3,4,'1'),(3,5,'7'),(3,6,'10'),(3,7,'4'),(3,8,'3'),(3,9,'6'),(3,10,'4'),(4,1,'2'),(4,2,'1'),(4,3,'5'),(4,4,'1'),(4,5,'1'),(4,6,'10'),(4,7,'3'),(4,8,'8'),(4,9,'2'),(4,10,'1'),(5,1,'1'),(5,2,'6'),(5,3,'2'),(5,4,'5'),(5,5,'10'),(5,6,'7'),(5,7,'10'),(5,8,'9'),(5,9,'2'),(5,10,'5'),(6,1,'6'),(6,2,'3'),(6,3,'1'),(6,4,'2'),(6,5,'10'),(6,6,'4'),(6,7,'7'),(6,8,'3'),(6,9,'10'),(6,10,'4'),(7,1,'8'),(7,2,'8'),(7,3,'7'),(7,4,'1'),(7,5,'9'),(7,6,'8'),(7,7,'5'),(7,8,'9'),(7,9,'4'),(7,10,'9'),(8,1,'3'),(8,2,'8'),(8,3,'1'),(8,4,'6'),(8,5,'1'),(8,6,'7'),(8,7,'2'),(8,8,'10'),(8,9,'5'),(8,10,'8'),(9,1,'8'),(9,2,'5'),(9,3,'10'),(9,4,'7'),(9,5,'8'),(9,6,'7'),(9,7,'1'),(9,8,'4'),(9,9,'9'),(9,10,'6'),(10,1,'7'),(10,2,'2'),(10,3,'5'),(10,4,'1'),(10,5,'7'),(10,6,'1'),(10,7,'5'),(10,8,'1'),(10,9,'8'),(10,10,'2'),(11,1,'5'),(11,2,'10'),(11,3,'4'),(11,4,'1'),(11,5,'2'),(11,6,'1'),(11,7,'2'),(11,8,'8'),(11,9,'3'),(11,10,'9');
/*!40000 ALTER TABLE `movie_ratings` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `rating` AFTER INSERT ON `movie_ratings` FOR EACH ROW BEGIN
    UPDATE movies SET avg_rating = (SELECT AVG(rate) FROM movie_ratings WHERE movie_id =  NEW.movie_id) WHERE id = new.movie_id;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `movie_types`
--

DROP TABLE IF EXISTS `movie_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `movie_types` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  UNIQUE KEY `id` (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movie_types`
--

LOCK TABLES `movie_types` WRITE;
/*!40000 ALTER TABLE `movie_types` DISABLE KEYS */;
INSERT INTO `movie_types` VALUES (2,'Документальное кино'),(3,'Мультфильм'),(5,'Мьюзикл'),(6,'Научно-популярное кино'),(7,'Образовательный фильм'),(4,'Фильм-спектакль'),(1,'Художественное кино');
/*!40000 ALTER TABLE `movie_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `movies`
--

DROP TABLE IF EXISTS `movies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `movies` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL COMMENT 'Название фильма',
  `genre_id` tinyint unsigned NOT NULL,
  `year` year DEFAULT NULL,
  `country` varchar(255) DEFAULT NULL,
  `movie_type_id` bigint unsigned NOT NULL,
  `description` text,
  `avg_rating` tinyint unsigned NOT NULL DEFAULT '0' COMMENT 'Средняя оцека (триггер) с ограничением 1-10',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `movie_type_id` (`movie_type_id`),
  KEY `genre_id` (`genre_id`),
  KEY `idx_movie` (`name`),
  CONSTRAINT `movies_ibfk_1` FOREIGN KEY (`movie_type_id`) REFERENCES `movie_types` (`id`),
  CONSTRAINT `movies_ibfk_2` FOREIGN KEY (`genre_id`) REFERENCES `genres` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movies`
--

LOCK TABLES `movies` WRITE;
/*!40000 ALTER TABLE `movies` DISABLE KEYS */;
INSERT INTO `movies` VALUES (1,'В бой идут одни старики',27,1970,'СССР',4,'description',6),(2,'Пятница',1,1946,'USA',7,'description',5),(3,'После дождечка в четверг',20,1920,'Great Britain',1,'description',5),(4,'Большая туса',4,1908,'Russia',2,'description',3),(5,'Корупционер',24,1902,'Australia',1,'description',7),(6,'Мажор',8,2011,'Ukraine',7,'description',6),(7,'Жили-были',26,1924,'Ussr',6,'description',5),(8,'Параход',9,2019,'Russia',1,'description',6),(9,'Любовь и голуби',17,1939,'СССР',2,'description',5),(10,'Темнота',27,1975,'Russia',5,'description',5);
/*!40000 ALTER TABLE `movies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `movies_actors`
--

DROP TABLE IF EXISTS `movies_actors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `movies_actors` (
  `movies_id` bigint unsigned NOT NULL,
  `actor_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`movies_id`,`actor_id`),
  KEY `actor_id` (`actor_id`),
  CONSTRAINT `movies_actors_ibfk_1` FOREIGN KEY (`movies_id`) REFERENCES `movies` (`id`),
  CONSTRAINT `movies_actors_ibfk_2` FOREIGN KEY (`actor_id`) REFERENCES `actors` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movies_actors`
--

LOCK TABLES `movies_actors` WRITE;
/*!40000 ALTER TABLE `movies_actors` DISABLE KEYS */;
/*!40000 ALTER TABLE `movies_actors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `movies_creator`
--

DROP TABLE IF EXISTS `movies_creator`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `movies_creator` (
  `movies_id` bigint unsigned NOT NULL,
  `creator_id` bigint unsigned NOT NULL,
  `creator_type_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`movies_id`,`creator_id`,`creator_type_id`),
  KEY `creator_id` (`creator_id`),
  KEY `creator_type_id` (`creator_type_id`),
  CONSTRAINT `movies_creator_ibfk_1` FOREIGN KEY (`movies_id`) REFERENCES `movies` (`id`),
  CONSTRAINT `movies_creator_ibfk_2` FOREIGN KEY (`creator_id`) REFERENCES `creators` (`id`),
  CONSTRAINT `movies_creator_ibfk_3` FOREIGN KEY (`creator_type_id`) REFERENCES `creators` (`creator_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movies_creator`
--

LOCK TABLES `movies_creator` WRITE;
/*!40000 ALTER TABLE `movies_creator` DISABLE KEYS */;
/*!40000 ALTER TABLE `movies_creator` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `profiles`
--

DROP TABLE IF EXISTS `profiles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `profiles` (
  `user_id` bigint unsigned NOT NULL,
  `gender` enum('f','m') NOT NULL,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `birthday_at` date DEFAULT NULL,
  `hometown` varchar(255) DEFAULT NULL,
  `photo_id` bigint unsigned DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  UNIQUE KEY `user_id` (`user_id`),
  KEY `idx_first_name_last_name` (`first_name`,`last_name`),
  KEY `photo_id` (`photo_id`),
  CONSTRAINT `profiles_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `profiles_ibfk_2` FOREIGN KEY (`photo_id`) REFERENCES `media` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `profiles`
--

LOCK TABLES `profiles` WRITE;
/*!40000 ALTER TABLE `profiles` DISABLE KEYS */;
INSERT INTO `profiles` VALUES (1,'m','Andrey','Petrov','1970-01-22','Sverdlovsk',1,'2021-10-18 16:44:35'),(2,'m','Sergey','Sidorov','1965-10-20','Moscow',2,'2021-10-18 16:44:35'),(3,'m','Valery','Epifanv','1974-10-20','Kaluga',3,'2021-10-18 16:44:35'),(4,'m','Nickolay','Romanov','1973-12-04','Saint-Petersburg',4,'2021-10-18 16:44:35'),(5,'m','Ivan','Galcev','0000-00-00','Murmansk',5,'2021-10-18 16:44:35'),(6,'f','Tatyana','Rumyanzeva','0000-00-00','Vsevolojsk',6,'2021-10-18 16:44:35'),(7,'m','Zahar','Lipkin','0000-00-00','Kirshi',7,'2021-10-18 16:44:35'),(8,'f','Ludmila','Trubnikov','0000-00-00','Tomsk',8,'2021-10-18 16:44:35'),(9,'m','Evgenia','Zaharova','0000-00-00','Omsk',9,'2021-10-18 16:44:35'),(10,'m','Marat','Tulkin','0000-00-00','Habarovsk',10,'2021-10-18 16:44:35'),(11,'m','Timofey','Pukalo','0000-00-00','Novosibisk',11,'2021-10-18 16:44:35');
/*!40000 ALTER TABLE `profiles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reviews`
--

DROP TABLE IF EXISTS `reviews`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reviews` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `movie_id` bigint unsigned NOT NULL,
  `body` text NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `count_likes` bigint unsigned NOT NULL DEFAULT '0' COMMENT 'Количество лайков (триггер)',
  PRIMARY KEY (`user_id`,`movie_id`),
  UNIQUE KEY `id` (`id`),
  KEY `movie_id` (`movie_id`),
  CONSTRAINT `reviews_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `reviews_ibfk_2` FOREIGN KEY (`movie_id`) REFERENCES `movies` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1001 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reviews`
--

LOCK TABLES `reviews` WRITE;
/*!40000 ALTER TABLE `reviews` DISABLE KEYS */;
INSERT INTO `reviews` VALUES (41,1,1,'body','2021-10-18 16:44:35','2021-10-18 16:44:37',4),(260,1,2,'body','2021-10-18 16:44:35','2021-10-18 16:44:35',0),(94,1,3,'body','2021-10-18 16:44:35','2021-10-18 16:44:37',4),(179,1,4,'body','2021-10-18 16:44:35','2021-10-18 16:44:35',0),(127,1,5,'body','2021-10-18 16:44:35','2021-10-18 16:44:35',0),(215,1,6,'body','2021-10-18 16:44:35','2021-10-18 16:44:35',0),(93,1,7,'body','2021-10-18 16:44:35','2021-10-18 16:44:37',6),(108,1,8,'body','2021-10-18 16:44:35','2021-10-18 16:44:37',5),(151,1,9,'body','2021-10-18 16:44:35','2021-10-18 16:44:35',0),(20,1,10,'body','2021-10-18 16:44:35','2021-10-18 16:44:37',8),(25,2,1,'body','2021-10-18 16:44:35','2021-10-18 16:44:37',6),(130,2,2,'body','2021-10-18 16:44:35','2021-10-18 16:44:35',0),(62,2,3,'body','2021-10-18 16:44:35','2021-10-18 16:44:37',7),(46,2,4,'body','2021-10-18 16:44:35','2021-10-18 16:44:37',8),(29,2,5,'body','2021-10-18 16:44:35','2021-10-18 16:44:37',5),(166,2,6,'body','2021-10-18 16:44:35','2021-10-18 16:44:35',0),(27,2,7,'body','2021-10-18 16:44:35','2021-10-18 16:44:37',7),(51,2,8,'body','2021-10-18 16:44:35','2021-10-18 16:44:37',7),(47,2,9,'body','2021-10-18 16:44:35','2021-10-18 16:44:37',4),(101,2,10,'body','2021-10-18 16:44:35','2021-10-18 16:44:37',6),(12,3,1,'body','2021-10-18 16:44:35','2021-10-18 16:44:37',8),(156,3,2,'body','2021-10-18 16:44:35','2021-10-18 16:44:35',0),(299,3,3,'body','2021-10-18 16:44:35','2021-10-18 16:44:35',0),(139,3,4,'body','2021-10-18 16:44:35','2021-10-18 16:44:35',0),(152,3,5,'body','2021-10-18 16:44:35','2021-10-18 16:44:35',0),(167,3,6,'body','2021-10-18 16:44:35','2021-10-18 16:44:35',0),(80,3,7,'body','2021-10-18 16:44:35','2021-10-18 16:44:37',6),(40,3,8,'body','2021-10-18 16:44:35','2021-10-18 16:44:37',8),(71,3,9,'body','2021-10-18 16:44:35','2021-10-18 16:44:37',6),(52,3,10,'body','2021-10-18 16:44:35','2021-10-18 16:44:37',4),(72,4,1,'body','2021-10-18 16:44:35','2021-10-18 16:44:37',6),(5,4,2,'body','2021-10-18 16:44:35','2021-10-18 16:44:37',6),(335,4,3,'body','2021-10-18 16:44:35','2021-10-18 16:44:35',0),(290,4,4,'body','2021-10-18 16:44:35','2021-10-18 16:44:35',0),(104,4,5,'body','2021-10-18 16:44:35','2021-10-18 16:44:37',5),(857,4,6,'body','2021-10-18 16:44:35','2021-10-18 16:44:35',0),(249,4,7,'body','2021-10-18 16:44:35','2021-10-18 16:44:35',0),(98,4,8,'body','2021-10-18 16:44:35','2021-10-18 16:44:37',8),(24,4,9,'body','2021-10-18 16:44:35','2021-10-18 16:44:37',6),(85,4,10,'body','2021-10-18 16:44:35','2021-10-18 16:44:37',6),(106,5,1,'body','2021-10-18 16:44:35','2021-10-18 16:44:37',4),(14,5,2,'body','2021-10-18 16:44:35','2021-10-18 16:44:37',5),(384,5,3,'body','2021-10-18 16:44:35','2021-10-18 16:44:35',0),(35,5,4,'body','2021-10-18 16:44:35','2021-10-18 16:44:37',5),(8,5,5,'body','2021-10-18 16:44:35','2021-10-18 16:44:37',5),(118,5,6,'body','2021-10-18 16:44:35','2021-10-18 16:44:35',0),(16,5,7,'body','2021-10-18 16:44:35','2021-10-18 16:44:37',6),(65,5,8,'body','2021-10-18 16:44:35','2021-10-18 16:44:37',5),(22,5,9,'body','2021-10-18 16:44:35','2021-10-18 16:44:37',4),(96,5,10,'body','2021-10-18 16:44:35','2021-10-18 16:44:37',8),(32,6,1,'body','2021-10-18 16:44:35','2021-10-18 16:44:37',4),(75,6,2,'body','2021-10-18 16:44:35','2021-10-18 16:44:37',6),(73,6,3,'body','2021-10-18 16:44:35','2021-10-18 16:44:37',8),(147,6,4,'body','2021-10-18 16:44:35','2021-10-18 16:44:35',0),(1,6,5,'body','2021-10-18 16:44:35','2021-10-18 16:44:36',5),(184,6,6,'body','2021-10-18 16:44:35','2021-10-18 16:44:35',0),(81,6,7,'body','2021-10-18 16:44:35','2021-10-18 16:44:37',6),(486,6,8,'body','2021-10-18 16:44:35','2021-10-18 16:44:35',0),(58,6,9,'body','2021-10-18 16:44:35','2021-10-18 16:44:37',7),(253,6,10,'body','2021-10-18 16:44:35','2021-10-18 16:44:35',0),(208,7,1,'body','2021-10-18 16:44:35','2021-10-18 16:44:35',0),(216,7,2,'body','2021-10-18 16:44:35','2021-10-18 16:44:35',0),(143,7,3,'body','2021-10-18 16:44:35','2021-10-18 16:44:35',0),(86,7,4,'body','2021-10-18 16:44:35','2021-10-18 16:44:37',6),(74,7,5,'body','2021-10-18 16:44:35','2021-10-18 16:44:37',5),(126,7,6,'body','2021-10-18 16:44:35','2021-10-18 16:44:35',0),(13,7,7,'body','2021-10-18 16:44:35','2021-10-18 16:44:37',6),(49,7,8,'body','2021-10-18 16:44:35','2021-10-18 16:44:37',9),(36,7,9,'body','2021-10-18 16:44:35','2021-10-18 16:44:37',7),(102,7,10,'body','2021-10-18 16:44:35','2021-10-18 16:44:37',9),(11,8,1,'body','2021-10-18 16:44:35','2021-10-18 16:44:37',3),(10,8,2,'body','2021-10-18 16:44:35','2021-10-18 16:44:37',6),(136,8,3,'body','2021-10-18 16:44:35','2021-10-18 16:44:35',0),(9,8,4,'body','2021-10-18 16:44:35','2021-10-18 16:44:37',4),(158,8,5,'body','2021-10-18 16:44:35','2021-10-18 16:44:35',0),(31,8,6,'body','2021-10-18 16:44:35','2021-10-18 16:44:37',7),(116,8,7,'body','2021-10-18 16:44:35','2021-10-18 16:44:35',0),(3,8,8,'body','2021-10-18 16:44:35','2021-10-18 16:44:37',4),(59,8,9,'body','2021-10-18 16:44:35','2021-10-18 16:44:37',6),(57,8,10,'body','2021-10-18 16:44:35','2021-10-18 16:44:37',8),(172,9,1,'body','2021-10-18 16:44:35','2021-10-18 16:44:35',0),(15,9,2,'body','2021-10-18 16:44:35','2021-10-18 16:44:37',8),(6,9,3,'body','2021-10-18 16:44:35','2021-10-18 16:44:37',7),(23,9,4,'body','2021-10-18 16:44:35','2021-10-18 16:44:37',7),(19,9,5,'body','2021-10-18 16:44:35','2021-10-18 16:44:37',8),(4,9,6,'body','2021-10-18 16:44:35','2021-10-18 16:44:37',7),(54,9,7,'body','2021-10-18 16:44:35','2021-10-18 16:44:37',6),(82,9,8,'body','2021-10-18 16:44:35','2021-10-18 16:44:37',7),(67,9,9,'body','2021-10-18 16:44:35','2021-10-18 16:44:37',5),(138,9,10,'body','2021-10-18 16:44:35','2021-10-18 16:44:35',0),(69,10,1,'body','2021-10-18 16:44:35','2021-10-18 16:44:37',5),(28,10,2,'body','2021-10-18 16:44:35','2021-10-18 16:44:37',3),(142,10,3,'body','2021-10-18 16:44:35','2021-10-18 16:44:35',0),(26,10,4,'body','2021-10-18 16:44:35','2021-10-18 16:44:37',5),(271,10,5,'body','2021-10-18 16:44:35','2021-10-18 16:44:35',0),(7,10,6,'body','2021-10-18 16:44:35','2021-10-18 16:44:37',8),(141,10,7,'body','2021-10-18 16:44:35','2021-10-18 16:44:35',0),(79,10,8,'body','2021-10-18 16:44:35','2021-10-18 16:44:37',3),(2,10,9,'body','2021-10-18 16:44:35','2021-10-18 16:44:37',10),(168,10,10,'body','2021-10-18 16:44:35','2021-10-18 16:44:35',0),(17,11,1,'body','2021-10-18 16:44:35','2021-10-18 16:44:37',8),(68,11,2,'body','2021-10-18 16:44:35','2021-10-18 16:44:37',6),(225,11,3,'body','2021-10-18 16:44:35','2021-10-18 16:44:35',0),(30,11,4,'body','2021-10-18 16:44:35','2021-10-18 16:44:37',6),(173,11,5,'body','2021-10-18 16:44:35','2021-10-18 16:44:35',0),(120,11,6,'body','2021-10-18 16:44:35','2021-10-18 16:44:35',0),(264,11,7,'body','2021-10-18 16:44:35','2021-10-18 16:44:35',0),(278,11,8,'body','2021-10-18 16:44:35','2021-10-18 16:44:35',0),(42,11,9,'body','2021-10-18 16:44:35','2021-10-18 16:44:37',7),(63,11,10,'body','2021-10-18 16:44:35','2021-10-18 16:44:37',4);
/*!40000 ALTER TABLE `reviews` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reviews_likes`
--

DROP TABLE IF EXISTS `reviews_likes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reviews_likes` (
  `user_id` bigint unsigned NOT NULL,
  `review_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`user_id`,`review_id`),
  KEY `review_id` (`review_id`),
  CONSTRAINT `reviews_likes_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `reviews_likes_ibfk_2` FOREIGN KEY (`review_id`) REFERENCES `reviews` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reviews_likes`
--

LOCK TABLES `reviews_likes` WRITE;
/*!40000 ALTER TABLE `reviews_likes` DISABLE KEYS */;
INSERT INTO `reviews_likes` VALUES (3,1),(6,1),(9,1),(10,1),(11,1),(2,2),(3,2),(4,2),(5,2),(6,2),(7,2),(8,2),(9,2),(10,2),(11,2),(2,3),(4,3),(7,3),(10,3),(2,4),(4,4),(6,4),(7,4),(9,4),(10,4),(11,4),(1,5),(2,5),(5,5),(6,5),(7,5),(8,5),(1,6),(2,6),(3,6),(4,6),(5,6),(7,6),(8,6),(1,7),(2,7),(4,7),(5,7),(6,7),(7,7),(8,7),(11,7),(2,8),(4,8),(6,8),(8,8),(11,8),(2,9),(4,9),(6,9),(11,9),(1,10),(3,10),(5,10),(7,10),(8,10),(10,10),(1,11),(8,11),(11,11),(1,12),(2,12),(3,12),(5,12),(6,12),(8,12),(9,12),(11,12),(1,13),(4,13),(5,13),(6,13),(7,13),(8,13),(2,14),(4,14),(5,14),(6,14),(7,14),(1,15),(2,15),(3,15),(6,15),(7,15),(9,15),(10,15),(11,15),(2,16),(4,16),(5,16),(6,16),(7,16),(9,16),(1,17),(3,17),(4,17),(7,17),(8,17),(9,17),(10,17),(11,17),(2,19),(3,19),(4,19),(5,19),(6,19),(7,19),(9,19),(11,19),(1,20),(2,20),(3,20),(4,20),(5,20),(7,20),(9,20),(11,20),(2,22),(7,22),(8,22),(11,22),(2,23),(3,23),(4,23),(5,23),(7,23),(10,23),(11,23),(3,24),(4,24),(5,24),(7,24),(8,24),(10,24),(1,25),(2,25),(6,25),(7,25),(8,25),(10,25),(2,26),(3,26),(5,26),(7,26),(8,26),(1,27),(2,27),(4,27),(6,27),(7,27),(10,27),(11,27),(4,28),(5,28),(9,28),(2,29),(3,29),(4,29),(6,29),(10,29),(3,30),(4,30),(5,30),(7,30),(8,30),(11,30),(1,31),(3,31),(4,31),(5,31),(6,31),(8,31),(10,31),(2,32),(7,32),(9,32),(11,32),(2,35),(5,35),(6,35),(9,35),(11,35),(2,36),(4,36),(5,36),(6,36),(7,36),(8,36),(10,36),(1,40),(2,40),(4,40),(5,40),(6,40),(8,40),(9,40),(11,40),(1,41),(5,41),(7,41),(8,41),(1,42),(2,42),(4,42),(6,42),(7,42),(8,42),(11,42),(2,46),(4,46),(5,46),(7,46),(8,46),(9,46),(10,46),(11,46),(2,47),(4,47),(5,47),(7,47),(2,49),(3,49),(4,49),(5,49),(6,49),(7,49),(9,49),(10,49),(11,49),(1,51),(2,51),(6,51),(7,51),(8,51),(10,51),(11,51),(1,52),(3,52),(5,52),(8,52),(2,54),(4,54),(6,54),(7,54),(8,54),(11,54),(1,57),(2,57),(4,57),(5,57),(6,57),(8,57),(10,57),(11,57),(2,58),(3,58),(4,58),(5,58),(7,58),(9,58),(10,58),(2,59),(3,59),(5,59),(7,59),(9,59),(10,59),(1,62),(2,62),(3,62),(4,62),(8,62),(9,62),(11,62),(1,63),(4,63),(7,63),(11,63),(1,65),(2,65),(4,65),(6,65),(10,65),(1,67),(2,67),(4,67),(6,67),(10,67),(1,68),(2,68),(3,68),(5,68),(6,68),(10,68),(1,69),(4,69),(6,69),(7,69),(8,69),(1,71),(2,71),(6,71),(8,71),(10,71),(11,71),(1,72),(3,72),(4,72),(5,72),(6,72),(10,72),(1,73),(2,73),(3,73),(5,73),(7,73),(8,73),(9,73),(10,73),(2,74),(5,74),(6,74),(7,74),(9,74),(1,75),(2,75),(4,75),(5,75),(7,75),(10,75),(4,79),(5,79),(6,79),(2,80),(3,80),(6,80),(7,80),(9,80),(11,80),(1,81),(2,81),(4,81),(5,81),(9,81),(11,81),(1,82),(3,82),(4,82),(7,82),(9,82),(10,82),(11,82),(1,85),(3,85),(5,85),(7,85),(8,85),(9,85),(1,86),(3,86),(4,86),(7,86),(9,86),(11,86),(1,93),(2,93),(7,93),(8,93),(10,93),(11,93),(5,94),(7,94),(8,94),(10,94),(1,96),(2,96),(3,96),(4,96),(6,96),(7,96),(9,96),(11,96),(1,98),(2,98),(4,98),(5,98),(6,98),(7,98),(8,98),(9,98),(3,101),(4,101),(5,101),(8,101),(10,101),(11,101),(1,102),(2,102),(3,102),(4,102),(5,102),(7,102),(8,102),(9,102),(11,102),(1,104),(3,104),(4,104),(5,104),(9,104),(3,106),(4,106),(6,106),(11,106),(2,108),(5,108),(6,108),(8,108),(10,108);
/*!40000 ALTER TABLE `reviews_likes` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `count_likes` AFTER INSERT ON `reviews_likes` FOR EACH ROW BEGIN
    UPDATE reviews
    SET count_likes = (SELECT COUNT(*) FROM reviews_likes WHERE review_id = new.review_id)
    WHERE id = new.review_id;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `trailers`
--

DROP TABLE IF EXISTS `trailers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `trailers` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `media_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `media_id` (`media_id`),
  CONSTRAINT `trailers_ibfk_1` FOREIGN KEY (`media_id`) REFERENCES `media` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trailers`
--

LOCK TABLES `trailers` WRITE;
/*!40000 ALTER TABLE `trailers` DISABLE KEYS */;
INSERT INTO `trailers` VALUES (1,'Трейлер к фильму',12),(2,'Трейлер к фильму',13),(3,'Трейлер к фильму',14),(4,'Трейлер к фильму',15),(5,'Трейлер к фильму',16),(6,'Трейлер к фильму',17),(7,'Трейлер к фильму',18),(8,'Трейлер к фильму',19),(9,'Трейлер к фильму',20),(10,'Трейлер к фильму',21);
/*!40000 ALTER TABLE `trailers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `trailers_movies`
--

DROP TABLE IF EXISTS `trailers_movies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `trailers_movies` (
  `movie_id` bigint unsigned NOT NULL,
  `trailer_id` bigint unsigned NOT NULL,
  KEY `movie_id` (`movie_id`),
  KEY `trailer_id` (`trailer_id`),
  CONSTRAINT `trailers_movies_ibfk_1` FOREIGN KEY (`movie_id`) REFERENCES `movies` (`id`),
  CONSTRAINT `trailers_movies_ibfk_2` FOREIGN KEY (`trailer_id`) REFERENCES `trailers` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trailers_movies`
--

LOCK TABLES `trailers_movies` WRITE;
/*!40000 ALTER TABLE `trailers_movies` DISABLE KEYS */;
INSERT INTO `trailers_movies` VALUES (1,1),(2,2),(3,3),(4,4),(5,5),(6,6),(7,7),(8,8),(9,9),(10,10);
/*!40000 ALTER TABLE `trailers_movies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `login` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone` bigint unsigned NOT NULL,
  `passwd_hash` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  UNIQUE KEY `login` (`login`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `phone` (`phone`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'log1','mail@mail.ru',74997875696,'8743b52063cd84097a6fhf33f5c74f5'),(2,'denim','denim@mail.ru',74995105696,'8743b52063cd84097a6td1633f5c74f5'),(3,'sunrise','sunrise@mail.ru',74497105696,'8743b52063cd8fff7a65d1633f5c74f5'),(4,'superman','superman@mail.ru',74997105696,'8743b52063cdhj097a65d1633f5c74f5'),(5,'tiesto','tiesto@mail.ru',74911105696,'8743b52063cd84097y65d1633f5c74f5'),(6,'jordan','jordan@mail.ru',74922105696,'8743b52063cd8409ll65d1633f5c74f5'),(7,'noname','noname@mail.ru',74933105696,'8743b52063cd840dcv65d1633f5c74f5'),(8,'clipper','clipper@mail.ru',75545105696,'8743b52063cd84ew7a65d1633f5c74f5'),(9,'robot_vector','robot_vector@mail.ru',74997665696,'8743dfg2063cd84097a65d1633f5c74f5'),(10,'transformer','transformer@mail.ru',74997107796,'8743b525r3cd84097a65d1633f5c74f5'),(11,'tiguan','tiguan@mail.ru',74977735696,'8743b52063cd8409567u5d1633f5c74f5');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `users_info`
--

DROP TABLE IF EXISTS `users_info`;
/*!50001 DROP VIEW IF EXISTS `users_info`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `users_info` AS SELECT 
 1 AS `name`,
 1 AS `age`,
 1 AS `hometown`,
 1 AS `email`,
 1 AS `count_of_revies`,
 1 AS `likes_activities`,
 1 AS `rate_activities`*/;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `movie_info`
--

/*!50001 DROP VIEW IF EXISTS `movie_info`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `movie_info` AS select `m`.`name` AS `name`,`g`.`genre` AS `genre`,`m`.`year` AS `year`,`m`.`avg_rating` AS `average_rating`,(select count(0) from `reviews` `r` where (`r`.`movie_id` = `m`.`id`)) AS `count_of_reviews` from (`movies` `m` join `genres` `g` on((`g`.`id` = `m`.`genre_id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `users_info`
--

/*!50001 DROP VIEW IF EXISTS `users_info`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `users_info` AS select concat(`p`.`first_name`,' ',`p`.`last_name`) AS `name`,timestampdiff(YEAR,`p`.`birthday_at`,curdate()) AS `age`,`p`.`hometown` AS `hometown`,`u`.`email` AS `email`,(select count(0) from `reviews` `r` where (`r`.`user_id` = `p`.`user_id`)) AS `count_of_revies`,(select count(0) from `reviews_likes` `rl` where (`rl`.`user_id` = `p`.`user_id`)) AS `likes_activities`,(select count(0) from `movie_ratings` `mr` where (`mr`.`user_id` = `p`.`user_id`)) AS `rate_activities` from (`profiles` `p` join `users` `u` on((`p`.`user_id` = `u`.`id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-10-20 19:29:06
