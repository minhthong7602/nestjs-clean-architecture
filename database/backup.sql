-- MySQL dump 10.13  Distrib 8.0.16, for Win64 (x86_64)
--
-- Host: localhost    Database: bruceleeblog
-- ------------------------------------------------------
-- Server version	8.0.16

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8mb4 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `blog_category_mapping`
--

DROP TABLE IF EXISTS `blog_category_mapping`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `blog_category_mapping` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `blog_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_blog_category` (`blog_id`,`category_id`),
  KEY `category_id` (`category_id`),
  CONSTRAINT `blog_category_mapping_ibfk_1` FOREIGN KEY (`blog_id`) REFERENCES `blogs` (`id`),
  CONSTRAINT `blog_category_mapping_ibfk_2` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blog_category_mapping`
--

LOCK TABLES `blog_category_mapping` WRITE;
/*!40000 ALTER TABLE `blog_category_mapping` DISABLE KEYS */;
INSERT INTO `blog_category_mapping` VALUES (3,1,1),(5,5,1);
/*!40000 ALTER TABLE `blog_category_mapping` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blog_comment`
--

DROP TABLE IF EXISTS `blog_comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `blog_comment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created_at` datetime DEFAULT (now()),
  `updated_at` datetime DEFAULT (now()),
  `content` text,
  `username` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ip` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `token` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `blog_id` int(11) DEFAULT NULL,
  `status` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `blog_id` (`blog_id`),
  CONSTRAINT `blog_comment_ibfk_1` FOREIGN KEY (`blog_id`) REFERENCES `blogs` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blog_comment`
--

LOCK TABLES `blog_comment` WRITE;
/*!40000 ALTER TABLE `blog_comment` DISABLE KEYS */;
/*!40000 ALTER TABLE `blog_comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blog_like`
--

DROP TABLE IF EXISTS `blog_like`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `blog_like` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created_at` datetime DEFAULT (now()),
  `updated_at` datetime DEFAULT (now()),
  `ip` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `token` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `blog_id` int(11) DEFAULT NULL,
  `status` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `blog_id` (`blog_id`),
  CONSTRAINT `blog_like_ibfk_1` FOREIGN KEY (`blog_id`) REFERENCES `blogs` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blog_like`
--

LOCK TABLES `blog_like` WRITE;
/*!40000 ALTER TABLE `blog_like` DISABLE KEYS */;
/*!40000 ALTER TABLE `blog_like` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blog_tag_mapping`
--

DROP TABLE IF EXISTS `blog_tag_mapping`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `blog_tag_mapping` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `blog_id` int(11) NOT NULL,
  `tag_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_blog_tag` (`blog_id`,`tag_id`),
  KEY `tag_id` (`tag_id`),
  CONSTRAINT `blog_tag_mapping_ibfk_1` FOREIGN KEY (`blog_id`) REFERENCES `blogs` (`id`),
  CONSTRAINT `blog_tag_mapping_ibfk_2` FOREIGN KEY (`tag_id`) REFERENCES `tags` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blog_tag_mapping`
--

LOCK TABLES `blog_tag_mapping` WRITE;
/*!40000 ALTER TABLE `blog_tag_mapping` DISABLE KEYS */;
INSERT INTO `blog_tag_mapping` VALUES (1,1,1),(3,1,2),(7,5,1),(8,5,2);
/*!40000 ALTER TABLE `blog_tag_mapping` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blog_view`
--

DROP TABLE IF EXISTS `blog_view`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `blog_view` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created_at` datetime DEFAULT (now()),
  `updated_at` datetime DEFAULT (now()),
  `ip` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `token` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `blog_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `blog_id` (`blog_id`),
  CONSTRAINT `blog_view_ibfk_1` FOREIGN KEY (`blog_id`) REFERENCES `blogs` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blog_view`
--

LOCK TABLES `blog_view` WRITE;
/*!40000 ALTER TABLE `blog_view` DISABLE KEYS */;
/*!40000 ALTER TABLE `blog_view` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blogs`
--

DROP TABLE IF EXISTS `blogs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `blogs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created_at` datetime DEFAULT (now()),
  `updated_at` datetime DEFAULT (now()),
  `title` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `sub_title` varchar(3000) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `content` text,
  `images` text,
  `status` tinyint(4) DEFAULT (0),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blogs`
--

LOCK TABLES `blogs` WRITE;
/*!40000 ALTER TABLE `blogs` DISABLE KEYS */;
INSERT INTO `blogs` VALUES (1,'2020-08-29 12:01:22','2020-08-29 12:01:22','dotnet core','dot net core',NULL,NULL,1),(2,'2020-08-29 13:59:10','2020-08-29 13:59:10','Angular 9','Angular 9','Angular 9',NULL,1),(3,'2020-08-29 14:01:34','2020-08-29 14:01:34','Angular 9','Angular 9','Angular 9',NULL,1),(4,'2020-08-29 14:03:32','2020-08-29 14:03:32','Angular 9','Angular 9','Angular 9',NULL,1),(5,'2020-08-29 14:04:22','2020-08-29 14:04:22','Angular 9','Angular 9','Angular 9',NULL,1),(6,'2022-02-19 16:54:30','2022-02-20 11:34:57','Nest Js Minh Thong Update Event 123 111','Nest Js Minh Thong Update Event','Nest Js Minh Thong Update Event',NULL,1);
/*!40000 ALTER TABLE `blogs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created_at` datetime DEFAULT (now()),
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `description` text,
  `is_active` tinyint(1) DEFAULT (1),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (1,'2020-08-29 07:10:11','.Net Core','Develop by Microsoft',1),(2,'2020-08-29 07:10:33','Angular','Develop by Google',1),(3,'2020-08-29 07:10:57','Database','Develop by many companies',1),(4,'2020-08-30 15:01:36','Nest Js','Node Framework js',1);
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `event_log_access`
--

DROP TABLE IF EXISTS `event_log_access`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `event_log_access` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created_at` datetime DEFAULT (now()),
  `ip` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `api_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `api_method` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=420 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `event_log_access`
--

LOCK TABLES `event_log_access` WRITE;
/*!40000 ALTER TABLE `event_log_access` DISABLE KEYS */;
INSERT INTO `event_log_access` VALUES (1,'2020-08-23 16:42:50','::1','GET','GET'),(2,'2020-08-23 16:43:35','::1','/api/roles','GET'),(3,'2020-08-23 17:24:49','::1','/api/roles','GET'),(4,'2020-08-23 17:26:48','::1','/api/roles','GET'),(5,'2020-08-23 17:39:57','::1','/api/roles','GET'),(6,'2020-08-23 20:55:44','::1','/api/roles','GET'),(7,'2020-08-23 21:05:24','::1','/api/roles','GET'),(8,'2020-08-23 21:06:59','::1','/api/roles','GET'),(9,'2020-08-23 21:07:41','::1','/api/roles','GET'),(10,'2020-08-23 21:08:29','::1','/api/roles','GET'),(11,'2020-08-23 21:15:05','::1','/api/roles','GET'),(12,'2020-08-23 21:19:42','::1','/api/roles','GET'),(13,'2020-08-23 21:20:15','::1','/api/roles','GET'),(14,'2020-08-23 21:20:23','::1','/api/roles','GET'),(15,'2020-08-23 21:20:54','::1','/api/roles','GET'),(16,'2020-08-23 21:23:47','::1','/api/roles','GET'),(17,'2020-08-23 21:25:17','::1','/api/roles','GET'),(18,'2020-08-23 21:25:39','::1','/api/roles','GET'),(19,'2020-08-23 21:26:49','::1','/api/roles','GET'),(20,'2020-08-23 22:16:20','::1','/api/roles','GET'),(21,'2020-08-23 22:16:43','::1','/api/roles','GET'),(22,'2020-08-23 22:25:24','::1','/api/roles','GET'),(23,'2020-08-24 00:17:42','::1','/api/users/change-password','POST'),(24,'2020-08-24 22:29:21','::1','/api/users/login','POST'),(25,'2020-08-24 22:29:25','::1','/api/users/login','POST'),(26,'2020-08-24 22:30:30','::1','/api/users/login','POST'),(27,'2020-08-24 22:33:41','::1','/api/users/test-validate','GET'),(28,'2020-08-24 22:35:04','::1','/api/users/test-validate','GET'),(29,'2020-08-24 22:35:42','::1','/api/users/login','POST'),(30,'2020-08-24 22:35:53','::1','/api/users/test-validate','GET'),(31,'2020-08-24 22:51:53','::1','/api/users/test-validate','GET'),(32,'2020-08-24 22:52:34','::1','/api/users/test-validate','GET'),(33,'2020-08-24 22:52:55','::1','/api/users/test-validate','GET'),(34,'2020-08-24 22:53:11','::1','/api/users/test-validate','GET'),(35,'2020-08-24 23:08:40','::1','/api/users/test-validate','GET'),(36,'2020-08-24 23:09:02','::1','/api/users/test-validate','GET'),(37,'2020-08-24 23:09:08','::1','/api/users/test-validate','GET'),(38,'2020-08-24 23:10:17','::1','/api/users/test-validate','GET'),(39,'2020-08-24 23:12:13','::1','/api/users/test-validate','GET'),(40,'2020-08-24 23:12:37','::1','/api/users/test-validate','GET'),(41,'2020-08-24 23:12:53','::1','/api/users/test-validate','GET'),(42,'2020-08-24 23:17:12','::1','/api/users/test-validate','GET'),(43,'2020-08-24 23:17:53','::1','/api/users/test-validate','GET'),(44,'2020-08-24 23:19:08','::1','/api/users/test-validate','GET'),(45,'2020-08-24 23:19:14','::1','/api/users/test-validate','GET'),(46,'2020-08-24 23:19:20','::1','/api/users/test-validate','GET'),(47,'2020-08-24 23:20:08','::1','/api/users/test-validate','GET'),(48,'2020-08-24 23:20:52','::1','/api/users/test-validate','GET'),(49,'2020-08-24 23:21:00','::1','/api/users/test-validate','GET'),(50,'2020-08-24 23:21:56','::1','/api/users/login','POST'),(51,'2020-08-24 23:22:02','::1','/api/users/login','POST'),(52,'2020-08-24 23:32:14','::1','/api/users/test-validate','GET'),(53,'2020-08-24 23:32:33','::1','/api/users/test-validate','GET'),(54,'2020-08-24 23:32:42','::1','/api/users/test-validate','GET'),(55,'2020-08-24 23:33:11','::1','/api/users/test-validate','GET'),(56,'2020-08-25 22:19:08','::1','/api/users/login','POST'),(57,'2020-08-25 22:24:27','::1','/api/users/login','POST'),(58,'2020-08-25 22:29:21','::1','/api/users/login','POST'),(59,'2020-08-25 22:29:46','::1','/api/users/login','POST'),(60,'2020-08-25 22:30:02','::1','/api/users/login','POST'),(61,'2020-08-25 22:31:53','::1','/api/users/login','POST'),(62,'2020-08-25 22:32:02','::1','/api/users/login','POST'),(63,'2020-08-25 22:34:15','::1','/api/users/login','POST'),(64,'2020-08-25 22:35:44','::1','/api/users/login','POST'),(65,'2020-08-25 22:35:48','::1','/api/users/login','POST'),(66,'2020-08-25 22:39:22','::1','/api/users/login','POST'),(67,'2020-08-25 22:42:46','::1','/api/users/login','POST'),(68,'2020-08-26 00:16:53','::1','/api/tags','GET'),(69,'2020-08-26 00:17:54','::1','/api/tags','GET'),(70,'2020-08-26 00:18:05','::1','/api/tags','GET'),(71,'2020-08-26 00:21:02','::1','/api/tags','GET'),(72,'2020-08-26 00:38:37','::1','/api/tags','GET'),(73,'2020-08-26 00:40:15','::1','/api/tags','POST'),(74,'2020-08-26 00:40:32','::1','/api/users/login','POST'),(75,'2020-08-26 00:41:04','::1','/api/tags','POST'),(76,'2020-08-26 00:41:19','::1','/api/tags','POST'),(77,'2020-08-26 00:46:31','::1','/api/tags','POST'),(78,'2020-08-26 00:47:26','::1','/api/tags','POST'),(79,'2020-08-26 00:47:54','::1','/api/tags','POST'),(80,'2020-08-26 00:48:14','::1','/api/tags','POST'),(81,'2020-08-29 06:39:46','::1','/api/categories','GET'),(82,'2020-08-29 07:09:22','::1','/api/categories','POST'),(83,'2020-08-29 07:09:53','::1','/api/users/login','POST'),(84,'2020-08-29 07:10:11','::1','/api/categories','POST'),(85,'2020-08-29 07:10:33','::1','/api/categories','POST'),(86,'2020-08-29 07:10:57','::1','/api/categories','POST'),(87,'2020-08-29 11:53:14','::1','/api/blogs','GET'),(88,'2020-08-29 11:53:29','::1','/api/blogs','GET'),(89,'2020-08-29 11:53:36','::1','/api/blogs','GET'),(90,'2020-08-29 11:53:51','::1','/api/blogs','GET'),(91,'2020-08-29 11:54:48','::1','/api/blogs?page=1&page_size=10','GET'),(92,'2020-08-29 11:55:08','::1','/api/blogs?page=1&page_size=10','GET'),(93,'2020-08-29 11:55:43','::1','/api/blogs?page=1&page_size=10','GET'),(94,'2020-08-29 11:57:04','::1','/api/blogs?page=1&page_size=10','GET'),(95,'2020-08-29 11:59:36','::1','/api/blogs?page=1&page_size=10','GET'),(96,'2020-08-29 11:59:45','::1','/api/blogs?page=1&page_size=10','GET'),(97,'2020-08-29 12:00:24','::1','/api/blogs?page=1&page_size=10','GET'),(98,'2020-08-29 12:01:29','::1','/api/blogs?page=1&page_size=10','GET'),(99,'2020-08-29 12:02:10','::1','/api/blogs?page=1&page_size=10','GET'),(100,'2020-08-29 12:15:44','::1','/api/blogs?page=1&page_size=10','GET'),(101,'2020-08-29 12:22:26','::1','/api/blogs?page=1&page_size=10','GET'),(102,'2020-08-29 12:22:53','::1','/api/blogs?page=1&page_size=10','GET'),(103,'2020-08-29 12:23:47','::1','/api/blogs?page=1&page_size=10','GET'),(104,'2020-08-29 12:24:20','::1','/api/blogs?page=1&page_size=10','GET'),(105,'2020-08-29 12:25:10','::1','/api/blogs?page=1&page_size=10','GET'),(106,'2020-08-29 12:25:37','::1','/api/blogs?page=1&page_size=10','GET'),(107,'2020-08-29 12:26:01','::1','/api/blogs?page=1&page_size=10','GET'),(108,'2020-08-29 12:26:15','::ffff:127.0.0.1','/api/blogs?page=1&page_size=10','GET'),(109,'2020-08-29 12:36:28','::ffff:127.0.0.1','/api/blogs?page=1&page_size=10','GET'),(110,'2020-08-29 12:36:53','::ffff:127.0.0.1','/api/blogs?page=1&page_size=10','GET'),(111,'2020-08-29 12:37:01','::1','/api/blogs?page=1&page_size=10','GET'),(112,'2020-08-29 12:37:22','::1','/api/blogs?page=1&page_size=10','GET'),(113,'2020-08-29 12:39:03','::ffff:127.0.0.1','/api/blogs?page=1&page_size=10','GET'),(114,'2020-08-29 12:40:34','::1','/api/blogs?page=1&page_size=10','GET'),(115,'2020-08-29 12:42:43','::ffff:127.0.0.1','/api/blogs?page=1&page_size=10','GET'),(116,'2020-08-29 12:43:15','::1','/api/blogs?page=1&page_size=10','GET'),(117,'2020-08-29 12:43:31','::1','/api/blogs?page=1&page_size=10','GET'),(118,'2020-08-29 12:44:24','::1','/api/blogs?page=1&page_size=10','GET'),(119,'2020-08-29 12:44:49','::1','/api/blogs?page=1&page_size=10','GET'),(120,'2020-08-29 12:44:56','::1','/api/blogs?page=1&page_size=10','GET'),(121,'2020-08-29 12:45:59','::1','/api/blogs?page=1&page_size=10','GET'),(122,'2020-08-29 13:50:48','::1','/api/users/login','POST'),(123,'2020-08-29 13:55:01','::1','/api/blogs/create','POST'),(124,'2020-08-29 13:55:13','::1','/api/blogs/create','POST'),(125,'2020-08-29 13:56:17','::1','/api/blogs/create','POST'),(126,'2020-08-29 13:56:22','::1','/api/blogs/create','POST'),(127,'2020-08-29 13:56:42','::1','/api/blogs/create','POST'),(128,'2020-08-29 13:57:05','::1','/api/blogs/create','POST'),(129,'2020-08-29 13:58:01','::1','/api/blogs/create','POST'),(130,'2020-08-29 13:58:45','::1','/api/blogs/create','POST'),(131,'2020-08-29 13:59:10','::1','/api/blogs/create','POST'),(132,'2020-08-29 14:01:34','::1','/api/blogs/create','POST'),(133,'2020-08-29 14:03:32','::1','/api/blogs/create','POST'),(134,'2020-08-29 14:04:22','::1','/api/blogs/create','POST'),(135,'2020-08-29 14:04:52','::1','/api/blogs?page=1&page_size=10','GET'),(136,'2020-08-29 14:11:50','::1','/api/blogs/create','POST'),(137,'2020-08-29 14:11:58','::1','/api/blogs/create','POST'),(138,'2020-08-29 14:12:04','::1','/api/blogs?page=1&page_size=10','GET'),(139,'2020-08-29 14:22:22','::1','/api/blogs?page=1&page_size=10','GET'),(140,'2020-08-29 14:22:22','::1','/api/blogs?page=1&page_size=10','GET'),(141,'2020-08-29 14:27:49','::1','/api/blogs/create','POST'),(142,'2020-08-29 14:27:55','::1','/api/blogs/create','POST'),(143,'2020-08-30 11:58:30','::1','/api/users/login','POST'),(144,'2020-08-30 11:58:46','::1','/api/users/login','POST'),(145,'2020-08-30 12:36:47','::1','/api/tags','GET'),(146,'2020-08-30 12:38:23','::1','/api/tags','GET'),(147,'2020-08-30 12:39:09','::1','/api/tags','GET'),(148,'2020-08-30 12:39:34','::1','/api/tags','GET'),(149,'2020-08-30 12:41:43','::1','/api/tags','GET'),(150,'2020-08-30 12:42:33','::1','/api/tags','GET'),(151,'2020-08-30 12:47:09','::1','/api/tags','GET'),(152,'2020-08-30 12:48:07','::1','/api/tags','GET'),(153,'2020-08-30 12:48:12','::1','/api/tags','GET'),(154,'2020-08-30 12:48:20','::1','/api/tags','GET'),(155,'2020-08-30 12:49:05','::1','/api/tags','GET'),(156,'2020-08-30 12:49:18','::1','/api/tags','GET'),(157,'2020-08-30 13:19:42','::1','/api/tags','GET'),(158,'2020-08-30 13:19:52','::1','/api/tags','GET'),(159,'2020-08-30 13:21:06','::1','/api/tags','GET'),(160,'2020-08-30 13:21:29','::1','/api/tags','GET'),(161,'2020-08-30 13:23:46','::1','/api/tags','GET'),(162,'2020-08-30 13:23:56','::1','/api/tags','GET'),(163,'2020-08-30 13:25:51','::1','/api/tags','GET'),(164,'2020-08-30 13:27:52','::1','/api/tags','GET'),(165,'2020-08-30 13:29:30','::1','/api/tags','GET'),(166,'2020-08-30 13:29:33','::1','/api/tags','GET'),(167,'2020-08-30 13:32:14','::1','/api/tags','GET'),(168,'2020-08-30 13:33:17','::1','/api/tags','GET'),(169,'2020-08-30 13:33:20','::1','/api/tags','GET'),(170,'2020-08-30 13:33:39','::1','/api/tags','GET'),(171,'2020-08-30 13:34:42','::1','/api/tags','GET'),(172,'2020-08-30 13:34:44','::1','/api/tags','GET'),(173,'2020-08-30 13:34:59','::1','/api/tags','GET'),(174,'2020-08-30 13:35:44','::1','/api/tags','GET'),(175,'2020-08-30 13:36:06','::1','/api/tags','GET'),(176,'2020-08-30 13:36:34','::1','/api/tags','GET'),(177,'2020-08-30 13:43:42','::1','/api/tags','GET'),(178,'2020-08-30 13:46:13','::1','/api/tags','GET'),(179,'2020-08-30 13:47:07','::1','/api/tags','GET'),(180,'2020-08-30 13:48:16','::1','/api/tags','GET'),(181,'2020-08-30 13:48:39','::1','/api/tags','GET'),(182,'2020-08-30 13:49:00','::1','/api/tags','GET'),(183,'2020-08-30 13:49:06','::1','/api/tags','GET'),(184,'2020-08-30 13:49:20','::1','/api/tags','GET'),(185,'2020-08-30 13:50:16','::1','/api/tags','GET'),(186,'2020-08-30 13:50:29','::1','/api/tags','GET'),(187,'2020-08-30 13:51:54','::1','/api/tags','GET'),(188,'2020-08-30 13:52:05','::1','/api/tags','GET'),(189,'2020-08-30 13:53:09','::1','/api/tags','GET'),(190,'2020-08-30 13:53:32','::1','/api/tags','GET'),(191,'2020-08-30 13:57:20','::1','/api/tags','GET'),(192,'2020-08-30 13:58:19','::1','/api/tags','GET'),(193,'2020-08-30 13:58:24','::1','/api/tags','POST'),(194,'2020-08-30 13:58:33','::1','/api/tags','GET'),(195,'2020-08-30 13:59:08','::1','/api/tags','POST'),(196,'2020-08-30 13:59:27','::1','/api/tags','GET'),(197,'2020-08-30 14:03:42','::1','/api/tags','GET'),(198,'2020-08-30 14:04:52','::1','/api/tags','GET'),(199,'2020-08-30 14:05:14','::1','/api/tags','GET'),(200,'2020-08-30 14:08:58','::1','/api/tags','GET'),(201,'2020-08-30 14:09:21','::1','/api/tags','GET'),(202,'2020-08-30 14:09:31','::1','/api/tags','GET'),(203,'2020-08-30 14:10:10','::1','/api/tags','GET'),(204,'2020-08-30 14:10:50','::1','/api/tags','GET'),(205,'2020-08-30 14:11:34','::1','/api/tags','GET'),(206,'2020-08-30 14:11:39','::1','/api/tags','GET'),(207,'2020-08-30 14:11:49','::1','/api/tags','GET'),(208,'2020-08-30 14:11:52','::1','/api/tags','GET'),(209,'2020-08-30 14:12:07','::1','/api/tags','GET'),(210,'2020-08-30 14:12:12','::1','/api/tags','POST'),(211,'2020-08-30 14:12:39','::1','/api/tags','POST'),(212,'2020-08-30 14:13:46','::1','/api/tags','GET'),(213,'2020-08-30 14:13:49','::1','/api/tags','GET'),(214,'2020-08-30 14:13:55','::1','/api/tags','POST'),(215,'2020-08-30 14:15:13','::1','/api/tags','GET'),(216,'2020-08-30 14:15:24','::1','/api/tags','POST'),(217,'2020-08-30 14:15:30','::1','/api/tags','POST'),(218,'2020-08-30 14:16:09','::1','/api/tags','GET'),(219,'2020-08-30 14:16:31','::1','/api/tags','POST'),(220,'2020-08-30 14:18:06','::1','/api/tags','GET'),(221,'2020-08-30 14:18:41','::1','/api/tags','POST'),(222,'2020-08-30 14:19:00','::1','/api/tags','POST'),(223,'2020-08-30 14:19:10','::1','/api/tags','POST'),(224,'2020-08-30 14:20:22','::1','/api/tags','POST'),(225,'2020-08-30 14:27:58','::1','/api/tags','GET'),(226,'2020-08-30 14:28:15','::1','/api/tags','GET'),(227,'2020-08-30 14:28:18','::1','/api/tags','GET'),(228,'2020-08-30 14:28:28','::1','/api/tags','GET'),(229,'2020-08-30 14:31:33','::1','/api/tags','GET'),(230,'2020-08-30 14:33:37','::1','/api/tags','GET'),(231,'2020-08-30 14:33:57','::1','/api/tags','GET'),(232,'2020-08-30 14:35:11','::1','/api/tags','GET'),(233,'2020-08-30 14:35:19','::1','/api/tags','GET'),(234,'2020-08-30 14:35:28','::1','/api/tags','GET'),(235,'2020-08-30 14:39:50','::1','/api/tags','GET'),(236,'2020-08-30 14:42:06','::1','/api/tags','GET'),(237,'2020-08-30 14:42:40','::1','/api/tags','GET'),(238,'2020-08-30 14:43:21','::1','/api/tags','GET'),(239,'2020-08-30 14:44:13','::1','/api/tags','GET'),(240,'2020-08-30 14:44:21','::1','/api/tags','GET'),(241,'2020-08-30 14:44:28','::1','/api/tags','GET'),(242,'2020-08-30 14:45:27','::1','/api/categories','GET'),(243,'2020-08-30 14:45:29','::1','/api/tags','GET'),(244,'2020-08-30 14:45:30','::1','/api/categories','GET'),(245,'2020-08-30 14:53:35','::1','/api/categories','GET'),(246,'2020-08-30 14:53:39','::1','/api/categories','GET'),(247,'2020-08-30 14:54:39','::1','/api/categories','GET'),(248,'2020-08-30 14:56:19','::1','/api/categories','GET'),(249,'2020-08-30 14:57:34','::1','/api/categories','GET'),(250,'2020-08-30 14:57:43','::1','/api/categories','GET'),(251,'2020-08-30 14:57:57','::1','/api/categories','GET'),(252,'2020-08-30 14:59:49','::1','/api/categories','GET'),(253,'2020-08-30 14:59:53','::1','/api/categories','POST'),(254,'2020-08-30 14:59:57','::1','/api/categories','POST'),(255,'2020-08-30 15:00:01','::1','/api/categories','POST'),(256,'2020-08-30 15:00:08','::1','/api/categories','POST'),(257,'2020-08-30 15:00:16','::1','/api/categories','POST'),(258,'2020-08-30 15:01:12','::1','/api/categories','POST'),(259,'2020-08-30 15:01:36','::1','/api/categories','POST'),(260,'2020-08-30 15:01:40','::1','/api/tags','GET'),(261,'2020-08-30 15:01:41','::1','/api/categories','GET'),(262,'2020-08-30 15:02:22','::1','/api/categories','GET'),(263,'2020-08-30 15:02:29','::1','/api/categories','GET'),(264,'2020-08-30 15:02:33','::1','/api/categories','GET'),(265,'2020-08-30 15:14:46','::1','/api/categories','GET'),(266,'2020-08-30 15:14:56','::1','/api/categories','GET'),(267,'2020-08-30 15:16:15','::1','/api/categories','GET'),(268,'2020-08-30 15:16:42','::1','/api/categories','GET'),(269,'2020-08-30 15:16:57','::1','/api/categories','GET'),(270,'2020-08-30 15:17:23','::1','/api/categories','GET'),(271,'2020-08-30 15:17:27','::1','/api/categories','GET'),(272,'2020-08-30 15:17:30','::1','/api/categories','GET'),(273,'2020-08-30 15:17:31','::1','/api/tags','GET'),(274,'2020-10-16 22:02:00','::1','/api/tags','GET'),(275,'2020-10-16 22:02:02','::1','/api/categories','GET'),(276,'2020-10-16 22:02:04','::1','/api/categories','GET'),(277,'2020-10-16 22:02:06','::1','/api/tags','GET'),(278,'2020-10-16 22:02:10','::1','/api/categories','GET'),(279,'2020-10-16 22:47:13','::1','/api/categories','GET'),(280,'2020-10-16 22:47:15','::1','/api/tags','GET'),(281,'2020-10-16 22:47:16','::1','/api/categories','GET'),(282,'2020-10-16 22:58:05','::1','/api/categories','GET'),(283,'2020-10-17 08:05:00','::1','/api/tags','GET'),(284,'2020-10-17 08:05:01','::1','/api/categories','GET'),(285,'2020-10-17 08:05:03','::1','/api/categories','GET'),(286,'2020-10-17 08:05:04','::1','/api/tags','GET'),(287,'2020-10-17 08:05:06','::1','/api/categories','GET'),(288,'2020-10-17 08:05:06','::1','/api/tags','GET'),(289,'2020-10-17 08:08:07','::1','/api/categories','GET'),(290,'2020-10-17 08:08:11','::1','/api/tags','GET'),(291,'2020-10-17 08:08:12','::1','/api/categories','GET'),(292,'2020-10-17 08:08:12','::1','/api/tags','GET'),(293,'2020-10-17 08:08:14','::1','/api/categories','GET'),(294,'2020-10-17 08:25:46','::1','/api/tags','GET'),(295,'2020-10-17 08:25:47','::1','/api/categories','GET'),(296,'2020-10-17 08:25:49','::1','/api/tags','GET'),(297,'2020-10-17 09:21:57','::1','/api/tags','GET'),(298,'2020-10-17 09:21:58','::1','/api/categories','GET'),(299,'2020-10-17 09:22:25','::1','/api/users/login','POST'),(300,'2020-10-17 09:23:22','::1','/api/users/login','POST'),(301,'2020-10-17 09:23:26','::1','/api/tags','GET'),(302,'2020-10-17 09:29:28','::1','/api/tags','GET'),(303,'2020-10-17 09:30:43','::1','/api/users/login','POST'),(304,'2020-10-17 09:31:00','::1','/api/tags','GET'),(305,'2020-10-17 09:31:03','::1','/api/categories','GET'),(306,'2020-10-17 09:34:34','::1','/api/categories','GET'),(307,'2020-10-17 09:34:44','::1','/api/categories','GET'),(308,'2020-10-17 09:35:14','::1','/api/categories','GET'),(309,'2020-10-17 09:40:15','::1','/api/categories','GET'),(310,'2020-10-17 09:40:17','::1','/api/categories','GET'),(311,'2020-10-17 09:40:51','::1','/api/categories','GET'),(312,'2020-10-17 09:48:25','::1','/api/users/login','POST'),(313,'2020-10-17 10:45:44','::1','/api/users/login','POST'),(314,'2020-10-17 10:46:16','::1','/api/users/login','POST'),(315,'2020-10-17 10:46:23','::1','/api/tags','GET'),(316,'2020-10-17 10:46:34','::1','/api/categories','GET'),(317,'2020-10-17 10:57:58','::1','/api/tags','GET'),(318,'2020-10-17 11:01:06','::1','/api/categories','GET'),(319,'2020-10-17 11:01:10','::1','/api/tags','GET'),(320,'2020-10-17 11:01:13','::1','/api/tags','GET'),(321,'2020-10-17 11:01:19','::1','/api/categories','GET'),(322,'2020-10-17 11:06:40','::1','/api/tags','GET'),(323,'2020-10-17 11:23:21','::1','/api/tags','GET'),(324,'2020-10-17 11:23:26','::1','/api/categories','GET'),(325,'2020-10-17 11:23:37','::1','/api/categories','POST'),(326,'2020-10-17 11:23:49','::1','/api/categories','POST'),(327,'2020-10-17 11:23:53','::1','/api/tags','GET'),(328,'2020-10-17 11:24:18','::1','/api/tags','GET'),(329,'2020-10-17 11:24:19','::1','/api/categories','GET'),(330,'2020-10-17 11:24:24','::1','/api/tags','GET'),(331,'2022-02-10 23:43:51','::1','/api/blogs','GET'),(332,'2022-02-10 23:50:31','::1','/api/blogs','GET'),(333,'2022-02-10 23:51:16','::1','/api/blogs?page=1&pageSize=10','GET'),(334,'2022-02-10 23:51:26','::1','/api/blogs?page=1&page_size=10','GET'),(335,'2022-02-11 00:07:31','::1','/api/blogs?page=1&page_size=10','GET'),(336,'2022-02-11 00:07:40','::1','/api/blogs?page=1&page_size=10','GET'),(337,'2022-02-11 00:07:42','::1','/api/blogs?page=1&page_size=10','GET'),(338,'2022-02-11 00:07:43','::1','/api/blogs?page=1&page_size=10','GET'),(339,'2022-02-11 00:07:43','::1','/api/blogs?page=1&page_size=10','GET'),(340,'2022-02-11 00:36:12','::1','/api/blogs?page=1&page_size=10','GET'),(341,'2022-02-11 00:42:07','::1','/api/users/login','POST'),(342,'2022-02-11 00:42:14','::1','/api/users/login','POST'),(343,'2022-02-14 23:13:58','::1','/api/blogs?page=1&page_size=10','GET'),(344,'2022-02-14 23:14:57','::1','/api/users/login','POST'),(345,'2022-02-14 23:17:07','::1','/api/blogs','GET'),(346,'2022-02-14 23:18:59','::1','/api/users/login','POST'),(347,'2022-02-16 19:37:23','::1','/api/users/login','POST'),(348,'2022-02-16 19:38:01','::1','/api/blogs','GET'),(349,'2022-02-19 16:53:02','::1','/api/users/login','POST'),(350,'2022-02-19 17:04:05','::1','/api/users/login','POST'),(351,'2022-02-19 17:31:50','::1','/api/blogs?page=1&page_size=10','GET'),(352,'2022-02-19 17:46:42','::1','/api/users/login','POST'),(353,'2022-02-19 17:46:59','::1','/api/blogs?page=1&page_size=2','GET'),(354,'2022-02-20 09:46:24','::1','/api/users/login','POST'),(355,'2022-02-20 09:46:40','::1','/api/blogs?page=1&page_size=10','GET'),(356,'2022-02-20 09:47:19','::1','/api/blogs/create','POST'),(357,'2022-02-20 09:53:48','::1','/api/blogs/create','POST'),(358,'2022-02-20 09:54:51','::1','/api/blogs/create','POST'),(359,'2022-02-20 10:21:03','::1','/api/blogs/create','POST'),(360,'2022-02-20 10:21:09','::1','/api/blogs/create','POST'),(361,'2022-02-20 10:21:30','::1','/api/blogs/create','POST'),(362,'2022-02-20 10:22:07','::1','/api/blogs/create','POST'),(363,'2022-02-20 10:24:04','::1','/api/blogs/create','POST'),(364,'2022-02-20 10:24:32','::1','/api/blogs/create','POST'),(365,'2022-02-20 10:24:54','::1','/api/blogs/create','POST'),(366,'2022-02-20 10:25:18','::1','/api/blogs/create','POST'),(367,'2022-02-20 10:25:53','::1','/api/blogs/create','POST'),(368,'2022-02-20 10:26:42','::1','/api/blogs/create','POST'),(369,'2022-02-20 10:27:55','::1','/api/blogs/create','POST'),(370,'2022-02-20 10:29:54','::1','/api/blogs/create','POST'),(371,'2022-02-20 10:30:42','::1','/api/blogs/create','POST'),(372,'2022-02-20 10:30:56','::1','/api/blogs/create','POST'),(373,'2022-02-20 10:31:34','::ffff:127.0.0.1','/api/blogs/create','POST'),(374,'2022-02-20 10:34:10','::1','/api/blogs/create','POST'),(375,'2022-02-20 10:35:32','::1','/api/blogs/create','POST'),(376,'2022-02-20 10:35:54','::1','/api/blogs/create','POST'),(377,'2022-02-20 10:38:24','::1','/api/blogs/create','POST'),(378,'2022-02-20 10:48:13','::1','/api/blogs/create','POST'),(379,'2022-02-20 10:48:26','::1','/api/blogs/create','POST'),(380,'2022-02-20 10:48:57','::1','/api/blogs/create','POST'),(381,'2022-02-20 10:49:34','::ffff:127.0.0.1','/api/blogs/create','POST'),(382,'2022-02-20 10:50:44','::1','/api/blogs/create','POST'),(383,'2022-02-20 10:50:59','::1','/api/blogs/create','POST'),(384,'2022-02-20 10:51:20','::1','/api/blogs/create','POST'),(385,'2022-02-20 10:51:30','::1','/api/blogs?page=1&page_size=10','GET'),(386,'2022-02-20 10:53:02','::1','/api/blogs?page=1&page_size=10','GET'),(387,'2022-02-20 10:53:07','::1','/api/blogs/create','POST'),(388,'2022-02-20 11:03:42','::1','/api/blogs/create','POST'),(389,'2022-02-20 11:04:23','::1','/api/blogs/create','POST'),(390,'2022-02-20 11:04:37','::1','/api/blogs/create','POST'),(391,'2022-02-20 11:04:42','::1','/api/blogs/create','POST'),(392,'2022-02-20 11:04:43','::1','/api/blogs/create','POST'),(393,'2022-02-20 11:04:44','::1','/api/blogs/create','POST'),(394,'2022-02-20 11:04:44','::1','/api/blogs/create','POST'),(395,'2022-02-20 11:04:45','::1','/api/blogs/create','POST'),(396,'2022-02-20 11:04:46','::1','/api/blogs/create','POST'),(397,'2022-02-20 11:04:47','::1','/api/blogs/create','POST'),(398,'2022-02-20 11:05:32','::ffff:127.0.0.1','/api/blogs/create','POST'),(399,'2022-02-20 11:05:33','::ffff:127.0.0.1','/api/blogs/create','POST'),(400,'2022-02-20 11:05:34','::ffff:127.0.0.1','/api/blogs/create','POST'),(401,'2022-02-20 11:09:02','::1','/api/blogs/create','POST'),(402,'2022-02-20 11:09:05','::1','/api/blogs/create','POST'),(403,'2022-02-20 11:11:21','::1','/api/blogs/create','POST'),(404,'2022-02-20 11:11:38','::1','/api/blogs/create','POST'),(405,'2022-02-20 11:11:44','::1','/api/blogs/create','POST'),(406,'2022-02-20 11:13:03','::1','/api/blogs/create','POST'),(407,'2022-02-20 11:13:10','::1','/api/blogs/create','POST'),(408,'2022-02-20 11:14:06','::ffff:127.0.0.1','/api/blogs/create','POST'),(409,'2022-02-20 11:14:09','::ffff:127.0.0.1','/api/blogs/create','POST'),(410,'2022-02-20 11:14:21','::ffff:127.0.0.1','/api/blogs/create','POST'),(411,'2022-02-20 11:17:10','::1','/api/blogs/create','POST'),(412,'2022-02-20 11:19:09','::1','/api/blogs/create','POST'),(413,'2022-02-20 11:27:31','::1','/api/blogs/create','POST'),(414,'2022-02-20 11:29:38','::1','/api/blogs/create','POST'),(415,'2022-02-20 11:34:56','::1','/api/blogs/create','POST'),(416,'2022-02-20 11:47:46','::1','/api/blogs?page=1&page_size=10','GET'),(417,'2022-02-20 11:48:21','::1','/api/blogs?page=1&page_size=10','GET'),(418,'2022-02-20 11:48:56','::1','/api/blogs?page=1&page_size=10','GET'),(419,'2022-02-20 12:48:31','::1','/api/blogs?page=1&page_size=10','GET');
/*!40000 ALTER TABLE `event_log_access` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `http_exception_access`
--

DROP TABLE IF EXISTS `http_exception_access`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `http_exception_access` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created_at` datetime DEFAULT (now()),
  `ip` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `api_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `api_method` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `api_error` text,
  `api_status` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=68 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `http_exception_access`
--

LOCK TABLES `http_exception_access` WRITE;
/*!40000 ALTER TABLE `http_exception_access` DISABLE KEYS */;
INSERT INTO `http_exception_access` VALUES (1,'2020-08-23 17:39:57','::1','/api/roles','GET','Unauthorized',401),(2,'2020-08-23 21:20:15','::1','/api/roles','GET','Unauthorized',401),(3,'2020-08-23 21:20:23','::1','/api/roles','GET','Unauthorized',401),(4,'2020-08-23 21:23:47','::1','/api/roles','GET','Cannot read property \'name\' of null',500),(5,'2020-08-23 21:25:17','::1','/api/roles','GET','Unauthorized',401),(6,'2020-08-23 23:32:33','::1','/api/users','POST','Cannot POST /api/users',404),(7,'2020-08-24 00:14:37','::1','/api/users/change-password','POST','Unexpected token } in JSON at position 82',400),(8,'2020-08-24 22:25:19','::1','/api/users/login','POST','Unexpected token } in JSON at position 52',400),(9,'2020-08-24 22:27:22','::1','/api/users/login','POST','Unexpected token } in JSON at position 52',400),(10,'2020-08-24 22:27:35','::1','/api/users/login','POST','Unexpected token } in JSON at position 52',400),(11,'2020-08-24 22:33:41','::1','/api/users/test-validate','GET','Unauthorized',401),(12,'2020-08-24 22:35:04','::1','/api/users/test-validate','GET','Unauthorized',401),(13,'2020-08-24 23:09:02','::1','/api/users/test-validate','GET','Unauthorized',401),(14,'2020-08-24 23:12:53','::1','/api/users/test-validate','GET','Unauthorized',401),(15,'2020-08-24 23:17:12','::1','/api/users/test-validate','GET','Unauthorized',401),(16,'2020-08-24 23:19:14','::1','/api/users/test-validate','GET','Unauthorized',401),(17,'2020-08-24 23:20:08','::1','/api/users/test-validate','GET','Unauthorized',401),(18,'2020-08-24 23:20:52','::1','/api/users/test-validate','GET','Unauthorized',401),(19,'2020-08-24 23:21:56','::1','/api/users/login','POST','Unauthorized',401),(20,'2020-08-24 23:32:33','::1','/api/users/test-validate','GET','Unauthorized',401),(21,'2020-08-25 22:21:26','::1','/api/users/login','OPTIONS','Cannot OPTIONS /api/users/login',404),(22,'2020-08-25 22:23:31','::1','/api/users/login','OPTIONS','Cannot OPTIONS /api/users/login',404),(23,'2020-08-26 00:16:20','::1','/api/tags','GET','Cannot GET /api/tags',404),(24,'2020-08-26 00:40:15','::1','/api/tags','POST','Unauthorized',401),(25,'2020-08-26 00:41:04','::1','/api/tags','POST','Unauthorized',401),(26,'2020-08-29 06:28:13','::1','/api/categories','POST','Cannot POST /api/categories',404),(27,'2020-08-29 07:09:22','::1','/api/categories','POST','Unauthorized',401),(28,'2020-08-29 07:09:42','::1','/account/login','POST','Cannot POST /account/login',404),(29,'2020-10-16 23:56:09','::1','/upload-file','POST','Unexpected token - in JSON at position 0',400),(30,'2020-10-17 00:05:12','::1','/upload-file','POST','Cannot read property \'originalname\' of undefined',500),(31,'2020-10-17 00:07:33','::1','/upload-file','POST','Cannot read property \'originalname\' of undefined',500),(32,'2020-10-17 00:08:07','::1','/upload-file','POST','Cannot read property \'originalname\' of undefined',500),(33,'2020-10-17 00:10:03','::1','/upload-file','POST','Cannot read property \'originalname\' of undefined',500),(34,'2020-10-17 00:10:57','::1','/upload-file','POST','Cannot read property \'originalname\' of undefined',500),(35,'2020-10-17 00:11:32','::1','/upload-file','POST','Cannot read property \'originalname\' of undefined',500),(36,'2020-10-17 00:15:30','::1','/upload-file','POST','Cannot read property \'originalname\' of undefined',500),(37,'2020-10-17 00:17:12','::1','/upload-file','POST','Unexpected token - in JSON at position 0',400),(38,'2020-10-17 00:17:54','::1','/upload-file','POST','Unexpected token - in JSON at position 0',400),(39,'2020-10-17 00:21:50','::1','/upload-file','POST','Unexpected token - in JSON at position 0',400),(40,'2020-10-17 00:22:07','::1','/','POST','Unexpected token - in JSON at position 0',400),(41,'2020-10-17 00:22:30','::1','/','POST','Unexpected token - in JSON at position 0',400),(42,'2020-10-17 00:24:20','::1','/','POST','Unexpected token - in JSON at position 0',400),(43,'2020-10-17 00:25:47','::1','/','POST','Unexpected token - in JSON at position 0',400),(44,'2020-10-17 00:26:29','::1','/','POST','Cannot POST /',404),(45,'2020-10-17 00:29:05','::1','/upload-file','POST','Cannot read property \'originalname\' of undefined',500),(46,'2020-10-17 08:21:55','::1','/backend-1045f.png','GET','Cannot GET /backend-1045f.png',404),(47,'2020-10-17 08:21:55','::1','/favicon.ico','GET','Cannot GET /favicon.ico',404),(48,'2020-10-17 08:21:56','::1','/backend-1045f.png','GET','Cannot GET /backend-1045f.png',404),(49,'2020-10-17 08:21:57','::1','/backend-1045f.png','GET','Cannot GET /backend-1045f.png',404),(50,'2020-10-17 08:21:57','::1','/backend-1045f.png','GET','Cannot GET /backend-1045f.png',404),(51,'2020-10-17 08:21:57','::1','/backend-1045f.png','GET','Cannot GET /backend-1045f.png',404),(52,'2020-10-17 08:21:57','::1','/backend-1045f.png','GET','Cannot GET /backend-1045f.png',404),(53,'2020-10-17 08:21:58','::1','/backend-1045f.png','GET','Cannot GET /backend-1045f.png',404),(54,'2020-10-17 08:21:58','::1','/backend-1045f.png','GET','Cannot GET /backend-1045f.png',404),(55,'2020-10-17 08:21:58','::1','/backend-1045f.png','GET','Cannot GET /backend-1045f.png',404),(56,'2020-10-17 08:21:59','::1','/backend-1045f.png','GET','Cannot GET /backend-1045f.png',404),(57,'2020-10-17 08:21:59','::1','/backend-1045f.png','GET','Cannot GET /backend-1045f.png',404),(58,'2020-10-17 08:21:59','::1','/backend-1045f.png','GET','Cannot GET /backend-1045f.png',404),(59,'2022-02-10 23:40:05','::1','/favicon.ico','GET','Cannot GET /favicon.ico',404),(60,'2022-02-14 23:13:42','::1','/favicon.ico','GET','Cannot GET /favicon.ico',404),(61,'2022-02-19 16:52:47','::1','/api/blogs/create','POST','Unauthorized',401),(62,'2022-02-19 17:02:14','::1','/api/blogs/create','POST','Unauthorized',401),(63,'2022-02-19 17:02:36','::1','/api/blogs?page=1&page_size=10','GET','Unauthorized',401),(64,'2022-02-19 17:03:19','::1','/api/blogs?page=1&page_size=10','GET','Unauthorized',401),(65,'2022-02-19 17:03:29','::1','/api/blogs?page=1&page_size=10','GET','Unauthorized',401),(66,'2022-02-19 17:03:45','::1','/api/blogs?page=1&page_size=10','GET','Unauthorized',401),(67,'2022-02-19 17:04:24','::1','/api/blogs?page=1&page_size=10','GET','Unauthorized',401);
/*!40000 ALTER TABLE `http_exception_access` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `roles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'Admin');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tags`
--

DROP TABLE IF EXISTS `tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tags` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created_at` datetime DEFAULT (now()),
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `description` text,
  `is_active` tinyint(1) NOT NULL DEFAULT (1),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tags`
--

LOCK TABLES `tags` WRITE;
/*!40000 ALTER TABLE `tags` DISABLE KEYS */;
INSERT INTO `tags` VALUES (1,'2020-08-26 00:17:50','Angular','Framework js',1),(2,'2020-08-26 00:41:19','.Net Core','Develop by Microsoft',1),(3,'2020-08-26 00:46:31','Database SQL','Develop by Microsoft',1),(4,'2020-08-30 14:15:24','Nest Js','Nest Js',1),(5,'2020-08-30 14:16:31','Mysql','Mysql',1);
/*!40000 ALTER TABLE `tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created_at` datetime DEFAULT (now()),
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `password_salt` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `last_ip` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `last_logged` datetime DEFAULT NULL,
  `role_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `role_id` (`role_id`),
  CONSTRAINT `users_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (2,'2020-08-23 23:37:21','minhthong','$2b$10$PoIsbzsq.Dg5nvj6ZVGgoub6QD4gw1qm7M.iSyLLgjdCUKFmQeghW','$2b$10$PoIsbzsq.Dg5nvj6ZVGgou','::1',NULL,1);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'bruceleeblog'
--
/*!50003 DROP PROCEDURE IF EXISTS `GetListBlogInHome` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetListBlogInHome`(
 IN _pageSize INT(11),
 IN _offSet INT(11)
)
BEGIN
  SELECT * FROM blogs B
  ORDER BY B.created_at DESC LIMIT _pageSize OFFSET _offSet;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetTagsByBlog` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetTagsByBlog`(
 IN _blogId INT(11)
)
BEGIN
  SELECT T.* FROM tags T
  JOIN blog_tag_mapping BT ON T.id = BT.blog_id
  WHERE BT.blog_id = _blogId AND T.is_active =1;
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

-- Dump completed on 2022-04-18 22:22:10
