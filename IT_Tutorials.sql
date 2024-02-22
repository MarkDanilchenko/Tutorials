-- MySQL dump 10.13  Distrib 8.0.33, for macos13.3 (arm64)
--
-- Host: localhost    Database: IT_Tutorials
-- ------------------------------------------------------
-- Server version	8.0.33

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
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add user',4,'add_user'),(14,'Can change user',4,'change_user'),(15,'Can delete user',4,'delete_user'),(16,'Can view user',4,'view_user'),(17,'Can add content type',5,'add_contenttype'),(18,'Can change content type',5,'change_contenttype'),(19,'Can delete content type',5,'delete_contenttype'),(20,'Can view content type',5,'view_contenttype'),(21,'Can add session',6,'add_session'),(22,'Can change session',6,'change_session'),(23,'Can delete session',6,'delete_session'),(24,'Can view session',6,'view_session'),(25,'Can add Tutorial',7,'add_tutorial'),(26,'Can change Tutorial',7,'change_tutorial'),(27,'Can delete Tutorial',7,'delete_tutorial'),(28,'Can view Tutorial',7,'view_tutorial'),(29,'Can add blacklisted token',8,'add_blacklistedtoken'),(30,'Can change blacklisted token',8,'change_blacklistedtoken'),(31,'Can delete blacklisted token',8,'delete_blacklistedtoken'),(32,'Can view blacklisted token',8,'view_blacklistedtoken'),(33,'Can add outstanding token',9,'add_outstandingtoken'),(34,'Can change outstanding token',9,'change_outstandingtoken'),(35,'Can delete outstanding token',9,'delete_outstandingtoken'),(36,'Can view outstanding token',9,'view_outstandingtoken');
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$720000$bsteFxUXsUuZiUY4n5Buf3$bDgA9DdGq1zAc4hCHNcZ9YqCbVmtmMhCzn53XiTVRoc=','2024-02-24 13:52:56.806498',1,'admin','','','',1,1,'2024-02-14 09:09:59.076919');
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
) ENGINE=InnoDB AUTO_INCREMENT=62 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2024-02-14 10:41:39.206009','1','h1',1,'[{\"added\": {}}]',7,1),(2,'2024-02-14 10:41:50.538455','1','h1',3,'',7,1),(3,'2024-02-14 10:47:16.634588','2','sdf',1,'[{\"added\": {}}]',7,1),(4,'2024-02-14 10:47:33.809841','2','sdf',3,'',7,1),(5,'2024-02-14 10:48:30.222876','3','asd',1,'[{\"added\": {}}]',7,1),(6,'2024-02-14 10:48:54.891206','4','asacs',1,'[{\"added\": {}}]',7,1),(7,'2024-02-14 10:49:01.366346','5','ascascsac',1,'[{\"added\": {}}]',7,1),(8,'2024-02-14 11:37:14.655643','5','ascascsac',2,'[{\"changed\": {\"fields\": [\"Tutorial publish date\"]}}]',7,1),(9,'2024-02-14 11:37:23.734409','4','asacs',2,'[{\"changed\": {\"fields\": [\"Tutorial publish date\"]}}]',7,1),(10,'2024-02-14 11:55:11.746424','6','Tutorial_1',1,'[{\"added\": {}}]',7,1),(11,'2024-02-14 11:55:27.749885','7','Tutorial_2',1,'[{\"added\": {}}]',7,1),(12,'2024-02-14 11:55:36.545994','8','Tutorial_3',1,'[{\"added\": {}}]',7,1),(13,'2024-02-14 11:56:09.267202','9','Tutorial_4',1,'[{\"added\": {}}]',7,1),(14,'2024-02-14 12:11:49.374804','10','Tutorial_6',1,'[{\"added\": {}}]',7,1),(15,'2024-02-14 12:30:19.483391','13','fknbkn',1,'[{\"added\": {}}]',7,1),(16,'2024-02-14 12:30:32.036387','14','jkdbnjkn',1,'[{\"added\": {}}]',7,1),(17,'2024-02-14 12:31:05.876969','14','jkdbnjkn',3,'',7,1),(18,'2024-02-14 12:31:05.879151','13','fknbkn',3,'',7,1),(19,'2024-02-14 12:31:28.666556','15','sadads',1,'[{\"added\": {}}]',7,1),(20,'2024-02-14 12:31:47.763171','16','fvdvd',1,'[{\"added\": {}}]',7,1),(21,'2024-02-14 12:55:21.880724','16','fvdvd',3,'',7,1),(22,'2024-02-14 12:55:21.884880','15','sadads',3,'',7,1),(23,'2024-02-14 13:25:30.901764','18','Tutorial_19',3,'',7,1),(24,'2024-02-14 13:25:30.904457','17','Tutorial_9',3,'',7,1),(25,'2024-02-14 13:25:30.905980','11','Tutorial_5',3,'',7,1),(26,'2024-02-14 13:55:08.060819','28','Tutorial_13639',3,'',7,1),(27,'2024-02-14 13:55:08.064215','27','Tutorial_1369',3,'',7,1),(28,'2024-02-14 13:55:08.066134','26','Tutorial_1339',3,'',7,1),(29,'2024-02-14 13:55:08.067658','20','Tutorial_49',3,'',7,1),(30,'2024-02-14 13:55:08.069156','19','Tutorial_39',3,'',7,1),(31,'2024-02-14 13:55:08.070249','10','Tutorial_6',3,'',7,1),(32,'2024-02-14 13:55:16.236641','24','Tutorial_149',3,'',7,1),(33,'2024-02-14 13:55:16.238407','23','Tutorial_119',3,'',7,1),(34,'2024-02-14 13:55:16.239532','22','Tutorial_29',3,'',7,1),(35,'2024-02-14 13:55:16.241030','21','Tutorial_59',3,'',7,1),(36,'2024-02-14 13:55:22.322798','25','Tutorial_169',3,'',7,1),(37,'2024-02-18 21:34:10.275316','31','FirstT',1,'[{\"added\": {}}]',7,1),(38,'2024-02-18 21:34:30.667332','32','SecondT',1,'[{\"added\": {}}]',7,1),(39,'2024-02-18 21:34:55.323844','31','FirstT',2,'[{\"changed\": {\"fields\": [\"Tutorial publish date\"]}}]',7,1),(40,'2024-02-19 14:15:13.496682','35','fsf333',3,'',7,1),(41,'2024-02-19 14:15:13.499097','34','asd',3,'',7,1),(42,'2024-02-19 14:15:13.500183','33','dfg',3,'',7,1),(43,'2024-02-19 14:15:18.672763','36','fdv',3,'',7,1),(44,'2024-02-19 14:26:59.286127','40','adadas6',3,'',7,1),(45,'2024-02-19 14:26:59.288714','39','adadas',3,'',7,1),(46,'2024-02-19 14:26:59.289967','38','fkdmfkvm',3,'',7,1),(47,'2024-02-19 14:26:59.291443','37','sds',3,'',7,1),(48,'2024-02-19 15:08:24.961545','42','Tutorial_5',3,'',7,1),(49,'2024-02-19 15:08:24.964506','31','FirstT',3,'',7,1),(50,'2024-02-19 15:08:24.966216','41','Hello',3,'',7,1),(51,'2024-02-19 15:08:24.967773','32','SecondT',3,'',7,1),(52,'2024-02-19 20:22:40.876538','45','sjbchj',1,'[{\"added\": {}}]',7,1),(53,'2024-02-19 20:23:17.244403','46','asxsax',1,'[{\"added\": {}}]',7,1),(54,'2024-02-20 10:38:21.647008','44','Python3 for beginners - 2024',2,'[{\"changed\": {\"fields\": [\"Tutorial description\", \"Tutorial publish date\"]}}]',7,1),(55,'2024-02-20 14:35:29.029360','51','test',2,'[{\"changed\": {\"fields\": [\"Tutorial published\"]}}]',7,1),(56,'2024-02-20 14:38:12.649206','51','test',2,'[{\"changed\": {\"fields\": [\"Tutorial publish date\", \"Tutorial published\"]}}]',7,1),(57,'2024-02-20 14:38:49.184651','51','test',2,'[{\"changed\": {\"fields\": [\"Tutorial publish date\", \"Tutorial published\"]}}]',7,1),(58,'2024-02-20 15:04:15.500887','51','test1',2,'[{\"changed\": {\"fields\": [\"Tutorial published\"]}}]',7,1),(59,'2024-02-24 13:51:28.852290','44','Python for beginners - 2024',2,'[{\"changed\": {\"fields\": [\"Tutorial title\"]}}]',7,1),(60,'2024-02-24 13:51:43.557854','59','Docker for beginners - 2024',1,'[{\"added\": {}}]',7,1),(61,'2024-02-24 13:52:01.537869','59','Docker for beginners - 2024',2,'[{\"changed\": {\"fields\": [\"Tutorial description\"]}}]',7,1);
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
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(5,'contenttypes','contenttype'),(7,'IT_Tutorials__main','tutorial'),(6,'sessions','session'),(8,'token_blacklist','blacklistedtoken'),(9,'token_blacklist','outstandingtoken');
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
INSERT INTO `django_migrations` VALUES (1,'IT_Tutorials__main','0001_initial','2024-02-14 08:42:09.647500'),(2,'contenttypes','0001_initial','2024-02-14 08:42:09.659971'),(3,'auth','0001_initial','2024-02-14 08:42:09.741442'),(4,'admin','0001_initial','2024-02-14 08:42:09.767130'),(5,'admin','0002_logentry_remove_auto_add','2024-02-14 08:42:09.770190'),(6,'admin','0003_logentry_add_action_flag_choices','2024-02-14 08:42:09.772923'),(7,'contenttypes','0002_remove_content_type_name','2024-02-14 08:42:09.790756'),(8,'auth','0002_alter_permission_name_max_length','2024-02-14 08:42:09.800803'),(9,'auth','0003_alter_user_email_max_length','2024-02-14 08:42:09.808719'),(10,'auth','0004_alter_user_username_opts','2024-02-14 08:42:09.811723'),(11,'auth','0005_alter_user_last_login_null','2024-02-14 08:42:09.821550'),(12,'auth','0006_require_contenttypes_0002','2024-02-14 08:42:09.821925'),(13,'auth','0007_alter_validators_add_error_messages','2024-02-14 08:42:09.824702'),(14,'auth','0008_alter_user_username_max_length','2024-02-14 08:42:09.836916'),(15,'auth','0009_alter_user_last_name_max_length','2024-02-14 08:42:09.850399'),(16,'auth','0010_alter_group_name_max_length','2024-02-14 08:42:09.856458'),(17,'auth','0011_update_proxy_permissions','2024-02-14 08:42:09.859785'),(18,'auth','0012_alter_user_first_name_max_length','2024-02-14 08:42:09.870819'),(19,'sessions','0001_initial','2024-02-14 08:42:09.876742'),(20,'token_blacklist','0001_initial','2024-02-14 08:42:09.904620'),(21,'token_blacklist','0002_outstandingtoken_jti_hex','2024-02-14 08:42:09.911747'),(22,'token_blacklist','0003_auto_20171017_2007','2024-02-14 08:42:09.917390'),(23,'token_blacklist','0004_auto_20171017_2013','2024-02-14 08:42:09.929870'),(24,'token_blacklist','0005_remove_outstandingtoken_jti','2024-02-14 08:42:09.939362'),(25,'token_blacklist','0006_auto_20171017_2113','2024-02-14 08:42:09.945522'),(26,'token_blacklist','0007_auto_20171017_2214','2024-02-14 08:42:09.978082'),(27,'token_blacklist','0008_migrate_to_bigautofield','2024-02-14 08:42:10.013334'),(28,'token_blacklist','0010_fix_migrate_to_bigautofield','2024-02-14 08:42:10.019511'),(29,'token_blacklist','0011_linearizes_history','2024-02-14 08:42:10.019933'),(30,'token_blacklist','0012_alter_outstandingtoken_user','2024-02-14 08:42:10.023110'),(31,'IT_Tutorials__main','0002_alter_tutorial_publish_date','2024-02-14 09:22:43.499010'),(32,'IT_Tutorials__main','0003_alter_tutorial_publish_date','2024-02-14 09:23:39.626277'),(33,'IT_Tutorials__main','0004_alter_tutorial_publish_date','2024-02-14 10:36:58.147054'),(34,'IT_Tutorials__main','0005_alter_tutorial_publish_date','2024-02-14 10:41:23.245035'),(35,'IT_Tutorials__main','0006_alter_tutorial_publish_date','2024-02-14 10:44:35.317455'),(36,'IT_Tutorials__main','0007_alter_tutorial_publish_date','2024-02-14 10:44:52.350182'),(37,'IT_Tutorials__main','0008_alter_tutorial_publish_date','2024-02-14 10:48:22.223998');
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
INSERT INTO `django_session` VALUES ('ycg2jwagsdwiclug4blw22l42xcai4nw','.eJxVjDkOwjAUBe_iGlleYhtT0nMG62_GAeRIWSrE3VGkFNC-mXlvVWBbW9kWmcvI6qKsOv1uCPSUvgN-QL9Pmqa-ziPqXdEHXfRtYnldD_fvoMHS9tqbnAPCmU1i54cK3lgJNLClaARzNYhQY_RVhIlEQgoEIaFDR2jU5wv_BDk6:1rc5FO:_MDckbY5R41uEfzZeJ2FmH595iTAfTetfOeiu28dML8','2024-03-04 15:07:58.862033');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `IT_Tutorials__main_tutorial`
--

DROP TABLE IF EXISTS `IT_Tutorials__main_tutorial`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `IT_Tutorials__main_tutorial` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL,
  `description` longtext NOT NULL,
  `published` tinyint(1) NOT NULL,
  `publish_date` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `title` (`title`)
) ENGINE=InnoDB AUTO_INCREMENT=60 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `IT_Tutorials__main_tutorial`
--

LOCK TABLES `IT_Tutorials__main_tutorial` WRITE;
/*!40000 ALTER TABLE `IT_Tutorials__main_tutorial` DISABLE KEYS */;
INSERT INTO `IT_Tutorials__main_tutorial` VALUES (43,'JavaScript for beginners -2024','Lorem ipsum dolor sit amet consectetur adipisicing elit. Porro soluta totam, quas consequatur deserunt inventore cupiditate veritatis, alias placeat perferendis iste odit asperiores dolore recusandae amet ex doloribus natus quis!!!!!!',0,NULL),(44,'Python for beginners - 2024','Lorem ipsum dolor sit amet consectetur adipisicing elit. Eligendi, amet officia! Quia id, provident laboriosam laudantium deserunt in, ea asperiores expedita at ad nisi odit cumque odio corrupti quasi reiciendis.\r\nAt quaerat accusamus delectus eos vero unde nam facere a in magni dolore aspernatur perferendis, perspiciatis excepturi expedita soluta! Ratione labore et quas est dolorum repellendus libero facilis amet at?\r\nConsectetur possimus, enim ut ex ipsam cumque harum expedita, sunt atque perspiciatis reprehenderit vero iusto? Accusamus dicta ducimus animi! Dolorem ut nam officiis veritatis alias hic, exercitationem assumenda necessitatibus! Quia.',0,NULL),(59,'Docker for beginners - 2024','Lorem ipsum dolor sit amet consectetur adipisicing elit. Eligendi, amet officia! Quia id, provident laboriosam laudantium deserunt in, ea asperiores expedita at ad nisi odit cumque odio corrupti quasi reiciendis.\r\nAt quaerat accusamus delectus eos vero unde nam facere a in magni dolore aspernatur perferendis, perspiciatis excepturi expedita soluta! Ratione labore et quas est dolorum repellendus libero facilis amet at!',1,'2024-02-24');
/*!40000 ALTER TABLE `IT_Tutorials__main_tutorial` ENABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `token_blacklist_blacklistedtoken`
--

LOCK TABLES `token_blacklist_blacklistedtoken` WRITE;
/*!40000 ALTER TABLE `token_blacklist_blacklistedtoken` DISABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `token_blacklist_outstandingtoken`
--

LOCK TABLES `token_blacklist_outstandingtoken` WRITE;
/*!40000 ALTER TABLE `token_blacklist_outstandingtoken` DISABLE KEYS */;
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

-- Dump completed on 2024-02-24 17:03:10
