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

CREATE TABLE
  `auth_group` (
    `id` int NOT NULL AUTO_INCREMENT,
    `name` varchar(150) NOT NULL,
    PRIMARY KEY (`id`),
    UNIQUE KEY `name` (`name`)
  ) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;

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

CREATE TABLE
  `auth_group_permissions` (
    `id` bigint NOT NULL AUTO_INCREMENT,
    `group_id` int NOT NULL,
    `permission_id` int NOT NULL,
    PRIMARY KEY (`id`),
    UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`, `permission_id`),
    KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
    CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
    CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
  ) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;

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

CREATE TABLE
  `auth_permission` (
    `id` int NOT NULL AUTO_INCREMENT,
    `name` varchar(255) NOT NULL,
    `content_type_id` int NOT NULL,
    `codename` varchar(100) NOT NULL,
    PRIMARY KEY (`id`),
    UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`, `codename`),
    CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
  ) ENGINE = InnoDB AUTO_INCREMENT = 37 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;

/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--
LOCK TABLES `auth_permission` WRITE;

/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;

INSERT INTO
  `auth_permission`
VALUES
  (1, 'Can add log entry', 1, 'add_logentry'),
  (2, 'Can change log entry', 1, 'change_logentry'),
  (3, 'Can delete log entry', 1, 'delete_logentry'),
  (4, 'Can view log entry', 1, 'view_logentry'),
  (5, 'Can add permission', 2, 'add_permission'),
  (
    6,
    'Can change permission',
    2,
    'change_permission'
  ),
  (
    7,
    'Can delete permission',
    2,
    'delete_permission'
  ),
  (8, 'Can view permission', 2, 'view_permission'),
  (9, 'Can add group', 3, 'add_group'),
  (10, 'Can change group', 3, 'change_group'),
  (11, 'Can delete group', 3, 'delete_group'),
  (12, 'Can view group', 3, 'view_group'),
  (13, 'Can add content type', 4, 'add_contenttype'),
  (
    14,
    'Can change content type',
    4,
    'change_contenttype'
  ),
  (
    15,
    'Can delete content type',
    4,
    'delete_contenttype'
  ),
  (
    16,
    'Can view content type',
    4,
    'view_contenttype'
  ),
  (17, 'Can add session', 5, 'add_session'),
  (18, 'Can change session', 5, 'change_session'),
  (19, 'Can delete session', 5, 'delete_session'),
  (20, 'Can view session', 5, 'view_session'),
  (21, 'Can add Tutorial', 6, 'add_tutorial'),
  (22, 'Can change Tutorial', 6, 'change_tutorial'),
  (23, 'Can delete Tutorial', 6, 'delete_tutorial'),
  (24, 'Can view Tutorial', 6, 'view_tutorial'),
  (25, 'Can add User', 7, 'add_user'),
  (26, 'Can change User', 7, 'change_user'),
  (27, 'Can delete User', 7, 'delete_user'),
  (28, 'Can view User', 7, 'view_user'),
  (
    29,
    'Can add blacklisted token',
    8,
    'add_blacklistedtoken'
  ),
  (
    30,
    'Can change blacklisted token',
    8,
    'change_blacklistedtoken'
  ),
  (
    31,
    'Can delete blacklisted token',
    8,
    'delete_blacklistedtoken'
  ),
  (
    32,
    'Can view blacklisted token',
    8,
    'view_blacklistedtoken'
  ),
  (
    33,
    'Can add outstanding token',
    9,
    'add_outstandingtoken'
  ),
  (
    34,
    'Can change outstanding token',
    9,
    'change_outstandingtoken'
  ),
  (
    35,
    'Can delete outstanding token',
    9,
    'delete_outstandingtoken'
  ),
  (
    36,
    'Can view outstanding token',
    9,
    'view_outstandingtoken'
  );

/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;

UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--
DROP TABLE IF EXISTS `django_admin_log`;

/*!40101 SET @saved_cs_client     = @@character_set_client */;

/*!50503 SET character_set_client = utf8mb4 */;

CREATE TABLE
  `django_admin_log` (
    `id` int NOT NULL AUTO_INCREMENT,
    `action_time` datetime (6) NOT NULL,
    `object_id` longtext,
    `object_repr` varchar(200) NOT NULL,
    `action_flag` smallint unsigned NOT NULL,
    `change_message` longtext NOT NULL,
    `content_type_id` int DEFAULT NULL,
    `user_id` bigint NOT NULL,
    PRIMARY KEY (`id`),
    KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
    KEY `django_admin_log_user_id_c564eba6_fk_IT_Tutorials__main_user_id` (`user_id`),
    CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
    CONSTRAINT `django_admin_log_user_id_c564eba6_fk_IT_Tutorials__main_user_id` FOREIGN KEY (`user_id`) REFERENCES `IT_Tutorials__main_user` (`id`),
    CONSTRAINT `django_admin_log_chk_1` CHECK ((`action_flag` >= 0))
  ) ENGINE = InnoDB AUTO_INCREMENT = 90 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;

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

CREATE TABLE
  `django_content_type` (
    `id` int NOT NULL AUTO_INCREMENT,
    `app_label` varchar(100) NOT NULL,
    `model` varchar(100) NOT NULL,
    PRIMARY KEY (`id`),
    UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`, `model`)
  ) ENGINE = InnoDB AUTO_INCREMENT = 10 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;

/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--
LOCK TABLES `django_content_type` WRITE;

/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;

INSERT INTO
  `django_content_type`
VALUES
  (1, 'admin', 'logentry'),
  (3, 'auth', 'group'),
  (2, 'auth', 'permission'),
  (4, 'contenttypes', 'contenttype'),
  (6, 'IT_Tutorials__main', 'tutorial'),
  (7, 'IT_Tutorials__main', 'user'),
  (5, 'sessions', 'session'),
  (8, 'token_blacklist', 'blacklistedtoken'),
  (9, 'token_blacklist', 'outstandingtoken');

/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;

UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--
DROP TABLE IF EXISTS `django_migrations`;

/*!40101 SET @saved_cs_client     = @@character_set_client */;

/*!50503 SET character_set_client = utf8mb4 */;

CREATE TABLE
  `django_migrations` (
    `id` bigint NOT NULL AUTO_INCREMENT,
    `app` varchar(255) NOT NULL,
    `name` varchar(255) NOT NULL,
    `applied` datetime (6) NOT NULL,
    PRIMARY KEY (`id`)
  ) ENGINE = InnoDB AUTO_INCREMENT = 31 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;

/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--
LOCK TABLES `django_migrations` WRITE;

/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;

INSERT INTO
  `django_migrations`
VALUES
  (
    1,
    'contenttypes',
    '0001_initial',
    '2024-02-27 12:09:59.745908'
  ),
  (
    2,
    'contenttypes',
    '0002_remove_content_type_name',
    '2024-02-27 12:09:59.756305'
  ),
  (
    3,
    'auth',
    '0001_initial',
    '2024-02-27 12:09:59.795208'
  ),
  (
    4,
    'auth',
    '0002_alter_permission_name_max_length',
    '2024-02-27 12:09:59.806076'
  ),
  (
    5,
    'auth',
    '0003_alter_user_email_max_length',
    '2024-02-27 12:09:59.808234'
  ),
  (
    6,
    'auth',
    '0004_alter_user_username_opts',
    '2024-02-27 12:09:59.810197'
  ),
  (
    7,
    'auth',
    '0005_alter_user_last_login_null',
    '2024-02-27 12:09:59.812018'
  ),
  (
    8,
    'auth',
    '0006_require_contenttypes_0002',
    '2024-02-27 12:09:59.812367'
  ),
  (
    9,
    'auth',
    '0007_alter_validators_add_error_messages',
    '2024-02-27 12:09:59.814090'
  ),
  (
    10,
    'auth',
    '0008_alter_user_username_max_length',
    '2024-02-27 12:09:59.815913'
  ),
  (
    11,
    'auth',
    '0009_alter_user_last_name_max_length',
    '2024-02-27 12:09:59.817749'
  ),
  (
    12,
    'auth',
    '0010_alter_group_name_max_length',
    '2024-02-27 12:09:59.822041'
  ),
  (
    13,
    'auth',
    '0011_update_proxy_permissions',
    '2024-02-27 12:09:59.824531'
  ),
  (
    14,
    'auth',
    '0012_alter_user_first_name_max_length',
    '2024-02-27 12:09:59.826578'
  ),
  (
    15,
    'IT_Tutorials__main',
    '0001_initial',
    '2024-02-27 12:09:59.871944'
  ),
  (
    16,
    'admin',
    '0001_initial',
    '2024-02-27 12:09:59.894954'
  ),
  (
    17,
    'admin',
    '0002_logentry_remove_auto_add',
    '2024-02-27 12:09:59.899019'
  ),
  (
    18,
    'admin',
    '0003_logentry_add_action_flag_choices',
    '2024-02-27 12:09:59.902552'
  ),
  (
    19,
    'sessions',
    '0001_initial',
    '2024-02-27 12:09:59.908523'
  ),
  (
    20,
    'token_blacklist',
    '0001_initial',
    '2024-02-27 12:09:59.938321'
  ),
  (
    21,
    'token_blacklist',
    '0002_outstandingtoken_jti_hex',
    '2024-02-27 12:09:59.945603'
  ),
  (
    22,
    'token_blacklist',
    '0003_auto_20171017_2007',
    '2024-02-27 12:09:59.951175'
  ),
  (
    23,
    'token_blacklist',
    '0004_auto_20171017_2013',
    '2024-02-27 12:09:59.964999'
  ),
  (
    24,
    'token_blacklist',
    '0005_remove_outstandingtoken_jti',
    '2024-02-27 12:09:59.973546'
  ),
  (
    25,
    'token_blacklist',
    '0006_auto_20171017_2113',
    '2024-02-27 12:09:59.980615'
  ),
  (
    26,
    'token_blacklist',
    '0007_auto_20171017_2214',
    '2024-02-27 12:10:00.018751'
  ),
  (
    27,
    'token_blacklist',
    '0008_migrate_to_bigautofield',
    '2024-02-27 12:10:00.056312'
  ),
  (
    28,
    'token_blacklist',
    '0010_fix_migrate_to_bigautofield',
    '2024-02-27 12:10:00.062729'
  ),
  (
    29,
    'token_blacklist',
    '0011_linearizes_history',
    '2024-02-27 12:10:00.063235'
  ),
  (
    30,
    'token_blacklist',
    '0012_alter_outstandingtoken_user',
    '2024-02-27 12:10:00.066446'
  );

/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;

UNLOCK TABLES;

--
-- Table structure for table `django_session`
--
DROP TABLE IF EXISTS `django_session`;

/*!40101 SET @saved_cs_client     = @@character_set_client */;

/*!50503 SET character_set_client = utf8mb4 */;

CREATE TABLE
  `django_session` (
    `session_key` varchar(40) NOT NULL,
    `session_data` longtext NOT NULL,
    `expire_date` datetime (6) NOT NULL,
    PRIMARY KEY (`session_key`),
    KEY `django_session_expire_date_a5c62663` (`expire_date`)
  ) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;

/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--
LOCK TABLES `django_session` WRITE;

/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;

/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;

UNLOCK TABLES;

--
-- Table structure for table `IT_Tutorials__main_tutorial`
--
DROP TABLE IF EXISTS `IT_Tutorials__main_tutorial`;

/*!40101 SET @saved_cs_client     = @@character_set_client */;

/*!50503 SET character_set_client = utf8mb4 */;

CREATE TABLE
  `IT_Tutorials__main_tutorial` (
    `id` bigint NOT NULL AUTO_INCREMENT,
    `title` varchar(100) NOT NULL,
    `description` longtext NOT NULL,
    `published` tinyint (1) NOT NULL,
    `publish_date` date DEFAULT NULL,
    PRIMARY KEY (`id`),
    UNIQUE KEY `title` (`title`)
  ) ENGINE = InnoDB AUTO_INCREMENT = 37 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;

/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `IT_Tutorials__main_tutorial`
--
LOCK TABLES `IT_Tutorials__main_tutorial` WRITE;

/*!40000 ALTER TABLE `IT_Tutorials__main_tutorial` DISABLE KEYS */;

INSERT INTO
  `IT_Tutorials__main_tutorial`
VALUES
  (
    18,
    'About Python - 2024',
    'Lorem ipsum dolor, sit amet consectetur adipisicing elit. Sit dolore eos cupiditate illum deleniti repellat itaque, qui vitae? Non commodi cupiditate praesentium. Hic ducimus commodi nisi nulla corporis beatae odio!',
    1,
    '2024-03-01'
  ),
  (
    19,
    'About JavaScript - 2024',
    'Lorem ipsum dolor, sit amet consectetur adipisicing elit. Sit dolore eos cupiditate illum deleniti repellat itaque, qui vitae? Non commodi cupiditate praesentium. Hic ducimus commodi nisi nulla corporis beatae odio!\nLorem ipsum dolor, sit amet consectetur adipisicing elit. Sit dolore eos cupiditate illum deleniti repellat itaque, qui vitae? Non commodi cupiditate praesentium. Hic ducimus commodi nisi nulla corporis beatae odio!',
    1,
    '2024-03-01'
  ),
  (
    20,
    'About SCSS - 2024',
    'Lorem ipsum dolor, sit amet consectetur adipisicing elit. Sit dolore eos cupiditate illum deleniti repellat itaque, qui vitae? Non commodi cupiditate praesentium. Hic ducimus commodi nisi nulla corporis beatae odio!\nLorem ipsum dolor, sit amet consectetur adipisicing elit. Sit dolore eos cupiditate illum deleniti repellat itaque, qui vitaei?',
    0,
    NULL
  );

/*!40000 ALTER TABLE `IT_Tutorials__main_tutorial` ENABLE KEYS */;

UNLOCK TABLES;

--
-- Table structure for table `IT_Tutorials__main_user`
--
DROP TABLE IF EXISTS `IT_Tutorials__main_user`;

/*!40101 SET @saved_cs_client     = @@character_set_client */;

/*!50503 SET character_set_client = utf8mb4 */;

CREATE TABLE
  `IT_Tutorials__main_user` (
    `id` bigint NOT NULL AUTO_INCREMENT,
    `password` varchar(128) NOT NULL,
    `last_login` datetime (6) DEFAULT NULL,
    `is_superuser` tinyint (1) NOT NULL,
    `first_name` varchar(150) NOT NULL,
    `last_name` varchar(150) NOT NULL,
    `email` varchar(254) NOT NULL,
    `is_staff` tinyint (1) NOT NULL,
    `is_active` tinyint (1) NOT NULL,
    `date_joined` datetime (6) NOT NULL,
    `username` varchar(100) NOT NULL,
    PRIMARY KEY (`id`),
    UNIQUE KEY `username` (`username`)
  ) ENGINE = InnoDB AUTO_INCREMENT = 11 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;

/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `IT_Tutorials__main_user`
--
LOCK TABLES `IT_Tutorials__main_user` WRITE;

/*!40000 ALTER TABLE `IT_Tutorials__main_user` DISABLE KEYS */;

INSERT INTO
  `IT_Tutorials__main_user`
VALUES
  (
    1,
    'pbkdf2_sha256$720000$CyCRQVFakk0cd6I41jjw7z$Vh5p97lhcA30MdoH2DxEzlNTLCoV8Rp1ORVDYiQKHJo=',
    '2024-03-09 20:01:44.946019',
    1,
    '',
    '',
    '',
    1,
    1,
    '2024-02-27 12:10:21.264315',
    'admin'
  );

/*!40000 ALTER TABLE `IT_Tutorials__main_user` ENABLE KEYS */;

UNLOCK TABLES;

--
-- Table structure for table `IT_Tutorials__main_user_groups`
--
DROP TABLE IF EXISTS `IT_Tutorials__main_user_groups`;

/*!40101 SET @saved_cs_client     = @@character_set_client */;

/*!50503 SET character_set_client = utf8mb4 */;

CREATE TABLE
  `IT_Tutorials__main_user_groups` (
    `id` bigint NOT NULL AUTO_INCREMENT,
    `user_id` bigint NOT NULL,
    `group_id` int NOT NULL,
    PRIMARY KEY (`id`),
    UNIQUE KEY `IT_Tutorials__main_user_groups_user_id_group_id_4b2ed3e7_uniq` (`user_id`, `group_id`),
    KEY `IT_Tutorials__main_u_group_id_f16303c5_fk_auth_grou` (`group_id`),
    CONSTRAINT `IT_Tutorials__main_u_group_id_f16303c5_fk_auth_grou` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
    CONSTRAINT `IT_Tutorials__main_u_user_id_aa87ac3e_fk_IT_Tutori` FOREIGN KEY (`user_id`) REFERENCES `IT_Tutorials__main_user` (`id`)
  ) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;

/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `IT_Tutorials__main_user_groups`
--
LOCK TABLES `IT_Tutorials__main_user_groups` WRITE;

/*!40000 ALTER TABLE `IT_Tutorials__main_user_groups` DISABLE KEYS */;

/*!40000 ALTER TABLE `IT_Tutorials__main_user_groups` ENABLE KEYS */;

UNLOCK TABLES;

--
-- Table structure for table `IT_Tutorials__main_user_user_permissions`
--
DROP TABLE IF EXISTS `IT_Tutorials__main_user_user_permissions`;

/*!40101 SET @saved_cs_client     = @@character_set_client */;

/*!50503 SET character_set_client = utf8mb4 */;

CREATE TABLE
  `IT_Tutorials__main_user_user_permissions` (
    `id` bigint NOT NULL AUTO_INCREMENT,
    `user_id` bigint NOT NULL,
    `permission_id` int NOT NULL,
    PRIMARY KEY (`id`),
    UNIQUE KEY `IT_Tutorials__main_user__user_id_permission_id_fb1d8848_uniq` (`user_id`, `permission_id`),
    KEY `IT_Tutorials__main_u_permission_id_b7dd4841_fk_auth_perm` (`permission_id`),
    CONSTRAINT `IT_Tutorials__main_u_permission_id_b7dd4841_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
    CONSTRAINT `IT_Tutorials__main_u_user_id_2d1f9dcc_fk_IT_Tutori` FOREIGN KEY (`user_id`) REFERENCES `IT_Tutorials__main_user` (`id`)
  ) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;

/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `IT_Tutorials__main_user_user_permissions`
--
LOCK TABLES `IT_Tutorials__main_user_user_permissions` WRITE;

/*!40000 ALTER TABLE `IT_Tutorials__main_user_user_permissions` DISABLE KEYS */;

/*!40000 ALTER TABLE `IT_Tutorials__main_user_user_permissions` ENABLE KEYS */;

UNLOCK TABLES;

--
-- Table structure for table `token_blacklist_blacklistedtoken`
--
DROP TABLE IF EXISTS `token_blacklist_blacklistedtoken`;

/*!40101 SET @saved_cs_client     = @@character_set_client */;

/*!50503 SET character_set_client = utf8mb4 */;

CREATE TABLE
  `token_blacklist_blacklistedtoken` (
    `id` bigint NOT NULL AUTO_INCREMENT,
    `blacklisted_at` datetime (6) NOT NULL,
    `token_id` bigint NOT NULL,
    PRIMARY KEY (`id`),
    UNIQUE KEY `token_id` (`token_id`),
    CONSTRAINT `token_blacklist_blacklistedtoken_token_id_3cc7fe56_fk` FOREIGN KEY (`token_id`) REFERENCES `token_blacklist_outstandingtoken` (`id`)
  ) ENGINE = InnoDB AUTO_INCREMENT = 87 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;

/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `token_blacklist_blacklistedtoken`
--
LOCK TABLES `token_blacklist_blacklistedtoken` WRITE;

/*!40000 ALTER TABLE `token_blacklist_blacklistedtoken` DISABLE KEYS */;

INSERT INTO
  `token_blacklist_blacklistedtoken`
VALUES
  (72, '2024-03-01 10:18:11.400133', 115),
  (73, '2024-03-02 16:29:33.939164', 117),
  (74, '2024-03-02 18:19:03.454138', 129),
  (75, '2024-03-02 18:24:06.341338', 130),
  (76, '2024-03-02 19:11:03.334256', 131),
  (77, '2024-03-02 19:13:02.780263', 132),
  (78, '2024-03-02 20:22:00.913479', 133),
  (79, '2024-03-02 20:34:26.896773', 134),
  (80, '2024-03-02 20:49:20.891724', 135),
  (81, '2024-03-09 13:35:21.963883', 136),
  (82, '2024-03-09 13:56:38.880099', 137),
  (83, '2024-03-09 13:58:21.282548', 138),
  (84, '2024-03-09 19:17:47.920769', 139),
  (85, '2024-03-09 19:20:58.904763', 140),
  (86, '2024-03-09 19:43:51.221441', 141);

/*!40000 ALTER TABLE `token_blacklist_blacklistedtoken` ENABLE KEYS */;

UNLOCK TABLES;

--
-- Table structure for table `token_blacklist_outstandingtoken`
--
DROP TABLE IF EXISTS `token_blacklist_outstandingtoken`;

/*!40101 SET @saved_cs_client     = @@character_set_client */;

/*!50503 SET character_set_client = utf8mb4 */;

CREATE TABLE
  `token_blacklist_outstandingtoken` (
    `id` bigint NOT NULL AUTO_INCREMENT,
    `token` longtext NOT NULL,
    `created_at` datetime (6) DEFAULT NULL,
    `expires_at` datetime (6) NOT NULL,
    `user_id` bigint DEFAULT NULL,
    `jti` varchar(255) NOT NULL,
    PRIMARY KEY (`id`),
    UNIQUE KEY `token_blacklist_outstandingtoken_jti_hex_d9bdf6f7_uniq` (`jti`),
    KEY `token_blacklist_outs_user_id_83bc629a_fk_IT_Tutori` (`user_id`),
    CONSTRAINT `token_blacklist_outs_user_id_83bc629a_fk_IT_Tutori` FOREIGN KEY (`user_id`) REFERENCES `IT_Tutorials__main_user` (`id`)
  ) ENGINE = InnoDB AUTO_INCREMENT = 143 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;

/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `token_blacklist_outstandingtoken`
--
LOCK TABLES `token_blacklist_outstandingtoken` WRITE;

/*!40000 ALTER TABLE `token_blacklist_outstandingtoken` DISABLE KEYS */;

INSERT INTO
  `token_blacklist_outstandingtoken`
VALUES
  (
    1,
    'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTcwOTEyMjU0MCwiaWF0IjoxNzA5MDM2MTQwLCJqdGkiOiI0MDdhMWRkM2E2NDE0ZWFmYWE3MzI4MDZiODRmNWU1MiIsInVzZXJfaWQiOjF9.BoXtCR5Q1PL6-RM42LbnnN0uV4gzfI4s4fisdl_n6ro',
    '2024-02-27 12:15:40.725606',
    '2024-02-28 12:15:40.000000',
    1,
    '407a1dd3a6414eafaa732806b84f5e52'
  ),
  (
    2,
    'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTcwOTEyNDkxOSwiaWF0IjoxNzA5MDM4NTE5LCJqdGkiOiIyMWNmODFjOTlmNTQ0ZmZjOWNhNDhlMTM3NmVlNjQyZCIsInVzZXJfaWQiOjF9.U7gHBmVVivdsP7k3tCDvFrcwpGp13aEQKDPkUf7Wbbk',
    '2024-02-27 12:55:19.162388',
    '2024-02-28 12:55:19.000000',
    1,
    '21cf81c99f544ffc9ca48e1376ee642d'
  ),
  (
    3,
    'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTcwOTEyNDkyMCwiaWF0IjoxNzA5MDM4NTIwLCJqdGkiOiJjN2Q5Y2ZhYTY3NDc0NWVmYjA1M2M2ZGI4MzNkZThhOSIsInVzZXJfaWQiOjF9.iLjnNWWtLe7GEmndK0X1UVjznOvIJfWgLZ1XqH_YPbE',
    '2024-02-27 12:55:20.336401',
    '2024-02-28 12:55:20.000000',
    1,
    'c7d9cfaa674745efb053c6db833de8a9'
  ),
  (
    4,
    'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTcwOTEyNTI1OCwiaWF0IjoxNzA5MDM4ODU4LCJqdGkiOiJlZjE2MDI2MTUxMjU0MWJmYjhhMTY4ZjZiYTI3OGEzYSIsInVzZXJfaWQiOjF9.IuUUOko5UmgAbQlM_C2aC6H68muR4Y-uCRP_NmwYOss',
    '2024-02-27 13:00:58.156101',
    '2024-02-28 13:00:58.000000',
    1,
    'ef160261512541bfb8a168f6ba278a3a'
  ),
  (
    5,
    'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTcwOTEyNTI3OSwiaWF0IjoxNzA5MDM4ODc5LCJqdGkiOiJlMjEzMTE3NjdjMDE0YzBjOWExMDA3ZmUxMjQ3OGYxZiIsInVzZXJfaWQiOjF9.z4qWkv3c3NkW4SogoSrl5duUCaL9hcGon_X8bS45TU4',
    '2024-02-27 13:01:19.865735',
    '2024-02-28 13:01:19.000000',
    1,
    'e21311767c014c0c9a1007fe12478f1f'
  ),
  (
    6,
    'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTcwOTEyNTMxOSwiaWF0IjoxNzA5MDM4OTE5LCJqdGkiOiI2OTVlYWJlYWJmY2I0N2M1YTcwZmI0MWJjOGM1YmY5OSIsInVzZXJfaWQiOjF9.iFRkTHTcKwnAzTrD8AWa_idFoABfdn2uaXLmWG0-vtY',
    '2024-02-27 13:01:59.254400',
    '2024-02-28 13:01:59.000000',
    1,
    '695eabeabfcb47c5a70fb41bc8c5bf99'
  ),
  (
    7,
    'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTcwOTEyNTM1OCwiaWF0IjoxNzA5MDM4OTU4LCJqdGkiOiJlMjc1YzE3MGU1N2I0NmM0ODFkZmMxMTkzMzQ0ZmM5ZiIsInVzZXJfaWQiOjF9.1_p6FNtKD4i-yYKknMveN1lHD1z5GfLfq0nHSGgRG-4',
    '2024-02-27 13:02:38.125643',
    '2024-02-28 13:02:38.000000',
    1,
    'e275c170e57b46c481dfc1193344fc9f'
  ),
  (
    8,
    'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTcwOTEyNTM2NCwiaWF0IjoxNzA5MDM4OTY0LCJqdGkiOiIyYTc1N2VhNDBiZWQ0ZTc5YTA2MDZjZWM5MWEzZWU2OSIsInVzZXJfaWQiOjF9.3L8fi2pUujqw96CwHfJyzAaFq60pOVB1RjVqeeiWohg',
    '2024-02-27 13:02:44.788985',
    '2024-02-28 13:02:44.000000',
    1,
    '2a757ea40bed4e79a0606cec91a3ee69'
  ),
  (
    9,
    'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTcwOTEzNzk4NCwiaWF0IjoxNzA5MDUxNTg0LCJqdGkiOiI3NTUxNmM5ZTc3ZjI0MGViYjg0YzU0ZTc4ZGFhYzRlNCIsInVzZXJfaWQiOjV9.g3dt-MTltRq89Gc-r7Gz-nrI6hcD7fbejkwOfc1rOWA',
    '2024-02-27 16:33:04.840107',
    '2024-02-28 16:33:04.000000',
    NULL,
    '75516c9e77f240ebb84c54e78daac4e4'
  ),
  (
    10,
    'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTcwOTE0MDkzNywiaWF0IjoxNzA5MDU0NTM3LCJqdGkiOiJmZjA5ZjZkODEyNjQ0YWI2ODZiMGY2YjUzY2UyYjdmZCIsInVzZXJfaWQiOjV9.YSz6erpMqAzauPwsYZIW2bd7I_T5cWptRpcaeAef5ZE',
    '2024-02-27 17:22:17.617622',
    '2024-02-28 17:22:17.000000',
    NULL,
    'ff09f6d812644ab686b0f6b53ce2b7fd'
  ),
  (
    11,
    'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTcwOTE0NTQyNiwiaWF0IjoxNzA5MDU5MDI2LCJqdGkiOiJjMzVkZjZlYzhjMjQ0MmE3ODljYTRiZmEwNTdmMmI4MiIsInVzZXJfaWQiOjV9.3TL-17vYlQMOhy7PclD2oBvxlFeccygyVGfqAuxrvZ4',
    '2024-02-27 18:37:06.148926',
    '2024-02-28 18:37:06.000000',
    NULL,
    'c35df6ec8c2442a789ca4bfa057f2b82'
  ),
  (
    12,
    'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTcwOTE0ODgxMSwiaWF0IjoxNzA5MDYyNDExLCJqdGkiOiJiMmY3OWJmMzUzMDc0ZDFmOTQ5MzJmNzlhNzY2MzU1NCIsInVzZXJfaWQiOjV9.fec865tWqdXq2sunadqUhAyuXRWZMSKiL3MdqX5KOME',
    '2024-02-27 19:33:31.746057',
    '2024-02-28 19:33:31.000000',
    NULL,
    'b2f79bf353074d1f94932f79a7663554'
  ),
  (
    13,
    'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTcwOTE0ODg0NCwiaWF0IjoxNzA5MDYyNDQ0LCJqdGkiOiJiNjMxNzY3OGJiMmI0M2UyYmE0NzdjNTBmMjIwN2RmNyIsInVzZXJfaWQiOjV9.WrBuG5IyIA58gBtYdfYXH0HsxDfoTRZ8Xusqzi2GH6g',
    '2024-02-27 19:34:04.200076',
    '2024-02-28 19:34:04.000000',
    NULL,
    'b6317678bb2b43e2ba477c50f2207df7'
  ),
  (
    14,
    'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTcwOTE1MTc3NywiaWF0IjoxNzA5MDY1Mzc3LCJqdGkiOiIwNzRjYTRlZmM4Nzg0ODJmYWU4YmVlMzliZmIyY2U0MiIsInVzZXJfaWQiOjd9.ROsMuLt-imbz0AWHaExBXjegcTdl4fEY87zDYUHLX0E',
    '2024-02-27 20:22:57.915146',
    '2024-02-28 20:22:57.000000',
    NULL,
    '074ca4efc878482fae8bee39bfb2ce42'
  ),
  (
    15,
    'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTcwOTE1MzkwOCwiaWF0IjoxNzA5MDY3NTA4LCJqdGkiOiI0MmI4YWMyOTE1Mzc0ZmU4OGQzZDZhODIxZDZkYmQ1ZSIsInVzZXJfaWQiOjh9.m2wt2lh8pE9TE429ykDpQdKpSm_nJjMNClDsGgGruOs',
    '2024-02-27 20:58:28.400317',
    '2024-02-28 20:58:28.000000',
    NULL,
    '42b8ac2915374fe88d3d6a821d6dbd5e'
  ),
  (
    16,
    'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTcwOTE1NDQwNSwiaWF0IjoxNzA5MDY4MDA1LCJqdGkiOiJjYWRlZTI1MjhhYmE0NzViYTQ3MzA4NWI2YTRiZjNhYiIsInVzZXJfaWQiOjl9.t11wAX7XN2yOEz4qVpsLJF2BR_TeJC6-SJvirbHy2C0',
    '2024-02-27 21:06:45.004202',
    '2024-02-28 21:06:45.000000',
    NULL,
    'cadee2528aba475ba473085b6a4bf3ab'
  ),
  (
    17,
    'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTcwOTE1OTM0NCwiaWF0IjoxNzA5MDcyOTQ0LCJqdGkiOiJlZGU5ODg1ZDVjMjM0MTBkOTY5ZjMxM2MxYzY1OGE1ZiIsInVzZXJfaWQiOjV9.7JYO0mRK60j1Jmr9SJcvrg9r9GNSGaE575wtPC4uli4',
    '2024-02-27 22:29:04.025390',
    '2024-02-28 22:29:04.000000',
    NULL,
    'ede9885d5c23410d969f313c1c658a5f'
  ),
  (
    18,
    'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTcwOTE1OTQ0NywiaWF0IjoxNzA5MDczMDQ3LCJqdGkiOiJmZGZiZGE2NmQxMmU0NzIzYjU2OTdjODZlNTc2MjY5YyIsInVzZXJfaWQiOjV9.3VdNirJTsmYxEOK1l0qgit2QzhzIgIj5OEXvCtsEwMI',
    '2024-02-27 22:30:47.788828',
    '2024-02-28 22:30:47.000000',
    NULL,
    'fdfbda66d12e4723b5697c86e576269c'
  ),
  (
    19,
    'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTcwOTE1OTUzNiwiaWF0IjoxNzA5MDczMTM2LCJqdGkiOiJhZGE4MmM1NjAwZTM0MzdmOTcwODdhNGQ5MmIzMzIwYyIsInVzZXJfaWQiOjV9.sk2wDI5j4nKW0YXMIEv4vEYY8nWOQ9jaDjSZBfrnM-0',
    '2024-02-27 22:32:16.533485',
    '2024-02-28 22:32:16.000000',
    NULL,
    'ada82c5600e3437f97087a4d92b3320c'
  ),
  (
    20,
    'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTcwOTE2MDQ0NiwiaWF0IjoxNzA5MDc0MDQ2LCJqdGkiOiI4Njk1NDdjODViOGU0N2JlYmNmZDNjMDA5YTM4MzEwYSIsInVzZXJfaWQiOjF9.aHdJTwf1iRvL8EzdihqBye3rDqBcdF6OcoLqqyRmKns',
    '2024-02-27 22:47:26.366281',
    '2024-02-28 22:47:26.000000',
    1,
    '869547c85b8e47bebcfd3c009a38310a'
  ),
  (
    21,
    'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTcwOTE2MDU2MCwiaWF0IjoxNzA5MDc0MTYwLCJqdGkiOiI2ZjdhZmQ3ZmQ5M2E0YzBiYTIyYjQzNGQ2YzAzZDJmOSIsInVzZXJfaWQiOjF9.J_T-RJ-L__X8eyK8_n4ohKhCuWXHWMGj08lMN-wFj90',
    '2024-02-27 22:49:20.468375',
    '2024-02-28 22:49:20.000000',
    1,
    '6f7afd7fd93a4c0ba22b434d6c03d2f9'
  ),
  (
    22,
    'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTcwOTE2MDU4MywiaWF0IjoxNzA5MDc0MTgzLCJqdGkiOiI1NjlmMzNiOGU1NjA0MzhjYjkyYWM5YWM0N2ViNzhjMSIsInVzZXJfaWQiOjF9.tfQzv42C_zq7JKGr-fiw1IwquIgBjzJl6QAxHPSMEyo',
    '2024-02-27 22:49:43.198123',
    '2024-02-28 22:49:43.000000',
    1,
    '569f33b8e560438cb92ac9ac47eb78c1'
  ),
  (
    23,
    'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTcwOTE2MDU5MiwiaWF0IjoxNzA5MDc0MTkyLCJqdGkiOiI4NmM4NjA2MDdjYmQ0OGI0OWUyNjIxMjcxMjRjYTQ4OCIsInVzZXJfaWQiOjF9.Jt8BmJHOI4QTw373VHgGt4Zb5XkRT4wfwT7HFxR4Nmg',
    '2024-02-27 22:49:52.367955',
    '2024-02-28 22:49:52.000000',
    1,
    '86c860607cbd48b49e262127124ca488'
  ),
  (
    24,
    'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTcwOTE4ODM3NiwiaWF0IjoxNzA5MTAxOTc2LCJqdGkiOiI4YzcxNmZiZTYzNTk0Njk2OGJiZTBkMDc4MWE5YTc0MSIsInVzZXJfaWQiOjF9.odpf-g6BOZH-M6ufSDquHCDkhUko-iStcNucmrwAftQ',
    '2024-02-28 06:32:56.870923',
    '2024-02-29 06:32:56.000000',
    1,
    '8c716fbe635946968bbe0d0781a9a741'
  ),
  (
    25,
    'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTcwOTE4ODY1NSwiaWF0IjoxNzA5MTAyMjU1LCJqdGkiOiI1NDg5NDdlMTFkNzE0Yzg2OTM2Y2VlYzA3MjMxMjM3YiIsInVzZXJfaWQiOjEwfQ.hqurZGkIW5vz6u2s2WwnpuKZIUemMPGtKtoUqmG2Ihs',
    '2024-02-28 06:37:35.865712',
    '2024-02-29 06:37:35.000000',
    NULL,
    '548947e11d714c86936ceec07231237b'
  ),
  (
    26,
    'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTcwOTE4ODgzMSwiaWF0IjoxNzA5MTAyNDMxLCJqdGkiOiJkNDIzMWRjNzM3ZDA0YzQ2OTBhYTMyYzljZTFkMDJiMiIsInVzZXJfaWQiOjV9.EHlPUSWtrnynsny_GQxvx45ebumBx6BWRcXKXwa90kc',
    '2024-02-28 06:40:31.512422',
    '2024-02-29 06:40:31.000000',
    NULL,
    'd4231dc737d04c4690aa32c9ce1d02b2'
  ),
  (
    27,
    'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTcwOTE4ODg1NSwiaWF0IjoxNzA5MTAyNDU1LCJqdGkiOiI1ZWU1NTNiYTQ5MDA0ZDFjYjBkYzkxODFlMzY1NzZlOCIsInVzZXJfaWQiOjF9.rsUF4hO2f_yXPnlZMqVm7Pt_eVYzkWvB2FfbgpnEUyo',
    '2024-02-28 06:40:55.013005',
    '2024-02-29 06:40:55.000000',
    1,
    '5ee553ba49004d1cb0dc9181e36576e8'
  ),
  (
    28,
    'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTcwOTE4ODg2NiwiaWF0IjoxNzA5MTAyNDY2LCJqdGkiOiJkZDY4MTMxY2JmOTc0ZmYyOGU2MTVkNzZlMDM4YTA0OSIsInVzZXJfaWQiOjF9.LWpd-hiL3ZO2-RtO-n04SK5aZUapp5SBXOShK3umzdg',
    '2024-02-28 06:41:06.761317',
    '2024-02-29 06:41:06.000000',
    1,
    'dd68131cbf974ff28e615d76e038a049'
  ),
  (
    29,
    'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTcwOTE4ODg2NywiaWF0IjoxNzA5MTAyNDY3LCJqdGkiOiI5ZWZiMjQ0NzkyZjA0OGNkYmU5NTY4NDkzNTI3YWQyNSIsInVzZXJfaWQiOjF9.2gJcErJXHRf-XAVIq13X6gmNymIDxroKGYxkE-p2eHs',
    '2024-02-28 06:41:07.611467',
    '2024-02-29 06:41:07.000000',
    1,
    '9efb244792f048cdbe9568493527ad25'
  ),
  (
    30,
    'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTcwOTE4OTMxOSwiaWF0IjoxNzA5MTAyOTE5LCJqdGkiOiI1MzZjZTZmZTEzZDk0NmRmYTIyODg0Y2JkYTMzYWIxZiIsInVzZXJfaWQiOjV9.HQ1URel0dd32pEVSmqLpugsUZOh5FKqKTR6CI7XlxQ8',
    '2024-02-28 06:48:39.364243',
    '2024-02-29 06:48:39.000000',
    NULL,
    '536ce6fe13d946dfa22884cbda33ab1f'
  ),
  (
    31,
    'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTcwOTE4OTQ1NiwiaWF0IjoxNzA5MTAzMDU2LCJqdGkiOiI2NjVlZWY2MWY2ZDk0MjA5OWZlNDg4YjcxYTliZGE2MiIsInVzZXJfaWQiOjV9.SPdvdaTN5IfUBr9A2h14BRJZSinznvxI_vwDqz3ovGg',
    '2024-02-28 06:50:56.249571',
    '2024-02-29 06:50:56.000000',
    NULL,
    '665eef61f6d942099fe488b71a9bda62'
  ),
  (
    32,
    'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTcwOTE4OTYzMiwiaWF0IjoxNzA5MTAzMjMyLCJqdGkiOiJjMzQ5OTQwNTZlODk0YTRiYjllZjg0Yjg0NDhmMDJjNiIsInVzZXJfaWQiOjV9.uRgAnvn9cMgDM8ismxpm22Ca_9BGtTNK0WLTHD0fdjY',
    '2024-02-28 06:53:52.965733',
    '2024-02-29 06:53:52.000000',
    NULL,
    'c34994056e894a4bb9ef84b8448f02c6'
  ),
  (
    33,
    'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTcwOTE4OTY5NSwiaWF0IjoxNzA5MTAzMjk1LCJqdGkiOiI5MWFlOGZhYTU0MGU0NjlhOWY1MTc3NjJiYTU4YWMwZSIsInVzZXJfaWQiOjV9.hw3n7tDuiXoVaqt1arXt46jcQLj_iF9v_bR2zaIT7Fc',
    '2024-02-28 06:54:55.988759',
    '2024-02-29 06:54:55.000000',
    NULL,
    '91ae8faa540e469a9f517762ba58ac0e'
  ),
  (
    34,
    'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTcwOTE4OTY5NywiaWF0IjoxNzA5MTAzMjk3LCJqdGkiOiIzOWNiMjczNGJkNWI0MTQyOTZhMmY5MDQwMmNhOTNhZCIsInVzZXJfaWQiOjV9.qCaS2g6XQ5MngtV2rNOhyG8Nyzid4O2X7cbbS5wcKfs',
    '2024-02-28 06:54:57.128437',
    '2024-02-29 06:54:57.000000',
    NULL,
    '39cb2734bd5b414296a2f90402ca93ad'
  ),
  (
    35,
    'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTcwOTE4OTk1OSwiaWF0IjoxNzA5MTAzNTU5LCJqdGkiOiIyZTk4MzMwMzRlOTE0MzFjOGQxYThhMGRlNzBjZTNkMCIsInVzZXJfaWQiOjV9.xlhzhCf8q-FmOqTsYA6Niytemlvdu6Gm1_fy0zIVHkE',
    '2024-02-28 06:59:19.594293',
    '2024-02-29 06:59:19.000000',
    NULL,
    '2e9833034e91431c8d1a8a0de70ce3d0'
  ),
  (
    36,
    'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTcwOTE5MDA2OCwiaWF0IjoxNzA5MTAzNjY4LCJqdGkiOiIzM2IwZGZhZDYwOWQ0MzAzOGQ1ZWMwMmE3MTM3ZDNkMSIsInVzZXJfaWQiOjV9.Tz9AEDQH2fU9FPOk11MUewHJ02I47TFfBhQ5MCwtPmU',
    '2024-02-28 07:01:08.625891',
    '2024-02-29 07:01:08.000000',
    NULL,
    '33b0dfad609d43038d5ec02a7137d3d1'
  ),
  (
    37,
    'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTcwOTE5MDExOSwiaWF0IjoxNzA5MTAzNzE5LCJqdGkiOiI1NDMzYTY2ZmY4YzY0ZGFiYjkwNGM0MGEzNzVlNGIyYiIsInVzZXJfaWQiOjV9.BqejYXq4qk_nDkWIAGtWcYMJ85MO97H73eaJIc5I4Ow',
    '2024-02-28 07:01:59.190952',
    '2024-02-29 07:01:59.000000',
    NULL,
    '5433a66ff8c64dabb904c40a375e4b2b'
  ),
  (
    38,
    'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTcwOTE5MDE3NCwiaWF0IjoxNzA5MTAzNzc0LCJqdGkiOiI5MDgxZWJhMzYxY2Y0ZjVkOTU4Y2U5YmU4MzhkMTJmZSIsInVzZXJfaWQiOjV9.zCL_vHiimMR16R4tvzxnvrq_kKzTgy_QBQMNCcSZDqs',
    '2024-02-28 07:02:54.587638',
    '2024-02-29 07:02:54.000000',
    NULL,
    '9081eba361cf4f5d958ce9be838d12fe'
  ),
  (
    39,
    'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTcwOTE5MDM4OCwiaWF0IjoxNzA5MTAzOTg4LCJqdGkiOiJkMzIzZTYwOTJjYjg0ZjlhODBmZTY0ZDhmNzljNDMwMSIsInVzZXJfaWQiOjV9.MV0yMWelHLo-9qfjvhOFEl6UJm2Dr8CO9N2mn6vELtg',
    '2024-02-28 07:06:28.209223',
    '2024-02-29 07:06:28.000000',
    NULL,
    'd323e6092cb84f9a80fe64d8f79c4301'
  ),
  (
    40,
    'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTcwOTE5MDUxMiwiaWF0IjoxNzA5MTA0MTEyLCJqdGkiOiI0ZTFiMTU1OGM3ZWU0OGFlYmQ4MDMyM2Q0ZTFkY2IzMyIsInVzZXJfaWQiOjF9.tkC2gnHoiL7yhoQXXeyX-njYF40UPoKzRtt-Dgzjg30',
    '2024-02-28 07:08:32.711740',
    '2024-02-29 07:08:32.000000',
    1,
    '4e1b1558c7ee48aebd80323d4e1dcb33'
  ),
  (
    41,
    'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTcwOTE5MDU2NiwiaWF0IjoxNzA5MTA0MTY2LCJqdGkiOiJhYmIwMWYxNTYyODY0YjVjYTZhZmY4YzQzYjllMTM4MyIsInVzZXJfaWQiOjV9.p1P-sxxuFPJUMt39E5m2ba6VlsegJnJI97OM29RZ0-s',
    '2024-02-28 07:09:26.745814',
    '2024-02-29 07:09:26.000000',
    NULL,
    'abb01f1562864b5ca6aff8c43b9e1383'
  ),
  (
    42,
    'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTcwOTE5MDYyOSwiaWF0IjoxNzA5MTA0MjI5LCJqdGkiOiI2YTI4NWE4ODBkODE0MGNjYTI1MmE0MDQyNDk2NGYxMiIsInVzZXJfaWQiOjV9.Xwwwy4DcY0Wha7AJrtWgRUTie1MBFecfCQSupQ1sfdQ',
    '2024-02-28 07:10:29.749084',
    '2024-02-29 07:10:29.000000',
    NULL,
    '6a285a880d8140cca252a40424964f12'
  ),
  (
    43,
    'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTcwOTE5MDY0NiwiaWF0IjoxNzA5MTA0MjQ2LCJqdGkiOiJmZjZlNDJiOTk2MjY0MDFlYWY3ZTJjMGU1NzIxZmYxNCIsInVzZXJfaWQiOjF9.VWKmt3g03pKE16tPsxsDVIDg8iLwOG4ehdAbRChSmeU',
    '2024-02-28 07:10:46.208882',
    '2024-02-29 07:10:46.000000',
    1,
    'ff6e42b99626401eaf7e2c0e5721ff14'
  ),
  (
    44,
    'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTcwOTE5MTQyOCwiaWF0IjoxNzA5MTA1MDI4LCJqdGkiOiJjZGZmZDllYThmNTk0NTFlOWM5YzVlYjM4YWIwZjA5MCIsInVzZXJfaWQiOjF9.eYdnVRCyIajbvts1rDvvKUaxCS0LeVQKwYYqg9TuBt8',
    '2024-02-28 07:23:48.690453',
    '2024-02-29 07:23:48.000000',
    1,
    'cdffd9ea8f59451e9c9c5eb38ab0f090'
  ),
  (
    45,
    'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTcwOTE5MjIzNCwiaWF0IjoxNzA5MTA1ODM0LCJqdGkiOiIzZWIxN2ExNDk2OTI0ZjlkYjk0MTE4YTQ2YTk5MDRjZSIsInVzZXJfaWQiOjF9.Nnka3tHoM6IR7z8ib6i4lHEEfQK4Jr3dZoDekXomnnc',
    '2024-02-28 07:37:14.482481',
    '2024-02-29 07:37:14.000000',
    1,
    '3eb17a1496924f9db94118a46a9904ce'
  ),
  (
    46,
    'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTcwOTE5MjM5NywiaWF0IjoxNzA5MTA1OTk3LCJqdGkiOiJiODM0MjZiZGU3YTQ0YTM2ODcxMDg4MjRhNmQzMzEyNiIsInVzZXJfaWQiOjV9.boOMCMM77RmVdDcv-WzP9ppuxtr247kBDBTOQd8rpVs',
    '2024-02-28 07:39:57.034900',
    '2024-02-29 07:39:57.000000',
    NULL,
    'b83426bde7a44a3687108824a6d33126'
  ),
  (
    47,
    'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTcwOTE5MjY0OCwiaWF0IjoxNzA5MTA2MjQ4LCJqdGkiOiJmMGM3MzUzODA3ZWM0YTc3YTFlOGFhZjM4NjhjZDc4YiIsInVzZXJfaWQiOjF9.Dp9-1w8riimhVHFFnjYhcPmlbZHyNwY2o6-S4uRd_JU',
    '2024-02-28 07:44:08.825401',
    '2024-02-29 07:44:08.000000',
    1,
    'f0c7353807ec4a77a1e8aaf3868cd78b'
  ),
  (
    48,
    'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTcwOTE5MjcwOSwiaWF0IjoxNzA5MTA2MzA5LCJqdGkiOiI4MjdjNjAyYTVkZTg0OGQ1Yjc3ZjUxZjdjYzQxN2U3MyIsInVzZXJfaWQiOjF9.69oGl9VZtnrSwGa9mBAQQF9ybCXsHMHqlisQksFtBPc',
    '2024-02-28 07:45:09.875332',
    '2024-02-29 07:45:09.000000',
    1,
    '827c602a5de848d5b77f51f7cc417e73'
  ),
  (
    49,
    'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTcwOTE5Mjc2MiwiaWF0IjoxNzA5MTA2MzYyLCJqdGkiOiI2NzZhNWQzYjBiMWI0NjdjYjc5NmE5NTE3MmVjM2RkYSIsInVzZXJfaWQiOjV9.VHRF6ZLsnv0ANZl2v3yrgaRzyxkXVA2D27kdJ4rarOc',
    '2024-02-28 07:46:02.590114',
    '2024-02-29 07:46:02.000000',
    NULL,
    '676a5d3b0b1b467cb796a95172ec3dda'
  ),
  (
    50,
    'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTcwOTE5ODU5NCwiaWF0IjoxNzA5MTEyMTk0LCJqdGkiOiJhZWVmMzI0NTkyMjg0MjQ1OTM5MWFiYzhkMzZjN2ViZCIsInVzZXJfaWQiOjF9.Gj1KtFmd2wAJLF1Q2GY6ePP1jroMad2WZ76zla5QQHs',
    '2024-02-28 09:23:14.560607',
    '2024-02-29 09:23:14.000000',
    1,
    'aeef3245922842459391abc8d36c7ebd'
  ),
  (
    51,
    'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTcwOTE5ODY1NSwiaWF0IjoxNzA5MTEyMjU1LCJqdGkiOiI0MGU5YmQ5YTFjNzI0OGZlYjkyYWMyZmE0M2VkYzdhZCIsInVzZXJfaWQiOjF9.TIztkGQ0uPexSV_f2sjr_p8Am4IriBXBYnA5TR9CYVg',
    '2024-02-28 09:24:15.408056',
    '2024-02-29 09:24:15.000000',
    1,
    '40e9bd9a1c7248feb92ac2fa43edc7ad'
  ),
  (
    52,
    'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTcwOTE5ODg1NiwiaWF0IjoxNzA5MTEyNDU2LCJqdGkiOiI0MmNjMmUyNmIzZjg0ZDg4ODY1ZmE3MzFiZjg4MWI5OCIsInVzZXJfaWQiOjV9.6oROCy0c8j3COC64tJgc6Y1N1PKp6HUl0SAvXnozzqM',
    '2024-02-28 09:27:36.156968',
    '2024-02-29 09:27:36.000000',
    NULL,
    '42cc2e26b3f84d88865fa731bf881b98'
  ),
  (
    53,
    'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTcwOTE5OTAxMiwiaWF0IjoxNzA5MTEyNjEyLCJqdGkiOiI1NDhjYmRhNTVkZGY0ZDA1ODYxMjk3YzY1MTlkMGFlMCIsInVzZXJfaWQiOjF9.JTDGvESWC2JiZg5BrdKoA-xQaqN7u1nJYOTa_OnqpVc',
    '2024-02-28 09:30:12.455989',
    '2024-02-29 09:30:12.000000',
    1,
    '548cbda55ddf4d05861297c6519d0ae0'
  ),
  (
    54,
    'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTcwOTE5OTA3MSwiaWF0IjoxNzA5MTEyNjcxLCJqdGkiOiJlZmRiYTYxNDExNDA0OTM0YjNhZTkyN2JiNTJhNGNiMSIsInVzZXJfaWQiOjF9.IBIxyuHqPWg0uo2Gx40GQn4Dx6dZiwAKrbOxy2ol2VQ',
    '2024-02-28 09:31:11.175243',
    '2024-02-29 09:31:11.000000',
    1,
    'efdba61411404934b3ae927bb52a4cb1'
  ),
  (
    55,
    'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTcwOTE5OTQ1MCwiaWF0IjoxNzA5MTEzMDUwLCJqdGkiOiI1NmZiOWY1MWU3NjQ0OTdhYWY3MjhmNmUwZmJkNTVjOSIsInVzZXJfaWQiOjF9.n77JJeg1Hb6TSE1ve37abieI-4OfiSZgqy2QXUfQs8M',
    '2024-02-28 09:37:30.872848',
    '2024-02-29 09:37:30.000000',
    1,
    '56fb9f51e764497aaf728f6e0fbd55c9'
  ),
  (
    56,
    'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTcwOTE5OTk0MiwiaWF0IjoxNzA5MTEzNTQyLCJqdGkiOiJlMDAyZjc2ZDQxMmE0MmU5YTFiOTFlODRhOWNjNTViOSIsInVzZXJfaWQiOjF9.VitrVVwKcP5P6YXBUfxwkAH5V9KiqV_IIXZQQgIx8wQ',
    '2024-02-28 09:45:42.143322',
    '2024-02-29 09:45:42.000000',
    1,
    'e002f76d412a42e9a1b91e84a9cc55b9'
  ),
  (
    57,
    'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTcwOTE5OTk5NywiaWF0IjoxNzA5MTEzNTk3LCJqdGkiOiJiMmQ2MTA5ZDVhOGI0NTY2YTlmZTk0MDBiMzRjODk0YyIsInVzZXJfaWQiOjF9.rDBFyA2wZRRYRXosSmPD_9hXc6APySaVzBeK5L5tXWI',
    '2024-02-28 09:46:37.353644',
    '2024-02-29 09:46:37.000000',
    1,
    'b2d6109d5a8b4566a9fe9400b34c894c'
  ),
  (
    58,
    'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTcwOTIwMDA0NiwiaWF0IjoxNzA5MTEzNjQ2LCJqdGkiOiIwN2JmZWI3ZThmMGE0ZGQ2OTNkMmM2NDgwMmJiYTJkOCIsInVzZXJfaWQiOjF9.HQXeErr1KHvs0yzaLx3xbrJUeDpilUsEZz0Fy9Cggn0',
    '2024-02-28 09:47:26.638504',
    '2024-02-29 09:47:26.000000',
    1,
    '07bfeb7e8f0a4dd693d2c64802bba2d8'
  ),
  (
    59,
    'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTcwOTIwMDEzMSwiaWF0IjoxNzA5MTEzNzMxLCJqdGkiOiJmNzIwYmI5MTYzMzM0MDNiOTFkM2NkZDk0OGJiYWM0YSIsInVzZXJfaWQiOjF9.OY7x5L3b1zbb33KRlgfZrUNabfCMLMZmegi0Vkrm-UI',
    '2024-02-28 09:48:51.885490',
    '2024-02-29 09:48:51.000000',
    1,
    'f720bb916333403b91d3cdd948bbac4a'
  ),
  (
    60,
    'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTcwOTIwMDYwNywiaWF0IjoxNzA5MTE0MjA3LCJqdGkiOiJlZmMyNGZkYjExM2M0ZjMxOWJhMWIzMjRhNmIzYzQ5YyIsInVzZXJfaWQiOjF9.IEyVYGk9B54pw-z-Wto1nG1EEhw06LoErd924_By7jw',
    '2024-02-28 09:56:47.384472',
    '2024-02-29 09:56:47.000000',
    1,
    'efc24fdb113c4f319ba1b324a6b3c49c'
  ),
  (
    61,
    'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTcwOTIwMDgzOSwiaWF0IjoxNzA5MTE0NDM5LCJqdGkiOiI5MDY0NzU2MGRjMDg0YTQ1OWQzZTNhNTc5ODUxMjhlZiIsInVzZXJfaWQiOjF9.zVWPD6s59aa2Oj0Rhp50_uSTy5jjdZuEM9nNbTaNb1o',
    '2024-02-28 10:00:39.787735',
    '2024-02-29 10:00:39.000000',
    1,
    '90647560dc084a459d3e3a57985128ef'
  ),
  (
    62,
    'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTcwOTIwMDg2NywiaWF0IjoxNzA5MTE0NDY3LCJqdGkiOiJiNjk5ZmZkZGMzNTQ0MzI4ODVmYTM3ZTI2OTI5ODQ3YSIsInVzZXJfaWQiOjF9.hCoauZ2XLagD9niMJGmcByOPlenGO-3tksl4eHhDfdE',
    '2024-02-28 10:01:07.366129',
    '2024-02-29 10:01:07.000000',
    1,
    'b699ffddc354432885fa37e26929847a'
  ),
  (
    63,
    'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTcwOTIwMTAwNiwiaWF0IjoxNzA5MTE0NjA2LCJqdGkiOiI0MzljNzNiNTI3Yjk0ZDUyYmM5OTEwYmIyZTJmYjBjZiIsInVzZXJfaWQiOjF9.ih-inwUtuqJCVitxHuUOZY7rce2pWtu_dhal7GDVOB8',
    '2024-02-28 10:03:26.253770',
    '2024-02-29 10:03:26.000000',
    1,
    '439c73b527b94d52bc9910bb2e2fb0cf'
  ),
  (
    64,
    'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTcwOTIwMTA1MCwiaWF0IjoxNzA5MTE0NjUwLCJqdGkiOiIzMWZiOWRlMDc3OTg0YTY2OTA5YWQ4MzUzODNiYTAzNCIsInVzZXJfaWQiOjF9.5E4LffDFwDLXNMddLlkjUW2X_7P32OLOQzqD6SF4Qvg',
    '2024-02-28 10:04:10.573836',
    '2024-02-29 10:04:10.000000',
    1,
    '31fb9de077984a66909ad835383ba034'
  ),
  (
    65,
    'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTcwOTIwMTEyMywiaWF0IjoxNzA5MTE0NzIzLCJqdGkiOiIzMDlmNjk0NDQ3YjU0ZjVkYmEwYTc5OWMxZGYyNGE1YiIsInVzZXJfaWQiOjF9._rEpSCcxKCrpb8hdyWdjibxCZSaYV5badEr_D75tz4A',
    '2024-02-28 10:05:23.823423',
    '2024-02-29 10:05:23.000000',
    1,
    '309f694447b54f5dba0a799c1df24a5b'
  ),
  (
    66,
    'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTcwOTIwMTI3OCwiaWF0IjoxNzA5MTE0ODc4LCJqdGkiOiI0NjBhMmZmNThhNmQ0OGNlYTlmZDg2Zjg5NzhiMmU0NyIsInVzZXJfaWQiOjF9.ehyBYLgbf_OkbUdhKFe6qU5MNaYxOrFmJLsmY58it70',
    '2024-02-28 10:07:58.413961',
    '2024-02-29 10:07:58.000000',
    1,
    '460a2ff58a6d48cea9fd86f8978b2e47'
  ),
  (
    67,
    'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTcwOTIwMTQ4NywiaWF0IjoxNzA5MTE1MDg3LCJqdGkiOiI0ZTg1MmY3YzlhOTc0MWQ3OWMwZmYyOThhNzBhYTQxMSIsInVzZXJfaWQiOjF9.Ph2zKZvZekFQO7K1IwQrskqf8BWdAW6YxE4KvmLaOe0',
    '2024-02-28 10:11:27.926158',
    '2024-02-29 10:11:27.000000',
    1,
    '4e852f7c9a9741d79c0ff298a70aa411'
  ),
  (
    68,
    'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTcwOTIwMTc0NCwiaWF0IjoxNzA5MTE1MzQ0LCJqdGkiOiI1ZDg5NDEzMmJlMDk0NzliOGQzNzBjYmIxNDY1ZDUxYSIsInVzZXJfaWQiOjF9.Qg5gA0_b7eTphV9kAWKVN6RUDx0v3yfJsRmTsTfqgZI',
    '2024-02-28 10:15:44.574902',
    '2024-02-29 10:15:44.000000',
    1,
    '5d894132be09479b8d370cbb1465d51a'
  ),
  (
    69,
    'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTcwOTIwMjg4MywiaWF0IjoxNzA5MTE2NDgzLCJqdGkiOiIwNzE3ZTRlNDVmNWI0N2JmOTBkNzgyNTIxZThjMGRlZSIsInVzZXJfaWQiOjF9.OuS-tlB4mqS0hJjXycX6cyq9NtWL8AKlYzVGFbUosfE',
    '2024-02-28 10:34:43.552486',
    '2024-02-29 10:34:43.000000',
    1,
    '0717e4e45f5b47bf90d782521e8c0dee'
  ),
  (
    70,
    'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTcwOTIwMjk0NSwiaWF0IjoxNzA5MTE2NTQ1LCJqdGkiOiI1ZjNkOTE2ZGYwMDE0NWMyYjZjMTViODNlYTAxNjBhZCIsInVzZXJfaWQiOjF9.L0AtRVYdd6gIhPeCNJb-bb01Ot1AHFx940pqRijT5zs',
    '2024-02-28 10:35:45.431678',
    '2024-02-29 10:35:45.000000',
    1,
    '5f3d916df00145c2b6c15b83ea0160ad'
  ),
  (
    71,
    'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTcwOTIwNzUwMSwiaWF0IjoxNzA5MTIxMTAxLCJqdGkiOiI5ZWQyY2ZmZGRlOGU0ZjNkYWI4NjFhZTZlZTAxY2QyOCIsInVzZXJfaWQiOjF9.tOBdLY2p5Jm3sNVenQ6QfxdOM2vM1kq1dy2w60JW1Ro',
    '2024-02-28 11:51:41.277657',
    '2024-02-29 11:51:41.000000',
    1,
    '9ed2cffdde8e4f3dab861ae6ee01cd28'
  ),
  (
    72,
    'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTcwOTIwODI2MiwiaWF0IjoxNzA5MTIxODYyLCJqdGkiOiJkMzhmMDVlMGEwNTg0ODQyYjEzM2E0MzYyNDVlYTA4ZiIsInVzZXJfaWQiOjV9.ZkZqxZu2jkAF8LPId2KAatd9zJbmJEB4mVNBFuuGoM4',
    '2024-02-28 12:04:22.194778',
    '2024-02-29 12:04:22.000000',
    NULL,
    'd38f05e0a0584842b133a436245ea08f'
  ),
  (
    73,
    'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTcwOTIwODI3OCwiaWF0IjoxNzA5MTIxODc4LCJqdGkiOiI2YjczMTdhNWY2MDU0MjhiYTdiYjAyOWM3NTU5MzAwYSIsInVzZXJfaWQiOjF9.dbMPYiKc6yMPimds7A1UX17eAFGyYJbv6jZRVAf8cCY',
    '2024-02-28 12:04:38.427162',
    '2024-02-29 12:04:38.000000',
    1,
    '6b7317a5f605428ba7bb029c7559300a'
  ),
  (
    74,
    'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTcwOTIwOTE2MywiaWF0IjoxNzA5MTIyNzYzLCJqdGkiOiJkZmU0ZjJmZjI3OGU0Y2QzOTlhMmU0MjU0NTUxMDQxMSIsInVzZXJfaWQiOjV9.RQu4XChH4gzEoTkUMEOctmXmQHYRvRo4QoJGfTlAhiY',
    '2024-02-28 12:19:23.300387',
    '2024-02-29 12:19:23.000000',
    NULL,
    'dfe4f2ff278e4cd399a2e42545510411'
  ),
  (
    75,
    'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTcwOTIxMDIwNCwiaWF0IjoxNzA5MTIzODA0LCJqdGkiOiI4MTU2NGU4YWVlNTA0NzY0ODA2ZWUzYzRhOTg2YWRiZCIsInVzZXJfaWQiOjF9.uc-pQshwKz4eOHPl3LWvNdzm-V2RyLwzdlJue3Og2q0',
    '2024-02-28 12:36:44.426627',
    '2024-02-29 12:36:44.000000',
    1,
    '81564e8aee504764806ee3c4a986adbd'
  ),
  (
    76,
    'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTcwOTIzNzI2OSwiaWF0IjoxNzA5MTUwODY5LCJqdGkiOiJiOWFlMDU5NDJiYjI0ZDJmYjIwZjlhMmQ4NWI4Yjk5ZSIsInVzZXJfaWQiOjF9.i2-_Kgmp1dp6cU5WmcMN92kPHNiU0_lUX9erDUswn6E',
    '2024-02-28 20:07:49.788253',
    '2024-02-29 20:07:49.000000',
    1,
    'b9ae05942bb24d2fb20f9a2d85b8b99e'
  ),
  (
    77,
    'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTcwOTIzNzM2MCwiaWF0IjoxNzA5MTUwOTYwLCJqdGkiOiI3ZjI0Y2ZlM2ZkM2I0ODhkYTkxODA5ODVmMjY2ODczNCIsInVzZXJfaWQiOjF9.3C0UtSEOvVKywpSolksB2NyE_J-6zub4voceqCii6D4',
    '2024-02-28 20:09:20.352916',
    '2024-02-29 20:09:20.000000',
    1,
    '7f24cfe3fd3b488da9180985f2668734'
  ),
  (
    78,
    'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTcwOTIzNzgzNCwiaWF0IjoxNzA5MTUxNDM0LCJqdGkiOiJmNjI4MDhjMmFlNzk0MGE4OWY4NGEzMDMxM2MzZDNmOSIsInVzZXJfaWQiOjF9.c7GDfW4In-dt8zmglJTfLd4WQRT2jWJxn7OinEjT79Y',
    '2024-02-28 20:17:14.960144',
    '2024-02-29 20:17:14.000000',
    1,
    'f62808c2ae7940a89f84a30313c3d3f9'
  ),
  (
    79,
    'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTcwOTI0MDMwMiwiaWF0IjoxNzA5MTUzOTAyLCJqdGkiOiI1MDdlOTEwMGQ3N2Q0YWQ1YjQyNDU1OTNhODVlZDQ3MSIsInVzZXJfaWQiOjF9.qIYhlTPhXJNqwYvrFkbh9vmq0Vvq9nYZSMlZzQPZpXs',
    '2024-02-28 20:58:22.726676',
    '2024-02-29 20:58:22.000000',
    1,
    '507e9100d77d4ad5b4245593a85ed471'
  ),
  (
    80,
    'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTcwOTI0MDM4NywiaWF0IjoxNzA5MTUzOTg3LCJqdGkiOiJkZjg4NDE5ZGE1MDc0ODM3YTZkZGQ1YjliYWNjOTY5NyIsInVzZXJfaWQiOjF9.eogtFJUqV83DpQlW2ODAAA00FKTSXcDR7B4vMkBYX0c',
    '2024-02-28 20:59:47.841242',
    '2024-02-29 20:59:47.000000',
    1,
    'df88419da5074837a6ddd5b9bacc9697'
  ),
  (
    81,
    'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTcwOTI0MDgyMCwiaWF0IjoxNzA5MTU0NDIwLCJqdGkiOiJiYjFjNWRmODhlZDA0MmRmODFlN2NmN2M4Y2MyY2Y2MCIsInVzZXJfaWQiOjF9.8O9E4TdLLwnT471HQV1hk_7jXYDZ-ZvKIzygcQ8QKyM',
    '2024-02-28 21:07:00.249250',
    '2024-02-29 21:07:00.000000',
    1,
    'bb1c5df88ed042df81e7cf7c8cc2cf60'
  ),
  (
    82,
    'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTcwOTI0MTA3MywiaWF0IjoxNzA5MTU0NjczLCJqdGkiOiJhYzBkNDMzZTNmYmE0NWYxYmU4MWUzZDYxMjQyMDI0NiIsInVzZXJfaWQiOjF9.qgVTSbPtSSrkryyAix5unFZ1n67jqdlv2F_82saA5C4',
    '2024-02-28 21:11:13.591380',
    '2024-02-29 21:11:13.000000',
    1,
    'ac0d433e3fba45f1be81e3d612420246'
  ),
  (
    83,
    'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTcwOTI0MzE3MSwiaWF0IjoxNzA5MTU2NzcxLCJqdGkiOiJlYjBhNDNkNmVlYzM0YmRiODY4YmM4ZGYyMzg2MTE3OCIsInVzZXJfaWQiOjF9.cBAR3xeXVKirY4lmxXiFnHH5meqb8mxL7w5NTlTz4z4',
    '2024-02-28 21:46:11.787902',
    '2024-02-29 21:46:11.000000',
    1,
    'eb0a43d6eec34bdb868bc8df23861178'
  ),
  (
    84,
    'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTcwOTI0MzQ5NSwiaWF0IjoxNzA5MTU3MDk1LCJqdGkiOiJlOTRkN2Y1NjczMWE0OGMyOGQwNTlhYWNjMzFlNTM2NyIsInVzZXJfaWQiOjF9.rnuOCIF13Jr2BvnsjrGHejDxt_MjCVzWgRUdWmInoik',
    '2024-02-28 21:51:35.360191',
    '2024-02-29 21:51:35.000000',
    1,
    'e94d7f56731a48c28d059aacc31e5367'
  ),
  (
    85,
    'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTcwOTI3MjU1MSwiaWF0IjoxNzA5MTg2MTUxLCJqdGkiOiJkYjY3MTZmNTQ5YmU0ODI1OTczOTI2NWFiZTRkMmJjOCIsInVzZXJfaWQiOjF9.mlYsMgNCIg91_hijpEiUa-eW-DgRmDTY0z6HyNQwpOI',
    '2024-02-29 05:55:51.620433',
    '2024-03-01 05:55:51.000000',
    1,
    'db6716f549be48259739265abe4d2bc8'
  ),
  (
    86,
    'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTcwOTI3NDExOCwiaWF0IjoxNzA5MTg3NzE4LCJqdGkiOiI2YjQzMTkwNjZlMWY0ZWY1YmM1MjZlYjU2Y2RlODU3ZSIsInVzZXJfaWQiOjF9.ts_DjaFk6nw_UZqbc-_mAR2ic-9dOsppX71K4H3fXA0',
    '2024-02-29 06:21:58.774468',
    '2024-03-01 06:21:58.000000',
    1,
    '6b4319066e1f4ef5bc526eb56cde857e'
  ),
  (
    87,
    'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTcwOTI3NDk5MCwiaWF0IjoxNzA5MTg4NTkwLCJqdGkiOiI1ZTc2NGEzZGFmMWI0YzNjOTFhMzBiYWE5ODUwMWVmYSIsInVzZXJfaWQiOjF9.Ga3C85rmMW6vCjyk62Lp4M44Js2QaZeCiPlg4goa-9A',
    '2024-02-29 06:36:30.646736',
    '2024-03-01 06:36:30.000000',
    1,
    '5e764a3daf1b4c3c91a30baa98501efa'
  ),
  (
    88,
    'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTcwOTI4NDc1NCwiaWF0IjoxNzA5MTk4MzU0LCJqdGkiOiI3NDBmOWFmNWY1ZjI0NzFjOTQ4MzgzZDk3NDYxZWQxZiIsInVzZXJfaWQiOjF9.ttJJBVO2ntu9I7oOVY20O2zr0TolkhQmdZK15zJPhaE',
    '2024-02-29 09:19:14.184546',
    '2024-03-01 09:19:14.000000',
    1,
    '740f9af5f5f2471c948383d97461ed1f'
  ),
  (
    89,
    'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTcwOTI4Njg0MywiaWF0IjoxNzA5MjAwNDQzLCJqdGkiOiI5YjljNjE3MTQwN2Q0NmQ5OThkYmMzYzdjODcyOWNhZCIsInVzZXJfaWQiOjV9.yw629iBYQiJ55K5PfjGLJaQKx9XwbxcSkpyaoGqMSYc',
    '2024-02-29 09:54:03.849549',
    '2024-03-01 09:54:03.000000',
    NULL,
    '9b9c6171407d46d998dbc3c7c8729cad'
  ),
  (
    90,
    'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTcwOTI4OTA3MywiaWF0IjoxNzA5MjAyNjczLCJqdGkiOiJhZTY4ZDQ3OWJhMzU0NTJmYjRmNjdjMWIzODFlMmI3ZSIsInVzZXJfaWQiOjV9.eWAK8aQAC7paaALK2TfgtdPiW8rIcDxFBvimIWsOe8k',
    '2024-02-29 10:31:13.881257',
    '2024-03-01 10:31:13.000000',
    NULL,
    'ae68d479ba35452fb4f67c1b381e2b7e'
  ),
  (
    91,
    'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTcwOTI4OTA4NywiaWF0IjoxNzA5MjAyNjg3LCJqdGkiOiJkNWY0NGJiODdhM2E0ZTI0YTNkMTI2YmVhZTk2NmRhZSIsInVzZXJfaWQiOjF9.zI_BCAbFDBr4Py5VItskxqa6rj237FIsuAagyO0UNSk',
    '2024-02-29 10:31:27.127291',
    '2024-03-01 10:31:27.000000',
    1,
    'd5f44bb87a3a4e24a3d126beae966dae'
  ),
  (
    92,
    'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTcwOTI5MzcyMCwiaWF0IjoxNzA5MjA3MzIwLCJqdGkiOiJjYWRjZTA2ZGIwMjk0NTcwOTc3NDQxNGUxNGRmNWU3NiIsInVzZXJfaWQiOjV9.bH2C6PMyE0d3DJe0CAX7uzk-02i1gtUmkhhLqv4M-bc',
    '2024-02-29 11:48:40.695717',
    '2024-03-01 11:48:40.000000',
    NULL,
    'cadce06db02945709774414e14df5e76'
  ),
  (
    93,
    'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTcwOTMwMTE1NSwiaWF0IjoxNzA5MjE0NzU1LCJqdGkiOiI0Y2IxMDg2ODUzODQ0MzhjYjQ4NWMwOGNhNjY4OTYwNCIsInVzZXJfaWQiOjV9.ouEUxzJDF3kHmO2JSMGue63DmA1Xz4VKvweskd3UtaA',
    '2024-02-29 13:52:35.202493',
    '2024-03-01 13:52:35.000000',
    NULL,
    '4cb108685384438cb485c08ca6689604'
  ),
  (
    94,
    'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTcwOTMwMTE3NiwiaWF0IjoxNzA5MjE0Nzc2LCJqdGkiOiJhZDEyMWQzMTg1MDI0MTM1OTEyNzdiMDAyMmQ5ZWRlZSIsInVzZXJfaWQiOjV9.mRKHbMLUwU03CNP6gE-OPobP5C3VO51B630FnKmJ_OY',
    '2024-02-29 13:52:56.896819',
    '2024-03-01 13:52:56.000000',
    NULL,
    'ad121d318502413591277b0022d9edee'
  ),
  (
    95,
    'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTcwOTMwMzEzNywiaWF0IjoxNzA5MjE2NzM3LCJqdGkiOiI2ODE2NDc0NmZmMjU0ZTViYmQxZmIyNzZiN2E2NjQzNSIsInVzZXJfaWQiOjF9.wnWCfuikAAUuqdsqSBTAnbaGZ30PPFDpBSwpqGYzmm0',
    '2024-02-29 14:25:37.129001',
    '2024-03-01 14:25:37.000000',
    1,
    '68164746ff254e5bbd1fb276b7a66435'
  ),
  (
    96,
    'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTcwOTMyNzA1NywiaWF0IjoxNzA5MjQwNjU3LCJqdGkiOiIxNDNiYzlkYjhjYzQ0NmFmOTk3ZGU0OTA2YzQ2MTJlNSIsInVzZXJfaWQiOjF9.xToHoBfDO087REsCgrgHtYxCyZrjJcGlLysSsBq81K8',
    '2024-02-29 21:04:17.122991',
    '2024-03-01 21:04:17.000000',
    1,
    '143bc9db8cc446af997de4906c4612e5'
  ),
  (
    97,
    'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTcwOTMyNzQwMywiaWF0IjoxNzA5MjQxMDAzLCJqdGkiOiJlYzNkNGE0MDFkZGQ0NGJlYjBmZmQzNzViNTkzYWJlYyIsInVzZXJfaWQiOjF9.UeL8suP7l1d3gEcrzFZpFAVe-LBOD8VS5DC3MPGJ6F4',
    '2024-02-29 21:10:03.464665',
    '2024-03-01 21:10:03.000000',
    1,
    'ec3d4a401ddd44beb0ffd375b593abec'
  ),
  (
    98,
    'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTcwOTI0MTIyNiwiaWF0IjoxNzA5MjQxMjExLCJqdGkiOiIwYzMzZGNlMmRjNGM0ZmVjOWNmNDU2MGVjODYxNDEwYiIsInVzZXJfaWQiOjF9.43ovcXViCNcFiihvk0-pQgs3yuCP8zWBNDpb_TRNp8g',
    '2024-02-29 21:13:31.181973',
    '2024-02-29 21:13:46.000000',
    1,
    '0c33dce2dc4c4fec9cf4560ec861410b'
  ),
  (
    99,
    'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTcwOTI0MTkxNSwiaWF0IjoxNzA5MjQxOTAwLCJqdGkiOiJmMjczN2Q2YzljM2Y0MjE5OTEzMjY2NDNhNWY4NzJiZCIsInVzZXJfaWQiOjF9.qLzv8oBfLPHLB_x0iLCtLAUCovZGoY-7Ebz5NOmfJVo',
    '2024-02-29 21:25:00.570709',
    '2024-02-29 21:25:15.000000',
    1,
    'f2737d6c9c3f421991326643a5f872bd'
  ),
  (
    100,
    'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTcwOTI0MTkyNiwiaWF0IjoxNzA5MjQxOTExLCJqdGkiOiJiYmQ0NmZlOGMwNDg0YzRmYWY0MDAzNDQyMTE2OTg4OSIsInVzZXJfaWQiOjF9.hIA2dzn9iepr8CxtMx0oqybWgFbR9gClf08mtswdbA0',
    '2024-02-29 21:25:11.785026',
    '2024-02-29 21:25:26.000000',
    1,
    'bbd46fe8c0484c4faf40034421169889'
  ),
  (
    101,
    'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTcwOTI0MzMwMSwiaWF0IjoxNzA5MjQzMjg2LCJqdGkiOiJiZWI2Zjc2MTViOWQ0YjFhYjIxNzliMzJkMTE0NThhNCIsInVzZXJfaWQiOjF9.xDwTx-CeiCItp7k-cQw2CAYSUzoVnKuoP5Vzhh9A3sY',
    '2024-02-29 21:48:06.222212',
    '2024-02-29 21:48:21.000000',
    1,
    'beb6f7615b9d4b1ab2179b32d11458a4'
  ),
  (
    102,
    'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTcwOTI0NDA2NCwiaWF0IjoxNzA5MjQ0MDQ5LCJqdGkiOiIxMWYwNWE0ZjFmY2M0NmIwYTY2NWQyYWI2ZDA4M2I5OSIsInVzZXJfaWQiOjF9.p7oVnXk4CXs7cjX_vMQ1WjfxiAmohpyTXzqgiaTONqA',
    '2024-02-29 22:00:49.896413',
    '2024-02-29 22:01:04.000000',
    1,
    '11f05a4f1fcc46b0a665d2ab6d083b99'
  ),
  (
    103,
    'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTcwOTI0NDcwOSwiaWF0IjoxNzA5MjQ0Njk0LCJqdGkiOiJhNmU3ZGFkYzk4NjU0MDFjYjNmZjhjYzJmYzE0Y2E2YiIsInVzZXJfaWQiOjF9.Pf9nvPXiJq9jiQ7bgxdw_ONpgEnWKfVcORYz_FBoJz0',
    '2024-02-29 22:11:34.566614',
    '2024-02-29 22:11:49.000000',
    1,
    'a6e7dadc9865401cb3ff8cc2fc14ca6b'
  ),
  (
    104,
    'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTcwOTI0NTQwNiwiaWF0IjoxNzA5MjQ1MzkxLCJqdGkiOiIyZjJmNjMyYTAzMGU0M2EyYTVmYjU5ODliYjY3MWVkZCIsInVzZXJfaWQiOjF9.Q4C9qBZwL3kFqoUwnJKE4DG5oZw-RXAMW-OuK5lE0rg',
    '2024-02-29 22:23:11.326858',
    '2024-02-29 22:23:26.000000',
    1,
    '2f2f632a030e43a2a5fb5989bb671edd'
  ),
  (
    105,
    'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTcwOTI0NTY1MCwiaWF0IjoxNzA5MjQ1NjM1LCJqdGkiOiI5NDNmYTU1ZmM3ZGQ0NDc3Yjk0Nzk0MTJmMjc2ZmU2ZiIsInVzZXJfaWQiOjF9.RooL4GeUMeYrptfaAvrBZoV3evyYTPzUoVn3EvKcL1k',
    '2024-02-29 22:27:15.920227',
    '2024-02-29 22:27:30.000000',
    1,
    '943fa55fc7dd4477b9479412f276fe6f'
  ),
  (
    106,
    'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTcwOTI0NTgxOCwiaWF0IjoxNzA5MjQ1ODAzLCJqdGkiOiJhNTM5NWE4MTY3ZjA0MmEwYmJlMTYyZGFiYWY1NWFlZSIsInVzZXJfaWQiOjF9.0xiHsVaNnvlAUdAfIPAX9mU7uybdPrJGl6QoITvzPoI',
    '2024-02-29 22:30:03.357657',
    '2024-02-29 22:30:18.000000',
    1,
    'a5395a8167f042a0bbe162dabaf55aee'
  ),
  (
    107,
    'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTcwOTI0NjA4MSwiaWF0IjoxNzA5MjQ2MDY2LCJqdGkiOiI3MjI0ODE3N2E2MzQ0MzQzOGZhZjFhN2FkODNiMzZhYyIsInVzZXJfaWQiOjF9.3JpFl-XcvXtqKQ403t6A41N6wGKqxcrnm34XsdhMLoI',
    '2024-02-29 22:34:26.430328',
    '2024-02-29 22:34:41.000000',
    1,
    '72248177a63443438faf1a7ad83b36ac'
  ),
  (
    108,
    'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTcwOTI0NjI1MCwiaWF0IjoxNzA5MjQ2MjM1LCJqdGkiOiJmM2Q3Yjg1ZTU2ZTM0YWI3Yjc2MzA4ZWIzMGY2OTNmNiIsInVzZXJfaWQiOjF9.8XXEmxN9PsZFkLVRfQiYhWIbd3UaZ_DHp--rR085abE',
    '2024-02-29 22:37:15.343837',
    '2024-02-29 22:37:30.000000',
    1,
    'f3d7b85e56e34ab7b76308eb30f693f6'
  ),
  (
    109,
    'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTcwOTI0NjQ0MCwiaWF0IjoxNzA5MjQ2NDI1LCJqdGkiOiI5MWY2MTE5NjMxYTc0YTE0OTJjNTZlZTFhOGVhNGFiYyIsInVzZXJfaWQiOjF9.xyj91ayy5zPDnDJs5tJiyyij2N9tiEC0f7yWfA78U4E',
    '2024-02-29 22:40:25.860158',
    '2024-02-29 22:40:40.000000',
    1,
    '91f6119631a74a1492c56ee1a8ea4abc'
  ),
  (
    110,
    'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTcwOTI0NjUzNiwiaWF0IjoxNzA5MjQ2NTIxLCJqdGkiOiJhZWY0NjVkNzg0YWU0MjllYThhNmNjNmNkYTQyN2ZjYyIsInVzZXJfaWQiOjF9.VztG_rIm9wkeTLIMOhjxi2NlbiY0f5Tjl4W6MuONH6k',
    '2024-02-29 22:42:01.515744',
    '2024-02-29 22:42:16.000000',
    1,
    'aef465d784ae429ea8a6cc6cda427fcc'
  ),
  (
    111,
    'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTcwOTI0Njc2MywiaWF0IjoxNzA5MjQ2NzQ4LCJqdGkiOiIwYjk4MDkwNDcwZWE0ZWUxODNiOTA4Y2ViNGE0YjViNyIsInVzZXJfaWQiOjF9.A_ZhbMlxr7B0ichPiYwymklh_opWMukuWk3QyU7DwEc',
    '2024-02-29 22:45:48.924264',
    '2024-02-29 22:46:03.000000',
    1,
    '0b98090470ea4ee183b908ceb4a4b5b7'
  ),
  (
    112,
    'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTcwOTI0NzI3MCwiaWF0IjoxNzA5MjQ3MjU1LCJqdGkiOiI3ZGU3ZDliMmY1MDg0ZGVlYTlmZDY4ZTg0NzJkNGRlMSIsInVzZXJfaWQiOjF9.Lv47raTTg5d_s3aYngwxWmAyBPD7qpMMdWUg6RLo2Ck',
    '2024-02-29 22:54:15.535052',
    '2024-02-29 22:54:30.000000',
    1,
    '7de7d9b2f5084deea9fd68e8472d4de1'
  ),
  (
    113,
    'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTcwOTI0NzczOCwiaWF0IjoxNzA5MjQ3NzI4LCJqdGkiOiJhZTRkMGExYzA5MWI0NmRiYmEyNTQyZTc3Y2NjY2IzMCIsInVzZXJfaWQiOjF9.bFc3ytortUyK8mMvhNDcpwP7A244a-J1XWpmcwGu0lo',
    '2024-02-29 23:02:08.820947',
    '2024-02-29 23:02:18.000000',
    1,
    'ae4d0a1c091b46dbba2542e77ccccb30'
  ),
  (
    114,
    'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTcwOTI4ODE5MSwiaWF0IjoxNzA5Mjg4MTgxLCJqdGkiOiI3NWIwYWRlNjY3MDg0NjIzOWNmZTEzMTgyNmNiOGQ3YiIsInVzZXJfaWQiOjF9.74qYNc76MNf-vp9ZzX7t046-SlYfUhMX4lT_CerFvjA',
    '2024-03-01 10:16:21.359521',
    '2024-03-01 10:16:31.000000',
    1,
    '75b0ade6670846239cfe131826cb8d7b'
  ),
  (
    115,
    'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTcwOTI4ODI5OSwiaWF0IjoxNzA5Mjg4Mjg5LCJqdGkiOiI2YzFhODZlOGY1ZjY0YTYxYjUyMWE1OWM3YWZlZTMxYyIsInVzZXJfaWQiOjF9.6UA8P5NFcvHprujZ4TXKY_-AXbbxUJfaTpOOX5Ixnyg',
    '2024-03-01 10:18:09.016002',
    '2024-03-01 10:18:19.000000',
    1,
    '6c1a86e8f5f64a61b521a59c7afee31c'
  ),
  (
    116,
    'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTcwOTI4ODMwNCwiaWF0IjoxNzA5Mjg4Mjk0LCJqdGkiOiJmN2Y4ZDEwOTAyNDk0MWI2ODFkZWNiN2EwZjVhZTQ2MyIsInVzZXJfaWQiOjF9.JUYGTaa1WLuGxhiNXHfKBHipVyTkFKXKdZlWNlPg0EU',
    '2024-03-01 10:18:14.908841',
    '2024-03-01 10:18:24.000000',
    1,
    'f7f8d109024941b681decb7a0f5ae463'
  ),
  (
    117,
    'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTcwOTU2OTc1MCwiaWF0IjoxNzA5Mzk2OTUwLCJqdGkiOiJhZmQ0OTU2OTI4NjI0ZDUwOWFmMjVkMWRkZTI1ZWMzZCIsInVzZXJfaWQiOjF9.TdHICtbymtAXazX_Ug2IqAPyACcKEsUOZd4pqEascL4',
    '2024-03-02 16:29:10.458856',
    '2024-03-04 16:29:10.000000',
    1,
    'afd4956928624d509af25d1dde25ec3d'
  ),
  (
    118,
    'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTcwOTM5NzgwNSwiaWF0IjoxNzA5Mzk3Nzk1LCJqdGkiOiIwNDMwNGY3NmYyYjg0NzdkOWUxZjlhMTNlZDM0YjA5NyIsInVzZXJfaWQiOjF9.POj50F1wzYSvZtS7fzX40a5eyn8AHQ2SybZIjlPBXMA',
    '2024-03-02 16:43:15.284524',
    '2024-03-02 16:43:25.000000',
    1,
    '04304f76f2b8477d9e1f9a13ed34b097'
  ),
  (
    119,
    'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTcwOTM5NzkwMiwiaWF0IjoxNzA5Mzk3ODkyLCJqdGkiOiJlYWQyY2YzYWE3Mjc0ODE2YWYzNzA2NzFkNmQ4NTQ1MyIsInVzZXJfaWQiOjF9.gO5_cc5r2HU2Z2PHau6RjHdlUE_hWs8YdjiO9bpPXFU',
    '2024-03-02 16:44:52.000952',
    '2024-03-02 16:45:02.000000',
    1,
    'ead2cf3aa7274816af370671d6d85453'
  ),
  (
    120,
    'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTcwOTM5ODAwMCwiaWF0IjoxNzA5Mzk3OTkwLCJqdGkiOiI2OTM1NDU1NzVjZjE0MzJlOTllMWQ1NmZmN2FjNzQ4NCIsInVzZXJfaWQiOjF9.Ce_mFtZqn3koPz6DHCtaKCs0KAHDSsa4ML--KggtuYw',
    '2024-03-02 16:46:30.695432',
    '2024-03-02 16:46:40.000000',
    1,
    '693545575cf1432e99e1d56ff7ac7484'
  ),
  (
    121,
    'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTcwOTM5ODExMCwiaWF0IjoxNzA5Mzk4MTAwLCJqdGkiOiI3MWM4YTA4NWFhNmQ0MjJhOWJjZjI2MmZlMDFlODYzMyIsInVzZXJfaWQiOjF9.pxuK3VWPPheNCCaIojJ1LlXo8UGLY4jb_ovI51VNUPY',
    '2024-03-02 16:48:20.446310',
    '2024-03-02 16:48:30.000000',
    1,
    '71c8a085aa6d422a9bcf262fe01e8633'
  ),
  (
    122,
    'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTcwOTM5OTYyNCwiaWF0IjoxNzA5Mzk5NjE0LCJqdGkiOiI2MjMxYjRjNTcwNzk0YWM2ODUyNmYxOTcwMzQ5NmQwMSIsInVzZXJfaWQiOjF9.xYsJZ2N9E2Ri72thqUQYWtuZC-wpvvbrkjF8Yn6HHDU',
    '2024-03-02 17:13:34.305391',
    '2024-03-02 17:13:44.000000',
    1,
    '6231b4c570794ac68526f19703496d01'
  ),
  (
    123,
    'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTcwOTM5OTg5NCwiaWF0IjoxNzA5Mzk5ODg0LCJqdGkiOiIzZWY5YzU3N2NlYTc0MWM2ODg1ZGE2MWI0MjFmMTI3OSIsInVzZXJfaWQiOjF9.3-6rWfLSfcnv8pBu4nOAKOBoAW3iHFVhjGXCnPAenxU',
    '2024-03-02 17:18:04.741124',
    '2024-03-02 17:18:14.000000',
    1,
    '3ef9c577cea741c6885da61b421f1279'
  ),
  (
    124,
    'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTcwOTQwMDE4MywiaWF0IjoxNzA5NDAwMTczLCJqdGkiOiJmNTc3MDhiZDA3NTA0ZTEwOGI0ZmZjYmE2YWQ0MTU3OCIsInVzZXJfaWQiOjF9.srvd6rtcl3tNaZPOU0d1g5xeN4hIFTuIs-AZAmL1qZs',
    '2024-03-02 17:22:53.326336',
    '2024-03-02 17:23:03.000000',
    1,
    'f57708bd07504e108b4ffcba6ad41578'
  ),
  (
    125,
    'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTcwOTQwMDIzNSwiaWF0IjoxNzA5NDAwMjI1LCJqdGkiOiI0OWViNDY4MjE4MTI0YjJkOTdkYjI5OWQ2ODJhZmM1MSIsInVzZXJfaWQiOjF9.pyttn7FMyloBcxr-uerI5sC7TfUcUFBd8hxjkkSz_0E',
    '2024-03-02 17:23:45.728154',
    '2024-03-02 17:23:55.000000',
    1,
    '49eb468218124b2d97db299d682afc51'
  ),
  (
    126,
    'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTcwOTQwMDc3NiwiaWF0IjoxNzA5NDAwNzY2LCJqdGkiOiIyOTQwNmRhNzgxNzg0NWZmYTBhYjkxNmQ1YjkyYTUzYyIsInVzZXJfaWQiOjF9.4z_JOiGEzvnXlpf73HvvGEFiURH-dU1gyy4vTcLKur8',
    '2024-03-02 17:32:46.578979',
    '2024-03-02 17:32:56.000000',
    1,
    '29406da7817845ffa0ab916d5b92a53c'
  ),
  (
    127,
    'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTcwOTQwMTM3NiwiaWF0IjoxNzA5NDAxMzY2LCJqdGkiOiJjMjMzYzUxOGE4MmQ0NWYyOTgzZjEzMTVmOTJmODJkZSIsInVzZXJfaWQiOjF9.RgasX7lCUNI-wMbFKMxUKsPJSsu58gl6F9iVLncSc-k',
    '2024-03-02 17:42:46.726004',
    '2024-03-02 17:42:56.000000',
    1,
    'c233c518a82d45f2983f1315f92f82de'
  ),
  (
    128,
    'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTcwOTQwMTYxMiwiaWF0IjoxNzA5NDAxNTUyLCJqdGkiOiI2NGY2NTk0NGVjYzY0ZjgzOTdiZjY5ZjkxNjVmYzIzMSIsInVzZXJfaWQiOjF9.ukMCyrYfQp5Ep5V_UZoRSmk6m1R2DDiHpgwCxbTWL0k',
    '2024-03-02 17:45:52.037493',
    '2024-03-02 17:46:52.000000',
    1,
    '64f65944ecc64f8397bf69f9165fc231'
  ),
  (
    129,
    'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTcwOTQ4OTk0MCwiaWF0IjoxNzA5NDAzNTQwLCJqdGkiOiJjMTQ4ZWE2MGJlNWU0NzMwOGY2ZGY2NjU4M2RlZDAxYSIsInVzZXJfaWQiOjF9.QY-pW4QAR3znyZP4ru1NL5VqSSRteyQq8EJAmcaRyjw',
    '2024-03-02 18:19:00.336865',
    '2024-03-03 18:19:00.000000',
    1,
    'c148ea60be5e47308f6df66583ded01a'
  ),
  (
    130,
    'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTcwOTQ5MDIzMCwiaWF0IjoxNzA5NDAzODMwLCJqdGkiOiIyNjA4ZWY1M2FiOGY0MzBlYjg2NjYzYmQ2OWFhODAyMyIsInVzZXJfaWQiOjF9.4jd1veY5jLDblAmRKXsG7PwnS1-q9ZY8kP9OXrvF5KE',
    '2024-03-02 18:23:50.587999',
    '2024-03-03 18:23:50.000000',
    1,
    '2608ef53ab8f430eb86663bd69aa8023'
  ),
  (
    131,
    'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTcwOTQ5MTUyOCwiaWF0IjoxNzA5NDA1MTI4LCJqdGkiOiIwNWI1YzQxNDVjZTU0MDI4ODlhMGNlNmZhNzA1YTU5MSIsInVzZXJfaWQiOjF9.yQ3SNELy0OP1_BuG1zaiO6_SaH2iLpDV_rMvsMosz9Y',
    '2024-03-02 18:45:28.805282',
    '2024-03-03 18:45:28.000000',
    1,
    '05b5c4145ce5402889a0ce6fa705a591'
  ),
  (
    132,
    'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTcwOTQ5MzA3MiwiaWF0IjoxNzA5NDA2NjcyLCJqdGkiOiI0NjJhZGUxMDczN2Y0MTcxYWJiOTBlNmUxYTNkYmJjOSIsInVzZXJfaWQiOjV9.leIhPDB-b7wYg_iM4bs9QtotGzCPUmUGYZkGGr7XXIg',
    '2024-03-02 19:11:12.246187',
    '2024-03-03 19:11:12.000000',
    NULL,
    '462ade10737f4171abb90e6e1a3dbbc9'
  ),
  (
    133,
    'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTcwOTQ5NzI3OCwiaWF0IjoxNzA5NDEwODc4LCJqdGkiOiIzZmIwNzJiNTY5ZDE0YWU0OTExYWZlN2U1N2ZlMzQxYSIsInVzZXJfaWQiOjF9.Mx1mv4j3EledHUEvFGYHtp5AVDuKcJ_KXagw6-L0tXo',
    '2024-03-02 20:21:18.699355',
    '2024-03-03 20:21:18.000000',
    1,
    '3fb072b569d14ae4911afe7e57fe341a'
  ),
  (
    134,
    'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTcwOTQ5Nzg3NiwiaWF0IjoxNzA5NDExNDc2LCJqdGkiOiIxZmVhYzZlOTA1MGQ0NjNjODA0ZTk4M2ZkYjk2MWIxNSIsInVzZXJfaWQiOjF9.BeAXR_rc1reHXAWLhyuvaYU0pX8E36f4S23kI2PV_58',
    '2024-03-02 20:31:16.364283',
    '2024-03-03 20:31:16.000000',
    1,
    '1feac6e9050d463c804e983fdb961b15'
  ),
  (
    135,
    'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTcwOTQ5ODc1MCwiaWF0IjoxNzA5NDEyMzUwLCJqdGkiOiIwYmI5MDQ2MzBmNzg0NmFiODAzOGVmMGFhZTVhY2FiMSIsInVzZXJfaWQiOjF9.ZJVYUIiWZC23XkHqv7z3Rp-dScKZ32lluWpMlXMcqdA',
    '2024-03-02 20:45:50.083792',
    '2024-03-03 20:45:50.000000',
    1,
    '0bb904630f7846ab8038ef0aae5acab1'
  ),
  (
    136,
    'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTcxMDA3NDgyNiwiaWF0IjoxNzA5OTg4NDI2LCJqdGkiOiJhZTQyN2FlNWYxM2Q0ODhmYWQyODkxYWYwZmZlODAyMiIsInVzZXJfaWQiOjF9.aKPfLNFNFP_Um_N15-c-U6d-dOVn5aiXudw8N3cqrW8',
    '2024-03-09 12:47:06.364659',
    '2024-03-10 12:47:06.000000',
    1,
    'ae427ae5f13d488fad2891af0ffe8022'
  ),
  (
    137,
    'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTcxMDA3ODk3MiwiaWF0IjoxNzA5OTkyNTcyLCJqdGkiOiI3YmFkNzIwOTgxOTQ0MGExYjJlOTNhZTgyNTIxNGVkNyIsInVzZXJfaWQiOjF9.TmWki4b9Mtv0s_j6xx7KKZ0Fy-cUhkTJIY22w36Uj8g',
    '2024-03-09 13:56:12.359886',
    '2024-03-10 13:56:12.000000',
    1,
    '7bad7209819440a1b2e93ae825214ed7'
  ),
  (
    138,
    'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTcxMDA3OTA3OCwiaWF0IjoxNzA5OTkyNjc4LCJqdGkiOiI1YzE2YmVlZjM5MjA0ZDZiYTMyZjg1OWQwMTg0NmNlZiIsInVzZXJfaWQiOjF9.KgKazDWVknHX6TXxsUn8Bkl1fHf2Ga6omPQpWOLNNpg',
    '2024-03-09 13:57:58.589749',
    '2024-03-10 13:57:58.000000',
    1,
    '5c16beef39204d6ba32f859d01846cef'
  ),
  (
    139,
    'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTcxMDA3OTU4MywiaWF0IjoxNzA5OTkzMTgzLCJqdGkiOiI0NDY4YTBhZjU2YjE0OGNjODBiODgzNTVhY2JmMDY1ZCIsInVzZXJfaWQiOjF9.m4LjiBWhvX98tip5r4DTWlbOl6KruTN8mpOeWUKmF04',
    '2024-03-09 14:06:23.819384',
    '2024-03-10 14:06:23.000000',
    1,
    '4468a0af56b148cc80b88355acbf065d'
  ),
  (
    140,
    'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTcxMDA5ODQ1MiwiaWF0IjoxNzEwMDEyMDUyLCJqdGkiOiJlZDFiZGQ0YzUxMGY0ZjMwOTJjZTdjZTI4M2Y2MGE2YiIsInVzZXJfaWQiOjV9.dtsm3Wt-QIQDSyJz8HN1VyjihDYO9m-sGDrOdg4CAJs',
    '2024-03-09 19:20:52.600542',
    '2024-03-10 19:20:52.000000',
    NULL,
    'ed1bdd4c510f4f3092ce7ce283f60a6b'
  ),
  (
    141,
    'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTcxMDA5ODQ2MywiaWF0IjoxNzEwMDEyMDYzLCJqdGkiOiIyMDZiNDk4ZGMzODE0ZTE1OGNhYTc1NzNjYjRhOTYwMCIsInVzZXJfaWQiOjF9.oE0LPbWiE7KiMcUQu5OT_7Gv1XQfII-N-md5AaiKv8c',
    '2024-03-09 19:21:03.241593',
    '2024-03-10 19:21:03.000000',
    1,
    '206b498dc3814e158caa7573cb4a9600'
  ),
  (
    142,
    'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTcxMDA5OTg4NywiaWF0IjoxNzEwMDEzNDg3LCJqdGkiOiI0ZTI1MTIwYjVlZGI0OWI2YWJkNTM2ODIxMDYyMWIyNyIsInVzZXJfaWQiOjF9.wpYW1r2BC0BSZKJKnyp0k7Lw5NzWJ6bc-xwmyFH0M6M',
    '2024-03-09 19:44:47.795622',
    '2024-03-10 19:44:47.000000',
    1,
    '4e25120b5edb49b6abd5368210621b27'
  );

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

-- Dump completed on 2024-03-09 23:03:36