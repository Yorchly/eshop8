-- MySQL dump 10.13  Distrib 5.7.22, for Linux (x86_64)
--
-- Host: localhost    Database: eshop8_development
-- ------------------------------------------------------
-- Server version	5.7.22-0ubuntu0.16.04.1

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
-- Table structure for table `cart_items`
--

DROP TABLE IF EXISTS `cart_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cart_items` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `program_id` int(11) DEFAULT NULL,
  `cart_id` int(11) DEFAULT NULL,
  `price` float DEFAULT NULL,
  `amount` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart_items`
--

LOCK TABLES `cart_items` WRITE;
/*!40000 ALTER TABLE `cart_items` DISABLE KEYS */;
/*!40000 ALTER TABLE `cart_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `carts`
--

DROP TABLE IF EXISTS `carts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `carts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `carts`
--

LOCK TABLES `carts` WRITE;
/*!40000 ALTER TABLE `carts` DISABLE KEYS */;
INSERT INTO `carts` VALUES (1,'2018-05-22 09:52:44','2018-05-22 09:52:44'),(2,'2018-05-22 10:47:05','2018-05-22 10:47:05'),(3,'2018-06-02 19:10:47','2018-06-02 19:10:47');
/*!40000 ALTER TABLE `carts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `developers`
--

DROP TABLE IF EXISTS `developers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `developers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `developers`
--

LOCK TABLES `developers` WRITE;
/*!40000 ALTER TABLE `developers` DISABLE KEYS */;
INSERT INTO `developers` VALUES (1,'Juan','2018-04-10 09:55:31','2018-04-10 09:55:31'),(2,'Antonio','2018-04-10 09:55:31','2018-04-10 09:55:31'),(3,'Fernando','2018-04-10 09:55:31','2018-04-10 09:55:31'),(4,'Mario','2018-04-10 09:55:31','2018-04-10 09:55:31'),(5,'Pedro','2018-04-10 09:55:31','2018-04-10 09:55:31'),(6,'Andrea','2018-04-10 09:55:31','2018-04-10 09:55:31'),(7,'Fátima','2018-04-10 09:55:31','2018-04-10 09:55:31'),(8,'Esteban','2018-04-10 09:55:31','2018-04-10 09:55:31'),(9,'Lucía','2018-04-10 09:55:31','2018-04-10 09:55:31'),(10,'Ángel','2018-04-10 09:55:31','2018-04-10 09:55:31'),(11,'José','2018-04-10 09:55:31','2018-04-10 09:55:31'),(12,'Nuria','2018-04-10 09:55:31','2018-04-10 09:55:31'),(13,'Esther','2018-04-10 09:55:31','2018-04-10 09:55:31'),(14,'Elena','2018-04-10 09:55:31','2018-04-10 09:55:31');
/*!40000 ALTER TABLE `developers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_items`
--

DROP TABLE IF EXISTS `order_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order_items` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `program_id` int(11) DEFAULT NULL,
  `order_id` int(11) DEFAULT NULL,
  `price` float DEFAULT NULL,
  `amount` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_order_items_orders` (`order_id`),
  CONSTRAINT `fk_order_items_orders` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_items`
--

LOCK TABLES `order_items` WRITE;
/*!40000 ALTER TABLE `order_items` DISABLE KEYS */;
INSERT INTO `order_items` VALUES (1,8,1,20,1,'2018-05-22 11:00:53','2018-05-22 11:00:53'),(2,7,1,0,1,'2018-05-22 11:00:53','2018-05-22 11:00:53'),(3,8,2,20,1,'2018-05-22 11:01:03','2018-05-22 11:01:03'),(4,7,2,0,1,'2018-05-22 11:01:03','2018-05-22 11:01:03'),(5,8,3,20,1,'2018-05-22 11:01:36','2018-05-22 11:01:36'),(6,7,3,0,1,'2018-05-22 11:01:36','2018-05-22 11:01:36'),(7,8,4,20,1,'2018-05-22 11:01:54','2018-05-22 11:01:54'),(8,7,4,0,1,'2018-05-22 11:01:54','2018-05-22 11:01:54'),(9,8,5,20,1,'2018-05-22 11:02:06','2018-05-22 11:02:06'),(10,7,5,0,1,'2018-05-22 11:02:06','2018-05-22 11:02:06'),(11,8,6,20,1,'2018-05-22 11:02:21','2018-05-22 11:02:21'),(12,7,6,0,1,'2018-05-22 11:02:21','2018-05-22 11:02:21');
/*!40000 ALTER TABLE `order_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone_number` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ship_to_first_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ship_to_last_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ship_to_address` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ship_to_city` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ship_to_postal_code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ship_to_country_code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `customer_ip` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `error_message` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (1,'prueba@gmail.com','548487484','hola','hola','hola','hola','11010','ES','127.0.0.1','failed','Tarjeta de credito no válida','2018-05-22 11:00:53','2018-05-22 11:00:54'),(2,'prueba@gmail.com','548487484','hola','hola','hola','hola','11010','ES','127.0.0.1','failed','Tarjeta de credito no válida','2018-05-22 11:01:03','2018-05-22 11:01:03'),(3,'prueba@gmail.com','548487484','hola','hola','hola','hola','11010','ES','127.0.0.1','failed','Tarjeta de credito no válida','2018-05-22 11:01:36','2018-05-22 11:01:36'),(4,'prueba@gmail.com','548487484','hola','hola','hola','hola','11010','ES','127.0.0.1','failed','Tarjeta de credito no válida','2018-05-22 11:01:54','2018-05-22 11:01:54'),(5,'prueba@gmail.com','548487484','hola','hola','hola','hola','11010','ES','127.0.0.1','failed','Tarjeta de credito no válida','2018-05-22 11:02:06','2018-05-22 11:02:06'),(6,'prueba@gmail.com','548487484','hola','hola','hola','hola','11010','ES','127.0.0.1','processed',NULL,'2018-05-22 11:02:21','2018-05-22 11:02:23');
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `programs`
--

DROP TABLE IF EXISTS `programs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `programs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `kind` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `developer_id` int(11) NOT NULL,
  `developed_at` datetime DEFAULT NULL,
  `serial_number` varchar(5) COLLATE utf8_unicode_ci DEFAULT NULL,
  `blurb` text COLLATE utf8_unicode_ci,
  `price` float DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `cover_image_file_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cover_image_content_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cover_image_file_size` int(11) DEFAULT NULL,
  `cover_image_updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_programs_developers` (`developer_id`),
  CONSTRAINT `fk_programs_developers` FOREIGN KEY (`developer_id`) REFERENCES `developers` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `programs`
--

LOCK TABLES `programs` WRITE;
/*!40000 ALTER TABLE `programs` DISABLE KEYS */;
INSERT INTO `programs` VALUES (1,'Skype','De Pago',5,'2018-05-15 08:03:00','110','Llamadas',90,'2018-04-10 09:55:31','2018-04-10 09:55:31',NULL,NULL,NULL,NULL),(2,'Azure','De Pago',6,'2018-05-15 08:03:00','111','Sistemas Operativos',290,'2018-04-10 09:55:31','2018-04-10 09:55:31',NULL,NULL,NULL,NULL),(3,'Spotify','De Pago',7,'2018-05-15 08:03:00','210','Música',10,'2018-04-10 09:55:31','2018-04-10 09:55:31',NULL,NULL,NULL,NULL),(4,'Webmin','Software Libre',8,'2018-05-15 08:03:00','110','Administración de servidores',0,'2018-04-10 09:55:31','2018-04-10 09:55:31',NULL,NULL,NULL,NULL),(5,'Nmap','Software Libre',9,'2018-05-15 08:03:00','134','Escáner de puertos',0,'2018-04-10 09:55:31','2018-04-10 09:55:31',NULL,NULL,NULL,NULL),(6,'Whatsapp','De Pago',5,'2018-05-15 08:03:00','220','Chats',1,'2018-04-10 09:55:31','2018-04-10 09:55:31',NULL,NULL,NULL,NULL),(7,'Sublime Text','Gratuito',6,'2018-05-15 08:03:00','880','Editor de texto',0,'2018-04-10 09:55:31','2018-04-10 09:55:31',NULL,NULL,NULL,NULL),(8,'SQLPlus','De Pago',7,'2018-05-15 08:03:00','998','Llamadas',20,'2018-04-10 09:55:31','2018-04-10 09:55:31',NULL,NULL,NULL,NULL),(9,'Linux Mint','Sistema Operativo',14,'2018-06-02 19:15:00','12345','Esto es una descripcion para el Sistema Operativo Linux Mint.',20,'2018-06-02 19:17:40','2018-06-02 19:17:40',NULL,NULL,NULL,NULL),(10,'Windows 10','Sistema Operativo',13,'2018-06-02 19:35:00','15874','Hola',180,'2018-06-02 19:35:56','2018-06-02 19:35:56','windows10.png','image/png',7554,'2018-06-02 19:35:56');
/*!40000 ALTER TABLE `programs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `programs_suppliers`
--

DROP TABLE IF EXISTS `programs_suppliers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `programs_suppliers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `supplier_id` int(11) NOT NULL,
  `program_id` int(11) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_programs_suppliers_suppliers` (`supplier_id`),
  KEY `fk_programs_suppliers_programs` (`program_id`),
  CONSTRAINT `fk_programs_suppliers_programs` FOREIGN KEY (`program_id`) REFERENCES `programs` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_programs_suppliers_suppliers` FOREIGN KEY (`supplier_id`) REFERENCES `suppliers` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `programs_suppliers`
--

LOCK TABLES `programs_suppliers` WRITE;
/*!40000 ALTER TABLE `programs_suppliers` DISABLE KEYS */;
INSERT INTO `programs_suppliers` VALUES (1,21,9,'2018-06-02 19:17:40','2018-06-02 19:17:40'),(2,4,10,'2018-06-02 19:35:56','2018-06-02 19:35:56'),(3,19,10,'2018-06-02 19:35:56','2018-06-02 19:35:56'),(4,20,10,'2018-06-02 19:35:56','2018-06-02 19:35:56'),(5,21,10,'2018-06-02 19:35:56','2018-06-02 19:35:56');
/*!40000 ALTER TABLE `programs_suppliers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `schema_migrations`
--

DROP TABLE IF EXISTS `schema_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `schema_migrations` (
  `version` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  UNIQUE KEY `unique_schema_migrations` (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schema_migrations`
--

LOCK TABLES `schema_migrations` WRITE;
/*!40000 ALTER TABLE `schema_migrations` DISABLE KEYS */;
INSERT INTO `schema_migrations` VALUES ('20180320095142'),('20180410094720'),('20180417101221'),('20180420142034'),('20180508084333'),('20180508084343'),('20180508102301'),('20180508102306'),('20180515094847');
/*!40000 ALTER TABLE `schema_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `suppliers`
--

DROP TABLE IF EXISTS `suppliers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `suppliers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `last_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `suppliers`
--

LOCK TABLES `suppliers` WRITE;
/*!40000 ALTER TABLE `suppliers` DISABLE KEYS */;
INSERT INTO `suppliers` VALUES (1,'David','Beckham','2018-04-10 09:55:31','2018-04-10 09:55:31'),(2,'Raúl','González','2018-04-10 09:55:31','2018-04-10 09:55:31'),(3,'Gareth','Bale','2018-04-10 09:55:31','2018-04-10 09:55:31'),(4,'Cristiano','Ronaldo','2018-04-10 09:55:31','2018-04-10 09:55:31'),(5,'Leo','Messi','2018-04-10 09:55:31','2018-04-10 09:55:31'),(6,'Andrés','Iniesta','2018-04-10 09:55:31','2018-04-10 09:55:31'),(7,'Eva','Hache','2018-04-10 09:55:31','2018-04-10 09:55:31'),(8,'Marie','Curie','2018-04-10 09:55:31','2018-04-10 09:55:31'),(9,'Christopher','MacCandless','2018-04-10 09:55:31','2018-04-10 09:55:31'),(10,'Paula','Echevarría','2018-04-10 09:55:31','2018-04-10 09:55:31'),(11,'Óscar','de Paula','2018-04-10 09:55:31','2018-04-10 09:55:31'),(12,'Ted','Mosby','2018-04-10 09:55:31','2018-04-10 09:55:31'),(13,'Barney','Stinson','2018-04-10 09:55:31','2018-04-10 09:55:31'),(14,'Robin','Scherbatsky','2018-04-10 09:55:31','2018-04-10 09:55:31'),(15,'Lily','Aldrin','2018-04-10 09:55:31','2018-04-10 09:55:31'),(16,'Tommy','Shelby','2018-04-10 09:55:31','2018-04-10 09:55:31'),(17,'Ross','Geller','2018-06-02 19:13:10','2018-06-02 19:13:10'),(18,'Chandler','Bing','2018-06-02 19:13:44','2018-06-02 19:13:44'),(19,'Mónica ','Geller','2018-06-02 19:13:57','2018-06-02 19:13:57'),(20,'Rachel','Green','2018-06-02 19:14:09','2018-06-02 19:14:09'),(21,'Joey','Tribbiani','2018-06-02 19:14:31','2018-06-02 19:14:31'),(22,'Phoebe ','Buffay','2018-06-02 19:14:53','2018-06-02 19:14:53');
/*!40000 ALTER TABLE `suppliers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `login` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `crypted_password` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `password_salt` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `persistence_token` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `perishable_token` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `login_count` int(11) NOT NULL DEFAULT '0',
  `failed_login_count` int(11) NOT NULL DEFAULT '0',
  `last_request_at` datetime DEFAULT NULL,
  `current_login_at` datetime DEFAULT NULL,
  `last_login_at` datetime DEFAULT NULL,
  `current_login_ip` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `last_login_ip` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'admin','admin','admin@admin.com','400$8$36$59eec69564ab2354$14b3d93bcaf7db9549f7fa19e8158886171cdf6e976368a5f4a1c643ec16d89c','Vg2XiJCG3jXjXOLJQ22','d3871c082873113d78271c1d6e8be89304ac16969dd15f1d4bb4d4dd98195dd4569f1733666df41b862f5fe550a7e9e479d78b8343c12ffdb82b90251841c238','fXOA6EEPv3GBhdL0X',4,0,'2018-06-02 19:37:54','2018-06-02 19:35:11','2018-06-02 19:11:05','127.0.0.1','127.0.0.1','2018-05-22 10:47:37','2018-06-02 19:37:54');
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

-- Dump completed on 2018-06-02 21:44:08
