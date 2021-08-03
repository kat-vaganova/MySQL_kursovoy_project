-- MySQL dump 10.13  Distrib 8.0.26, for Linux (x86_64)
--
-- Host: localhost    Database: Shop2
-- ------------------------------------------------------
-- Server version	8.0.26-0ubuntu0.20.04.2

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
-- Table structure for table `catalogs`
--

DROP TABLE IF EXISTS `catalogs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `catalogs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'nasvanie rasdela',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `ix_catalogs_name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='rasdely int_t magasina';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalogs`
--

LOCK TABLES `catalogs` WRITE;
/*!40000 ALTER TABLE `catalogs` DISABLE KEYS */;
INSERT INTO `catalogs` VALUES (1,'voluptas','1997-05-19 10:39:56','2001-01-29 12:06:55'),(2,'ullam','1980-06-10 01:37:55','2009-06-20 02:12:52'),(3,'quidem','2013-04-09 18:30:08','2018-04-19 21:05:34'),(4,'corporis','1986-07-03 17:23:07','2000-03-10 02:02:12'),(5,'qui','1980-03-02 07:09:25','2009-11-25 19:44:12'),(6,'reiciendis','2001-09-07 01:21:26','2003-04-04 17:22:25'),(7,'iure','1975-07-05 16:56:51','2002-02-01 18:37:18'),(8,'culpa','1986-09-29 21:27:29','1996-05-07 12:53:50'),(9,'dolorem','1991-08-11 12:22:28','2006-09-09 07:48:36'),(10,'in','1991-07-19 04:25:41','1994-12-26 22:37:02');
/*!40000 ALTER TABLE `catalogs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `deliveries`
--

DROP TABLE IF EXISTS `deliveries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `deliveries` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `order_id` bigint unsigned DEFAULT NULL,
  `type_of_delivery` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'получение товара со складакурьером',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `fk_deliveries_order_id` (`order_id`),
  CONSTRAINT `fk_deliveries_order_id` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='способ получения товара';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `deliveries`
--

LOCK TABLES `deliveries` WRITE;
/*!40000 ALTER TABLE `deliveries` DISABLE KEYS */;
INSERT INTO `deliveries` VALUES (1,1,'storehouses','1986-12-25 01:28:05','1989-11-05 12:57:10'),(2,2,'courier','1980-07-05 17:20:54','1992-07-07 21:19:00');
/*!40000 ALTER TABLE `deliveries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `discounts`
--

DROP TABLE IF EXISTS `discounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `discounts` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned DEFAULT NULL,
  `discount` float unsigned DEFAULT NULL COMMENT 'skidka ot 0 do 1',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `fk_discounts_user_id` (`user_id`),
  CONSTRAINT `fk_discounts_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='skidki pokupatelyu po karte';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `discounts`
--

LOCK TABLES `discounts` WRITE;
/*!40000 ALTER TABLE `discounts` DISABLE KEYS */;
INSERT INTO `discounts` VALUES (1,1,2,'2003-03-15 05:53:09','1986-08-29 06:32:00'),(2,2,5,'1990-12-17 04:25:14','2015-08-08 11:07:44'),(3,3,2,'1975-01-02 11:17:33','1992-04-25 06:53:30'),(4,4,2,'1994-05-10 20:41:08','2015-08-31 17:51:47'),(5,5,9,'1970-07-07 09:39:00','2002-12-31 19:15:01'),(6,6,6,'2020-04-05 18:23:29','2016-04-18 03:21:42'),(7,7,4,'2020-07-18 06:07:16','1978-05-14 06:38:32'),(8,8,9,'1972-10-04 08:00:03','2009-07-23 06:12:44'),(9,9,1,'1999-08-25 00:33:40','1981-02-17 03:57:49'),(10,10,8,'1982-11-24 17:06:19','1998-04-06 19:43:43');
/*!40000 ALTER TABLE `discounts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `discounts_products`
--

DROP TABLE IF EXISTS `discounts_products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `discounts_products` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `discount_id` bigint unsigned DEFAULT NULL,
  `product_id` bigint unsigned DEFAULT NULL,
  `started_at` datetime DEFAULT NULL,
  `finished_at` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `fk_discounts_products_discounts_id` (`discount_id`),
  KEY `fk_discounts_products_product_id` (`product_id`),
  KEY `ix_discounts_products_started_at` (`started_at`),
  CONSTRAINT `fk_discounts_products_discounts_id` FOREIGN KEY (`discount_id`) REFERENCES `discounts` (`id`),
  CONSTRAINT `fk_discounts_products_product_id` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='skidka po aktsiyam na tovar';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `discounts_products`
--

LOCK TABLES `discounts_products` WRITE;
/*!40000 ALTER TABLE `discounts_products` DISABLE KEYS */;
INSERT INTO `discounts_products` VALUES (1,1,1,'1991-08-01 05:55:21','1994-07-26 11:31:48','1990-06-08 10:36:54','1995-08-03 15:42:33'),(2,2,2,'1996-05-07 21:33:19','2008-04-16 01:12:37','1995-01-18 03:32:00','2009-08-27 20:36:42'),(3,3,3,'1991-07-04 00:54:34','1992-05-19 09:22:39','1990-02-08 20:39:19','2005-08-19 15:50:51'),(4,4,4,'2004-11-20 01:50:21','2008-11-21 13:57:23','2001-07-21 18:39:40','2009-08-24 05:35:59'),(5,5,5,'2011-07-03 00:20:03','2017-09-11 09:42:43','2001-09-10 04:57:30','2018-12-27 15:32:32'),(6,6,6,'1993-09-04 11:54:50','1999-08-23 18:33:27','1979-05-31 09:59:09','2000-11-18 00:09:08'),(7,7,7,'1984-04-01 00:18:09','2016-05-02 06:24:01','1976-09-11 07:08:50','2017-08-26 02:05:28'),(8,8,8,'2020-12-15 08:55:43','2022-02-21 13:32:42','2013-06-01 04:40:22','2023-07-25 20:03:51'),(9,9,9,'2021-04-30 19:41:52','2021-11-27 19:49:12','2019-02-16 19:22:13','2024-01-06 08:37:22'),(10,10,10,'2005-11-08 18:27:04','2021-10-14 03:26:43','1989-08-09 00:12:48','2022-05-26 10:23:32'),(11,1,11,'1999-09-21 21:52:17','2022-04-12 08:08:45','1998-04-16 01:12:37','2024-11-20 01:50:21'),(12,2,12,'1997-04-08 02:47:36','2021-08-19 08:53:37','2005-11-08 18:27:04','2016-05-02 06:24:01'),(13,3,13,'2006-07-21 07:41:28','2026-08-28 16:19:19','2005-04-05 18:23:29','2027-04-18 03:21:42'),(14,4,14,'1996-10-02 03:18:19','2012-07-25 20:54:58','1995-07-18 06:07:16','2013-05-14 06:38:32'),(15,5,15,'2021-11-25 00:39:48','2023-09-06 17:37:40','2017-07-08 17:53:13','2024-07-14 17:22:44'),(16,6,16,'2022-05-06 07:58:55','2023-03-04 08:15:29','2000-02-07 15:12:37','2024-09-15 16:42:59'),(17,7,17,'2023-01-24 20:01:56','2023-10-07 03:37:55','2010-11-14 14:13:00','2024-04-16 09:26:28'),(18,8,18,'2021-11-24 06:22:53','2022-05-15 17:29:48','1971-01-06 07:40:49','1923-03-13 23:20:19'),(19,9,19,'2021-09-01 20:04:29','2024-05-20 07:54:38','2000-02-07 15:12:37','2025-09-15 16:42:59'),(20,10,20,'2022-02-24 18:56:43','2022-08-13 14:21:16','1980-01-09 04:25:29','2024-07-16 13:49:46');
/*!40000 ALTER TABLE `discounts_products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_products`
--

DROP TABLE IF EXISTS `order_products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_products` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `order_id` bigint unsigned DEFAULT NULL,
  `product_id` bigint unsigned DEFAULT NULL,
  `total` int unsigned DEFAULT '1' COMMENT 'kol-vo tovarov',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `fk_order_produkts_order_id` (`order_id`),
  KEY `fk_order_produkts_product_id` (`product_id`),
  CONSTRAINT `fk_order_produkts_order_id` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`),
  CONSTRAINT `fk_order_produkts_product_id` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=201 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='sostav zakaza';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_products`
--

LOCK TABLES `order_products` WRITE;
/*!40000 ALTER TABLE `order_products` DISABLE KEYS */;
INSERT INTO `order_products` VALUES (1,1,1,3,'1989-02-12 03:28:50','1997-06-16 00:57:02'),(2,2,2,8,'2001-04-17 19:04:03','2003-05-31 13:03:10'),(3,3,3,1,'1996-04-21 05:43:23','1986-02-20 10:39:36'),(4,4,4,9,'1982-09-09 07:05:14','1988-10-22 01:58:27'),(5,5,5,7,'1993-04-12 13:00:34','2010-07-30 02:44:04'),(6,6,6,4,'1982-12-30 06:12:42','1991-06-23 14:15:34'),(7,7,7,3,'1979-07-27 11:39:04','2013-05-02 03:26:00'),(8,8,8,2,'2011-08-19 09:42:11','1999-10-20 19:52:01'),(9,9,9,9,'2009-01-02 21:13:24','1987-01-05 08:59:06'),(10,10,10,5,'1987-09-27 13:46:35','2012-02-11 23:15:16'),(11,11,11,7,'2011-11-20 12:51:27','1996-02-25 13:06:10'),(12,12,12,2,'1972-09-01 18:00:49','2016-04-23 18:22:07'),(13,13,13,6,'1985-04-07 01:55:44','1987-06-15 22:49:51'),(14,14,14,6,'1977-10-15 11:28:10','2010-06-15 08:43:54'),(15,15,15,8,'2019-08-21 02:02:15','1977-11-13 17:58:31'),(16,16,16,8,'1998-02-22 04:45:00','1977-05-26 16:16:01'),(17,17,17,1,'2006-11-23 18:14:47','1988-05-10 02:57:57'),(18,18,18,7,'1990-02-20 17:46:20','1991-03-08 03:44:27'),(19,19,19,4,'1978-12-04 15:37:40','2014-11-29 02:51:39'),(20,20,20,5,'1997-02-23 20:44:13','1970-12-01 11:40:21'),(21,21,21,9,'2019-01-02 08:01:15','2011-08-31 13:24:33'),(22,22,22,3,'1998-04-10 18:21:59','1980-09-21 00:44:29'),(23,23,23,3,'2002-09-29 11:17:34','2010-11-06 21:00:50'),(24,24,24,7,'1992-11-19 09:10:19','1994-12-12 04:37:51'),(25,25,25,8,'1995-01-03 21:09:09','1989-09-19 19:42:59'),(26,26,26,6,'1995-04-17 12:47:40','1983-07-13 06:50:24'),(27,27,27,1,'1986-05-14 09:28:18','2014-11-16 06:31:56'),(28,28,28,7,'1999-07-21 00:15:59','1994-06-05 00:29:33'),(29,29,29,7,'2013-05-11 05:04:42','2007-11-24 11:55:19'),(30,30,30,5,'2004-06-18 13:14:31','2016-02-18 15:23:39'),(31,31,31,6,'1979-08-24 15:17:10','1988-12-29 07:14:27'),(32,32,32,9,'1978-02-28 07:37:17','2003-09-26 03:14:14'),(33,33,33,4,'2006-01-15 11:05:27','1991-10-08 20:36:56'),(34,34,34,2,'2005-05-06 10:24:11','1991-01-11 18:03:35'),(35,35,35,4,'2020-04-15 21:18:00','1989-10-26 17:22:53'),(36,36,36,8,'2011-03-17 14:21:39','2007-04-20 09:40:16'),(37,37,37,9,'1997-10-15 13:24:41','1999-09-14 16:29:00'),(38,38,38,6,'2007-10-23 12:40:51','1982-01-07 16:10:47'),(39,39,39,8,'1973-05-16 04:29:03','1997-03-11 16:56:30'),(40,40,40,4,'1994-01-03 19:32:29','1980-03-20 03:14:28'),(41,41,41,8,'1981-08-22 16:20:03','1993-05-20 07:38:47'),(42,42,42,4,'2008-07-16 05:21:53','2016-08-27 23:24:02'),(43,43,43,2,'2007-05-23 04:29:25','2006-09-15 08:43:57'),(44,44,44,1,'2017-05-13 19:10:35','1990-05-02 14:35:09'),(45,45,45,5,'2017-02-19 09:10:09','1998-12-28 11:40:23'),(46,46,46,1,'1972-02-23 07:45:48','1988-08-09 11:08:10'),(47,47,47,3,'1983-03-23 07:32:11','2014-05-24 09:17:53'),(48,48,48,9,'2001-10-25 06:06:28','1971-12-09 16:58:58'),(49,49,49,2,'2013-09-09 10:56:14','1995-08-21 11:31:20'),(50,50,50,7,'2004-01-25 04:40:25','2006-08-20 21:02:28'),(51,51,51,7,'2007-05-11 08:44:01','1985-08-18 07:54:21'),(52,52,52,8,'1980-04-28 04:54:31','1981-01-28 19:16:33'),(53,53,53,1,'1987-05-25 05:49:16','1978-04-22 16:01:07'),(54,54,54,5,'1993-02-13 03:15:43','2021-02-20 07:27:28'),(55,55,55,3,'1980-04-05 01:08:24','1993-03-10 23:53:57'),(56,56,56,5,'2014-05-10 18:37:17','1981-08-25 04:28:31'),(57,57,57,2,'1992-05-22 01:44:11','1988-03-31 15:40:08'),(58,58,58,7,'1987-04-02 11:25:31','1990-09-16 05:49:13'),(59,59,59,3,'1981-04-17 15:04:29','2011-05-09 19:53:46'),(60,60,60,5,'1977-11-15 02:22:56','1995-12-03 18:29:26'),(61,61,1,5,'2018-09-06 04:02:17','2014-09-17 00:47:34'),(62,62,2,8,'2020-12-08 07:16:51','2017-07-17 03:27:07'),(63,63,3,3,'1990-01-19 13:40:29','1994-09-25 07:05:30'),(64,64,4,4,'2001-08-04 07:44:04','1990-02-24 13:47:18'),(65,65,5,6,'2015-08-14 02:42:06','2000-07-02 09:53:10'),(66,66,6,7,'2005-09-10 12:35:49','2015-04-13 17:13:02'),(67,67,7,8,'1973-09-23 01:47:52','2014-12-31 01:15:28'),(68,68,8,8,'1983-02-21 14:07:44','1975-08-03 21:38:37'),(69,69,9,3,'1983-09-16 02:28:53','1982-02-17 06:30:41'),(70,70,10,2,'1998-08-23 04:27:12','2018-02-16 00:48:12'),(71,71,11,1,'2002-04-19 17:29:30','1988-12-25 17:23:51'),(72,72,12,7,'2000-10-22 18:14:56','2000-03-03 20:28:49'),(73,73,13,1,'2018-08-18 17:15:26','1988-02-01 04:35:30'),(74,74,14,2,'2006-08-17 00:02:21','1978-09-09 07:57:18'),(75,75,15,7,'2015-07-24 18:28:26','2011-04-16 09:46:37'),(76,76,16,3,'1989-05-29 05:05:02','1987-12-24 03:53:37'),(77,77,17,7,'1991-06-29 11:20:44','2014-01-16 11:21:52'),(78,78,18,1,'1991-11-28 19:53:53','1985-08-14 03:14:39'),(79,79,19,8,'1975-05-15 10:33:52','1993-01-10 18:34:25'),(80,80,20,5,'1999-09-20 01:05:46','2004-07-17 18:27:07'),(81,1,21,6,'1992-07-29 17:24:26','2012-01-08 08:27:30'),(82,2,22,1,'1972-06-16 16:09:39','2007-10-10 17:32:55'),(83,3,23,9,'2013-03-16 22:56:39','1983-09-06 13:21:03'),(84,4,24,3,'1983-06-11 07:30:26','1978-12-30 16:10:34'),(85,5,25,8,'2019-08-14 06:16:07','1983-09-26 08:47:35'),(86,6,26,9,'1986-07-18 14:48:31','1979-07-16 08:18:28'),(87,7,27,3,'1976-09-29 18:04:47','2018-03-05 04:18:54'),(88,8,28,2,'1977-09-22 19:17:42','1987-03-12 06:59:11'),(89,9,29,7,'1986-04-29 07:13:12','1978-08-03 09:48:45'),(90,10,30,4,'2019-08-28 04:32:14','1982-07-12 02:58:35'),(91,11,31,8,'1980-02-27 18:33:27','2020-08-18 09:20:53'),(92,12,32,8,'1971-02-27 07:09:54','1986-06-26 21:29:52'),(93,13,33,2,'1973-07-25 09:01:01','1971-02-25 02:51:52'),(94,14,34,2,'1987-08-08 13:13:40','1977-09-15 18:12:43'),(95,15,35,6,'2010-01-07 20:02:54','1990-07-05 13:55:06'),(96,16,36,3,'1970-07-10 10:12:57','1994-05-17 10:33:16'),(97,17,37,4,'1991-09-27 23:28:06','1979-06-19 13:21:32'),(98,18,38,3,'1978-04-14 15:24:59','1995-08-23 00:06:17'),(99,19,39,5,'1998-08-04 04:36:00','1995-11-01 14:27:08'),(100,20,40,4,'2003-08-17 23:19:02','1974-06-13 02:30:47'),(101,21,41,9,'2012-08-20 11:51:30','1995-08-03 10:54:51'),(102,22,42,5,'1984-03-10 19:42:23','2006-02-10 14:11:08'),(103,23,43,3,'1990-04-21 18:50:43','1985-03-31 11:09:41'),(104,24,44,9,'1972-10-11 03:19:54','2002-12-13 12:14:44'),(105,25,45,7,'1986-05-15 14:37:40','1980-09-23 03:02:32'),(106,26,46,9,'2008-12-04 16:32:47','1976-09-28 10:00:32'),(107,27,47,1,'1994-08-05 07:45:21','1981-10-20 09:45:29'),(108,28,48,9,'1971-10-16 11:31:19','1972-08-11 21:33:59'),(109,29,49,2,'2010-06-01 12:01:58','1997-02-25 15:41:29'),(110,30,50,6,'2002-12-11 05:44:10','1977-02-19 22:20:11'),(111,31,51,5,'2001-11-07 10:43:47','2018-02-13 14:28:09'),(112,32,52,3,'1984-01-03 08:10:54','2002-08-30 16:01:05'),(113,33,53,2,'2005-11-12 05:01:28','2019-09-07 16:18:18'),(114,34,54,7,'1988-07-25 22:17:15','1981-12-07 17:59:27'),(115,35,55,5,'1999-06-19 01:08:58','1981-05-08 04:15:38'),(116,36,56,4,'1981-10-26 13:56:18','2015-07-02 13:57:11'),(117,37,57,2,'1975-05-28 21:25:38','2011-12-02 18:11:30'),(118,38,58,8,'2011-02-01 05:36:59','1996-01-01 00:10:18'),(119,39,59,7,'2015-02-09 14:11:44','1986-08-11 01:07:03'),(120,40,60,5,'2007-11-27 12:22:35','2017-07-26 10:05:05'),(121,41,1,9,'2002-02-03 17:11:13','1981-01-04 23:34:53'),(122,42,2,6,'1997-01-31 07:49:38','1975-10-28 12:20:43'),(123,43,3,9,'1995-07-17 14:56:40','2020-04-06 14:59:12'),(124,44,4,2,'1979-02-28 07:22:00','2000-12-28 20:10:45'),(125,45,5,2,'1978-06-07 04:22:08','1972-03-17 20:15:15'),(126,46,6,2,'1981-04-16 01:52:02','2001-10-09 05:32:22'),(127,47,7,4,'2019-08-14 18:24:05','2003-11-11 11:22:24'),(128,48,8,8,'2001-02-08 05:36:26','1973-12-18 18:52:34'),(129,49,9,2,'1994-02-09 18:02:15','1980-09-22 03:04:39'),(130,50,10,3,'1988-08-07 16:57:32','2016-10-12 09:43:48'),(131,51,11,6,'1993-02-25 19:47:55','1992-10-15 15:52:15'),(132,52,12,6,'1999-02-12 08:20:33','1975-04-25 14:06:09'),(133,53,13,7,'2000-01-18 13:38:56','1976-06-29 11:35:56'),(134,54,14,3,'2001-04-07 13:59:55','1993-02-22 13:19:06'),(135,55,15,3,'2021-07-25 17:47:38','2017-10-29 20:00:39'),(136,56,16,7,'1972-08-14 00:15:20','1984-08-24 09:36:46'),(137,57,17,4,'1989-05-05 20:35:14','1999-07-19 16:40:45'),(138,58,18,2,'2008-11-11 08:37:49','1990-08-31 06:25:51'),(139,59,19,2,'1996-10-03 13:20:50','2002-01-12 03:57:10'),(140,60,20,5,'2017-12-30 20:48:43','2013-08-18 15:26:40'),(141,61,21,6,'2003-12-31 12:26:13','1981-10-24 08:23:47'),(142,62,22,2,'2003-09-09 04:46:43','2001-07-03 01:33:47'),(143,63,23,4,'1981-08-11 18:10:57','1977-05-29 15:20:17'),(144,64,24,5,'1996-12-11 23:03:31','1991-05-01 02:17:03'),(145,65,25,9,'1993-11-24 18:59:41','1973-06-30 16:30:58'),(146,66,26,9,'2014-11-27 12:33:29','2018-12-11 21:52:48'),(147,67,27,4,'2013-12-09 05:25:42','2010-06-23 01:34:32'),(148,68,28,6,'1996-09-10 00:33:45','1977-01-21 02:39:27'),(149,69,29,5,'1985-02-18 07:29:00','1993-04-10 17:17:12'),(150,70,30,5,'1986-04-01 10:04:54','1999-01-12 11:22:11'),(151,71,31,3,'1985-06-02 05:54:49','1991-03-18 00:52:35'),(152,72,32,3,'1981-09-03 11:35:01','2021-05-02 19:40:22'),(153,73,33,4,'1973-11-16 21:24:23','1993-10-09 14:34:53'),(154,74,34,7,'1988-01-06 18:12:57','1991-02-06 10:27:46'),(155,75,35,4,'2001-04-24 10:56:38','1985-12-10 11:31:50'),(156,76,36,4,'1975-09-16 00:36:19','1993-02-03 19:38:13'),(157,77,37,9,'2004-09-28 04:32:03','2005-10-30 18:42:40'),(158,78,38,1,'1980-08-07 18:38:39','1985-05-14 18:34:27'),(159,79,39,1,'2010-01-05 14:32:25','1971-10-26 10:10:32'),(160,80,40,7,'1995-08-11 08:27:31','2021-02-13 13:18:24'),(161,1,41,2,'1991-04-11 23:00:29','1983-05-11 22:48:42'),(162,2,42,7,'1979-10-09 21:26:20','1999-10-07 20:05:09'),(163,3,43,1,'2002-04-20 23:40:09','1989-07-15 07:23:58'),(164,4,44,5,'2016-10-08 05:13:05','2002-03-18 11:36:30'),(165,5,45,7,'1997-02-22 15:13:21','2020-07-28 23:34:56'),(166,6,46,3,'1999-08-29 23:30:02','1971-05-29 08:41:01'),(167,7,47,7,'1971-11-08 06:04:29','1985-08-30 19:42:47'),(168,8,48,5,'2006-08-09 18:36:17','2000-10-27 04:01:09'),(169,9,49,1,'1979-09-15 14:27:58','2014-05-20 18:17:09'),(170,10,50,7,'2018-06-01 07:49:25','1984-08-02 03:50:39'),(171,11,51,3,'1974-09-16 19:35:53','1998-03-01 14:44:15'),(172,12,52,1,'2018-06-29 05:36:03','1994-05-01 10:37:23'),(173,13,53,4,'1997-04-22 00:08:44','2003-08-12 13:49:25'),(174,14,54,3,'2012-01-09 07:23:33','2020-01-13 22:01:17'),(175,15,55,7,'2020-01-22 21:13:21','1980-11-11 09:29:39'),(176,16,56,5,'2012-05-08 15:34:01','2011-08-24 18:19:29'),(177,17,57,9,'1997-11-19 19:21:32','2007-02-17 09:17:26'),(178,18,58,6,'2006-03-06 14:58:47','1980-04-09 08:51:02'),(179,19,59,7,'1970-07-11 03:57:05','2013-06-21 09:39:03'),(180,20,60,7,'1995-03-11 21:15:38','2019-06-09 16:32:26'),(181,21,1,7,'2006-09-23 11:35:27','2011-09-25 14:03:44'),(182,22,2,9,'1980-04-03 06:46:23','2011-09-21 02:21:58'),(183,23,3,7,'2015-04-29 21:06:57','1970-02-02 05:38:02'),(184,24,4,5,'1991-04-01 09:27:08','2005-12-26 06:19:17'),(185,25,5,6,'2014-02-03 18:51:28','1976-07-12 10:07:22'),(186,26,6,3,'1981-04-22 14:38:20','1980-05-11 05:11:49'),(187,27,7,1,'2017-04-04 13:25:44','2003-11-01 23:02:36'),(188,28,8,5,'1982-08-30 06:54:38','1991-04-12 08:57:51'),(189,29,9,3,'1979-02-24 09:59:16','1985-09-10 05:07:16'),(190,30,10,2,'1979-03-22 17:19:51','1986-04-04 21:01:51'),(191,31,11,7,'2013-04-14 07:37:13','2015-06-18 22:57:48'),(192,32,12,8,'1978-05-07 12:26:02','1992-11-22 21:59:57'),(193,33,13,9,'2009-10-02 04:11:51','2013-04-26 04:13:32'),(194,34,14,1,'1989-12-17 15:38:02','1986-10-17 14:44:36'),(195,35,15,8,'2002-08-11 17:05:49','2014-03-07 04:36:50'),(196,36,16,6,'2002-11-11 05:31:25','2011-04-25 02:50:29'),(197,37,17,6,'1979-05-25 20:57:32','1999-06-30 13:49:03'),(198,38,18,6,'1974-04-10 08:44:23','2016-04-18 11:47:08'),(199,39,19,1,'1979-08-29 15:42:18','1987-07-28 10:26:42'),(200,40,20,2,'1995-09-07 07:05:05','2009-10-30 04:08:28');
/*!40000 ALTER TABLE `order_products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned DEFAULT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `index_of_user_id` (`user_id`),
  CONSTRAINT `fk_orders_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=81 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='zakazi';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (1,1,'2006-06-01 21:08:42','2015-11-10 02:58:49'),(2,2,'2012-02-05 04:34:57','2014-03-28 00:28:21'),(3,3,'2016-02-14 04:46:58','1991-12-06 04:31:46'),(4,4,'1987-04-12 21:35:36','1974-12-27 05:29:41'),(5,5,'2014-01-11 08:33:41','1976-07-25 08:07:19'),(6,6,'2018-11-03 01:03:08','2008-06-21 17:36:36'),(7,7,'1981-08-05 01:25:47','2007-08-30 12:13:27'),(8,8,'1992-06-05 05:57:02','2015-06-29 20:49:38'),(9,9,'2010-11-16 11:16:37','1987-01-17 16:49:22'),(10,10,'1980-08-29 08:36:16','2019-05-20 01:28:23'),(11,11,'2016-08-27 21:08:43','2019-04-04 06:51:03'),(12,12,'1990-03-24 01:31:29','2005-04-15 08:29:12'),(13,13,'2008-10-18 13:13:45','1986-11-20 20:10:19'),(14,14,'2006-06-11 07:33:03','1990-02-17 11:32:11'),(15,15,'1986-02-12 14:28:33','1981-01-15 14:20:14'),(16,16,'2004-11-20 08:21:45','2001-02-24 22:47:13'),(17,17,'2001-06-10 02:11:32','2014-10-26 16:42:17'),(18,18,'1982-04-20 17:11:10','1994-08-24 15:38:44'),(19,19,'1988-03-22 06:33:53','1996-10-13 15:12:07'),(20,20,'1996-09-28 17:44:23','1980-02-11 12:00:12'),(21,1,'1981-12-03 14:33:20','2003-03-10 14:36:33'),(22,2,'1988-12-24 17:27:20','2005-08-12 00:01:44'),(23,3,'1989-05-10 09:27:15','1986-09-19 16:58:28'),(24,4,'2020-04-15 18:07:57','2002-11-13 23:57:48'),(25,5,'1984-02-07 21:56:34','1991-07-09 14:18:06'),(26,6,'1997-11-30 13:09:09','2003-12-12 11:42:44'),(27,7,'2006-01-07 11:00:16','1974-12-25 15:39:46'),(28,8,'1985-10-08 20:04:33','2008-07-15 22:37:50'),(29,9,'1993-11-05 15:21:53','1981-01-30 02:48:56'),(30,10,'2018-01-09 22:37:20','2001-07-04 05:57:34'),(31,11,'1970-03-11 19:24:28','1999-08-07 04:23:51'),(32,12,'2009-05-15 06:44:38','2000-11-10 02:35:52'),(33,13,'2020-01-14 08:45:18','1974-11-30 10:31:35'),(34,14,'1985-06-17 10:40:17','1994-06-27 23:39:08'),(35,15,'1971-10-14 15:07:57','1999-03-24 16:29:26'),(36,16,'2007-09-18 16:55:18','2018-06-12 06:28:58'),(37,17,'2018-01-27 06:10:45','2003-10-19 21:09:54'),(38,18,'1976-12-21 11:08:43','1976-09-25 23:38:49'),(39,19,'2018-06-14 20:32:05','1992-12-13 08:09:35'),(40,20,'1991-08-15 07:21:34','1986-03-17 12:44:25'),(41,1,'1975-12-26 22:11:31','2016-08-18 04:52:19'),(42,2,'1976-01-26 14:15:53','2002-03-18 00:56:20'),(43,3,'2008-11-01 04:13:39','1972-10-13 11:27:23'),(44,4,'1973-11-27 19:56:45','1987-05-22 20:16:35'),(45,5,'1999-01-22 06:27:18','2018-01-20 23:13:36'),(46,6,'1974-12-23 20:37:32','2015-05-12 14:41:55'),(47,7,'2006-08-09 20:44:35','1992-08-20 11:54:26'),(48,8,'1977-04-19 19:59:27','1977-12-04 15:46:20'),(49,9,'1974-09-12 05:40:39','1970-11-28 21:54:54'),(50,10,'1985-03-04 00:15:52','1981-09-25 00:14:30'),(51,11,'2015-08-14 00:14:06','1998-10-18 16:39:22'),(52,12,'1989-12-07 23:56:51','1989-11-02 11:38:53'),(53,13,'2007-10-21 05:27:28','2018-06-07 11:26:10'),(54,14,'2017-06-10 16:55:14','1980-09-15 02:13:12'),(55,15,'2018-02-10 23:56:43','2014-06-15 13:41:50'),(56,16,'1978-11-27 05:35:48','2004-11-20 20:04:14'),(57,17,'2004-05-09 20:20:55','1973-02-17 01:06:55'),(58,18,'2009-03-04 22:22:58','1993-02-24 20:44:53'),(59,19,'2016-04-20 11:30:07','2020-09-07 02:09:40'),(60,20,'2020-08-28 05:10:10','2018-03-24 08:11:07'),(61,1,'1975-03-10 07:15:03','2016-12-06 05:29:26'),(62,2,'1998-01-22 11:14:25','1977-02-22 11:03:43'),(63,3,'2005-10-05 08:51:38','2010-09-02 12:58:25'),(64,4,'1975-11-01 05:36:18','2002-04-02 02:54:45'),(65,5,'1970-07-12 14:07:19','1981-07-29 08:42:13'),(66,6,'1985-07-14 11:06:28','2009-02-04 07:01:58'),(67,7,'2018-05-06 18:22:55','1998-04-04 15:34:38'),(68,8,'2016-06-17 13:49:01','2021-06-05 17:57:10'),(69,9,'2001-07-18 12:59:24','2015-07-27 13:01:54'),(70,10,'1989-06-12 21:14:59','2006-02-26 15:16:25'),(71,11,'2008-03-24 08:03:39','1994-11-07 23:55:25'),(72,12,'1977-03-12 15:00:09','2006-01-01 13:02:09'),(73,13,'2005-02-10 03:13:25','2008-12-20 08:10:25'),(74,14,'1993-03-24 08:50:45','1995-06-19 22:20:31'),(75,15,'2000-01-21 04:13:46','1985-09-13 10:35:59'),(76,16,'1985-02-10 06:42:59','1988-01-17 21:11:49'),(77,17,'2008-12-04 00:27:39','1981-10-13 14:58:44'),(78,18,'1976-03-03 06:38:50','1972-05-13 06:47:43'),(79,19,'1992-12-27 13:08:34','1970-12-06 19:38:49'),(80,20,'2001-03-19 13:06:48','2006-08-03 05:06:25');
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payments`
--

DROP TABLE IF EXISTS `payments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payments` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `order_id` bigint unsigned DEFAULT NULL,
  `payment` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'вид оплаты по карте лобо наличными',
  `moment_of_payment` datetime DEFAULT NULL COMMENT 'момент опаты',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `fk_payments_order_id` (`order_id`),
  CONSTRAINT `fk_payments_order_id` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='способ оплаты';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payments`
--

LOCK TABLES `payments` WRITE;
/*!40000 ALTER TABLE `payments` DISABLE KEYS */;
INSERT INTO `payments` VALUES (1,1,'card','1983-07-24 00:30:52','1982-06-25 05:45:41','1991-12-23 02:44:10'),(2,2,'cash','1989-06-12 13:36:51','1988-05-17 21:01:04','1990-10-08 16:25:18');
/*!40000 ALTER TABLE `payments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'nasvanie',
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT 'opisanie',
  `price` decimal(11,2) DEFAULT NULL COMMENT 'tsena',
  `catalog_id` bigint unsigned DEFAULT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `fk_products_catalog_id` (`catalog_id`),
  KEY `ix_products_name` (`name`),
  CONSTRAINT `fk_products_catalog_id` FOREIGN KEY (`catalog_id`) REFERENCES `catalogs` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='tovarnie pozitsii';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (1,'modi','Error eum quasi suscipit quos voluptatibus ducimus architecto consequuntur. Ratione dolore autem tempora vel provident dolorem. Suscipit ullam quod et voluptatem sint ipsum autem.',8.00,1,'1994-12-20 04:43:02','2005-10-21 02:53:31'),(2,'soluta','Est dolorem a adipisci sapiente. Quae repellat voluptatem expedita officia. Eveniet dolorem molestiae ad culpa est minus ea nihil. Dolorem dignissimos sed quis.',6.00,2,'1995-08-28 07:20:45','2004-12-13 10:44:25'),(3,'deleniti','Quis quisquam hic sed recusandae iusto. Velit aut et et debitis maxime illum. Distinctio placeat repellendus voluptate eveniet officia inventore omnis. Voluptatibus suscipit itaque corrupti excepturi dolore et.',5.00,3,'1992-03-07 02:27:54','1973-02-16 19:29:14'),(4,'vero','Placeat voluptas cum sunt praesentium. Veritatis voluptatum dolores ut. Voluptas saepe voluptates dolor ut. Repudiandae dicta blanditiis et magnam animi.',4.00,4,'1977-01-29 00:15:01','1993-06-05 03:04:34'),(5,'qui','Voluptas quia molestiae quasi asperiores tenetur excepturi. Exercitationem consequatur eligendi rem vitae et sit blanditiis voluptatibus. Voluptatibus optio sunt iusto placeat. Ea et et qui quia rem.',4.00,5,'1981-01-26 19:42:29','2013-05-22 09:22:16'),(6,'ex','Expedita vel earum est id sint assumenda. Reiciendis eius dolor illo ea aspernatur quia neque dolor. Sed voluptas tempore aut repudiandae ullam tempore et. Laborum quis sapiente dolorem hic facilis iste voluptas.',1.00,6,'2000-03-26 05:18:10','1999-06-27 09:22:11'),(7,'neque','Quia velit qui quia ut dolores sed. Hic quo vel aut aspernatur. Sapiente necessitatibus ea laudantium omnis qui totam. Reiciendis quis et quis sed vel debitis.',2.00,7,'1979-01-24 05:07:24','2017-07-03 16:19:42'),(8,'ut','Aut vero officiis dolor eligendi. Cumque sunt molestiae eligendi at blanditiis ullam odit perspiciatis. Tempora accusantium iusto et. Voluptas excepturi est rerum porro nemo.',2.00,8,'2005-08-15 15:10:20','2006-01-19 16:45:38'),(9,'aut','Sint non necessitatibus consequatur laboriosam dolores iure cupiditate. Dolorem veniam cupiditate porro sed.',6.00,9,'2012-06-03 11:16:18','1978-02-20 06:33:22'),(10,'sequi','Itaque ullam ad laudantium incidunt assumenda eius eaque et. Ducimus ut laboriosam sed tenetur ut quod ullam. Incidunt earum voluptas quasi quia cupiditate dolorem voluptas. Officia et accusamus eos reiciendis nihil non.',6.00,10,'1994-09-10 03:19:11','2012-01-01 12:33:31'),(11,'dolores','Id et placeat dicta ad suscipit tempore. Aut voluptates nobis et consequatur molestias. Non veniam neque aspernatur dolor nisi. Consectetur mollitia quis ut quas quo.',5.00,1,'1981-06-26 06:04:22','2014-10-29 23:28:25'),(12,'eveniet','Quibusdam labore enim amet in laudantium. Optio impedit ex ut tenetur voluptate ut est.',8.00,2,'1974-12-15 10:38:12','1973-09-29 22:59:30'),(13,'molestiae','Est possimus voluptatem dolor officia ut doloremque qui. Doloribus consequatur maiores pariatur dignissimos. Cupiditate omnis est rem molestiae et.',6.00,3,'2011-07-04 12:27:36','1982-10-13 18:45:39'),(14,'placeat','Nihil sed veniam id et eaque voluptatem asperiores. Sunt et ab dignissimos fugiat aut autem omnis. Id rerum eos nisi itaque. Dolor qui odio recusandae ducimus vel.',5.00,4,'2021-05-12 07:59:53','2002-01-25 02:18:20'),(15,'accusantium','Quas rerum vitae in quia. Sint dignissimos qui recusandae dicta. Facere facere odio et qui.',7.00,5,'1999-07-09 13:45:32','2008-04-30 15:51:04'),(16,'et','Accusantium odit eos et. Corporis ex qui ea nihil explicabo reiciendis. Beatae veritatis rem maxime maiores.',5.00,6,'2005-03-18 22:38:53','1983-02-18 08:40:10'),(17,'unde','Qui autem autem ratione fugit et cumque reprehenderit quo. Repellendus odio repellat ut voluptas aut.',3.00,7,'1998-04-10 06:14:58','1970-01-29 15:16:06'),(18,'nihil','Alias amet quia reprehenderit non et illum. Eaque nostrum beatae debitis aliquid occaecati. Esse temporibus explicabo molestiae.',5.00,8,'1973-04-02 23:03:46','2008-05-29 10:38:34'),(19,'autem','Ut est illo labore rerum animi neque. Voluptas est sed in hic nostrum iusto quo. Et sunt ipsa et ullam illum.',7.00,9,'1977-05-07 17:05:14','1981-12-12 01:44:45'),(20,'consequatur','Vel dolor temporibus omnis ea sit. Veritatis rerum culpa consequuntur autem laudantium aliquam. Facilis ipsam aut repudiandae autem. Inventore impedit et cupiditate temporibus libero.',3.00,10,'2004-05-31 07:08:08','2020-08-13 22:43:56'),(21,'ut','Molestias in perferendis aliquam aut vel accusamus est placeat. Nostrum voluptatem rerum rerum minima voluptatem repudiandae. Dolorem quos in minima impedit expedita aspernatur non.',9.00,1,'1974-02-15 01:58:31','2005-10-03 13:55:24'),(22,'ratione','Non quos tempore est temporibus. Quos pariatur tempore autem suscipit veritatis eaque consectetur. Sed qui accusamus nihil. Error porro ex doloribus sed neque rerum debitis.',6.00,2,'1977-04-22 07:50:12','1995-06-30 09:29:51'),(23,'voluptas','Ipsam molestiae nobis delectus ipsum nihil eveniet. Aut rerum vel saepe laborum facere. Nihil et neque nostrum sint sunt et.',1.00,3,'2000-12-30 13:50:14','1998-05-30 10:36:23'),(24,'itaque','Ullam explicabo quaerat voluptas. Nobis reprehenderit voluptas accusamus cumque quis mollitia. Et aut qui ut aut dolores animi optio. Quas molestiae illo qui ab unde.',4.00,4,'2006-08-01 14:00:56','1976-05-19 13:08:37'),(25,'porro','Enim molestiae tempora non. Earum iure tempore labore qui qui. Libero voluptas qui molestiae.',3.00,5,'1989-06-01 21:30:54','2002-12-10 13:55:05'),(26,'magni','Reiciendis animi quisquam maxime sint impedit quia. Occaecati libero esse necessitatibus suscipit in. Deleniti ab adipisci beatae assumenda.',7.00,6,'2002-07-05 21:13:52','1992-03-31 11:03:37'),(27,'dicta','Possimus odio error repellendus quo. Id dolorum vitae aliquam sit sed placeat debitis est. Eius blanditiis veniam sit et deleniti numquam asperiores.',7.00,7,'2018-06-27 02:02:55','2020-02-12 04:32:27'),(28,'alias','Sed ut deserunt labore sed optio accusamus velit. Sed voluptas quasi et qui vel. Omnis eligendi sed est.',7.00,8,'1976-06-20 00:42:25','1985-06-09 12:11:32'),(29,'ab','Maxime voluptatem numquam error sed recusandae qui veritatis. Et qui ad unde omnis aliquam nobis dolorem nisi. Laudantium ratione pariatur atque voluptatem recusandae voluptates. Officia quam consequatur ipsam eos rerum totam eum. Modi deleniti numquam amet autem autem.',9.00,9,'1981-08-21 06:49:43','1994-07-24 14:24:44'),(30,'sit','Nobis quidem iusto facilis omnis. Velit in cum nulla eum assumenda rerum aut. At aliquam ut accusamus repellendus. Et itaque aut eos ipsam repellat soluta mollitia. Voluptatibus est ullam ex sit dolor.',2.00,10,'1999-11-07 21:29:37','2017-06-18 08:45:33'),(31,'maxime','Vitae tenetur ut veniam aut maxime quia quos. Dignissimos quos quo et fugiat. Iste optio vel voluptas quaerat. Sequi voluptatum deleniti non sit.',3.00,1,'1976-07-30 19:47:55','2012-05-17 22:46:49'),(32,'iusto','Voluptatem necessitatibus voluptatibus expedita qui officia eius. Ab eum quasi quia neque voluptas. Nam odit rerum dicta qui eaque.',9.00,2,'2010-11-10 17:54:44','2008-10-19 22:14:58'),(33,'soluta','Numquam modi ut aut sint. Rem voluptatum est architecto ut necessitatibus. Eos nisi sed illum ab aliquam recusandae enim ut.',8.00,3,'1973-11-02 22:13:38','2006-12-13 04:10:27'),(34,'quaerat','Quo sint quos et. Dolor facere unde sed eum commodi. Provident perspiciatis ipsam illum voluptate qui. Laborum enim at ipsam et.',3.00,4,'1982-11-25 12:31:07','2009-09-12 06:22:16'),(35,'temporibus','Fugiat nobis ut eveniet et. Et vitae corrupti repellendus. Id illo eveniet corporis quia ratione nostrum quia. Cumque aut iste nesciunt consequuntur facere autem fugiat adipisci.',7.00,5,'1979-09-05 08:13:01','1977-05-09 07:22:53'),(36,'quis','Qui id sit unde non corporis incidunt et qui. Rerum officiis adipisci maxime fugiat ut excepturi. Sapiente quasi fugit optio quia. Velit rem quia ab vitae dolorem quae nostrum.',8.00,6,'1991-04-11 13:58:18','1985-01-02 13:57:10'),(37,'ad','Voluptas eligendi reprehenderit voluptas quaerat ullam deleniti. Occaecati est quo ab provident sapiente sit. Nobis ut perspiciatis occaecati et in possimus. Non id qui molestiae et.',1.00,7,'1995-03-16 00:01:17','1999-06-07 21:45:44'),(38,'eum','Nostrum et fugit reprehenderit. Qui aut voluptatem atque. Eligendi quod autem consequatur repellendus non. Accusantium suscipit eum culpa qui.',7.00,8,'1971-06-13 19:38:26','2016-04-29 12:39:04'),(39,'quam','Qui quam aut eos et et nihil aut magnam. Dolores ipsa voluptatem adipisci nemo aut. Fugit commodi doloremque numquam error aliquam eos labore consequatur. Expedita qui reiciendis debitis quasi.',8.00,9,'1975-04-29 03:56:27','1975-03-12 13:41:34'),(40,'ex','Est dolor ut impedit. Ut vel non reprehenderit quas. Et dolorum consequatur unde aperiam sunt suscipit qui doloribus. Dolore id voluptatibus voluptate quod dolores voluptates ipsum.',7.00,10,'1980-04-29 07:30:23','2006-04-10 13:47:18'),(41,'non','Cumque rerum architecto at at suscipit aut ullam dicta. Quo adipisci nesciunt commodi. Mollitia a nihil accusantium eius nemo et suscipit. In sed blanditiis inventore commodi minima aut cupiditate.',6.00,1,'2004-06-29 11:32:21','2021-03-17 16:44:05'),(42,'repellat','Dolor rerum sapiente et eum doloremque modi. Et omnis eos unde autem accusamus accusamus mollitia velit. Vero qui quo sint ea facere. Quia qui fugiat aut non in.',1.00,2,'1996-09-08 04:53:27','2012-10-28 21:28:48'),(43,'incidunt','Aspernatur officia voluptas quasi cum veniam voluptatum. Sed qui in voluptatem. Pariatur et ut corporis. Magni deserunt est earum ad sunt ad id. Nobis voluptatem doloremque saepe cupiditate.',3.00,3,'2016-07-23 11:52:36','2016-04-03 11:35:29'),(44,'aut','Aliquam ipsum eum ducimus voluptatem vitae et. Omnis sint et enim dolores dolorum deserunt odio. Eum voluptas ut maxime voluptas nihil. Voluptatem in repudiandae et earum qui illum.',2.00,4,'2005-11-22 11:11:16','1971-10-30 19:26:24'),(45,'rem','Velit dolor rerum quis et alias vitae. Aliquid natus qui minus excepturi. Dolores aliquam ducimus aut dolorum in autem at aut.',6.00,5,'1972-03-01 23:25:53','1979-12-31 02:07:28'),(46,'nostrum','Et cupiditate amet exercitationem voluptas placeat hic officiis. Nobis inventore id est molestias laudantium ut. Quia cumque et laborum qui. At odio quam quia velit repellat.',6.00,6,'1972-11-02 19:21:13','1992-03-29 15:05:04'),(47,'adipisci','Aut debitis cupiditate voluptatem asperiores eos. Eos tempora sequi unde nihil eum at. Ab nisi delectus asperiores sit quia tenetur. Error voluptatum culpa non blanditiis.',8.00,7,'2009-10-31 01:00:00','1994-01-15 03:28:30'),(48,'pariatur','Veritatis saepe dignissimos veniam consequatur rerum. Aut vero iste quo commodi molestiae. Adipisci nihil unde non itaque distinctio.',8.00,8,'2002-05-07 05:05:25','2015-09-13 23:18:23'),(49,'sit','Tempora et consequatur eos sequi. Veritatis ut saepe nesciunt quod et fugit. Esse fugit dolores laborum dolorem quia reprehenderit.',6.00,9,'1977-02-18 21:56:43','1982-04-14 17:01:07'),(50,'ut','Qui quia quas perspiciatis quibusdam corrupti. Exercitationem quos corrupti consequatur aut impedit corporis nemo natus. Minima est reprehenderit mollitia.',4.00,10,'1992-11-24 05:05:29','1980-09-17 20:22:21'),(51,'repellat','Cum similique ratione veniam corporis. Qui architecto at consequatur consequatur est magni et. Nihil sequi quisquam non suscipit praesentium. Quo est architecto pariatur corrupti.',9.00,1,'2004-07-25 03:23:27','1986-10-28 06:55:19'),(52,'temporibus','Vel nisi esse similique et officiis non. Numquam vel et et. Recusandae consectetur atque quaerat officiis eos quidem repudiandae eos.',4.00,2,'1996-10-28 13:11:29','1991-05-28 03:24:09'),(53,'consequatur','Voluptatem voluptates atque corporis ut architecto tempore esse. Incidunt velit nesciunt aliquid consectetur reiciendis dolorem ut quas. Reiciendis tenetur debitis non deserunt maiores impedit accusamus.',5.00,3,'1984-12-10 04:47:39','1973-12-03 19:22:38'),(54,'nobis','Quaerat voluptas quisquam aut magni. Velit doloremque laborum ratione aut tempore non nulla. Possimus enim voluptatem omnis provident. Rerum autem consequatur minima ipsam. Qui voluptates eveniet rerum assumenda.',4.00,4,'2013-05-07 09:17:09','1988-11-01 05:08:13'),(55,'fuga','Possimus sed dicta corporis illum ut. Debitis deleniti sed quisquam dolorem aut totam consectetur. Et error error incidunt vero.',6.00,5,'2003-02-16 17:53:24','2003-02-11 12:21:30'),(56,'fugiat','Voluptatem similique ut ut molestias. Quam a sit est velit officia optio sequi pariatur. Ullam impedit est quo.',8.00,6,'2007-03-15 22:01:14','2017-01-01 02:43:05'),(57,'nesciunt','Voluptatem dolor architecto consequatur est. Sit tenetur corrupti sint maxime commodi et. Vitae nisi nemo consectetur aut. Ut consequuntur molestias dolores in cumque non quia.',2.00,7,'2005-12-19 08:15:29','2018-02-28 14:49:03'),(58,'sequi','Illum et quae perferendis quisquam. Natus magni ad nihil et enim ut. Ut consequatur ratione alias est nam sunt.',6.00,8,'2011-06-09 10:07:33','2011-03-22 01:18:07'),(59,'tempore','Quo a nihil perferendis quia facere. Praesentium fugit iure eos quisquam minima fugiat. Aperiam in provident tempore consequatur tempore aperiam. Odit voluptatum id ut ipsa explicabo. Expedita quam quos eum explicabo culpa id.',3.00,9,'1978-08-19 07:06:19','1992-08-22 14:34:37'),(60,'accusantium','Quaerat nulla debitis aut reprehenderit eum nisi ullam. Vel perferendis omnis voluptatem minima cupiditate dolorem. Consequuntur voluptas reiciendis incidunt recusandae. Occaecati ullam assumenda minima recusandae et quia esse.',4.00,10,'1997-04-16 20:44:51','1990-03-23 09:03:15');
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `storehouses`
--

DROP TABLE IF EXISTS `storehouses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `storehouses` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'nazvanie',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='sklady';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `storehouses`
--

LOCK TABLES `storehouses` WRITE;
/*!40000 ALTER TABLE `storehouses` DISABLE KEYS */;
INSERT INTO `storehouses` VALUES (1,'qui','1990-10-31 01:29:59','1994-09-23 11:05:35'),(2,'vitae','1988-10-20 20:56:11','2021-06-29 07:54:52'),(3,'doloremque','1981-10-25 01:42:04','1987-11-29 10:26:16'),(4,'qui','1981-12-16 04:05:44','1987-09-25 19:31:44'),(5,'quasi','1999-10-25 02:30:34','2002-07-05 16:31:45');
/*!40000 ALTER TABLE `storehouses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `storehouses_products`
--

DROP TABLE IF EXISTS `storehouses_products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `storehouses_products` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `product_id` bigint unsigned DEFAULT NULL,
  `storehous_id` bigint unsigned DEFAULT NULL,
  `value` bigint unsigned DEFAULT NULL COMMENT 'zapasi',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `fk_storehouses_products_product_id` (`product_id`),
  KEY `fk_storehouses_products_storehous_id` (`storehous_id`),
  CONSTRAINT `fk_storehouses_products_product_id` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`),
  CONSTRAINT `fk_storehouses_products_storehous_id` FOREIGN KEY (`storehous_id`) REFERENCES `storehouses` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='zapasi na sklade';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `storehouses_products`
--

LOCK TABLES `storehouses_products` WRITE;
/*!40000 ALTER TABLE `storehouses_products` DISABLE KEYS */;
INSERT INTO `storehouses_products` VALUES (1,1,1,2,'2011-05-07 16:26:53','1972-07-19 04:31:51'),(2,2,2,2,'2000-08-04 09:47:16','1984-07-08 13:41:17'),(3,3,3,0,'1993-01-12 21:54:59','1976-04-18 04:54:43'),(4,4,4,1,'1995-08-27 00:41:02','1974-11-26 07:53:57'),(5,5,5,5,'1982-09-11 06:38:40','2009-04-16 21:40:59'),(6,6,1,1,'1990-10-06 01:20:00','2019-02-08 13:52:50'),(7,7,2,5,'1984-12-14 06:46:13','2001-09-13 21:53:50'),(8,8,3,8,'2016-03-26 12:35:57','1991-06-07 05:38:08'),(9,9,4,6,'1986-02-02 10:39:10','2009-11-16 03:45:27'),(10,10,5,8,'2021-03-21 12:05:39','1991-11-24 00:54:14'),(11,11,1,8,'2001-10-24 19:29:41','1984-01-24 01:14:38'),(12,12,2,8,'2003-08-09 09:53:55','1976-11-19 19:23:15'),(13,13,3,1,'1978-05-01 19:52:34','1975-07-16 19:30:14'),(14,14,4,7,'1984-10-01 04:19:02','1976-07-04 02:48:54'),(15,15,5,7,'2005-05-15 13:41:15','1988-02-10 12:30:42'),(16,16,1,0,'1996-04-07 08:51:08','1985-03-22 16:12:05'),(17,17,2,4,'2005-05-12 21:15:14','1976-10-12 11:22:56'),(18,18,3,6,'1982-02-26 17:30:05','1974-07-06 12:03:36'),(19,19,4,7,'1995-08-10 08:25:45','1973-07-29 18:59:08'),(20,20,5,3,'2015-04-02 08:24:38','2018-01-17 01:08:05'),(21,21,1,0,'2010-05-29 03:06:45','1977-08-27 00:32:03'),(22,22,2,1,'2015-12-10 02:57:51','1978-11-09 00:07:00'),(23,23,3,4,'1994-03-16 09:07:44','2020-11-16 06:25:01'),(24,24,4,6,'1996-06-08 22:15:11','1977-04-01 21:47:54'),(25,25,5,2,'1992-02-13 12:36:48','1988-12-20 18:29:48'),(26,26,1,5,'1979-03-14 06:08:24','1984-04-19 15:01:10'),(27,27,2,0,'2017-08-01 17:09:54','1988-10-16 10:04:37'),(28,28,3,8,'1974-09-22 04:03:09','1974-06-22 04:13:25'),(29,29,4,5,'2004-11-14 13:58:51','1983-08-31 21:56:08'),(30,30,5,3,'2005-09-27 06:51:08','2007-02-08 06:47:02'),(31,31,1,0,'2015-01-19 01:10:44','1990-01-04 17:40:56'),(32,32,2,3,'1996-05-16 21:16:07','2005-03-16 05:11:52'),(33,33,3,6,'1976-11-21 02:34:00','1988-09-10 13:40:39'),(34,34,4,6,'1995-05-26 19:09:00','2017-06-10 12:23:51'),(35,35,5,0,'2008-05-06 12:29:27','1987-03-04 10:45:26'),(36,36,1,5,'2004-05-03 18:44:30','2020-10-09 19:32:59'),(37,37,2,5,'2014-10-27 08:09:39','1970-10-24 13:03:49'),(38,38,3,0,'2007-03-12 22:04:29','2016-06-20 16:27:00'),(39,39,4,7,'2015-07-11 16:43:38','1977-11-18 19:29:21'),(40,40,5,9,'2015-01-05 12:12:29','1973-08-26 01:24:38'),(41,41,1,8,'1993-08-22 18:07:28','1973-01-14 18:33:15'),(42,42,2,6,'1979-05-31 19:39:06','2006-05-19 01:32:34'),(43,43,3,1,'2000-12-12 15:55:37','2001-08-06 01:10:56'),(44,44,4,2,'1973-11-24 21:31:11','2001-12-10 18:54:40'),(45,45,5,0,'1997-10-07 06:58:35','1996-04-27 01:14:04'),(46,46,1,7,'1977-03-27 20:20:14','1979-12-07 11:44:09'),(47,47,2,8,'1988-07-26 23:53:37','1972-02-25 07:41:11'),(48,48,3,8,'1970-02-27 04:27:50','1986-05-25 05:09:15'),(49,49,4,9,'2012-02-23 22:49:17','1996-07-17 00:23:33'),(50,50,5,7,'1976-07-10 03:09:18','1996-12-26 17:11:56'),(51,51,1,9,'1970-04-21 10:44:49','1973-12-06 14:22:23'),(52,52,2,0,'1992-02-28 08:25:09','1997-09-22 14:44:13'),(53,53,3,0,'1981-02-04 19:57:03','2020-06-23 04:24:10'),(54,54,4,6,'2008-09-03 04:29:14','2002-10-09 10:28:00'),(55,55,5,6,'2005-12-10 02:30:55','1970-02-05 01:07:33'),(56,56,1,6,'2019-05-08 01:40:08','2009-05-13 17:09:42'),(57,57,2,9,'1986-02-05 11:01:10','1979-11-26 04:13:54'),(58,58,3,7,'1989-03-13 11:35:46','1979-05-27 23:23:05'),(59,59,4,1,'1970-01-28 23:43:15','1973-12-30 23:32:39'),(60,60,5,3,'1984-05-12 09:22:38','2013-02-18 10:18:10');
/*!40000 ALTER TABLE `storehouses_products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `first_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'imya pokupatelya',
  `last_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'imya pokupatelya',
  `birthday_at` date DEFAULT NULL COMMENT 'data rozhdenia',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='pocupateli';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Marcelino','Wisozk','1986-12-12','1987-07-31 19:37:56','1997-04-30 04:39:27'),(2,'Earnest','Bednar','2015-04-04','2020-03-03 08:58:53','2021-07-17 06:32:40'),(3,'Penelope','Bogisich','1985-10-09','1999-07-12 10:42:40','2007-02-05 18:47:38'),(4,'Jan','Stracke','1970-11-07','1978-09-23 00:02:42','1993-11-13 07:46:18'),(5,'Marlee','Abernathy','1980-05-01','2009-04-19 15:00:46','2013-11-27 02:26:55'),(6,'Godfrey','Stroman','2000-10-16','2005-05-28 00:16:55','2016-11-26 23:55:58'),(7,'Earnest','Champlin','1986-01-17','2008-12-28 10:41:25','2011-01-21 22:45:05'),(8,'Kathlyn','Jaskolski','2000-02-25','2012-03-10 01:18:15','2014-04-24 14:20:26'),(9,'Keyon','Bahringer','1984-06-21','1996-04-27 16:49:20','2007-01-07 08:23:18'),(10,'Caleigh','Cartwright','1977-11-04','1985-10-04 16:52:21','2015-04-14 21:01:20'),(11,'Derick','Crooks','2002-01-16','2011-03-05 17:54:23','2019-09-17 16:57:01'),(12,'Josiah','Botsford','1981-07-22','1999-01-03 07:52:22','2019-07-14 15:53:22'),(13,'Annabell','Bahringer','1976-03-19','2001-09-09 16:46:44','2011-05-05 04:47:29'),(14,'Jaiden','Kihn','1995-11-18','1999-06-19 07:42:16','2014-04-27 12:39:53'),(15,'Yessenia','Kuvalis','2007-11-19','2009-07-28 12:24:21','2010-04-10 16:43:53'),(16,'Rashawn','Kunze','1979-07-02','1985-03-22 12:24:07','1995-08-09 10:33:20'),(17,'Johathan','Volkman','2000-02-09','2009-08-22 02:41:02','2012-02-21 12:14:53'),(18,'Barton','Quitzon','1993-11-09','1999-05-29 15:41:54','1999-07-16 20:53:13'),(19,'Shany','Becker','1985-11-05','1977-12-04 04:23:24','1996-02-15 21:50:19'),(20,'Lukas','Kshlerin','2010-11-18','2011-05-23 23:44:30','2016-03-18 04:24:35');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-07-29 22:50:52
