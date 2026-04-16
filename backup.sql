-- MySQL dump 10.13  Distrib 8.0.40, for Win64 (x86_64)
--
-- Host: localhost    Database: canteen_backend
-- ------------------------------------------------------
-- Server version	8.0.40

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
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add user',4,'add_user'),(14,'Can change user',4,'change_user'),(15,'Can delete user',4,'delete_user'),(16,'Can view user',4,'view_user'),(17,'Can add content type',5,'add_contenttype'),(18,'Can change content type',5,'change_contenttype'),(19,'Can delete content type',5,'delete_contenttype'),(20,'Can view content type',5,'view_contenttype'),(21,'Can add session',6,'add_session'),(22,'Can change session',6,'change_session'),(23,'Can delete session',6,'delete_session'),(24,'Can view session',6,'view_session'),(25,'Can add Blacklisted Token',7,'add_blacklistedtoken'),(26,'Can change Blacklisted Token',7,'change_blacklistedtoken'),(27,'Can delete Blacklisted Token',7,'delete_blacklistedtoken'),(28,'Can view Blacklisted Token',7,'view_blacklistedtoken'),(29,'Can add Outstanding Token',8,'add_outstandingtoken'),(30,'Can change Outstanding Token',8,'change_outstandingtoken'),(31,'Can delete Outstanding Token',8,'delete_outstandingtoken'),(32,'Can view Outstanding Token',8,'view_outstandingtoken'),(33,'Can add canteen',9,'add_canteen'),(34,'Can change canteen',9,'change_canteen'),(35,'Can delete canteen',9,'delete_canteen'),(36,'Can view canteen',9,'view_canteen'),(37,'Can add product',10,'add_product'),(38,'Can change product',10,'change_product'),(39,'Can delete product',10,'delete_product'),(40,'Can view product',10,'view_product'),(41,'Can add menu',11,'add_menu'),(42,'Can change menu',11,'change_menu'),(43,'Can delete menu',11,'delete_menu'),(44,'Can view menu',11,'view_menu'),(45,'Can add order item',12,'add_orderitem'),(46,'Can change order item',12,'change_orderitem'),(47,'Can delete order item',12,'delete_orderitem'),(48,'Can view order item',12,'view_orderitem'),(49,'Can add order',13,'add_order'),(50,'Can change order',13,'change_order'),(51,'Can delete order',13,'delete_order'),(52,'Can view order',13,'view_order'),(53,'Can add cart item',14,'add_cartitem'),(54,'Can change cart item',14,'change_cartitem'),(55,'Can delete cart item',14,'delete_cartitem'),(56,'Can view cart item',14,'view_cartitem');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (7,'pbkdf2_sha256$1000000$Bs4W6CKFQ5hjssd4satC2Z$6vX1T/W0qH9xnbn6bsCg/etNaLAtwlKUGOjiGqPIVqE=',NULL,0,'Hari','','','harisenthil13@outlook.com',0,1,'2025-09-21 06:22:56.270884'),(8,'pbkdf2_sha256$1000000$jCENgsnFcLz3LgPRKiNaje$x5qhYtFK9rJ/Z5ebTR6LOdfi5XuiYsBh/brjU1NfRYY=',NULL,0,'deepak','','','deepak@gmail.com',0,1,'2025-09-21 06:28:45.301180'),(9,'pbkdf2_sha256$1000000$IPZpkOp4x917tpTipRIlA9$Pw38pbd2tK71iibUDFcIMQtVVYzKPuX2XBjqPLgA6YY=',NULL,0,'Sandeep','','','sandeep@gmail.com',0,1,'2025-09-22 05:36:58.082707'),(10,'pbkdf2_sha256$1000000$wzWOT9IyY22WmcS1PKCsIh$uzvPummg2o8obFaaAGwF44GI7G6wrX13zku/Hi1el8A=',NULL,0,'Abishek','','','abishek@gmail.com',0,1,'2025-09-22 06:23:24.513652'),(11,'pbkdf2_sha256$1000000$A9RopdChdAqR0BkjS0kDnT$Ft95CoCHPWCvekZAW6IJRfdvI5vs/Ih+vu7BBJ3c3D4=',NULL,0,'sriram','','','sriram@gmail.com',0,1,'2025-09-22 06:27:06.930246'),(12,'pbkdf2_sha256$1000000$Boc1PMxQGkigq4yR9na8gK$Vi+YFJBcD1V8kppSntqYW5W3ltnfoF0QqAhEzBkCwa0=',NULL,0,'logesh','','','logesh@gmail.com',0,1,'2025-09-22 06:33:40.710880'),(13,'pbkdf2_sha256$1000000$f8VHYEXsbmONgMhg5Q1tYz$bmMQ/UAkcC7Y0UBs18t4d7gRgZnHN+airKekUOpXUvM=',NULL,0,'sri','','','sri@gmail.com',0,1,'2025-09-22 06:36:18.174939'),(14,'pbkdf2_sha256$1000000$xb6cN18osKDUwEdcQOX6ox$Hmf4JB4wt7Wwh67EPdLvM5GuUXBJXa8dY7pP8X09pTM=',NULL,0,'admin','','','admin@gmail.com',0,1,'2025-09-22 06:37:58.103893'),(15,'pbkdf2_sha256$1000000$yL26rhTB1wsrTFVLjStCwv$FwKwzr9prkreaYxIRnBSjFEeneJOdY7DlL3Kq8QR7EI=',NULL,0,'guest','','','guest@gmail.com',0,1,'2025-09-22 06:45:00.718979'),(16,'pbkdf2_sha256$1000000$JHhH6EjUemRWjcfD61yv6F$aHBm6X917w5cktZciieomNlaZfacr70kb3vCzoR2+Rc=',NULL,0,'krish','','','krish@gmail.com',0,1,'2025-09-22 06:45:48.394939'),(17,'pbkdf2_sha256$1000000$GArjFheK8vEBNjPUmQH1Ct$w3dxng9w9sU5xv0kKwFolKaVFylwN2mcCEwGa6lCg64=',NULL,0,'yogesh','','','yogesh@gmail.com',0,1,'2025-09-22 07:24:51.862504'),(18,'pbkdf2_sha256$1000000$xMbt4s9jGjWyNSiK8S75Wz$QN1FCOBJYP1OD1fqc1fTxJzH1a8BWFWBdc0xew8zzgk=',NULL,0,'janarth','','','janarth@gmail.com',0,1,'2025-09-22 09:10:50.079316');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_groups` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `canteen_backend_canteen`
--

DROP TABLE IF EXISTS `canteen_backend_canteen`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `canteen_backend_canteen` (
  `id` char(32) NOT NULL,
  `name` varchar(100) NOT NULL,
  `location` varchar(200) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `canteen_backend_canteen`
--

LOCK TABLES `canteen_backend_canteen` WRITE;
/*!40000 ALTER TABLE `canteen_backend_canteen` DISABLE KEYS */;
INSERT INTO `canteen_backend_canteen` VALUES ('24c1a6a4d9f9426fa0eb8e30b7a86ce5','Main Canteen (SOPANAM)','Near AB1'),('6dedf4923b4143c1b40ee7d5cd4e7b97','IT Canteen','Near AB3'),('bc65894a103243c89b4978fce23ac6e0','MBA Canteen','Near Business School');
/*!40000 ALTER TABLE `canteen_backend_canteen` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `canteen_backend_menu`
--

DROP TABLE IF EXISTS `canteen_backend_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `canteen_backend_menu` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `stock` int unsigned NOT NULL,
  `canteen_id` char(32) NOT NULL,
  `product_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `Canteen_backend_menu_canteen_id_product_id_1629f0fb_uniq` (`canteen_id`,`product_id`),
  KEY `Canteen_backend_menu_product_id_d391bcde_fk_Canteen_b` (`product_id`),
  CONSTRAINT `Canteen_backend_menu_canteen_id_b53e0de5_fk_Canteen_b` FOREIGN KEY (`canteen_id`) REFERENCES `canteen_backend_canteen` (`id`),
  CONSTRAINT `Canteen_backend_menu_product_id_d391bcde_fk_Canteen_b` FOREIGN KEY (`product_id`) REFERENCES `canteen_backend_product` (`id`),
  CONSTRAINT `canteen_backend_menu_chk_1` CHECK ((`stock` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `canteen_backend_menu`
--

LOCK TABLES `canteen_backend_menu` WRITE;
/*!40000 ALTER TABLE `canteen_backend_menu` DISABLE KEYS */;
INSERT INTO `canteen_backend_menu` VALUES (1,50,'24c1a6a4d9f9426fa0eb8e30b7a86ce5',1),(2,30,'24c1a6a4d9f9426fa0eb8e30b7a86ce5',2),(3,20,'6dedf4923b4143c1b40ee7d5cd4e7b97',4),(4,25,'6dedf4923b4143c1b40ee7d5cd4e7b97',5),(5,15,'bc65894a103243c89b4978fce23ac6e0',6),(6,10,'bc65894a103243c89b4978fce23ac6e0',7);
/*!40000 ALTER TABLE `canteen_backend_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `canteen_backend_product`
--

DROP TABLE IF EXISTS `canteen_backend_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `canteen_backend_product` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `product_code` varchar(20) NOT NULL,
  `name` varchar(100) NOT NULL,
  `price` double NOT NULL,
  `type` varchar(50) NOT NULL,
  `url` varchar(300) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `product_code` (`product_code`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `canteen_backend_product`
--

LOCK TABLES `canteen_backend_product` WRITE;
/*!40000 ALTER TABLE `canteen_backend_product` DISABLE KEYS */;
INSERT INTO `canteen_backend_product` VALUES (1,'A001','Black Tea',15,'Beverages','https://images.pexels.com/photos/13032225/pexels-photo-13032225.jpeg'),(2,'A002','Black Coffee',15,'Beverages','https://images.pexels.com/photos/1627931/pexels-photo-1627931.jpeg'),(3,'A003','Black Boost',20,'Beverages','https://m.media-amazon.com/images/I/51+cuHopFsL.jpg'),(4,'A004','Veg Puffs',20,'Snacks','https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTLAGi1iKwDtgu-pTJJzutB0ZKUtO_O2hS_Sg&s'),(5,'A005','Egg Puffs',25,'Snacks','https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT0efCCOAs0Pg5S7SbI3Z4ACvYE1krAhurfvg&s'),(6,'A006','Plain Dosa',30,'Meals','https://cdn3.foodviva.com/static-content/food-images/south-indian-recipes/dosa-recipe/dosa-recipe.jpg'),(7,'A007','Masala Dosa',40,'Meals','https://t4.ftcdn.net/jpg/16/27/96/47/360_F_1627964740_eShNRJesWQ9oaEfOXHYRjXLT7pATobDZ.jpg');
/*!40000 ALTER TABLE `canteen_backend_product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_admin_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `django_admin_log_chk_1` CHECK ((`action_flag` >= 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_content_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(9,'Canteen_backend','canteen'),(14,'Canteen_backend','cartitem'),(11,'Canteen_backend','menu'),(13,'Canteen_backend','order'),(12,'Canteen_backend','orderitem'),(10,'Canteen_backend','product'),(5,'contenttypes','contenttype'),(6,'sessions','session'),(7,'token_blacklist','blacklistedtoken'),(8,'token_blacklist','outstandingtoken');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_migrations` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2025-09-20 17:55:25.242233'),(2,'auth','0001_initial','2025-09-20 17:55:25.907627'),(3,'admin','0001_initial','2025-09-20 17:55:26.083582'),(4,'admin','0002_logentry_remove_auto_add','2025-09-20 17:55:26.094529'),(5,'admin','0003_logentry_add_action_flag_choices','2025-09-20 17:55:26.106650'),(6,'contenttypes','0002_remove_content_type_name','2025-09-20 17:55:26.218015'),(7,'auth','0002_alter_permission_name_max_length','2025-09-20 17:55:26.306861'),(8,'auth','0003_alter_user_email_max_length','2025-09-20 17:55:26.339556'),(9,'auth','0004_alter_user_username_opts','2025-09-20 17:55:26.346312'),(10,'auth','0005_alter_user_last_login_null','2025-09-20 17:55:26.401814'),(11,'auth','0006_require_contenttypes_0002','2025-09-20 17:55:26.404886'),(12,'auth','0007_alter_validators_add_error_messages','2025-09-20 17:55:26.412313'),(13,'auth','0008_alter_user_username_max_length','2025-09-20 17:55:26.489730'),(14,'auth','0009_alter_user_last_name_max_length','2025-09-20 17:55:26.564681'),(15,'auth','0010_alter_group_name_max_length','2025-09-20 17:55:26.585102'),(16,'auth','0011_update_proxy_permissions','2025-09-20 17:55:26.593636'),(17,'auth','0012_alter_user_first_name_max_length','2025-09-20 17:55:26.665291'),(18,'sessions','0001_initial','2025-09-20 17:55:26.703894'),(19,'token_blacklist','0001_initial','2025-09-22 05:11:30.291225'),(20,'token_blacklist','0002_outstandingtoken_jti_hex','2025-09-22 05:11:30.323321'),(21,'token_blacklist','0003_auto_20171017_2007','2025-09-22 05:11:30.340828'),(22,'token_blacklist','0004_auto_20171017_2013','2025-09-22 05:11:30.426119'),(23,'token_blacklist','0005_remove_outstandingtoken_jti','2025-09-22 05:11:30.492007'),(24,'token_blacklist','0006_auto_20171017_2113','2025-09-22 05:11:30.516177'),(25,'token_blacklist','0007_auto_20171017_2214','2025-09-22 05:11:30.721307'),(26,'token_blacklist','0008_migrate_to_bigautofield','2025-09-22 05:11:30.994965'),(27,'token_blacklist','0010_fix_migrate_to_bigautofield','2025-09-22 05:11:31.006921'),(28,'token_blacklist','0011_linearizes_history','2025-09-22 05:11:31.010010'),(29,'token_blacklist','0012_alter_outstandingtoken_user','2025-09-22 05:11:31.020598'),(30,'token_blacklist','0013_alter_blacklistedtoken_options_and_more','2025-09-22 05:11:31.032638'),(37,'Canteen_backend','0001_initial','2025-09-25 14:36:34.675519');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `token_blacklist_blacklistedtoken`
--

DROP TABLE IF EXISTS `token_blacklist_blacklistedtoken`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `token_blacklist_blacklistedtoken` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `blacklisted_at` datetime(6) NOT NULL,
  `token_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `token_id` (`token_id`),
  CONSTRAINT `token_blacklist_blacklistedtoken_token_id_3cc7fe56_fk` FOREIGN KEY (`token_id`) REFERENCES `token_blacklist_outstandingtoken` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `token_blacklist_blacklistedtoken`
--

LOCK TABLES `token_blacklist_blacklistedtoken` WRITE;
/*!40000 ALTER TABLE `token_blacklist_blacklistedtoken` DISABLE KEYS */;
INSERT INTO `token_blacklist_blacklistedtoken` VALUES (1,'2025-09-22 05:36:09.459963',8),(2,'2025-09-22 05:37:02.672719',9),(3,'2025-09-22 05:48:08.354351',10),(4,'2025-09-22 05:50:50.658191',11),(5,'2025-09-22 05:54:13.484466',12),(6,'2025-09-22 06:02:22.914177',13),(7,'2025-09-22 06:04:55.716657',14),(8,'2025-09-22 06:08:36.612157',16),(9,'2025-09-22 06:09:50.241718',17),(10,'2025-09-22 06:10:13.899690',18),(11,'2025-09-22 06:23:49.119869',25),(12,'2025-09-22 06:31:16.555771',28),(13,'2025-09-22 06:41:15.287283',37),(14,'2025-09-22 06:45:22.086062',41),(15,'2025-09-22 06:45:54.305817',44),(16,'2025-09-22 07:25:05.668454',48),(17,'2025-09-22 09:11:01.453623',52);
/*!40000 ALTER TABLE `token_blacklist_blacklistedtoken` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `token_blacklist_outstandingtoken`
--

DROP TABLE IF EXISTS `token_blacklist_outstandingtoken`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `token_blacklist_outstandingtoken` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `token` longtext NOT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `expires_at` datetime(6) NOT NULL,
  `user_id` int DEFAULT NULL,
  `jti` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `token_blacklist_outstandingtoken_jti_hex_d9bdf6f7_uniq` (`jti`),
  KEY `token_blacklist_outs_user_id_83bc629a_fk_auth_user` (`user_id`),
  CONSTRAINT `token_blacklist_outs_user_id_83bc629a_fk_auth_user` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=58 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `token_blacklist_outstandingtoken`
--

LOCK TABLES `token_blacklist_outstandingtoken` WRITE;
/*!40000 ALTER TABLE `token_blacklist_outstandingtoken` DISABLE KEYS */;
INSERT INTO `token_blacklist_outstandingtoken` VALUES (1,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc1ODYwNTA3MywiaWF0IjoxNzU4NTE4NjczLCJqdGkiOiJlMDgyZWQyZjBhOTA0ZTA1ODhmZTFlZDA1OTE2OTdiMSIsInVzZXJfaWQiOiI3In0.esPRhXDabBc2Oh-4_rblWDy6pZVWI6E2RcWvjBlsrSo','2025-09-22 05:24:33.320292','2025-09-23 05:24:33.000000',7,'e082ed2f0a904e0588fe1ed0591697b1'),(2,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc1ODYwNTEzMCwiaWF0IjoxNzU4NTE4NzMwLCJqdGkiOiIxMzUwNzc3YjczNDQ0ODcyODY0OGMwMDYwNmViMTBlNyIsInVzZXJfaWQiOiI3In0.hKPMMyTd_1v3t9Sd95W3b80JfIuT0_4fUtSKmXzYxho','2025-09-22 05:25:30.186986','2025-09-23 05:25:30.000000',7,'1350777b734448728648c00606eb10e7'),(3,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc1ODYwNTMwNiwiaWF0IjoxNzU4NTE4OTA2LCJqdGkiOiI2MjljM2VmN2MwMjM0ZjNiOWY2OTNhOTIwMTU5ZGJjMCIsInVzZXJfaWQiOiI3In0.H7aAE0sirQZbiK4ajXl7qBYyMlmt02VjXtVCFEIqwuI','2025-09-22 05:28:26.117231','2025-09-23 05:28:26.000000',7,'629c3ef7c0234f3b9f693a920159dbc0'),(4,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc1ODYwNTQ5NiwiaWF0IjoxNzU4NTE5MDk2LCJqdGkiOiIzNjgxN2E2NTk4N2I0MTdkOWZiN2U5OWJiZjIxNGQyZCIsInVzZXJfaWQiOiI3In0.6e_dPWBeyHgTwi42gqNmTwhvlWAjO5Ra5jTaPq8rXCc','2025-09-22 05:31:36.258096','2025-09-23 05:31:36.000000',7,'36817a65987b417d9fb7e99bbf214d2d'),(5,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc1ODYwNTUzMCwiaWF0IjoxNzU4NTE5MTMwLCJqdGkiOiI0Y2E2Zjg2OGZmNDE0YWI1OTNhZTc3M2QzYzQ4OGMzOSIsInVzZXJfaWQiOiI3In0.Gi5cj4pUX0ZZdGS6Tj6kuwRd2RrV2bw95BeTa6AdgT8','2025-09-22 05:32:10.823465','2025-09-23 05:32:10.000000',7,'4ca6f868ff414ab593ae773d3c488c39'),(6,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc1ODYwNTY1NiwiaWF0IjoxNzU4NTE5MjU2LCJqdGkiOiI5NzFhNDYyNGY1YTc0MDJhYTZhZDgwN2M0MzcwYzY4ZiIsInVzZXJfaWQiOiI3In0.TU10X9sOB-r8vaYYxcSPNzv4hGfQwy_4xK0bBUhMpjQ','2025-09-22 05:34:16.597431','2025-09-23 05:34:16.000000',7,'971a4624f5a7402aa6ad807c4370c68f'),(7,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc1ODYwNTY4NywiaWF0IjoxNzU4NTE5Mjg3LCJqdGkiOiJkZDQ2NDIyZDRkZWU0YTkzYjlkMzVlMjVhNmU3MzUwNyIsInVzZXJfaWQiOiI3In0.QY1yXSWjoxNbOIoDzhOPmjl4xlIMpceHDu_M3vi9cGo','2025-09-22 05:34:47.050324','2025-09-23 05:34:47.000000',7,'dd46422d4dee4a93b9d35e25a6e73507'),(8,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc1ODYwNTc2NywiaWF0IjoxNzU4NTE5MzY3LCJqdGkiOiJlZGRhMjQzNWQ3MWQ0OTllOGJkY2JkYjJmMWVjZTEwMCIsInVzZXJfaWQiOiI3In0.kXRvvkyN9iS-CQF7FaAo4RRnvpWNz8Nj_E_Rrox132M','2025-09-22 05:36:07.683679','2025-09-23 05:36:07.000000',7,'edda2435d71d499e8bdcbdb2f1ece100'),(9,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc1ODYwNTgxOCwiaWF0IjoxNzU4NTE5NDE4LCJqdGkiOiIwZTU5OTYxOWE1MGU0ZThlYTE3NDQ0ZGEwMGViYTc2MyIsInVzZXJfaWQiOiI5In0.-JkrOroDOvc3xjEvvXBLAImlzpU_P0sUAUInLhu4uIo','2025-09-22 05:36:58.742321','2025-09-23 05:36:58.000000',9,'0e599619a50e4e8ea17444da00eba763'),(10,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc1ODYwNjQ4MywiaWF0IjoxNzU4NTIwMDgzLCJqdGkiOiI5MzRlNzhiZDA3Mjc0Y2VlOWM5Mzk5ZmFhMjQ0MTEwOCIsInVzZXJfaWQiOiI5In0.YCVdQ4CIeErmwm3RioeAgjTpsANuUj-QmNAfdQynVQo','2025-09-22 05:48:03.557851','2025-09-23 05:48:03.000000',9,'934e78bd07274cee9c9399faa2441108'),(11,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc1ODYwNjY0NiwiaWF0IjoxNzU4NTIwMjQ2LCJqdGkiOiI3NDViNTVlZmU3OGM0MDE4YWQ2YmI1ZmU1ZWRkZDkwMCIsInVzZXJfaWQiOiI5In0.mQfkKr1qXqmgSeBRFii_lU8gYiMM89o5eRc7GBIRIxc','2025-09-22 05:50:46.922371','2025-09-23 05:50:46.000000',9,'745b55efe78c4018ad6bb5fe5eddd900'),(12,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc1ODYwNjg1MCwiaWF0IjoxNzU4NTIwNDUwLCJqdGkiOiI2NWFmZGVmMDFkMDQ0MmE4ODc5ZDk0Nzg0YjAwMTllNiIsInVzZXJfaWQiOiI3In0.tTYhB5JqJmVo8_WWsbjmz16dhyFDoYKNWDMv_DvWP7A','2025-09-22 05:54:10.805747','2025-09-23 05:54:10.000000',7,'65afdef01d0442a8879d94784b0019e6'),(13,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc1ODYwNzM0MCwiaWF0IjoxNzU4NTIwOTQwLCJqdGkiOiIxOWM3Y2Y2NTBhODk0NzU5YjVjNGQwYmY1YTYwYzM4ZCIsInVzZXJfaWQiOiI3In0.INVpUum2Q6Ij4mHitpBo942tDrndJSv7GeJDevLj2Zc','2025-09-22 06:02:20.958973','2025-09-23 06:02:20.000000',7,'19c7cf650a894759b5c4d0bf5a60c38d'),(14,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc1ODYwNzQ0NSwiaWF0IjoxNzU4NTIxMDQ1LCJqdGkiOiIzNGJkM2MxMDMxZmE0YTM1OTA0NjJlODVjMjI2MjMzOCIsInVzZXJfaWQiOiI3In0.5TzfTP8U2pOlyD5G7GwKp-niQzXcm7w99zuOrYTwQlA','2025-09-22 06:04:05.322322','2025-09-23 06:04:05.000000',7,'34bd3c1031fa4a3590462e85c2262338'),(15,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc1ODYwNzU3MSwiaWF0IjoxNzU4NTIxMTcxLCJqdGkiOiJkZDY2NjgzYThkZWI0NDVjYTFhNGEyMTM2ZWMwZjk0OCIsInVzZXJfaWQiOiI4In0.V9ttS2QuiNW86FTMmDbHvHagQY6jP_2UtvVI830yKVM','2025-09-22 06:06:11.340758','2025-09-23 06:06:11.000000',8,'dd66683a8deb445ca1a4a2136ec0f948'),(16,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc1ODYwNzcxMCwiaWF0IjoxNzU4NTIxMzEwLCJqdGkiOiI4Njc5MGFkNmI2MTc0OTIyYWE2MmVhY2M0NjFhMGZmOSIsInVzZXJfaWQiOiI4In0.uZ5h01EaDZcQ06fvIWF9kmnfV3j3ACQGtZZQl35S0D0','2025-09-22 06:08:30.975090','2025-09-23 06:08:30.000000',8,'86790ad6b6174922aa62eacc461a0ff9'),(17,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc1ODYwNzc4NywiaWF0IjoxNzU4NTIxMzg3LCJqdGkiOiJmZmJkZDcxYmIyMWU0M2YxODYwNmNiM2Y1MThjZjE4YSIsInVzZXJfaWQiOiI4In0.L_SteLuctebejEkad_b3NPoIUiOl9JTbJwBUIdqQtwE','2025-09-22 06:09:47.367696','2025-09-23 06:09:47.000000',8,'ffbdd71bb21e43f18606cb3f518cf18a'),(18,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc1ODYwNzgwMiwiaWF0IjoxNzU4NTIxNDAyLCJqdGkiOiI2ZWE0MTNiZDIyMGE0OTkwYWQ2ZDgwYWVhNTdmMDhkMCIsInVzZXJfaWQiOiI3In0.9PyP5kcdOxH5EOfDxTttNEjKIAqFRddYjyDfvPhMBNk','2025-09-22 06:10:02.090180','2025-09-23 06:10:02.000000',7,'6ea413bd220a4990ad6d80aea57f08d0'),(19,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc1ODYwNzgzMiwiaWF0IjoxNzU4NTIxNDMyLCJqdGkiOiIwMTNkZjllMzQ5Njk0NGNiYTI4MTZiZDAzNGFkOTU2MSIsInVzZXJfaWQiOiI3In0.Vlhy02Hq95w7QpoETpWlRwWq36x0mfct_QMt9a4rTJQ','2025-09-22 06:10:32.859995','2025-09-23 06:10:32.000000',7,'013df9e3496944cba2816bd034ad9561'),(20,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc1ODYwODI0NywiaWF0IjoxNzU4NTIxODQ3LCJqdGkiOiJlYmQ0M2Q5YjFmMmQ0YWFhYmE1MjZiM2Q0MDIxZWI1MiIsInVzZXJfaWQiOiI3In0.OveW-7m3g80_kE5lmXXT1qPao3Kl4_GS0LqK6FUpk3s','2025-09-22 06:17:27.427400','2025-09-23 06:17:27.000000',7,'ebd43d9b1f2d4aaaba526b3d4021eb52'),(21,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc1ODYwODI4NSwiaWF0IjoxNzU4NTIxODg1LCJqdGkiOiI3NmM5YWVmZmM3OWQ0ZDZlODIzZjQ1YmE4M2NiZDQ0MyIsInVzZXJfaWQiOiI3In0.AzqBzdGHOklxS1ATaBr0_PVJ9ZnQOW2WRDla7G2M30U','2025-09-22 06:18:05.332258','2025-09-23 06:18:05.000000',7,'76c9aeffc79d4d6e823f45ba83cbd443'),(22,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc1ODYwODQxOSwiaWF0IjoxNzU4NTIyMDE5LCJqdGkiOiJiYTIzMDU3NTM4ZjQ0OTQyYjA1ZWVjZGY0M2UzZTJiZCIsInVzZXJfaWQiOiI3In0.lCblLtPU2TYaZ4iau0X1xpgX99amPUsJH2i__tXL2mw','2025-09-22 06:20:19.579545','2025-09-23 06:20:19.000000',7,'ba23057538f44942b05eecdf43e3e2bd'),(23,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc1ODYwODQ3OSwiaWF0IjoxNzU4NTIyMDc5LCJqdGkiOiJmYzM5NDBlNzc1ZmM0NDExYjJiMTJmZTM5YmY2YzFkYSIsInVzZXJfaWQiOiI3In0.cY7_7B0QYJZMFA-fdulnKF6knekx99sPeFBHzHEi9gY','2025-09-22 06:21:19.021570','2025-09-23 06:21:19.000000',7,'fc3940e775fc4411b2b12fe39bf6c1da'),(24,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc1ODYwODU1NywiaWF0IjoxNzU4NTIyMTU3LCJqdGkiOiJlMzdiNDNlMjVmZTM0MGFmYTIwMTk4NjliY2RiOTU2YyIsInVzZXJfaWQiOiI3In0.cGMz89gfhqa18zhTdUAjvBx47ewXnMRnDb6cJca6eAA','2025-09-22 06:22:37.541087','2025-09-23 06:22:37.000000',7,'e37b43e25fe340afa2019869bcdb956c'),(25,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc1ODYwODYwNSwiaWF0IjoxNzU4NTIyMjA1LCJqdGkiOiI1YzhkMTBiNGZjMDc0N2Q0OTFiZjQ2YTE5MTU0NzM2MSIsInVzZXJfaWQiOiIxMCJ9.CRCE8uphq3DKAGmmGhwItRsgI-JUzqnRsXLJpwary1Y','2025-09-22 06:23:25.191118','2025-09-23 06:23:25.000000',10,'5c8d10b4fc0747d491bf46a191547361'),(26,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc1ODYwODY0MSwiaWF0IjoxNzU4NTIyMjQxLCJqdGkiOiI3MGNmNWRjYWYxZjE0MDM3YjFjOWNiMDYwNWM2NzUwYiIsInVzZXJfaWQiOiIxMCJ9.CDNwd9mtzkh0XgLJhN860egrDcQe6FigtbxDtNNKWQ0','2025-09-22 06:24:01.100039','2025-09-23 06:24:01.000000',10,'70cf5dcaf1f14037b1c9cb0605c6750b'),(27,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc1ODYwODgyNywiaWF0IjoxNzU4NTIyNDI3LCJqdGkiOiIxMGI2ZjZiNGQxZWM0Y2RkOGI3MDIwMjcxNzZiZTYyMyIsInVzZXJfaWQiOiIxMSJ9.2f9WRPS0nb6tGk8WvaX6tNcUJqBmhdtl_GovCw45fqw','2025-09-22 06:27:07.543922','2025-09-23 06:27:07.000000',11,'10b6f6b4d1ec4cdd8b702027176be623'),(28,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc1ODYwODgyNywiaWF0IjoxNzU4NTIyNDI3LCJqdGkiOiJjM2VlOWRkNjE5NWQ0MWZhYjhlZDU2OTJjZTMwOThiOCIsInVzZXJfaWQiOiIxMSJ9.98lpeoygSM84-o8BO3I1EM-kACg3o7SxOEy7Va-2DVY','2025-09-22 06:27:07.560551','2025-09-23 06:27:07.000000',11,'c3ee9dd6195d41fab8ed5692ce3098b8'),(29,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc1ODYwOTIyMSwiaWF0IjoxNzU4NTIyODIxLCJqdGkiOiIwZTRlN2ZiOTc2NGY0NDg1YjIyM2NkMjYyYmUxMzczNCIsInVzZXJfaWQiOiIxMiJ9.hL90cutPHIWxe5gnLG6k2XOrSFswKIAHtlQxC_ZgbsU','2025-09-22 06:33:41.280763','2025-09-23 06:33:41.000000',12,'0e4e7fb9764f4485b223cd262be13734'),(30,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc1ODYwOTIyMSwiaWF0IjoxNzU4NTIyODIxLCJqdGkiOiJhOWM4ZmQwNjQ0NWY0NWU4OGNjODA0MGNkM2JlNTIyYSIsInVzZXJfaWQiOiIxMiJ9.aARu7wTA1wd9KXwhxpq4pP2X3CBfN9yq0LywaJzordc','2025-09-22 06:33:41.283931','2025-09-23 06:33:41.000000',12,'a9c8fd06445f45e88cc8040cd3be522a'),(31,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc1ODYwOTIyMSwiaWF0IjoxNzU4NTIyODIxLCJqdGkiOiI2ZmJhZmY5OGY2ZjE0OGFiYmZjN2UyNGQyYTdmNDk5MiIsInVzZXJfaWQiOiIxMiJ9.lKVNMnyy_QtrFJjGrf0485EJ62KV-ZoePHe_9DWJobo','2025-09-22 06:33:41.285779','2025-09-23 06:33:41.000000',12,'6fbaff98f6f148abbfc7e24d2a7f4992'),(32,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc1ODYwOTM3OCwiaWF0IjoxNzU4NTIyOTc4LCJqdGkiOiI0OGY5MGE4ZGQyM2Q0ZjllYmNlZGQ4YjE1YjU2YjUzNSIsInVzZXJfaWQiOiIxMyJ9.XhzDCtCpEbxxphXKBAvzuxrsvI6T8lOf-uMGPCsQpFs','2025-09-22 06:36:18.762070','2025-09-23 06:36:18.000000',13,'48f90a8dd23d4f9ebcedd8b15b56b535'),(33,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc1ODYwOTM3OCwiaWF0IjoxNzU4NTIyOTc4LCJqdGkiOiJmNDY1NDA2ZDJjNjA0NzA2OWYzNGZiZjIyZDUyYmJmYyIsInVzZXJfaWQiOiIxMyJ9.E375x3j1_BUcpB2dZX17kpHkSR3SVD70PygNWlzCZp4','2025-09-22 06:36:18.764546','2025-09-23 06:36:18.000000',13,'f465406d2c6047069f34fbf22d52bbfc'),(34,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc1ODYwOTM3OCwiaWF0IjoxNzU4NTIyOTc4LCJqdGkiOiI3OWIzYzQwZDM5OTk0OGI0YmM1MzUxZmUyYTA0MTJiMyIsInVzZXJfaWQiOiIxMyJ9.7dZMExfF-V-RpZM5gzU1dZnjmkHhYN4VysT0e35l7KU','2025-09-22 06:36:18.766695','2025-09-23 06:36:18.000000',13,'79b3c40d399948b4bc5351fe2a0412b3'),(35,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc1ODYwOTQ3OCwiaWF0IjoxNzU4NTIzMDc4LCJqdGkiOiI2OTM2ZmUxYWEzODQ0MWVjOTIxMjlhZDQwZDZmNTdkNiIsInVzZXJfaWQiOiIxNCJ9.8qLWFa1ZK_1FDYg8Bxz3MUIjWwl3BjrDy7SpxdD05og','2025-09-22 06:37:58.740494','2025-09-23 06:37:58.000000',14,'6936fe1aa38441ec92129ad40d6f57d6'),(36,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc1ODYwOTQ3OCwiaWF0IjoxNzU4NTIzMDc4LCJqdGkiOiJhYjA0OGJmMGY3MWI0ZGJkOTMyYmZlNDQ1NTY5YzQ1NiIsInVzZXJfaWQiOiIxNCJ9.GVlqc_MY97FyQXDN69RtXTPFwv68MweLmfOkn5CSkWk','2025-09-22 06:37:58.743139','2025-09-23 06:37:58.000000',14,'ab048bf0f71b4dbd932bfe445569c456'),(37,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc1ODYwOTQ3OCwiaWF0IjoxNzU4NTIzMDc4LCJqdGkiOiJmMzNhNDM2YmI0Y2M0MDM2OTZkMzBmYWU5YWU1ZWY2OSIsInVzZXJfaWQiOiIxNCJ9.ZNoeVU_T_a3VwxTa6TN-xJFuT-oJ1Fyj-omYR-cB3VE','2025-09-22 06:37:58.745316','2025-09-23 06:37:58.000000',14,'f33a436bb4cc403696d30fae9ae5ef69'),(38,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc1ODYwOTY5MCwiaWF0IjoxNzU4NTIzMjkwLCJqdGkiOiI5MGIzMmYzMDk2MDI0YmRmOTFmZDNiMGZkZDk1YWJhYiIsInVzZXJfaWQiOiIxMCJ9.7dvKpB-8bU9fyl19usZPxpYQm_diYdii99PHwjY84BM','2025-09-22 06:41:30.648231','2025-09-23 06:41:30.000000',10,'90b32f3096024bdf91fd3b0fdd95abab'),(39,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc1ODYwOTkwMSwiaWF0IjoxNzU4NTIzNTAxLCJqdGkiOiI2ZGMyYWQ0ZjA3N2M0MDk5YjM3YzdkYTM4N2FhYWRlZiIsInVzZXJfaWQiOiIxNSJ9.G0D9SjHedP2nrB97Ig75vnMdjyj1mxVGV7FUHnDSklQ','2025-09-22 06:45:01.343039','2025-09-23 06:45:01.000000',15,'6dc2ad4f077c4099b37c7da387aaadef'),(40,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc1ODYwOTkwMSwiaWF0IjoxNzU4NTIzNTAxLCJqdGkiOiI0NWZjMTlmOTEyYjc0MDY5YWE3ZWZiN2FlMDY3ZmE0OSIsInVzZXJfaWQiOiIxNSJ9.g57vLhICPtZP5x7MK7kQK-cK2M7fW-z68FCtx832vh0','2025-09-22 06:45:01.345783','2025-09-23 06:45:01.000000',15,'45fc19f912b74069aa7efb7ae067fa49'),(41,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc1ODYwOTkwMSwiaWF0IjoxNzU4NTIzNTAxLCJqdGkiOiIzNDNjYjdkNjE4OWE0NmU0YWRjNmVkYTQzZDZhYjE5MCIsInVzZXJfaWQiOiIxNSJ9.jYgIxdnVOQ2gR2mnj47QpeaVZ4agCw6K82uQT1nD3AA','2025-09-22 06:45:01.347813','2025-09-23 06:45:01.000000',15,'343cb7d6189a46e4adc6eda43d6ab190'),(42,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc1ODYwOTk0OCwiaWF0IjoxNzU4NTIzNTQ4LCJqdGkiOiJhYTQyMDhlNjhlN2U0YTVhYjc1YTMxMGNlMDQ4MmIyNiIsInVzZXJfaWQiOiIxNiJ9.AuNdn9dUtQudPhX7ho2MSSYh3xgE3O0rEZKG03dItMU','2025-09-22 06:45:48.973886','2025-09-23 06:45:48.000000',16,'aa4208e68e7e4a5ab75a310ce0482b26'),(43,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc1ODYwOTk0OCwiaWF0IjoxNzU4NTIzNTQ4LCJqdGkiOiIyZmVmN2I0MzJlODU0N2YwODU2Mjg3Mzk3NjA2MzA5NSIsInVzZXJfaWQiOiIxNiJ9.4hnzZlqWzj7ig2417ssPHNDiNb8Wpqv3ZBGOwcYr5f0','2025-09-22 06:45:48.977463','2025-09-23 06:45:48.000000',16,'2fef7b432e8547f08562873976063095'),(44,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc1ODYwOTk0OCwiaWF0IjoxNzU4NTIzNTQ4LCJqdGkiOiIyZjAxY2JhMWYwZTQ0MDYzOTA5ODJiOGFkMDllYjc3MiIsInVzZXJfaWQiOiIxNiJ9.WlPOYnjSB64aG4pqzWVmNrbarP3XnCExv336t86DoSw','2025-09-22 06:45:48.979673','2025-09-23 06:45:48.000000',16,'2f01cba1f0e4406390982b8ad09eb772'),(45,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc1ODYwOTk2OSwiaWF0IjoxNzU4NTIzNTY5LCJqdGkiOiJmODEzZTZhNjY0YWY0NjlkYjliZWQzNzVjODczOGZiZSIsInVzZXJfaWQiOiIxNiJ9.-SWqNnMU1GrY-WXeUdd8X9tMe_8UPZig_37bZklsxK8','2025-09-22 06:46:09.869553','2025-09-23 06:46:09.000000',16,'f813e6a664af469db9bed375c8738fbe'),(46,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc1ODYxMjI5MiwiaWF0IjoxNzU4NTI1ODkyLCJqdGkiOiJjY2M2M2NjMzBiYzg0NmM3OGUyNDIwY2E1ZDllZWEwYiIsInVzZXJfaWQiOiIxNyJ9.0oNN3ZU6ZvHvePk2Y5GLSylzDEuoOm-52IYVU3vyqIM','2025-09-22 07:24:52.565104','2025-09-23 07:24:52.000000',17,'ccc63cc30bc846c78e2420ca5d9eea0b'),(47,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc1ODYxMjI5MiwiaWF0IjoxNzU4NTI1ODkyLCJqdGkiOiJiMWI4MWJiZTAwYTQ0ZGUxODNkMTZiZDIzMzc2NDhiNyIsInVzZXJfaWQiOiIxNyJ9.bvCX4SRZcuPAoUT6w3cSBzQ4qj97vF1BBwA7E-SMk8Y','2025-09-22 07:24:52.585902','2025-09-23 07:24:52.000000',17,'b1b81bbe00a44de183d16bd2337648b7'),(48,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc1ODYxMjI5MiwiaWF0IjoxNzU4NTI1ODkyLCJqdGkiOiIwMWFmY2U5NDUwYzc0YTA4YTE3NmMwMjNlYzExMzU4OSIsInVzZXJfaWQiOiIxNyJ9.OdkobzBQEU-VyvlYixFpSQaMQwcPBk3JfW13gzU6pQ8','2025-09-22 07:24:52.588189','2025-09-23 07:24:52.000000',17,'01afce9450c74a08a176c023ec113589'),(49,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc1ODYxMjMzNCwiaWF0IjoxNzU4NTI1OTM0LCJqdGkiOiJjMDdjNjhjMzUwOWY0ZGNmOWY4YjRjNDA2NjEyNGVjYyIsInVzZXJfaWQiOiI5In0.WgTJOfyU8E3mdv_lLVyYNUCeQreoqnzAPzmTsuWZ4tc','2025-09-22 07:25:34.486119','2025-09-23 07:25:34.000000',9,'c07c68c3509f4dcf9f8b4c4066124ecc'),(50,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc1ODYxODY1MCwiaWF0IjoxNzU4NTMyMjUwLCJqdGkiOiJjNWYwNDIwODM3MGE0MTMzODY2ZjI3OTIyOWUxNDNjOCIsInVzZXJfaWQiOiIxOCJ9.n48p0qa0HaYsnj6dZs8HbnO-rTgpZ3GhZhdFeEzMnag','2025-09-22 09:10:50.688142','2025-09-23 09:10:50.000000',18,'c5f04208370a4133866f279229e143c8'),(51,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc1ODYxODY1MCwiaWF0IjoxNzU4NTMyMjUwLCJqdGkiOiI0ZjYzNDNkMDc2Y2U0OGQyYmRmNWIzNjkwNGJjNzM4NyIsInVzZXJfaWQiOiIxOCJ9.Snnu6pafeuBmlFoEt7hjV7WiBLWyVEwDcON9l2wCpUQ','2025-09-22 09:10:50.691339','2025-09-23 09:10:50.000000',18,'4f6343d076ce48d2bdf5b36904bc7387'),(52,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc1ODYxODY1MCwiaWF0IjoxNzU4NTMyMjUwLCJqdGkiOiJmMzUyZWJiNzVhYTI0ODlmOTdiNjZhNjdiMWEwMTc3MyIsInVzZXJfaWQiOiIxOCJ9.4ScjybKZxKDhu2jriIXrR7V_lhtDZJWASsnMcz306zQ','2025-09-22 09:10:50.693494','2025-09-23 09:10:50.000000',18,'f352ebb75aa2489f97b66a67b1a01773'),(53,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc1ODYxODY3OCwiaWF0IjoxNzU4NTMyMjc4LCJqdGkiOiI2ZTZlMWM5YWY5N2E0Njc5OGQ5ZmVkZTcwMTViMWExMiIsInVzZXJfaWQiOiIxOCJ9.-VarNUo7ifPievEhVgJMQB-WueIjy8KeRuIZJoujPYE','2025-09-22 09:11:18.261040','2025-09-23 09:11:18.000000',18,'6e6e1c9af97a46798d9fede7015b1a12'),(54,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc1ODcwNDExOCwiaWF0IjoxNzU4NjE3NzE4LCJqdGkiOiJiMTE5MzQ0MjAzMGQ0MWRkODNhNWEwOTMyYWE3NGE3MiIsInVzZXJfaWQiOiI3In0.GGMvHtmmKFj4zKjF9Tnw5Pe4teLae6JCLmJR1Rm6FjU','2025-09-23 08:55:18.408638','2025-09-24 08:55:18.000000',7,'b1193442030d41dd83a5a0932aa74a72'),(55,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc1ODg4MTY1NywiaWF0IjoxNzU4Nzk1MjU3LCJqdGkiOiIyMmE2NTFjYzVlYmI0M2U4YTlhZTgwOWI3MzJlMDdiNiIsInVzZXJfaWQiOiIxNiJ9.FjeRWs2qZRSH3AZWnNSwQfCavCb1-5QtKsv3X0HNjbA','2025-09-25 10:14:17.409032','2025-09-26 10:14:17.000000',16,'22a651cc5ebb43e8a9ae809b732e07b6'),(56,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc1ODg4MjExNiwiaWF0IjoxNzU4Nzk1NzE2LCJqdGkiOiJhY2YzYmJjZGM0MDI0NzBiYTU0YzNiNDdmNTI4MjNkZCIsInVzZXJfaWQiOiI3In0.OipYNcutGUxr2AuuSz6hRraA3YlZu4rg2hrpEtP61GA','2025-09-25 10:21:56.703975','2025-09-26 10:21:56.000000',7,'acf3bbcdc402470ba54c3b47f52823dd'),(57,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc1ODg5NjI4MywiaWF0IjoxNzU4ODA5ODgzLCJqdGkiOiI2Nzg4YTlmMzU1NDI0NWNlOTIzYTRhNWQ5NTk3YzFjMSIsInVzZXJfaWQiOiIxMCJ9.IIJZnHO2JuqOm6nMNNCzsgIXY6-NHcWoIxRiQaRE_wY','2025-09-25 14:18:03.047195','2025-09-26 14:18:03.000000',10,'6788a9f3554245ce923a4a5d9597c1c1');
/*!40000 ALTER TABLE `token_blacklist_outstandingtoken` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-09-25 20:21:53
