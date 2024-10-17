-- MySQL dump 10.13  Distrib 8.0.39, for Linux (x86_64)
--
-- Host: localhost    Database: quizcloud
-- ------------------------------------------------------
-- Server version	8.0.39-0ubuntu0.22.04.1

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
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add content type',4,'add_contenttype'),(14,'Can change content type',4,'change_contenttype'),(15,'Can delete content type',4,'delete_contenttype'),(16,'Can view content type',4,'view_contenttype'),(17,'Can add session',5,'add_session'),(18,'Can change session',5,'change_session'),(19,'Can delete session',5,'delete_session'),(20,'Can view session',5,'view_session'),(21,'Can add question',6,'add_question'),(22,'Can change question',6,'change_question'),(23,'Can delete question',6,'delete_question'),(24,'Can view question',6,'view_question'),(25,'Can add subject',7,'add_subject'),(26,'Can change subject',7,'change_subject'),(27,'Can delete subject',7,'delete_subject'),(28,'Can view subject',7,'view_subject'),(29,'Can add user',8,'add_customuser'),(30,'Can change user',8,'change_customuser'),(31,'Can delete user',8,'delete_customuser'),(32,'Can view user',8,'view_customuser'),(33,'Can add option',9,'add_option'),(34,'Can change option',9,'change_option'),(35,'Can delete option',9,'delete_option'),(36,'Can view option',9,'view_option'),(37,'Can add quiz',10,'add_quiz'),(38,'Can change quiz',10,'change_quiz'),(39,'Can delete quiz',10,'delete_quiz'),(40,'Can view quiz',10,'view_quiz'),(41,'Can add quiz attempt',11,'add_quizattempt'),(42,'Can change quiz attempt',11,'change_quizattempt'),(43,'Can delete quiz attempt',11,'delete_quizattempt'),(44,'Can view quiz attempt',11,'view_quizattempt'),(45,'Can add answer',12,'add_answer'),(46,'Can change answer',12,'change_answer'),(47,'Can delete answer',12,'delete_answer'),(48,'Can view answer',12,'view_answer'),(49,'Can add planned quiz',13,'add_plannedquiz'),(50,'Can change planned quiz',13,'change_plannedquiz'),(51,'Can delete planned quiz',13,'delete_plannedquiz'),(52,'Can view planned quiz',13,'view_plannedquiz');
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
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_quiz_customuser_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_quiz_customuser_id` FOREIGN KEY (`user_id`) REFERENCES `quiz_customuser` (`id`),
  CONSTRAINT `django_admin_log_chk_1` CHECK ((`action_flag` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2024-09-13 07:49:08.112633','4cdac5d4-e292-48dd-8966-fa1dadad24bf','English',1,'[{\"added\": {}}]',7,1),(2,'2024-09-13 07:49:12.583825','0025d963-712c-461f-88e7-09e8d70f0244','Kiswahili',1,'[{\"added\": {}}]',7,1),(3,'2024-09-13 07:49:18.253986','84c8681a-cfd6-4db7-b81a-92d9c9d1f660','Mathematics',1,'[{\"added\": {}}]',7,1),(4,'2024-09-13 07:49:24.228640','5601b2fd-2922-4d23-aaf2-be04f1b62f6f','Physics',1,'[{\"added\": {}}]',7,1);
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
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'contenttypes','contenttype'),(12,'quiz','answer'),(8,'quiz','customuser'),(9,'quiz','option'),(13,'quiz','plannedquiz'),(6,'quiz','question'),(10,'quiz','quiz'),(11,'quiz','quizattempt'),(7,'quiz','subject'),(5,'sessions','session');
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
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2024-09-13 07:27:22.147801'),(2,'contenttypes','0002_remove_content_type_name','2024-09-13 07:27:22.315149'),(3,'auth','0001_initial','2024-09-13 07:27:23.110343'),(4,'auth','0002_alter_permission_name_max_length','2024-09-13 07:27:23.343692'),(5,'auth','0003_alter_user_email_max_length','2024-09-13 07:27:23.362580'),(6,'auth','0004_alter_user_username_opts','2024-09-13 07:27:23.381991'),(7,'auth','0005_alter_user_last_login_null','2024-09-13 07:27:23.399727'),(8,'auth','0006_require_contenttypes_0002','2024-09-13 07:27:23.407693'),(9,'auth','0007_alter_validators_add_error_messages','2024-09-13 07:27:23.422452'),(10,'auth','0008_alter_user_username_max_length','2024-09-13 07:27:23.441260'),(11,'auth','0009_alter_user_last_name_max_length','2024-09-13 07:27:23.461609'),(12,'auth','0010_alter_group_name_max_length','2024-09-13 07:27:23.501010'),(13,'auth','0011_update_proxy_permissions','2024-09-13 07:27:23.519805'),(14,'auth','0012_alter_user_first_name_max_length','2024-09-13 07:27:23.537440'),(15,'quiz','0001_initial','2024-09-13 07:27:26.938276'),(16,'admin','0001_initial','2024-09-13 07:27:27.278755'),(17,'admin','0002_logentry_remove_auto_add','2024-09-13 07:27:27.300006'),(18,'admin','0003_logentry_add_action_flag_choices','2024-09-13 07:27:27.323403'),(19,'quiz','0002_quiz_published','2024-09-13 07:27:27.418240'),(20,'quiz','0003_quiz_created_at_quiz_updated_at','2024-09-13 07:27:27.594704'),(21,'sessions','0001_initial','2024-09-13 07:27:27.694626');
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
INSERT INTO `django_session` VALUES ('2l0lvl9m281avoct9bibcsgo1pprsjt6','.eJxVjssKwjAURP8lW225edpkKfgH7sNNbkKDD9Ckgor_bgtd6HLmzAzzZh6nNvqpprsvxBwTbPvrBYyndF3AbSqvfpW1P1ywnPcr_GuMWMc5nmyyCgQklVGStMZksaOoA6pAkpAGUIkDicgNQDY0ZKKYA8iMMeQwj56xNo-xlUdpz-UaCNWB7bg8cu2kcEL33Bqt5QbAAbDPFy3OQKI:1sp8HZ:J378F6uHtVvqpM-X1VQw-jf1rSF4VEOOcV3Of7e3GL4','2024-09-13 23:32:25.275638'),('8ffc3xi82l3vcp6ghvk9eb97zzjref5b','.eJxVjMsOwiAQRf-FrbaZAQTapYl_4J4MU0iJj0ShJmr8d9ukC12e-zhv4Wmqo59KvPs8iF4osf3NAvEpXpfiNuVXu2JpDxfK5_1a_j1GKuM8l0OnOSrSrFFFtMoAmhgNows6qQQJuUs7NIGcBmV50EE6soScUjJulp6pVE9c8yPX56IEqRvoGlRHcD1AL11rO2us3MwAID5f0f8_aw:1sp1EC:a8M3IAsMaQunGH609BqE54LchQnCekAVl1Fwk9oDgb0','2024-09-13 16:00:28.804887'),('9s2aqarkhxg2rij3erwi3xv801qbgak4','.eJxVjs0KwjAQhN8lV23ZTbJJk6PgG3gvm5jQ4A9oWkHFd7eFHvQ4880M8xY9T-PQTzXd-3IUXkix_fUCx1O6LuA2lVe7ytruL1zOuxX-NQauwxwnY5FzMmS1tomAO2UigY4Ss7NKoe4YssVglCMOkEliDNKp4IxN0s6jZ65jz3EsjzI-l2sgdQOuQTqg82S81C0idUpuADyA-HwBXQ097g:1spvM8:AOaxGbCLyyIuOyCfD9wY8kDJY-MskXEExohhMxhKEus','2024-09-16 03:56:24.273158'),('eisbu8qakxxmqboyjbdst5i0m4jq8g69','.eJxVjEEOwiAURO_CVtsA_cCXpYk3cE8oH1JiNVGoiRrvLiZd6Oxm3sy8mPNLndxS4s1lYpYB2_5mow-nePmC65Kf_WpLfzj7PO9X-LeYfJlanRKS1CCHpITBmDR6H3TYgVQxBtEERFokgyElAmmIlI4wRhqNRsJ2OvtSnQ8133N9tEvJJXR81wk4SmEBrcIeudZi2HBuOWfvDwDrP-s:1spadZ:0obD2kicoCIcSn8GDVA5Qz4kFe7JIr6311KjKsugl4c','2024-09-15 05:49:01.724582'),('goqymr3spezg2x92eser027vdrg14ip5','.eJxVjMsKwjAQRf8lW22ZZNI8uhT8A_dhMjY0WAVNK6j470boQpfnPs5LBFrmMSxluIV8FL1Asf3NIvFpuHyL65Kf7Yql3Z8pT7u1_HuMVMY6H9BZjNqlZBJY5ZIy0bFDqaWShMYZYJSAjoGj9azRJ5kUeE7UWYAqnajMgXjO9zw_qlKB0g34RnYHBT3YXkJrwXjrNlAZxPsDb6s-GQ:1spvWY:gpspwWSwH-U3RaLQgBXTapVroDzOSBcN1DjZALVfJY4','2024-09-16 04:07:10.782740'),('kk81vuj8kmwejfweoo3yogllsyeglfaa','.eJxVjskKwjAURf8lW215GV-TpeAfuA8vMaHBATSpoOK_20IXurznDtw38zS10U813X05MscE2_6yQPGUrotxm8qrX2Xt9xcq591q_jVGquMc1wY55WQ0KoVJAw3SRA0qCp4tSsnVQJCRByOtpgBZCx6DsDJYg0ngPHqm2jzFVh6lPZdrIFQHtuP6wNEp4wT0Qs4QNwAOgH2-XG495Q:1sptKG:6T8vZdiABMhuomOV3O-vgRP25gDV2AyAle7c1s15uV4','2024-09-16 01:46:20.243833'),('pz62rz47rurai22m8r1l7ergahr77t8b','.eJxVjssKwjAURP8lW225N-9kKfgH7stNTGjwAZpUUPHfbaELXc6cmWHebKCpjcNU030oR-YZZ9tfL1A8pesCblN59aus_f5C5bxb4V9jpDrOcaUNUk5aGSlNUkBW6KhARo7ZGSFQWoJsMGjhFAXIimMM3IngtEnczKNnqm2g2MqjtOdyDbjswHVcHdB6dJ5jj8JK6zYAHoB9vl1NPfc:1stWbh:b1yn5yaKhTTEGOOAOtE2LPhLFY2mPZeCZixPTjtCmMs','2024-09-26 02:19:21.179339'),('wtkl8p8qfjxf05vqjxm7f37u678peqgt','.eJxVjEkKAjEURO-SrXbzk5-hk6XgDdyHjHRwAE1aUPHuRuiFLutV1XsR65Y226Wmmy2RGELJ9pd5F47p8i2uS3mOa6zj_uzKabeWf4_Z1bnPlfBCSuAiBunSFFH6LEMOU5Qghc_UU69jBwo1siyQTopnidonmLTPXXpytVkXWrmX9uhKBowPoAeKB1CGa8P4iFoh0xsAA0DeH-jnP44:1sp13U:rnhU4vFlrEDbAy0V5Z4wPaItRrAeGWyP9A-Ry2xdE_M','2024-09-13 15:49:24.400066');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `quiz_answer`
--

DROP TABLE IF EXISTS `quiz_answer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `quiz_answer` (
  `id` char(32) NOT NULL,
  `question_id` char(32) NOT NULL,
  `quiz_attempt_id` char(32) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `quiz_answer_question_id_26edde8a_fk_quiz_question_id` (`question_id`),
  KEY `quiz_answer_quiz_attempt_id_1fa248c4_fk_quiz_quizattempt_id` (`quiz_attempt_id`),
  CONSTRAINT `quiz_answer_question_id_26edde8a_fk_quiz_question_id` FOREIGN KEY (`question_id`) REFERENCES `quiz_question` (`id`),
  CONSTRAINT `quiz_answer_quiz_attempt_id_1fa248c4_fk_quiz_quizattempt_id` FOREIGN KEY (`quiz_attempt_id`) REFERENCES `quiz_quizattempt` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `quiz_answer`
--

LOCK TABLES `quiz_answer` WRITE;
/*!40000 ALTER TABLE `quiz_answer` DISABLE KEYS */;
/*!40000 ALTER TABLE `quiz_answer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `quiz_answer_selected_options`
--

DROP TABLE IF EXISTS `quiz_answer_selected_options`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `quiz_answer_selected_options` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `answer_id` char(32) NOT NULL,
  `option_id` char(32) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `quiz_answer_selected_options_answer_id_option_id_43f52688_uniq` (`answer_id`,`option_id`),
  KEY `quiz_answer_selected_option_id_5d14b3c8_fk_quiz_opti` (`option_id`),
  CONSTRAINT `quiz_answer_selected_answer_id_70672bb5_fk_quiz_answ` FOREIGN KEY (`answer_id`) REFERENCES `quiz_answer` (`id`),
  CONSTRAINT `quiz_answer_selected_option_id_5d14b3c8_fk_quiz_opti` FOREIGN KEY (`option_id`) REFERENCES `quiz_option` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `quiz_answer_selected_options`
--

LOCK TABLES `quiz_answer_selected_options` WRITE;
/*!40000 ALTER TABLE `quiz_answer_selected_options` DISABLE KEYS */;
/*!40000 ALTER TABLE `quiz_answer_selected_options` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `quiz_customuser`
--

DROP TABLE IF EXISTS `quiz_customuser`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `quiz_customuser` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  `email` varchar(254) NOT NULL,
  `status` varchar(100) NOT NULL,
  `school` varchar(100) NOT NULL,
  `image` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `quiz_customuser`
--

LOCK TABLES `quiz_customuser` WRITE;
/*!40000 ALTER TABLE `quiz_customuser` DISABLE KEYS */;
INSERT INTO `quiz_customuser` VALUES (1,'pbkdf2_sha256$720000$8eRtKJOmKcR67psfJDh5Jj$fSSGcYYJdcPwMsB4njtCXvL9ZIx559iAp4hdAUDrQuI=','2024-09-13 07:41:34.976105',1,'tom','','',1,1,'2024-09-13 07:38:10.231255','sakachrispine388@gmail.com','student','','default/user.jpg'),(2,'pbkdf2_sha256$720000$6BUYswxoDNKnVd7tWKTOPs$eGvez+InoSROMi2MkP18N97X35hiAyONzrc/4sobTT0=','2024-09-25 18:19:21.099679',0,'Chris','Chrispine','Saka',0,1,'2024-09-13 07:44:26.201355','sakachris90@gmail.com','student','Fuzu Academy','default/user.jpg'),(3,'pbkdf2_sha256$720000$QSakzFfgQa9m80BVGyl2S3$5NqX94qwVdh7neJu7oLc2jT+THqFZYl5u5jkFDLxovs=','2024-09-15 19:06:53.211007',0,'grace','Grace','Tom',0,1,'2024-09-13 07:52:04.294885','sakachrispo@gmail.com','teacher','Nuru School','default/user.jpg'),(4,'pbkdf2_sha256$720000$sFQ4vq9SZB41KTmA7fl4F5$KOwcT8z9EBrCXFbuV3R59vVTozK1STjVkPd+Huzp0nA=','2024-09-14 21:49:01.671243',0,'joy','','',0,1,'2024-09-14 21:42:28.029276','saka@cloudoon.com','student','','default/user.jpg');
/*!40000 ALTER TABLE `quiz_customuser` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `quiz_customuser_groups`
--

DROP TABLE IF EXISTS `quiz_customuser_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `quiz_customuser_groups` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `customuser_id` bigint NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `quiz_customuser_groups_customuser_id_group_id_a0044c4e_uniq` (`customuser_id`,`group_id`),
  KEY `quiz_customuser_groups_group_id_ac6c2b9a_fk_auth_group_id` (`group_id`),
  CONSTRAINT `quiz_customuser_grou_customuser_id_e984c226_fk_quiz_cust` FOREIGN KEY (`customuser_id`) REFERENCES `quiz_customuser` (`id`),
  CONSTRAINT `quiz_customuser_groups_group_id_ac6c2b9a_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `quiz_customuser_groups`
--

LOCK TABLES `quiz_customuser_groups` WRITE;
/*!40000 ALTER TABLE `quiz_customuser_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `quiz_customuser_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `quiz_customuser_subjects`
--

DROP TABLE IF EXISTS `quiz_customuser_subjects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `quiz_customuser_subjects` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `customuser_id` bigint NOT NULL,
  `subject_id` char(32) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `quiz_customuser_subjects_customuser_id_subject_id_6c9dc438_uniq` (`customuser_id`,`subject_id`),
  KEY `quiz_customuser_subjects_subject_id_d4595f45_fk_quiz_subject_id` (`subject_id`),
  CONSTRAINT `quiz_customuser_subj_customuser_id_c73c3578_fk_quiz_cust` FOREIGN KEY (`customuser_id`) REFERENCES `quiz_customuser` (`id`),
  CONSTRAINT `quiz_customuser_subjects_subject_id_d4595f45_fk_quiz_subject_id` FOREIGN KEY (`subject_id`) REFERENCES `quiz_subject` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `quiz_customuser_subjects`
--

LOCK TABLES `quiz_customuser_subjects` WRITE;
/*!40000 ALTER TABLE `quiz_customuser_subjects` DISABLE KEYS */;
INSERT INTO `quiz_customuser_subjects` VALUES (2,2,'4cdac5d4e29248dd8966fa1dadad24bf'),(4,2,'5601b2fd29224d23aaf2be04f1b62f6f'),(1,2,'84c8681acfd64db7b81a92d9c9d1f660'),(3,4,'0025d963712c461f88e709e8d70f0244');
/*!40000 ALTER TABLE `quiz_customuser_subjects` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `quiz_customuser_user_permissions`
--

DROP TABLE IF EXISTS `quiz_customuser_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `quiz_customuser_user_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `customuser_id` bigint NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `quiz_customuser_user_per_customuser_id_permission_3b2a522a_uniq` (`customuser_id`,`permission_id`),
  KEY `quiz_customuser_user_permission_id_defcb4f3_fk_auth_perm` (`permission_id`),
  CONSTRAINT `quiz_customuser_user_customuser_id_9f8c8fb9_fk_quiz_cust` FOREIGN KEY (`customuser_id`) REFERENCES `quiz_customuser` (`id`),
  CONSTRAINT `quiz_customuser_user_permission_id_defcb4f3_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `quiz_customuser_user_permissions`
--

LOCK TABLES `quiz_customuser_user_permissions` WRITE;
/*!40000 ALTER TABLE `quiz_customuser_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `quiz_customuser_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `quiz_option`
--

DROP TABLE IF EXISTS `quiz_option`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `quiz_option` (
  `id` char(32) NOT NULL,
  `text` varchar(255) NOT NULL,
  `is_correct` tinyint(1) NOT NULL,
  `question_id` char(32) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `quiz_option_question_id_f88cc373_fk_quiz_question_id` (`question_id`),
  CONSTRAINT `quiz_option_question_id_f88cc373_fk_quiz_question_id` FOREIGN KEY (`question_id`) REFERENCES `quiz_question` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `quiz_option`
--

LOCK TABLES `quiz_option` WRITE;
/*!40000 ALTER TABLE `quiz_option` DISABLE KEYS */;
INSERT INTO `quiz_option` VALUES ('0a8e8efb8a6e4b9590b2adcebf45eb67','14',0,'062674d4f7004a03bc1725780537f5ff'),('0aea7134f1e14f32afcd2d6fb491b95f','No',0,'4c6288de3fb749b6b67a0763ab8322fa'),('0e584420f951473d9ecc677bc18f1d22','10',1,'1cba88e0dc87473592af7b2d6da30567'),('22666c899726463ca001dcd7590e99ee','5',0,'4cf68bb5e2b646fcacb820e24dabf663'),('4446716320e4447ea91eb0a14d2a21d6','3',0,'60a5ce09bbb041cb8b5069fc0b29a8e1'),('4c4c9cd76b324d419ee2db0a4cdb04ff','-8',1,'062674d4f7004a03bc1725780537f5ff'),('4e9fb0eb773448d7b4fd1c8eada87392','-10',0,'1cba88e0dc87473592af7b2d6da30567'),('51d03daea8bb495b8a8d63f7c95feee1','-5',0,'4cf68bb5e2b646fcacb820e24dabf663'),('6f1cfeffd3b74bf09fadabc3ecebe333','-6',1,'60a5ce09bbb041cb8b5069fc0b29a8e1'),('71251d8b37cf4e6e91ea0ec52e92508b','Yes',0,'4c6288de3fb749b6b67a0763ab8322fa'),('7577ffbb11ce4a7cb025a0a8bd073b74','0',1,'4cf68bb5e2b646fcacb820e24dabf663'),('76b4d3b7b02744fdb88741e5c4dc763e','1',0,'50d97910d8ff494c91bcb8f31e6ee996'),('89b6babf6cf040189d3f186e6599d660','0',0,'60a5ce09bbb041cb8b5069fc0b29a8e1'),('924c247ae0f3454daaeadc9ebfc8f600','-1',0,'50d97910d8ff494c91bcb8f31e6ee996'),('92d4d889be684233b028f1ccf262c965','His',1,'44f97f060d5a4ff6b0885ba2fb080bb8'),('9bc040de5f3844628d1b00f08b35fb1d','2',0,'1cba88e0dc87473592af7b2d6da30567'),('9c5c29942d8e433c8346c84221d1ba70','17',0,'50d97910d8ff494c91bcb8f31e6ee996'),('a056f9cd402244c89339e566c4e1191b','8',0,'062674d4f7004a03bc1725780537f5ff'),('ab03a6e9e5b745ce8359037d351f665f','10',0,'4cf68bb5e2b646fcacb820e24dabf663'),('be50e92cc8aa43789c289e9e3ac93285','Movement',1,'4c6288de3fb749b6b67a0763ab8322fa'),('be5574d97f5041e898151e89e5032642','-17',1,'50d97910d8ff494c91bcb8f31e6ee996'),('c5ea68f316fd4d899fd86c0618d5db5d','6',0,'60a5ce09bbb041cb8b5069fc0b29a8e1'),('c8daacf2346c4d25aba520f60a838813','-14',0,'062674d4f7004a03bc1725780537f5ff'),('cda493d3e1844996aadb019769f0a551','Her',0,'44f97f060d5a4ff6b0885ba2fb080bb8'),('f1a99c2719094959a2e935a2c60721d5','-2',0,'1cba88e0dc87473592af7b2d6da30567');
/*!40000 ALTER TABLE `quiz_option` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `quiz_plannedquiz`
--

DROP TABLE IF EXISTS `quiz_plannedquiz`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `quiz_plannedquiz` (
  `id` char(32) NOT NULL,
  `taken` tinyint(1) NOT NULL,
  `student_id` bigint NOT NULL,
  `quiz_id` char(32) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `quiz_plannedquiz_student_id_quiz_id_fb057356_uniq` (`student_id`,`quiz_id`),
  KEY `quiz_plannedquiz_quiz_id_290d28ef_fk_quiz_quiz_id` (`quiz_id`),
  CONSTRAINT `quiz_plannedquiz_quiz_id_290d28ef_fk_quiz_quiz_id` FOREIGN KEY (`quiz_id`) REFERENCES `quiz_quiz` (`id`),
  CONSTRAINT `quiz_plannedquiz_student_id_37139e14_fk_quiz_customuser_id` FOREIGN KEY (`student_id`) REFERENCES `quiz_customuser` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `quiz_plannedquiz`
--

LOCK TABLES `quiz_plannedquiz` WRITE;
/*!40000 ALTER TABLE `quiz_plannedquiz` DISABLE KEYS */;
INSERT INTO `quiz_plannedquiz` VALUES ('8d216527e3644099b23f883290f8e080',0,2,'431f2ad0445447569463637f17771a47');
/*!40000 ALTER TABLE `quiz_plannedquiz` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `quiz_question`
--

DROP TABLE IF EXISTS `quiz_question`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `quiz_question` (
  `id` char(32) NOT NULL,
  `text` longtext NOT NULL,
  `marks` int unsigned NOT NULL,
  `quiz_id` char(32) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `quiz_question_quiz_id_b7429966_fk_quiz_quiz_id` (`quiz_id`),
  CONSTRAINT `quiz_question_quiz_id_b7429966_fk_quiz_quiz_id` FOREIGN KEY (`quiz_id`) REFERENCES `quiz_quiz` (`id`),
  CONSTRAINT `quiz_question_chk_1` CHECK ((`marks` >= 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `quiz_question`
--

LOCK TABLES `quiz_question` WRITE;
/*!40000 ALTER TABLE `quiz_question` DISABLE KEYS */;
INSERT INTO `quiz_question` VALUES ('062674d4f7004a03bc1725780537f5ff','3 - 11',2,'431f2ad0445447569463637f17771a47'),('1cba88e0dc87473592af7b2d6da30567','6 - -4',2,'431f2ad0445447569463637f17771a47'),('44f97f060d5a4ff6b0885ba2fb080bb8','He',5,'f270e7d47fc24eed8f81d85bd2a05602'),('4c6288de3fb749b6b67a0763ab8322fa','Define motion',2,'cfa6c04fa945475e8100fde7d7c00a87'),('4cf68bb5e2b646fcacb820e24dabf663','-5 - -5',2,'431f2ad0445447569463637f17771a47'),('50d97910d8ff494c91bcb8f31e6ee996','-9 - 8',2,'431f2ad0445447569463637f17771a47'),('60a5ce09bbb041cb8b5069fc0b29a8e1','-3 - 3',2,'431f2ad0445447569463637f17771a47');
/*!40000 ALTER TABLE `quiz_question` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `quiz_quiz`
--

DROP TABLE IF EXISTS `quiz_quiz`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `quiz_quiz` (
  `id` char(32) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` longtext NOT NULL,
  `time_limit` int unsigned NOT NULL,
  `max_attempts` int unsigned NOT NULL,
  `pass_mark` int unsigned NOT NULL,
  `created_by_id` bigint NOT NULL,
  `subject_id` char(32) DEFAULT NULL,
  `published` tinyint(1) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `quiz_quiz_created_by_id_d515c84c_fk_quiz_customuser_id` (`created_by_id`),
  KEY `quiz_quiz_subject_id_cd3c416e_fk_quiz_subject_id` (`subject_id`),
  CONSTRAINT `quiz_quiz_created_by_id_d515c84c_fk_quiz_customuser_id` FOREIGN KEY (`created_by_id`) REFERENCES `quiz_customuser` (`id`),
  CONSTRAINT `quiz_quiz_subject_id_cd3c416e_fk_quiz_subject_id` FOREIGN KEY (`subject_id`) REFERENCES `quiz_subject` (`id`),
  CONSTRAINT `quiz_quiz_chk_1` CHECK ((`time_limit` >= 0)),
  CONSTRAINT `quiz_quiz_chk_2` CHECK ((`max_attempts` >= 0)),
  CONSTRAINT `quiz_quiz_chk_3` CHECK ((`pass_mark` >= 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `quiz_quiz`
--

LOCK TABLES `quiz_quiz` WRITE;
/*!40000 ALTER TABLE `quiz_quiz` DISABLE KEYS */;
INSERT INTO `quiz_quiz` VALUES ('431f2ad0445447569463637f17771a47','Integers','Form 1 Integers',2,3,80,3,'84c8681acfd64db7b81a92d9c9d1f660',1,'2024-09-13 07:53:33.979331','2024-09-13 08:00:18.761942'),('cfa6c04fa945475e8100fde7d7c00a87','Motion','motion',2,2,45,3,'5601b2fd29224d23aaf2be04f1b62f6f',0,'2024-09-15 19:36:45.931448','2024-09-15 19:51:14.029694'),('f270e7d47fc24eed8f81d85bd2a05602','Pronouns','pronouns',2,1,80,3,'4cdac5d4e29248dd8966fa1dadad24bf',1,'2024-09-15 19:11:34.872265','2024-09-15 19:13:34.907422');
/*!40000 ALTER TABLE `quiz_quiz` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `quiz_quizattempt`
--

DROP TABLE IF EXISTS `quiz_quizattempt`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `quiz_quizattempt` (
  `id` char(32) NOT NULL,
  `score` int unsigned NOT NULL,
  `percentage_score` int unsigned NOT NULL,
  `passed` tinyint(1) NOT NULL,
  `date_attempted` datetime(6) NOT NULL,
  `start_time` datetime(6) DEFAULT NULL,
  `end_time` datetime(6) DEFAULT NULL,
  `expired` tinyint(1) NOT NULL,
  `quiz_id` char(32) NOT NULL,
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `quiz_quizattempt_quiz_id_2c7782a0_fk_quiz_quiz_id` (`quiz_id`),
  KEY `quiz_quizattempt_user_id_380ce10d_fk_quiz_customuser_id` (`user_id`),
  CONSTRAINT `quiz_quizattempt_quiz_id_2c7782a0_fk_quiz_quiz_id` FOREIGN KEY (`quiz_id`) REFERENCES `quiz_quiz` (`id`),
  CONSTRAINT `quiz_quizattempt_user_id_380ce10d_fk_quiz_customuser_id` FOREIGN KEY (`user_id`) REFERENCES `quiz_customuser` (`id`),
  CONSTRAINT `quiz_quizattempt_chk_1` CHECK ((`score` >= 0)),
  CONSTRAINT `quiz_quizattempt_chk_2` CHECK ((`percentage_score` >= 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `quiz_quizattempt`
--

LOCK TABLES `quiz_quizattempt` WRITE;
/*!40000 ALTER TABLE `quiz_quizattempt` DISABLE KEYS */;
/*!40000 ALTER TABLE `quiz_quizattempt` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `quiz_subject`
--

DROP TABLE IF EXISTS `quiz_subject`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `quiz_subject` (
  `id` char(32) NOT NULL,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `quiz_subject`
--

LOCK TABLES `quiz_subject` WRITE;
/*!40000 ALTER TABLE `quiz_subject` DISABLE KEYS */;
INSERT INTO `quiz_subject` VALUES ('0025d963712c461f88e709e8d70f0244','Kiswahili'),('4cdac5d4e29248dd8966fa1dadad24bf','English'),('5601b2fd29224d23aaf2be04f1b62f6f','Physics'),('84c8681acfd64db7b81a92d9c9d1f660','Mathematics');
/*!40000 ALTER TABLE `quiz_subject` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-10-17  8:19:17
