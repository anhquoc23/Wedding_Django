-- MySQL dump 10.13  Distrib 8.0.33, for Win64 (x86_64)
--
-- Host: localhost    Database: wedding_db
-- ------------------------------------------------------
-- Server version	8.0.33

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
  `name` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
INSERT INTO `auth_group` VALUES (1,'CUSTOMER'),(2,'EMPLOYEE');
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
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
INSERT INTO `auth_group_permissions` VALUES (7,1,24),(19,1,28),(1,1,32),(2,1,40),(3,1,41),(5,1,49),(6,1,52),(17,2,24),(18,2,28),(9,2,32),(10,2,40),(11,2,41),(12,2,44),(13,2,49),(14,2,50),(15,2,51),(16,2,52);
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
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add content type',4,'add_contenttype'),(14,'Can change content type',4,'change_contenttype'),(15,'Can delete content type',4,'delete_contenttype'),(16,'Can view content type',4,'view_contenttype'),(17,'Can add session',5,'add_session'),(18,'Can change session',5,'change_session'),(19,'Can delete session',5,'delete_session'),(20,'Can view session',5,'view_session'),(21,'Can add category',6,'add_category'),(22,'Can change category',6,'change_category'),(23,'Can delete category',6,'delete_category'),(24,'Can view category',6,'view_category'),(25,'Can add service',7,'add_service'),(26,'Can change service',7,'change_service'),(27,'Can delete service',7,'delete_service'),(28,'Can view service',7,'view_service'),(29,'Can add wedding hall',8,'add_weddinghall'),(30,'Can change wedding hall',8,'change_weddinghall'),(31,'Can delete wedding hall',8,'delete_weddinghall'),(32,'Can view wedding hall',8,'view_weddinghall'),(33,'Can add user',9,'add_user'),(34,'Can change user',9,'change_user'),(35,'Can delete user',9,'delete_user'),(36,'Can view user',9,'view_user'),(37,'Can add menu',10,'add_menu'),(38,'Can change menu',10,'change_menu'),(39,'Can delete menu',10,'delete_menu'),(40,'Can view menu',10,'view_menu'),(41,'Can add feed back',11,'add_feedback'),(42,'Can change feed back',11,'change_feedback'),(43,'Can delete feed back',11,'delete_feedback'),(44,'Can view feed back',11,'view_feedback'),(45,'Can add wedding menu',12,'add_weddingmenu'),(46,'Can change wedding menu',12,'change_weddingmenu'),(47,'Can delete wedding menu',12,'delete_weddingmenu'),(48,'Can view wedding menu',12,'view_weddingmenu'),(49,'Can add wedding party',13,'add_weddingparty'),(50,'Can change wedding party',13,'change_weddingparty'),(51,'Can delete wedding party',13,'delete_weddingparty'),(52,'Can view wedding party',13,'view_weddingparty'),(53,'Can add wedding service',14,'add_weddingservice'),(54,'Can change wedding service',14,'change_weddingservice'),(55,'Can delete wedding service',14,'delete_weddingservice'),(56,'Can view wedding service',14,'view_weddingservice'),(57,'Can add cancel',15,'add_cancel'),(58,'Can change cancel',15,'change_cancel'),(59,'Can delete cancel',15,'delete_cancel'),(60,'Can view cancel',15,'view_cancel');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
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
  `object_id` longtext COLLATE utf8mb4_unicode_ci,
  `object_repr` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `action_flag` smallint unsigned NOT NULL,
  `change_message` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_wedding_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_wedding_user_id` FOREIGN KEY (`user_id`) REFERENCES `wedding_user` (`id`),
  CONSTRAINT `django_admin_log_chk_1` CHECK ((`action_flag` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2024-04-10 14:55:31.236231','fe08a08b-f175-47da-a6a4-4ff523b4e147','Món Khai Vị',1,'[{\"added\": {}}]',6,1),(2,'2024-04-10 14:57:33.491828','e090a922-bc12-4fac-94cf-aec4d37174de','Món Chính',1,'[{\"added\": {}}]',6,1),(3,'2024-04-10 14:57:41.594729','0944f3c4-5332-47cc-bba2-1c4bcb7c0b87','Món Tráng Miệng',1,'[{\"added\": {}}]',6,1),(4,'2024-04-10 15:01:23.295984','21981f69-09dc-4b4e-aff7-c3b9a3214bd4','Đồ Uống',1,'[{\"added\": {}}]',6,1),(5,'2024-04-11 13:58:06.014536','1','CUSTOMER',1,'[{\"added\": {}}]',3,1),(6,'2024-04-11 14:01:25.487819','2','EMPLOYEE',1,'[{\"added\": {}}]',3,1),(7,'2024-04-11 14:16:06.790972','a4140273-4f6c-42a5-90f8-29b24f149141','Bánh Mặn Đầu Giờ',1,'[{\"added\": {}}]',10,1),(8,'2024-04-11 14:17:35.274182','b5f9451c-b91e-4201-9a04-9b446430b484','Bánh Bacon Cuộn',1,'[{\"added\": {}}]',10,1),(9,'2024-04-11 14:18:34.394059','f919c312-a934-4435-8a15-488608efcd6f','Bánh Cuộn Xúc Xích',1,'[{\"added\": {}}]',10,1),(10,'2024-04-11 14:19:27.256842','6bd3f206-a0e8-44a0-ad54-3bbc45d0a774','Bánh Croissant Meat Jambon',1,'[{\"added\": {}}]',10,1),(11,'2024-04-11 14:19:34.122268','a4140273-4f6c-42a5-90f8-29b24f149141','Bánh Mặn Đầu Giờ',3,'',10,1),(12,'2024-04-11 14:35:59.236904','e2fdff78-993d-4ddb-8718-c5bba9a01d9f','Bánh Chicken Meat Puff',1,'[{\"added\": {}}]',10,1),(13,'2024-04-11 14:47:51.582667','e4ce7a8d-034e-458e-b0e9-589a7c5b5b5f','Bánh Pate Chaud',1,'[{\"added\": {}}]',10,1),(14,'2024-04-11 14:48:50.171913','1a1e4c5e-76be-4ef6-8e5d-894885b5cd1d','Bánh Jambon Mayonnaise Puff',1,'[{\"added\": {}}]',10,1),(15,'2024-04-11 14:49:27.294626','9477e9c4-7a95-44e8-b6db-341abc0c65fe','Bánh Hải Sản Vol Au Vent',1,'[{\"added\": {}}]',10,1),(16,'2024-04-11 14:52:29.128308','da8edb13-949b-4f7c-b7ba-95980091c178','Bánh Tart Florentine',1,'[{\"added\": {}}]',10,1),(17,'2024-04-11 14:53:07.146538','5876f093-7676-48ad-854d-d0f4ecc02580','Gỏi Củ Hủ Dừa Tôm Thịt',1,'[{\"added\": {}}]',10,1),(18,'2024-04-11 14:54:10.621749','96c7bbe2-7424-4514-80c3-0541743e9956','Gỏi Tôm Tứ Quý',1,'[{\"added\": {}}]',10,1),(19,'2024-04-11 14:55:04.435643','da87d3a8-224d-4707-8aa3-d97e1b5e3456','Gỏi Sứa Tứ Xuyên',1,'[{\"added\": {}}]',10,1),(20,'2024-04-11 14:55:36.464723','e37ffe2a-e8c9-4d03-8152-d31f03498c0b','Gỏi Mực Vinh Quy',1,'[{\"added\": {}}]',10,1),(21,'2024-04-11 14:56:14.246792','e3c69fae-0e33-4c36-b4f2-2680f73dcbb5','Gỏi Hải Sản Bưởi Tân Triều',1,'[{\"added\": {}}]',10,1),(22,'2024-04-11 14:56:57.087423','50a42fa6-3f99-45ab-aa2e-2e464c6aef09','Súp Cua Trúc Xanh',1,'[{\"added\": {}}]',10,1),(23,'2024-04-11 14:57:28.016666','21c181b0-1c10-4920-9911-f1318f707924','Súp Uyên Ương Thượng Hải',1,'[{\"added\": {}}]',10,1),(24,'2024-04-11 14:58:03.297672','28fe3142-8ab1-41af-9d93-8b08cb06969a','Súp Hải Sản Tuyết Nhĩ',1,'[{\"added\": {}}]',10,1),(25,'2024-04-11 14:58:35.636730','93dfee75-cc58-4f04-8e62-4cb0fb72d422','Súp Bào Ngư Thịt Cua',1,'[{\"added\": {}}]',10,1),(26,'2024-04-11 14:59:15.023580','21809e4f-3d64-447a-ac26-d8c0cca26934','Súp Vi Cá Thịt Cua',1,'[{\"added\": {}}]',10,1),(27,'2024-04-11 14:59:46.089706','fad0f740-f4c1-4458-8d36-acbf60189109','Sườn Non Tiềm Bách Hợp Đông Trùng',1,'[{\"added\": {}}]',10,1),(28,'2024-04-11 15:00:24.314930','9c9ff1f2-d071-4240-bb69-9ad8d678b111','Sườn Non Tiềm Hải Sâm Thảo Mộc',1,'[{\"added\": {}}]',10,1),(29,'2024-04-11 15:01:08.767093','fee78258-82f9-44f7-8443-43fe7960ef58','Bào Ngư Tiềm Thảo Mộc và Nấm Bạch Linh',1,'[{\"added\": {}}]',10,1),(30,'2024-04-11 15:01:55.082427','aa7cc1b9-47b2-4b57-90b0-5416465beaee','Tôm Chiên Tempura',1,'[{\"added\": {}}]',10,1),(31,'2024-04-11 15:02:29.290015','7b8659c1-ad2f-46d8-950e-6dfa65bfe600','Tôm Chiên Cốm Xanh',1,'[{\"added\": {}}]',10,1),(32,'2024-04-11 15:03:10.447187','3951eed6-4746-4032-82f2-f5a1086d0c87','Cá Chẽm Phô Mai Sốt Tartare',1,'[{\"added\": {}}]',10,1),(33,'2024-04-11 15:03:53.696882','aa57fdf4-f14e-49ed-b5a3-cb4c13a7509f','Chả Giò Hải Sản Xốt Trái Cây',1,'[{\"added\": {}}]',10,1),(34,'2024-04-11 15:04:29.364920','1942f34b-ed9d-47a6-a6b5-b87a29b8995e','Gà Nướng Nam Hàn',1,'[{\"added\": {}}]',10,1),(35,'2024-04-11 15:04:55.868464','5c9bea9e-33aa-426d-9aa2-77f46510d109','Cánh Gà Rang Bơ Tỏi',1,'[{\"added\": {}}]',10,1),(36,'2024-04-11 15:05:23.715589','71c09f5b-d595-438a-bc47-9ae04497e4c0','Chem Chép New Zealand Nướng Tiêu',1,'[{\"added\": {}}]',10,1),(37,'2024-04-12 01:20:17.396454','1','CUSTOMER',2,'[{\"changed\": {\"fields\": [\"Permissions\"]}}]',3,1);
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
  `app_label` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'contenttypes','contenttype'),(5,'sessions','session'),(15,'wedding','cancel'),(6,'wedding','category'),(11,'wedding','feedback'),(10,'wedding','menu'),(7,'wedding','service'),(9,'wedding','user'),(8,'wedding','weddinghall'),(12,'wedding','weddingmenu'),(13,'wedding','weddingparty'),(14,'wedding','weddingservice');
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
  `app` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2024-04-09 10:11:48.556410'),(2,'contenttypes','0002_remove_content_type_name','2024-04-09 10:11:48.603251'),(3,'auth','0001_initial','2024-04-09 10:11:48.802117'),(4,'auth','0002_alter_permission_name_max_length','2024-04-09 10:11:48.843371'),(5,'auth','0003_alter_user_email_max_length','2024-04-09 10:11:48.848415'),(6,'auth','0004_alter_user_username_opts','2024-04-09 10:11:48.854010'),(7,'auth','0005_alter_user_last_login_null','2024-04-09 10:11:48.859195'),(8,'auth','0006_require_contenttypes_0002','2024-04-09 10:11:48.862123'),(9,'auth','0007_alter_validators_add_error_messages','2024-04-09 10:11:48.862123'),(10,'auth','0008_alter_user_username_max_length','2024-04-09 10:11:48.871829'),(11,'auth','0009_alter_user_last_name_max_length','2024-04-09 10:11:48.878076'),(12,'auth','0010_alter_group_name_max_length','2024-04-09 10:11:48.890027'),(13,'auth','0011_update_proxy_permissions','2024-04-09 10:11:48.898098'),(14,'auth','0012_alter_user_first_name_max_length','2024-04-09 10:11:48.902022'),(15,'wedding','0001_initial','2024-04-09 10:11:49.797883'),(16,'admin','0001_initial','2024-04-09 10:11:49.922743'),(17,'admin','0002_logentry_remove_auto_add','2024-04-09 10:11:49.931955'),(18,'admin','0003_logentry_add_action_flag_choices','2024-04-09 10:11:49.940530'),(19,'sessions','0001_initial','2024-04-09 10:11:49.973202'),(20,'wedding','0002_alter_category_id_alter_menu_id_alter_menu_image_and_more','2024-04-11 14:33:21.261439'),(21,'wedding','0003_cancel','2024-04-12 01:46:11.129235');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `session_data` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('jnrkfd0om32upydkzqzd62g318a560ea','.eJxVjMsOwiAQRf-FtSEgMAWX7vsNzTAzSNXQpI-V8d-1SRe6veec-1IDbmsdtkXmYWR1UVadfreM9JC2A75ju02aprbOY9a7og-66H5ieV4P9--g4lK_tTlDcWJBBGxwkQPGAuKgJE6QivWOsQTrCRJ4HzkSBVO6bDokApPV-wPabzfp:1ruZ1p:m36BxvaIMrr3ZD5HAXYeK-XM5T1tM5VbW7CQ4YYNu7c','2024-04-24 14:34:21.674633');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wedding_cancel`
--

DROP TABLE IF EXISTS `wedding_cancel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wedding_cancel` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `cancel_date` datetime(6) NOT NULL,
  `employee_id` int NOT NULL,
  `wedding_party_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `wedding_cancel_wedding_party_id_7bb3671c_fk_wedding_w` (`wedding_party_id`),
  CONSTRAINT `wedding_cancel_wedding_party_id_7bb3671c_fk_wedding_w` FOREIGN KEY (`wedding_party_id`) REFERENCES `wedding_weddingparty` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wedding_cancel`
--

LOCK TABLES `wedding_cancel` WRITE;
/*!40000 ALTER TABLE `wedding_cancel` DISABLE KEYS */;
/*!40000 ALTER TABLE `wedding_cancel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wedding_category`
--

DROP TABLE IF EXISTS `wedding_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wedding_category` (
  `id` char(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wedding_category`
--

LOCK TABLES `wedding_category` WRITE;
/*!40000 ALTER TABLE `wedding_category` DISABLE KEYS */;
INSERT INTO `wedding_category` VALUES ('0944f3c4533247ccbba21c4bcb7c0b87','Món Tráng Miệng',1),('21981f6909dc4b4eaff7c3b9a3214bd4','Đồ Uống',1),('e090a922bc124fac94cfaec4d37174de','Món Chính',1),('fe08a08bf17547daa6a44ff523b4e147','Món Khai Vị',1);
/*!40000 ALTER TABLE `wedding_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wedding_feedback`
--

DROP TABLE IF EXISTS `wedding_feedback`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wedding_feedback` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `content` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_date` datetime(6) NOT NULL,
  `user_id` bigint NOT NULL,
  `hall_id` char(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `party_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `wedding_feedback_user_id_party_id_8f634e01_uniq` (`user_id`,`party_id`),
  KEY `wedding_feedback_party_id_e2de8f18_fk_wedding_weddingparty_id` (`party_id`),
  KEY `wedding_feedback_hall_id_0085328f_fk_wedding_weddinghall_id` (`hall_id`),
  CONSTRAINT `wedding_feedback_hall_id_0085328f_fk_wedding_weddinghall_id` FOREIGN KEY (`hall_id`) REFERENCES `wedding_weddinghall` (`id`),
  CONSTRAINT `wedding_feedback_party_id_e2de8f18_fk_wedding_weddingparty_id` FOREIGN KEY (`party_id`) REFERENCES `wedding_weddingparty` (`id`),
  CONSTRAINT `wedding_feedback_user_id_d48fbd8c_fk_wedding_user_id` FOREIGN KEY (`user_id`) REFERENCES `wedding_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wedding_feedback`
--

LOCK TABLES `wedding_feedback` WRITE;
/*!40000 ALTER TABLE `wedding_feedback` DISABLE KEYS */;
/*!40000 ALTER TABLE `wedding_feedback` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wedding_menu`
--

DROP TABLE IF EXISTS `wedding_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wedding_menu` (
  `id` char(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `unit_price` decimal(10,2) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `category_id` char(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `wedding_menu_category_id_f34d1e1d_fk_wedding_category_id` (`category_id`),
  CONSTRAINT `wedding_menu_category_id_f34d1e1d_fk_wedding_category_id` FOREIGN KEY (`category_id`) REFERENCES `wedding_category` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wedding_menu`
--

LOCK TABLES `wedding_menu` WRITE;
/*!40000 ALTER TABLE `wedding_menu` DISABLE KEYS */;
INSERT INTO `wedding_menu` VALUES ('1942f34bed9d47a6a6b5b87a29b8995e','Gà Nướng Nam Hàn',170000.00,1,'image/upload/v1712847866/lqabofvcgd5rpc37bmpz.jpg','fe08a08bf17547daa6a44ff523b4e147'),('1a1e4c5e76be4ef68e5d894885b5cd1d','Bánh Jambon Mayonnaise Puff',200000.00,1,'image/upload/v1712846927/lhts9usk4r6ywohakbzs.jpg','fe08a08bf17547daa6a44ff523b4e147'),('21809e4f3d64447aac26d8c0cca26934','Súp Vi Cá Thịt Cua',90000.00,1,'image/upload/v1712847552/g1xp1k4zk9tnsqpqqs7m.jpg','fe08a08bf17547daa6a44ff523b4e147'),('21c181b01c1049209911f1318f707924','Súp Uyên Ương Thượng Hải',70000.00,1,'image/upload/v1712847445/z2ojol6abdzh76ybbsy2.jpg','fe08a08bf17547daa6a44ff523b4e147'),('28fe31428ab141af9d938b08cb06969a','Súp Hải Sản Tuyết Nhĩ',110000.00,1,'image/upload/v1712847480/g8ylubl1h6z0qrbq2xce.jpg','fe08a08bf17547daa6a44ff523b4e147'),('3951eed64746403282f2f5a1086d0c87','Cá Chẽm Phô Mai Sốt Tartare',180000.00,1,'image/upload/v1712847787/qxlnhn1kuxdchhdk0xkg.jpg','fe08a08bf17547daa6a44ff523b4e147'),('50a42fa63f9945abaa2e2e464c6aef09','Súp Cua Trúc Xanh',45000.00,1,'image/upload/v1712847414/dbmk79wontldju6vfeyl.jpg','fe08a08bf17547daa6a44ff523b4e147'),('5876f093767648ad854dd0f4ecc02580','Gỏi Củ Hủ Dừa Tôm Thịt',45000.00,1,'image/upload/v1712847184/qwpfhatokhsfqnnzjv01.jpg','fe08a08bf17547daa6a44ff523b4e147'),('5c9bea9e33aa426d9aa277f46510d109','Cánh Gà Rang Bơ Tỏi',140000.00,1,'image/upload/v1712847893/j9ac1otzgqq5poepwz4w.jpg','fe08a08bf17547daa6a44ff523b4e147'),('6bd3f206a0e844a0ad543bbc45d0a774','Bánh Croissant Meat Jambon',92000.00,1,'wedding/menu/download_3.jpg','fe08a08bf17547daa6a44ff523b4e147'),('71c09f5bd595438abc479ae04497e4c0','Chem Chép New Zealand Nướng Tiêu',200000.00,1,'image/upload/v1712847920/mqxgdir0cejzbnq79jre.jpg','fe08a08bf17547daa6a44ff523b4e147'),('7b8659c1ad2f46d8950e6dfa65bfe600','Tôm Chiên Cốm Xanh',50000.00,1,'image/upload/v1712847746/jsnfuvujvo2tkdprqugg.jpg','fe08a08bf17547daa6a44ff523b4e147'),('93dfee75cc584f048e624cb0fb72d422','Súp Bào Ngư Thịt Cua',19000.00,1,'image/upload/v1712847512/l56bbcovlt555fm5g90u.jpg','fe08a08bf17547daa6a44ff523b4e147'),('9477e9c47a9544e8b6db341abc0c65fe','Bánh Hải Sản Vol Au Vent',170000.00,1,'image/upload/v1712846964/x923hcuzoxntspcwi95f.jpg','fe08a08bf17547daa6a44ff523b4e147'),('96c7bbe27424451480c30541743e9956','Gỏi Tôm Tứ Quý',80000.00,1,'image/upload/v1712847247/vbwvfvtfhtouvk9lwexz.jpg','fe08a08bf17547daa6a44ff523b4e147'),('9c9ff1f2d0714240bb699ad8d678b111','Sườn Non Tiềm Hải Sâm Thảo Mộc',180000.00,1,'image/upload/v1712847621/hbnk3vovaztdxeqmq4bf.jpg','fe08a08bf17547daa6a44ff523b4e147'),('aa57fdf4f14e49edb5a3cb4c13a7509f','Chả Giò Hải Sản Xốt Trái Cây',85000.00,1,'image/upload/v1712847830/jkesifiozy6zmrtscgqf.jpg','fe08a08bf17547daa6a44ff523b4e147'),('aa7cc1b947b24b5790b05416465beaee','Tôm Chiên Tempura',70000.00,1,'image/upload/v1712847712/jnbbrbmtr9gmqhtnaiyw.jpg','fe08a08bf17547daa6a44ff523b4e147'),('b5f9451cb91e42019a049b446430b484','Bánh Bacon Cuộn',120000.00,1,'wedding/menu/download_1.jpg','fe08a08bf17547daa6a44ff523b4e147'),('da87d3a8224d47078aa3d97e1b5e3456','Gỏi Sứa Tứ Xuyên',80000.00,1,'image/upload/v1712847301/enivj5mfa4rvbwjohhxa.jpg','fe08a08bf17547daa6a44ff523b4e147'),('da8edb13949b4f7cb7ba95980091c178','Bánh Tart Florentine',75000.00,1,'image/upload/v1712847146/nzkatwf4dpdfj9x4comd.jpg','fe08a08bf17547daa6a44ff523b4e147'),('e2fdff78993d4ddb8718c5bba9a01d9f','Bánh Chicken Meat Puff',70000.00,1,'image/upload/v1712846156/dzvmamkoenqf31ivxgfv.jpg','fe08a08bf17547daa6a44ff523b4e147'),('e37ffe2ae8c94d038152d31f03498c0b','Gỏi Mực Vinh Quy',105000.00,1,'image/upload/v1712847333/mm7gilwxxcjz6xgy8bdr.jpg','fe08a08bf17547daa6a44ff523b4e147'),('e3c69fae0e334c36b4f22680f73dcbb5','Gỏi Hải Sản Bưởi Tân Triều',90000.00,1,'image/upload/v1712847371/sjfjrrqtgsecswiklphq.jpg','fe08a08bf17547daa6a44ff523b4e147'),('e4ce7a8d034e458eb0e9589a7c5b5b5f','Bánh Pate Chaud',110000.00,1,'image/upload/v1712846868/bd4jx2d8ybkozi1kueu4.jpg','fe08a08bf17547daa6a44ff523b4e147'),('f919c312a93444358a15488608efcd6f','Bánh Cuộn Xúc Xích',80000.00,1,'wedding/menu/download_2.jpg','fe08a08bf17547daa6a44ff523b4e147'),('fad0f740f4c144588d36acbf60189109','Sườn Non Tiềm Bách Hợp Đông Trùng',100000.00,1,'image/upload/v1712847583/smeinsowvpxmfz27qc7t.jpg','fe08a08bf17547daa6a44ff523b4e147'),('fee7825882f944f7844343fe7960ef58','Bào Ngư Tiềm Thảo Mộc và Nấm Bạch Linh',145000.00,1,'image/upload/v1712847665/oy2il6lymdphtb24m3fl.jpg','fe08a08bf17547daa6a44ff523b4e147');
/*!40000 ALTER TABLE `wedding_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wedding_service`
--

DROP TABLE IF EXISTS `wedding_service`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wedding_service` (
  `id` char(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `unit_price` decimal(10,2) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wedding_service`
--

LOCK TABLES `wedding_service` WRITE;
/*!40000 ALTER TABLE `wedding_service` DISABLE KEYS */;
/*!40000 ALTER TABLE `wedding_service` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wedding_user`
--

DROP TABLE IF EXISTS `wedding_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wedding_user` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `password` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `first_name` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(254) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  `avatar` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wedding_user`
--

LOCK TABLES `wedding_user` WRITE;
/*!40000 ALTER TABLE `wedding_user` DISABLE KEYS */;
INSERT INTO `wedding_user` VALUES (1,'pbkdf2_sha256$720000$xmOu7OGlgfz1kxxMPm8DAW$QugPjuyvp6EpUmB29OO6OggCoP0lrcu5z1aSj0d4aII=','2024-04-10 14:34:21.671075',1,'admin','','','admin@gmail.com',1,'2024-04-10 14:33:52.302842','',1);
/*!40000 ALTER TABLE `wedding_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wedding_user_groups`
--

DROP TABLE IF EXISTS `wedding_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wedding_user_groups` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` bigint NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `wedding_user_groups_user_id_group_id_d2f991b2_uniq` (`user_id`,`group_id`),
  KEY `wedding_user_groups_group_id_8316c968_fk_auth_group_id` (`group_id`),
  CONSTRAINT `wedding_user_groups_group_id_8316c968_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `wedding_user_groups_user_id_d177c0f9_fk_wedding_user_id` FOREIGN KEY (`user_id`) REFERENCES `wedding_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wedding_user_groups`
--

LOCK TABLES `wedding_user_groups` WRITE;
/*!40000 ALTER TABLE `wedding_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `wedding_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wedding_user_user_permissions`
--

DROP TABLE IF EXISTS `wedding_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wedding_user_user_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` bigint NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `wedding_user_user_permis_user_id_permission_id_1047e857_uniq` (`user_id`,`permission_id`),
  KEY `wedding_user_user_pe_permission_id_8943d6f7_fk_auth_perm` (`permission_id`),
  CONSTRAINT `wedding_user_user_pe_permission_id_8943d6f7_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `wedding_user_user_pe_user_id_f9f97f68_fk_wedding_u` FOREIGN KEY (`user_id`) REFERENCES `wedding_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wedding_user_user_permissions`
--

LOCK TABLES `wedding_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `wedding_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `wedding_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wedding_weddinghall`
--

DROP TABLE IF EXISTS `wedding_weddinghall`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wedding_weddinghall` (
  `id` char(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price_morning` decimal(10,2) NOT NULL,
  `price_afternoon` decimal(10,2) NOT NULL,
  `price_evening` decimal(10,2) NOT NULL,
  `created_date` datetime(6) NOT NULL,
  `updated_date` datetime(6) NOT NULL,
  `capacity` int NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wedding_weddinghall`
--

LOCK TABLES `wedding_weddinghall` WRITE;
/*!40000 ALTER TABLE `wedding_weddinghall` DISABLE KEYS */;
/*!40000 ALTER TABLE `wedding_weddinghall` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wedding_weddingmenu`
--

DROP TABLE IF EXISTS `wedding_weddingmenu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wedding_weddingmenu` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `quantity` int NOT NULL,
  `unit_price` decimal(10,2) NOT NULL,
  `menu_id` char(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `party_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `wedding_weddingmenu_party_id_9b674b99_fk_wedding_weddingparty_id` (`party_id`),
  KEY `wedding_weddingmenu_menu_id_e281e89c_fk_wedding_menu_id` (`menu_id`),
  CONSTRAINT `wedding_weddingmenu_menu_id_e281e89c_fk_wedding_menu_id` FOREIGN KEY (`menu_id`) REFERENCES `wedding_menu` (`id`),
  CONSTRAINT `wedding_weddingmenu_party_id_9b674b99_fk_wedding_weddingparty_id` FOREIGN KEY (`party_id`) REFERENCES `wedding_weddingparty` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wedding_weddingmenu`
--

LOCK TABLES `wedding_weddingmenu` WRITE;
/*!40000 ALTER TABLE `wedding_weddingmenu` DISABLE KEYS */;
/*!40000 ALTER TABLE `wedding_weddingmenu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wedding_weddingparty`
--

DROP TABLE IF EXISTS `wedding_weddingparty`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wedding_weddingparty` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `unit_price` decimal(10,2) NOT NULL,
  `created_date` datetime(6) NOT NULL,
  `order_date` datetime(6) NOT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint NOT NULL,
  `wedding_hall_id` char(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `wedding_weddingparty_user_id_beeebc48_fk_wedding_user_id` (`user_id`),
  KEY `wedding_weddingparty_wedding_hall_id_ddefd1b3_fk_wedding_w` (`wedding_hall_id`),
  CONSTRAINT `wedding_weddingparty_user_id_beeebc48_fk_wedding_user_id` FOREIGN KEY (`user_id`) REFERENCES `wedding_user` (`id`),
  CONSTRAINT `wedding_weddingparty_wedding_hall_id_ddefd1b3_fk_wedding_w` FOREIGN KEY (`wedding_hall_id`) REFERENCES `wedding_weddinghall` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wedding_weddingparty`
--

LOCK TABLES `wedding_weddingparty` WRITE;
/*!40000 ALTER TABLE `wedding_weddingparty` DISABLE KEYS */;
/*!40000 ALTER TABLE `wedding_weddingparty` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wedding_weddingservice`
--

DROP TABLE IF EXISTS `wedding_weddingservice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wedding_weddingservice` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `quantity` int NOT NULL,
  `unit_price` decimal(10,2) NOT NULL,
  `party_id` bigint NOT NULL,
  `service_id` char(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `wedding_weddingservi_party_id_7d041241_fk_wedding_w` (`party_id`),
  KEY `wedding_weddingservice_service_id_936a695a_fk_wedding_service_id` (`service_id`),
  CONSTRAINT `wedding_weddingservi_party_id_7d041241_fk_wedding_w` FOREIGN KEY (`party_id`) REFERENCES `wedding_weddingparty` (`id`),
  CONSTRAINT `wedding_weddingservice_service_id_936a695a_fk_wedding_service_id` FOREIGN KEY (`service_id`) REFERENCES `wedding_service` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wedding_weddingservice`
--

LOCK TABLES `wedding_weddingservice` WRITE;
/*!40000 ALTER TABLE `wedding_weddingservice` DISABLE KEYS */;
/*!40000 ALTER TABLE `wedding_weddingservice` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-04-12  8:47:25
