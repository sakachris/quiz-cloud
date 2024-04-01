-- MySQL dump 10.13  Distrib 8.0.36, for Linux (x86_64)
--
-- Host: localhost    Database: quizcloud
-- ------------------------------------------------------
-- Server version	8.0.36-0ubuntu0.22.04.1

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
  `name` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
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
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=73 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add content type',4,'add_contenttype'),(14,'Can change content type',4,'change_contenttype'),(15,'Can delete content type',4,'delete_contenttype'),(16,'Can view content type',4,'view_contenttype'),(17,'Can add session',5,'add_session'),(18,'Can change session',5,'change_session'),(19,'Can delete session',5,'delete_session'),(20,'Can view session',5,'view_session'),(21,'Can add question',6,'add_question'),(22,'Can change question',6,'change_question'),(23,'Can delete question',6,'delete_question'),(24,'Can view question',6,'view_question'),(25,'Can add subject',7,'add_subject'),(26,'Can change subject',7,'change_subject'),(27,'Can delete subject',7,'delete_subject'),(28,'Can view subject',7,'view_subject'),(29,'Can add user',8,'add_customuser'),(30,'Can change user',8,'change_customuser'),(31,'Can delete user',8,'delete_customuser'),(32,'Can view user',8,'view_customuser'),(33,'Can add option',9,'add_option'),(34,'Can change option',9,'change_option'),(35,'Can delete option',9,'delete_option'),(36,'Can view option',9,'view_option'),(37,'Can add quiz',10,'add_quiz'),(38,'Can change quiz',10,'change_quiz'),(39,'Can delete quiz',10,'delete_quiz'),(40,'Can view quiz',10,'view_quiz'),(41,'Can add quiz attempt',11,'add_quizattempt'),(42,'Can change quiz attempt',11,'change_quizattempt'),(43,'Can delete quiz attempt',11,'delete_quizattempt'),(44,'Can view quiz attempt',11,'view_quizattempt'),(45,'Can add answer',12,'add_answer'),(46,'Can change answer',12,'change_answer'),(47,'Can delete answer',12,'delete_answer'),(48,'Can view answer',12,'view_answer'),(49,'Can add planned quiz',13,'add_plannedquiz'),(50,'Can change planned quiz',13,'change_plannedquiz'),(51,'Can delete planned quiz',13,'delete_plannedquiz'),(52,'Can view planned quiz',13,'view_plannedquiz'),(53,'Can add question',8,'add_question'),(54,'Can change question',8,'change_question'),(55,'Can delete question',8,'delete_question'),(56,'Can view question',8,'view_question'),(57,'Can add subject',6,'add_subject'),(58,'Can change subject',6,'change_subject'),(59,'Can delete subject',6,'delete_subject'),(60,'Can view subject',6,'view_subject'),(61,'Can add user',13,'add_customuser'),(62,'Can change user',13,'change_customuser'),(63,'Can delete user',13,'delete_customuser'),(64,'Can view user',13,'view_customuser'),(65,'Can add quiz',7,'add_quiz'),(66,'Can change quiz',7,'change_quiz'),(67,'Can delete quiz',7,'delete_quiz'),(68,'Can view quiz',7,'view_quiz'),(69,'Can add planned quiz',10,'add_plannedquiz'),(70,'Can change planned quiz',10,'change_plannedquiz'),(71,'Can delete planned quiz',10,'delete_plannedquiz'),(72,'Can view planned quiz',10,'view_plannedquiz');
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
  KEY `django_admin_log_user_id_c564eba6_fk_quiz_customuser_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_quiz_customuser_id` FOREIGN KEY (`user_id`) REFERENCES `quiz_customuser` (`id`),
  CONSTRAINT `django_admin_log_chk_1` CHECK ((`action_flag` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2024-03-26 19:23:18.236000','c8331415-aacd-4fea-9c6d-efab429807e4','Maths',1,'[{\"added\": {}}]',7,1),(2,'2024-03-26 19:23:24.130000','8246d936-e928-470c-be2a-718d48c19943','English',1,'[{\"added\": {}}]',7,1),(3,'2024-03-26 19:23:31.662000','37fe3b73-9b13-495c-bf6d-117a71677d0e','Physics',1,'[{\"added\": {}}]',7,1),(4,'2024-03-26 19:23:39.157000','5958769f-0f02-4759-931c-67370887263d','History',1,'[{\"added\": {}}]',7,1);
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
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'contenttypes','contenttype'),(12,'quiz','answer'),(13,'quiz','customuser'),(9,'quiz','option'),(10,'quiz','plannedquiz'),(8,'quiz','question'),(7,'quiz','quiz'),(11,'quiz','quizattempt'),(6,'quiz','subject'),(5,'sessions','session');
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
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2024-03-29 13:47:30.402934'),(2,'contenttypes','0002_remove_content_type_name','2024-03-29 13:47:30.516269'),(3,'auth','0001_initial','2024-03-29 13:47:31.069333'),(4,'auth','0002_alter_permission_name_max_length','2024-03-29 13:47:31.150753'),(5,'auth','0003_alter_user_email_max_length','2024-03-29 13:47:31.164137'),(6,'auth','0004_alter_user_username_opts','2024-03-29 13:47:31.179925'),(7,'auth','0005_alter_user_last_login_null','2024-03-29 13:47:31.191640'),(8,'auth','0006_require_contenttypes_0002','2024-03-29 13:47:31.198964'),(9,'auth','0007_alter_validators_add_error_messages','2024-03-29 13:47:31.209663'),(10,'auth','0008_alter_user_username_max_length','2024-03-29 13:47:31.219936'),(11,'auth','0009_alter_user_last_name_max_length','2024-03-29 13:47:31.232883'),(12,'auth','0010_alter_group_name_max_length','2024-03-29 13:47:31.263771'),(13,'auth','0011_update_proxy_permissions','2024-03-29 13:47:31.275907'),(14,'auth','0012_alter_user_first_name_max_length','2024-03-29 13:47:31.287858'),(15,'quiz','0001_initial','2024-03-29 13:47:33.019324'),(16,'admin','0001_initial','2024-03-29 13:47:33.202586'),(17,'admin','0002_logentry_remove_auto_add','2024-03-29 13:47:33.223243'),(18,'admin','0003_logentry_add_action_flag_choices','2024-03-29 13:47:33.238813'),(19,'quiz','0002_quiz_published','2024-03-29 13:47:33.319486'),(20,'sessions','0001_initial','2024-03-29 13:47:33.387821'),(21,'quiz','0003_quiz_created_at_quiz_updated_at','2024-03-31 20:25:48.250673');
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
INSERT INTO `django_session` VALUES ('8vxzkged7c10jqexkdduseer34bfxx3m','.eJxVi0sOAiEQBe_C2ky6gebj0sRzEGiYQPwkyrDRePcZk1nosl69eosQx1LD6OUZWhZHgeLwu6XIl3L_isdor2nHPp1vsV1Pu_wraux1u89EGbwxkn2R2hJZcs5rhAQaIElVaCbLjCoZdAAWIiCydDYzu6LEZwUVPTDE:1rpCNn:K0f02NtRQjGhAh8k1v3y4laGlHa4wl3BHjPlyc5I47Q','2024-04-09 19:22:51.347000'),('csqzfy4gur91t7wwvhlcspdt1xmssut2','.eJxVi0sOAiEQBe_C2kwQm-nGpYnnIA3dBOInUYaNxrurySx0Wa9ePU3ksdQ4ut5jE7M3zmx-t8T5pNevuI32mFbs0_HC7XxY5V9RudfPHTUEssgKZasp-4CCwUoRSow-gUIGKTNREUlWAYO4eWctkfNAUszrDW2_Mq0:1rqdX9:k9S_t1fQ61SkWKc3JZr6MWqu4hmt81xF1mhY2lTMPK8','2024-04-13 18:34:27.341676'),('hg6v66t5ndtiejyudg76sly48r02xybr','.eJxVi8sKAjEMRf-laxloMjWpS8HvKElaafEB2ulG8d9VmIUuzz33PF2SsdQ0ermnlt3Oodv8bip2KtevuI32mFbs0-Ei7bxf5V9RpdfPnTwzQfQIBkGjmS_EksHoSDGAR89Rg1FQRAoIJds8i2U12maI7F5vLNUxpQ:1rqhmK:2e0HUKyyHD9igetchpQBguhX49aUph958rEQkZOjB7A','2024-04-13 23:06:24.433556'),('mpfj66z98lbk05p1norfod9pseg8l0hn','e30:1rqdVE:OWTif2GfVfn6Q0ES2RtP0ttT5o5Y-gPYiiAwAr6A1V0','2024-04-13 18:32:28.052968'),('nai8yh4sntxu7dtb18gmm6umfoclu4wn','.eJxVjEsKwzAMBe_idQmyZcmhy0LPYaTIwaYfaBNvWnr3EsiiXc4b3rxdlr7W3JfyzM3c0ZE7_G4q06XcN_Ho7TXsuAznm7TraZd_jypL3TqsBsheKCAG9QlUp1mUwSyA-WRRBEsizxxHQBwJLSriTBC5kPt8AUHRMWw:1rqCgg:rWn0Uc2x3qPeJFwaF4WmCehqhS_90xqSxuiWAo3O_4w','2024-04-12 13:54:30.713178'),('viyiryntpb5if2m46vr8i737uld9ymlh','.eJxVi0kKQjEQBe_Sa_lk6EwuBc8ROkmHBAfQ_GwU767CX-iyXr16QqS5tjgH32MvsAeE3e-WKJ_4-hW32R_LhmM5XqifD5v8KxqN9rmzssWwZ1nJoPCuZCF9sKYE4XSuqTBLp6TVKmUMSaMzhFitVF4zG4bXG1C0Mf4:1rqf5d:0oIb6m5RVsiSBK1q-oB14j8ripUKQbbgdPc2FPvXChs','2024-04-13 20:14:09.534123');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `quiz_answer`
--

DROP TABLE IF EXISTS `quiz_answer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `quiz_answer` (
  `id` char(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `question_id` char(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `quiz_attempt_id` char(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `quiz_answer_question_id_26edde8a_fk_quiz_question_id` (`question_id`),
  KEY `quiz_answer_quiz_attempt_id_1fa248c4_fk_quiz_quizattempt_id` (`quiz_attempt_id`),
  CONSTRAINT `quiz_answer_question_id_26edde8a_fk_quiz_question_id` FOREIGN KEY (`question_id`) REFERENCES `quiz_question` (`id`),
  CONSTRAINT `quiz_answer_quiz_attempt_id_1fa248c4_fk_quiz_quizattempt_id` FOREIGN KEY (`quiz_attempt_id`) REFERENCES `quiz_quizattempt` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `quiz_answer`
--

LOCK TABLES `quiz_answer` WRITE;
/*!40000 ALTER TABLE `quiz_answer` DISABLE KEYS */;
INSERT INTO `quiz_answer` VALUES ('0154c9e360de41da906668de553083ed','cb5b1f1ad4a2443fafd1a3accf994a5b','dd98bc898a324d49940e2c9ac5ff04a0'),('01c8158c49e84b5aaf7d59d82c86fab9','a61f05dc685046f8ae4eafab6e42d215','c5bc1fb515a341fbb07863a6f4170256'),('09e650c49c9b41bbabeed454b5a28d40','fac2d214c7914186b01f629a5b393794','6fed2200430344cf93ec0f8088ff0958'),('0aeaea9a5cd44bd3945eeaaecab0ece6','cc3ac08a4e454182b2c2aaad8c9b9d1c','94dce219b250484e93c313855acf673d'),('0eea388d47d54e3aa6de4131e73faa71','8cc64443a33848e2b1da158e87e0e9e9','88134020f2484943abaf93187f739353'),('0f66b44fc5794b76a2428bceff4d9725','77f5e7aa2f824636ad19cb4211a1911c','d111e96e90b942cca885257d08841200'),('10e33f3e653741e4b926f45b68816b7c','cc3ac08a4e454182b2c2aaad8c9b9d1c','6fed2200430344cf93ec0f8088ff0958'),('10ed781faa6048ba937b4ab0a777695f','fb85b9e65157448fae3acffcc3f573d0','46da7762dfc04b1097dea00b1b9d7267'),('15f7fb0d9e494c13bae60e684ee2a3aa','301341b4fadb4fe3a7e12d7ad8838f5a','d4682f62da1a4c1eae1d3ddecd11bed0'),('17100b6a74a7479999516224c39d73f1','a4c77adf301443ae8d6c94cf2c4cacb2','9dbebca2bf3244948b776737d818c6b1'),('1cee75bb698b49ef9133b6d6a13cc057','49fac0be6ffd4855a33c987f54a8f97b','9dbebca2bf3244948b776737d818c6b1'),('28932c1fdd1a498ebfa0dc37ebed585b','dbd6ca7146de4c249f045cf7c3e0840b','90e56dc48e21469aa5b34e123ba834d0'),('2ab15653b35d4781b239c5976afaac6a','cb5b1f1ad4a2443fafd1a3accf994a5b','6422582c49154da78f7d91474c4d9cb5'),('3049b6f819aa48e9bf281a72639c37d2','49fac0be6ffd4855a33c987f54a8f97b','b590455383054aaca3735b94490a1940'),('32835f1ce0894ba984167d7893e4c83f','a61f05dc685046f8ae4eafab6e42d215','c7de6c5d2b5a4cd18812e0c740b2e017'),('3294fd49111d46fcbbe29774063ceb8b','dbd6ca7146de4c249f045cf7c3e0840b','b3b7c4c00de445af8287da4d6de7348f'),('340a7c6db18d448e9383284e154c2b01','d77ec472441547ceb13e6552a01b9ece','d4682f62da1a4c1eae1d3ddecd11bed0'),('39ccc81abe1e488b82c33d4a92da18e1','af21ababfb0d4c219f334b22197ae288','6422582c49154da78f7d91474c4d9cb5'),('39cd29ee2cdb446a8e7278308d823515','2218799db0b1428babefd482ea133478','c7de6c5d2b5a4cd18812e0c740b2e017'),('3a5cd6174a5d4596b7ed6fcbc749c805','a4c77adf301443ae8d6c94cf2c4cacb2','b590455383054aaca3735b94490a1940'),('3b4bc59eb01c44fb86e4b25356af7aa1','2218799db0b1428babefd482ea133478','f3d8c2429672497990eef33e7923ba08'),('49639bf5df3e4a7391a7c5d6a6916f4e','764814d0044c4cc2967d4f3a39df5a0f','55296bdec838456b96831217b7c23bc4'),('4a70128a623a4fb08189194003a176f0','fac2d214c7914186b01f629a5b393794','6a7fb78b93514903baa6e528c11fe103'),('4ba7fef997ed42a99693a9e371e7f71b','49fac0be6ffd4855a33c987f54a8f97b','d86cb70c6ee8458497ca9ade61440034'),('4cb5ebd4ddd9463c80dcfa7dd495111e','301341b4fadb4fe3a7e12d7ad8838f5a','9f35aa2ed88f4ed684051d27091cc3b3'),('5060bfa02769475e9c3d8e4be04cccd4','fac2d214c7914186b01f629a5b393794','90e56dc48e21469aa5b34e123ba834d0'),('53ddd433ee724dab82cc446c3b47cc2a','dbd6ca7146de4c249f045cf7c3e0840b','6fed2200430344cf93ec0f8088ff0958'),('54e342ba0a33432999c074a57a13993a','cb5b1f1ad4a2443fafd1a3accf994a5b','88134020f2484943abaf93187f739353'),('589bd90563a346bb89125989d7c2bfe4','036b44935d914e1d8f5e6a6b91393f4d','6fed2200430344cf93ec0f8088ff0958'),('5c38d670887b436d8704e1ff6c5f57f3','cb5b1f1ad4a2443fafd1a3accf994a5b','2c2a84db4d594262aa8c359c378e35ec'),('5cbfcbc9539545fb9b326c2be25e795d','49fac0be6ffd4855a33c987f54a8f97b','86c1442e2f5f4775bd992be5cc26baa9'),('5e4620a53f604092839507c78f5ef142','764814d0044c4cc2967d4f3a39df5a0f','8e4580a6a4e0495bb47a856fa6f173a2'),('5ffab0024b9e41f1b064f240b4d2275e','af21ababfb0d4c219f334b22197ae288','88134020f2484943abaf93187f739353'),('66ec83c2ec6e485cb7a17ebb3d977f22','2218799db0b1428babefd482ea133478','c5bc1fb515a341fbb07863a6f4170256'),('6802f1e33d564f1a9dae37156b3dbcc4','a4c77adf301443ae8d6c94cf2c4cacb2','46da7762dfc04b1097dea00b1b9d7267'),('682b0aa6d0204eb09ed7ddc647a01437','036b44935d914e1d8f5e6a6b91393f4d','6a7fb78b93514903baa6e528c11fe103'),('69ca2346c4c440fa8ec306cdf280a76c','af21ababfb0d4c219f334b22197ae288','dd98bc898a324d49940e2c9ac5ff04a0'),('6e27e34e836840acb5a3b93b68d85234','8cc64443a33848e2b1da158e87e0e9e9','dd98bc898a324d49940e2c9ac5ff04a0'),('6fb463479ec14f9dbc6e9d82c4d60ec9','cc3ac08a4e454182b2c2aaad8c9b9d1c','90e56dc48e21469aa5b34e123ba834d0'),('72f190f8f28643b1b4ebc6878727818e','036b44935d914e1d8f5e6a6b91393f4d','94dce219b250484e93c313855acf673d'),('758f6ed0407b4fd4b8bd592b0a771eeb','77f5e7aa2f824636ad19cb4211a1911c','c7de6c5d2b5a4cd18812e0c740b2e017'),('75d2d3f704e14b2f94bfc64ec44c02ed','cc3ac08a4e454182b2c2aaad8c9b9d1c','6a7fb78b93514903baa6e528c11fe103'),('7d59e5709a61498dbda44208a6317062','d77ec472441547ceb13e6552a01b9ece','9f35aa2ed88f4ed684051d27091cc3b3'),('7dcc6889c34c420fb53e6dc1d6f2741d','af21ababfb0d4c219f334b22197ae288','2c2a84db4d594262aa8c359c378e35ec'),('7ecb7f7115f54a5c808708a41c405669','736570ef75f84f98ac740f8236d5334d','54055160990a4d5b9fdbe90abda7c87f'),('7ef61f8adee74c468b8d44616393d671','fb85b9e65157448fae3acffcc3f573d0','9dbebca2bf3244948b776737d818c6b1'),('80850be30f57464e8d80928a541fc988','a61f05dc685046f8ae4eafab6e42d215','d111e96e90b942cca885257d08841200'),('814760dad7134053863a9c102a4cfbca','be3213ff2d934dabb9d7707320d89ac5','8e4580a6a4e0495bb47a856fa6f173a2'),('859b7c492b714b4896dcd4619cfc9421','fac2d214c7914186b01f629a5b393794','b3b7c4c00de445af8287da4d6de7348f'),('85e0b9291cdc435eaee6f71e8d8d9b5f','a61f05dc685046f8ae4eafab6e42d215','5f6cbe643e3a4db4964f584e8352360b'),('885949a4124b4efa9d88548324156cfc','cc3ac08a4e454182b2c2aaad8c9b9d1c','b3b7c4c00de445af8287da4d6de7348f'),('8bbc69fbf5de4c768a19aef895acf500','2218799db0b1428babefd482ea133478','d111e96e90b942cca885257d08841200'),('8cf5447c89604d86bcf0da5932480e02','d77ec472441547ceb13e6552a01b9ece','54055160990a4d5b9fdbe90abda7c87f'),('8d544b95c2ac45df915d1daad5c02346','fb85b9e65157448fae3acffcc3f573d0','a82e6cc7e8b040948876155f0901622c'),('8ebd7bdab9ef473e9cd44ee60994f1d9','2218799db0b1428babefd482ea133478','5f6cbe643e3a4db4964f584e8352360b'),('960059625086402885b7ab41517ffb87','a4c77adf301443ae8d6c94cf2c4cacb2','86c1442e2f5f4775bd992be5cc26baa9'),('995f1c9463cd41549b2b179e04d8ae74','736570ef75f84f98ac740f8236d5334d','5497413b90e8498795cf76017a2f653a'),('9d599beac2274e98a8363d0ddf2ae264','036b44935d914e1d8f5e6a6b91393f4d','b3b7c4c00de445af8287da4d6de7348f'),('adfd336a51ea435da52a36e1eb859d91','d77ec472441547ceb13e6552a01b9ece','5497413b90e8498795cf76017a2f653a'),('b0a8a3d7f909437a955f8145e2eb2243','77f5e7aa2f824636ad19cb4211a1911c','5f6cbe643e3a4db4964f584e8352360b'),('b19b265b45574bcdb48cfe622061189d','be3213ff2d934dabb9d7707320d89ac5','55296bdec838456b96831217b7c23bc4'),('b2b620808a6e4bfdab5404534bf6d320','fb85b9e65157448fae3acffcc3f573d0','86c1442e2f5f4775bd992be5cc26baa9'),('b8bee77ffa6c40f692777fbab510407d','dbd6ca7146de4c249f045cf7c3e0840b','6a7fb78b93514903baa6e528c11fe103'),('bb33e0457acc48f288a692ffbfd3d801','736570ef75f84f98ac740f8236d5334d','d4682f62da1a4c1eae1d3ddecd11bed0'),('bc5a75a81de242708cb8bcf02f061d88','a4c77adf301443ae8d6c94cf2c4cacb2','a82e6cc7e8b040948876155f0901622c'),('bda6e80257514dcc919073848fbdad45','8cc64443a33848e2b1da158e87e0e9e9','6422582c49154da78f7d91474c4d9cb5'),('c3e6a907d20b42349f7525447ac94e70','fb85b9e65157448fae3acffcc3f573d0','d86cb70c6ee8458497ca9ade61440034'),('c68edc212d094bbf930a7c806c97857f','736570ef75f84f98ac740f8236d5334d','9f35aa2ed88f4ed684051d27091cc3b3'),('c75da4ff78cd4f77bd80fbd642604ffb','301341b4fadb4fe3a7e12d7ad8838f5a','54055160990a4d5b9fdbe90abda7c87f'),('c9d03deb54c14a2bb7a06d0426721d0d','49fac0be6ffd4855a33c987f54a8f97b','a82e6cc7e8b040948876155f0901622c'),('cacd0c4ed54641f2a2d3bfa6938c2ff8','036b44935d914e1d8f5e6a6b91393f4d','90e56dc48e21469aa5b34e123ba834d0'),('d0594dcddbd7459990c665a87a5e892d','77f5e7aa2f824636ad19cb4211a1911c','f3d8c2429672497990eef33e7923ba08'),('d1e66200757644f8b3249132dad66bf9','49fac0be6ffd4855a33c987f54a8f97b','46da7762dfc04b1097dea00b1b9d7267'),('d30324239ee7458e8e7914843b342e1f','fb85b9e65157448fae3acffcc3f573d0','b590455383054aaca3735b94490a1940'),('d4e74c8715aa40ccaf8af6c4b5c68323','dbd6ca7146de4c249f045cf7c3e0840b','94dce219b250484e93c313855acf673d'),('d97cd56643d74d058cff808b5ea24d7c','a4c77adf301443ae8d6c94cf2c4cacb2','d86cb70c6ee8458497ca9ade61440034'),('e46dc0a67d394799b83c05f509636ae8','8cc64443a33848e2b1da158e87e0e9e9','2c2a84db4d594262aa8c359c378e35ec'),('e4e51c8e90f943aebfa10129af8f061b','a61f05dc685046f8ae4eafab6e42d215','f3d8c2429672497990eef33e7923ba08'),('e7a9224de5754e90bcb255935a35fc7f','301341b4fadb4fe3a7e12d7ad8838f5a','5497413b90e8498795cf76017a2f653a'),('f52c6b6e90594797946714938edd27c8','fac2d214c7914186b01f629a5b393794','94dce219b250484e93c313855acf673d'),('fc41b394bc5048ed8f3658c2fc5b654f','77f5e7aa2f824636ad19cb4211a1911c','c5bc1fb515a341fbb07863a6f4170256');
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
  `answer_id` char(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `option_id` char(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `quiz_answer_selected_options_answer_id_option_id_43f52688_uniq` (`answer_id`,`option_id`),
  KEY `quiz_answer_selected_option_id_5d14b3c8_fk_quiz_opti` (`option_id`),
  CONSTRAINT `quiz_answer_selected_answer_id_70672bb5_fk_quiz_answ` FOREIGN KEY (`answer_id`) REFERENCES `quiz_answer` (`id`),
  CONSTRAINT `quiz_answer_selected_option_id_5d14b3c8_fk_quiz_opti` FOREIGN KEY (`option_id`) REFERENCES `quiz_option` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=105 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `quiz_answer_selected_options`
--

LOCK TABLES `quiz_answer_selected_options` WRITE;
/*!40000 ALTER TABLE `quiz_answer_selected_options` DISABLE KEYS */;
INSERT INTO `quiz_answer_selected_options` VALUES (1,'0154c9e360de41da906668de553083ed','18fe8f2cf95541dbaac4ee51287d7a9e'),(2,'01c8158c49e84b5aaf7d59d82c86fab9','72bfea3671d24cd8b4ea5ecba453b49c'),(3,'09e650c49c9b41bbabeed454b5a28d40','ce67b674942644368a1089f220c449b5'),(4,'0aeaea9a5cd44bd3945eeaaecab0ece6','698a3a638a8d4b60b3ff7e046e791b69'),(69,'0eea388d47d54e3aa6de4131e73faa71','fd8681f25c1b4a51a3a6501b8eae89c3'),(5,'0f66b44fc5794b76a2428bceff4d9725','dd6f2e63db944d338fc3f63f3473b1a6'),(6,'10e33f3e653741e4b926f45b68816b7c','698a3a638a8d4b60b3ff7e046e791b69'),(7,'10ed781faa6048ba937b4ab0a777695f','c645e8278813403db7e52a76b9ea70f5'),(87,'15f7fb0d9e494c13bae60e684ee2a3aa','08a5a912103f4956ab1b42d5dba02dd5'),(8,'17100b6a74a7479999516224c39d73f1','4b94871198e343d9b298077ea7706287'),(9,'1cee75bb698b49ef9133b6d6a13cc057','0f06a2ceff4a460aa428b2ba2626b379'),(10,'28932c1fdd1a498ebfa0dc37ebed585b','d2e7cf855f9c45d1978002e09ea14fec'),(68,'2ab15653b35d4781b239c5976afaac6a','18fe8f2cf95541dbaac4ee51287d7a9e'),(11,'3049b6f819aa48e9bf281a72639c37d2','0f06a2ceff4a460aa428b2ba2626b379'),(12,'3049b6f819aa48e9bf281a72639c37d2','31fdefdd91a942eea0cb3c35fec206e2'),(13,'32835f1ce0894ba984167d7893e4c83f','72bfea3671d24cd8b4ea5ecba453b49c'),(14,'3294fd49111d46fcbbe29774063ceb8b','d2e7cf855f9c45d1978002e09ea14fec'),(89,'340a7c6db18d448e9383284e154c2b01','8ad07c790c6546038949452409e8c451'),(67,'39ccc81abe1e488b82c33d4a92da18e1','5b1c97a17c214467afc75ba11f92b0a2'),(15,'39cd29ee2cdb446a8e7278308d823515','6d374b2dc74647ceafe6ee0cb26599f8'),(16,'39cd29ee2cdb446a8e7278308d823515','847c7746b9d64e098ce3fe86115f3df4'),(17,'3a5cd6174a5d4596b7ed6fcbc749c805','4b94871198e343d9b298077ea7706287'),(18,'3b4bc59eb01c44fb86e4b25356af7aa1','6d374b2dc74647ceafe6ee0cb26599f8'),(74,'49639bf5df3e4a7391a7c5d6a6916f4e','bc19ad4edc4242b5ac9ff352f1f685b2'),(19,'4a70128a623a4fb08189194003a176f0','ad137e7a7bd84b7db47d52ffcf11d392'),(20,'4ba7fef997ed42a99693a9e371e7f71b','0f06a2ceff4a460aa428b2ba2626b379'),(93,'4cb5ebd4ddd9463c80dcfa7dd495111e','08a5a912103f4956ab1b42d5dba02dd5'),(21,'5060bfa02769475e9c3d8e4be04cccd4','ad137e7a7bd84b7db47d52ffcf11d392'),(22,'53ddd433ee724dab82cc446c3b47cc2a','d2e7cf855f9c45d1978002e09ea14fec'),(71,'54e342ba0a33432999c074a57a13993a','76ef28582a7d446fb6f9aeb868f0fcd2'),(23,'589bd90563a346bb89125989d7c2bfe4','bf41775a167e4d70809d499c366236eb'),(24,'5c38d670887b436d8704e1ff6c5f57f3','76ef28582a7d446fb6f9aeb868f0fcd2'),(25,'5cbfcbc9539545fb9b326c2be25e795d','31fdefdd91a942eea0cb3c35fec206e2'),(76,'5e4620a53f604092839507c78f5ef142','e9b0b2d864234ff19fe696fbcd63a6e7'),(70,'5ffab0024b9e41f1b064f240b4d2275e','5b1c97a17c214467afc75ba11f92b0a2'),(26,'66ec83c2ec6e485cb7a17ebb3d977f22','6d374b2dc74647ceafe6ee0cb26599f8'),(27,'6802f1e33d564f1a9dae37156b3dbcc4','4b94871198e343d9b298077ea7706287'),(29,'682b0aa6d0204eb09ed7ddc647a01437','0ce936051c7547ed863a10e20c5efb20'),(28,'682b0aa6d0204eb09ed7ddc647a01437','bf41775a167e4d70809d499c366236eb'),(30,'69ca2346c4c440fa8ec306cdf280a76c','bf451b9ac586410cbeb473518d4949a6'),(31,'6e27e34e836840acb5a3b93b68d85234','fd8681f25c1b4a51a3a6501b8eae89c3'),(32,'6fb463479ec14f9dbc6e9d82c4d60ec9','698a3a638a8d4b60b3ff7e046e791b69'),(33,'72f190f8f28643b1b4ebc6878727818e','0ce936051c7547ed863a10e20c5efb20'),(34,'758f6ed0407b4fd4b8bd592b0a771eeb','9af8fa2bcec84e37a1dbb38ab24b8669'),(35,'75d2d3f704e14b2f94bfc64ec44c02ed','698a3a638a8d4b60b3ff7e046e791b69'),(95,'7d59e5709a61498dbda44208a6317062','8ad07c790c6546038949452409e8c451'),(36,'7dcc6889c34c420fb53e6dc1d6f2741d','5b1c97a17c214467afc75ba11f92b0a2'),(97,'7ecb7f7115f54a5c808708a41c405669','27e0adf1c7694e838e6eedadae9d0140'),(37,'7ef61f8adee74c468b8d44616393d671','c645e8278813403db7e52a76b9ea70f5'),(38,'80850be30f57464e8d80928a541fc988','72bfea3671d24cd8b4ea5ecba453b49c'),(77,'814760dad7134053863a9c102a4cfbca','a3174af9c4114040b0c3cdd0e4a270d7'),(39,'859b7c492b714b4896dcd4619cfc9421','ad137e7a7bd84b7db47d52ffcf11d392'),(40,'85e0b9291cdc435eaee6f71e8d8d9b5f','13544ba1831c4b9eb093fe57a0d5a6ce'),(41,'885949a4124b4efa9d88548324156cfc','7bf198bbc8204059a27ba724c9e8e6a6'),(42,'8bbc69fbf5de4c768a19aef895acf500','847c7746b9d64e098ce3fe86115f3df4'),(98,'8cf5447c89604d86bcf0da5932480e02','8891d1fd10ea4652a5a7cde9f6685c27'),(43,'8d544b95c2ac45df915d1daad5c02346','1d3ef92f9c9941819e6058e8b109e5f8'),(44,'8ebd7bdab9ef473e9cd44ee60994f1d9','6d374b2dc74647ceafe6ee0cb26599f8'),(45,'8ebd7bdab9ef473e9cd44ee60994f1d9','847c7746b9d64e098ce3fe86115f3df4'),(46,'960059625086402885b7ab41517ffb87','4b94871198e343d9b298077ea7706287'),(100,'995f1c9463cd41549b2b179e04d8ae74','0c36a75d636749b49bfc938e99730844'),(48,'9d599beac2274e98a8363d0ddf2ae264','0ce936051c7547ed863a10e20c5efb20'),(47,'9d599beac2274e98a8363d0ddf2ae264','bf41775a167e4d70809d499c366236eb'),(101,'adfd336a51ea435da52a36e1eb859d91','8ad07c790c6546038949452409e8c451'),(49,'b0a8a3d7f909437a955f8145e2eb2243','9af8fa2bcec84e37a1dbb38ab24b8669'),(75,'b19b265b45574bcdb48cfe622061189d','a3174af9c4114040b0c3cdd0e4a270d7'),(50,'b2b620808a6e4bfdab5404534bf6d320','c645e8278813403db7e52a76b9ea70f5'),(51,'b8bee77ffa6c40f692777fbab510407d','d2e7cf855f9c45d1978002e09ea14fec'),(88,'bb33e0457acc48f288a692ffbfd3d801','325008388058490fb4a78aa14779015f'),(52,'bc5a75a81de242708cb8bcf02f061d88','4b94871198e343d9b298077ea7706287'),(66,'bda6e80257514dcc919073848fbdad45','fd8681f25c1b4a51a3a6501b8eae89c3'),(53,'c3e6a907d20b42349f7525447ac94e70','921f996439ea4fbe866ffc5824249a6b'),(94,'c68edc212d094bbf930a7c806c97857f','27e0adf1c7694e838e6eedadae9d0140'),(96,'c75da4ff78cd4f77bd80fbd642604ffb','08a5a912103f4956ab1b42d5dba02dd5'),(54,'c9d03deb54c14a2bb7a06d0426721d0d','31fdefdd91a942eea0cb3c35fec206e2'),(55,'cacd0c4ed54641f2a2d3bfa6938c2ff8','bf41775a167e4d70809d499c366236eb'),(56,'d0594dcddbd7459990c665a87a5e892d','9af8fa2bcec84e37a1dbb38ab24b8669'),(57,'d1e66200757644f8b3249132dad66bf9','0f06a2ceff4a460aa428b2ba2626b379'),(58,'d1e66200757644f8b3249132dad66bf9','31fdefdd91a942eea0cb3c35fec206e2'),(59,'d30324239ee7458e8e7914843b342e1f','c645e8278813403db7e52a76b9ea70f5'),(60,'d4e74c8715aa40ccaf8af6c4b5c68323','d2e7cf855f9c45d1978002e09ea14fec'),(61,'d97cd56643d74d058cff808b5ea24d7c','4b94871198e343d9b298077ea7706287'),(62,'e46dc0a67d394799b83c05f509636ae8','fd8681f25c1b4a51a3a6501b8eae89c3'),(63,'e4e51c8e90f943aebfa10129af8f061b','72bfea3671d24cd8b4ea5ecba453b49c'),(99,'e7a9224de5754e90bcb255935a35fc7f','08a5a912103f4956ab1b42d5dba02dd5'),(64,'f52c6b6e90594797946714938edd27c8','ad137e7a7bd84b7db47d52ffcf11d392'),(65,'fc41b394bc5048ed8f3658c2fc5b654f','dd6f2e63db944d338fc3f63f3473b1a6');
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
  `password` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `first_name` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  `email` varchar(254) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `school` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `quiz_customuser`
--

LOCK TABLES `quiz_customuser` WRITE;
/*!40000 ALTER TABLE `quiz_customuser` DISABLE KEYS */;
INSERT INTO `quiz_customuser` VALUES (1,'pbkdf2_sha256$720000$evSo0AEZekFkMt9Vg5qUlk$pY0LmAa35jBGy4i1yHvf4G+S9AV0t+BdhXVKXlB3K94=','2024-03-26 19:22:51.331000',1,'admin','','',1,1,'2024-03-26 19:21:53.070000','admin@test.com','student','','default/user.jpg'),(2,'pbkdf2_sha256$720000$2Ssw7p9mHU2oiwuaABYJi4$DPwj4srjZ3lfzKJH7l81NttDwA1pofaWrTRv0sACN7k=','2024-03-30 18:34:27.314520',0,'Chris','Chrispine','Saka',0,1,'2024-03-26 19:27:56.837000','sakachris90@gmail.com','teacher','Nuru Academy','default/user.jpg'),(3,'pbkdf2_sha256$720000$GVuix9kwn4vGb7jQQ2TU3f$XNZVUm3lgqumWWOerHEd54nS+GLOlrureaoqWpOZFWI=','2024-03-30 23:06:24.424708',0,'Charles','Charles','Odoyo',0,1,'2024-03-26 19:31:43.822000','sakachrispo@gmail.com','teacher','Bidii Academy','default/user.jpg'),(4,'pbkdf2_sha256$720000$iHy12JAq55wGOXgIWKFTJ2$bMVxtoEvg1njQlXQC+kqZH8ygYG5uesZCsXqGojKj/8=','2024-03-30 20:14:09.521912',0,'Edith','Edith','Mumbi',0,1,'2024-03-26 19:36:04.099000','sakachrispine388@gmail.com','student','Nuru Academy','Users/Edith/Saka_Chrispine3.jpg'),(5,'pbkdf2_sha256$720000$M95co9nPYMMDEEXMdAqcnH$z04bM1paqOJLZ7oPs0CwA7IplehqJeE6+bc5lyapx/s=','2024-03-29 13:54:30.707453',0,'Grace','Grace','Achieng',0,1,'2024-03-26 19:38:24.671000','sakachrispine@gmail.com','student','Bidii Academy','default/user.jpg');
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
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
  `subject_id` char(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `quiz_customuser_subjects_customuser_id_subject_id_6c9dc438_uniq` (`customuser_id`,`subject_id`),
  KEY `quiz_customuser_subjects_subject_id_d4595f45_fk_quiz_subject_id` (`subject_id`),
  CONSTRAINT `quiz_customuser_subj_customuser_id_c73c3578_fk_quiz_cust` FOREIGN KEY (`customuser_id`) REFERENCES `quiz_customuser` (`id`),
  CONSTRAINT `quiz_customuser_subjects_subject_id_d4595f45_fk_quiz_subject_id` FOREIGN KEY (`subject_id`) REFERENCES `quiz_subject` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `quiz_customuser_subjects`
--

LOCK TABLES `quiz_customuser_subjects` WRITE;
/*!40000 ALTER TABLE `quiz_customuser_subjects` DISABLE KEYS */;
INSERT INTO `quiz_customuser_subjects` VALUES (8,4,'37fe3b739b13495cbf6d117a71677d0e'),(11,4,'5958769f0f024759931c67370887263d'),(10,4,'8246d936e928470cbe2a718d48c19943'),(9,4,'c8331415aacd4fea9c6defab429807e4'),(14,5,'5958769f0f024759931c67370887263d'),(12,5,'8246d936e928470cbe2a718d48c19943'),(13,5,'c8331415aacd4fea9c6defab429807e4');
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
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
  `id` char(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `text` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_correct` tinyint(1) NOT NULL,
  `question_id` char(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `quiz_option_question_id_f88cc373_fk_quiz_question_id` (`question_id`),
  CONSTRAINT `quiz_option_question_id_f88cc373_fk_quiz_question_id` FOREIGN KEY (`question_id`) REFERENCES `quiz_question` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `quiz_option`
--

LOCK TABLES `quiz_option` WRITE;
/*!40000 ALTER TABLE `quiz_option` DISABLE KEYS */;
INSERT INTO `quiz_option` VALUES ('06fd05c9601d4faeb43645edcf285932','48',0,'fac2d214c7914186b01f629a5b393794'),('08a5a912103f4956ab1b42d5dba02dd5','54',1,'301341b4fadb4fe3a7e12d7ad8838f5a'),('0c36a75d636749b49bfc938e99730844','Nigeria',1,'736570ef75f84f98ac740f8236d5334d'),('0c605a8b1e5244428d02413680e63d2a','1965',0,'cc3ac08a4e454182b2c2aaad8c9b9d1c'),('0ce936051c7547ed863a10e20c5efb20','Daniel Moi',1,'036b44935d914e1d8f5e6a6b91393f4d'),('0f06a2ceff4a460aa428b2ba2626b379','0.9',1,'49fac0be6ffd4855a33c987f54a8f97b'),('13544ba1831c4b9eb093fe57a0d5a6ce','cow',0,'a61f05dc685046f8ae4eafab6e42d215'),('18fe8f2cf95541dbaac4ee51287d7a9e','goes',0,'cb5b1f1ad4a2443fafd1a3accf994a5b'),('1a656585ae9344f2881fcf878cb1e5b2','49',0,'fac2d214c7914186b01f629a5b393794'),('1d3ef92f9c9941819e6058e8b109e5f8','12',0,'fb85b9e65157448fae3acffcc3f573d0'),('27e0adf1c7694e838e6eedadae9d0140','Uganda',0,'736570ef75f84f98ac740f8236d5334d'),('2ca30f4070e044fe84add59781b2351c','5.5',0,'a4c77adf301443ae8d6c94cf2c4cacb2'),('31fdefdd91a942eea0cb3c35fec206e2','0.90',1,'49fac0be6ffd4855a33c987f54a8f97b'),('325008388058490fb4a78aa14779015f','Rwanda',0,'736570ef75f84f98ac740f8236d5334d'),('43f49e3c9cf24f31891b4ecd90aaed4b','57',0,'301341b4fadb4fe3a7e12d7ad8838f5a'),('49e72b763d6541d0818a6961425e8c6a','0.7',0,'49fac0be6ffd4855a33c987f54a8f97b'),('4b94871198e343d9b298077ea7706287','1.4',1,'a4c77adf301443ae8d6c94cf2c4cacb2'),('4f1bd3dc23304644a87889f84ed22c42','55',0,'301341b4fadb4fe3a7e12d7ad8838f5a'),('5b1c97a17c214467afc75ba11f92b0a2','sit',1,'af21ababfb0d4c219f334b22197ae288'),('5ddb7c0c8f0f4af3a0a6f8d7ddb5fa03','Nakuru',0,'dbd6ca7146de4c249f045cf7c3e0840b'),('65e0ce569bd945d780dbbae47752cb28','Oginga Odinga',0,'036b44935d914e1d8f5e6a6b91393f4d'),('698a3a638a8d4b60b3ff7e046e791b69','1963',1,'cc3ac08a4e454182b2c2aaad8c9b9d1c'),('6d374b2dc74647ceafe6ee0cb26599f8','milk',1,'2218799db0b1428babefd482ea133478'),('72bfea3671d24cd8b4ea5ecba453b49c','cows',1,'a61f05dc685046f8ae4eafab6e42d215'),('76ef28582a7d446fb6f9aeb868f0fcd2','go',1,'cb5b1f1ad4a2443fafd1a3accf994a5b'),('7bf198bbc8204059a27ba724c9e8e6a6','1964',0,'cc3ac08a4e454182b2c2aaad8c9b9d1c'),('837c776d26a14f83acf353acac503132','Abuja',0,'d77ec472441547ceb13e6552a01b9ece'),('847c7746b9d64e098ce3fe86115f3df4','Milk',1,'2218799db0b1428babefd482ea133478'),('8891d1fd10ea4652a5a7cde9f6685c27','Nairobi',0,'d77ec472441547ceb13e6552a01b9ece'),('8ad07c790c6546038949452409e8c451','Accra',1,'d77ec472441547ceb13e6552a01b9ece'),('8c06ed39723248bf87d2b7f58272e59b','Jomo Kenyatta',0,'036b44935d914e1d8f5e6a6b91393f4d'),('921f996439ea4fbe866ffc5824249a6b','1.0',0,'fb85b9e65157448fae3acffcc3f573d0'),('923f81d15c764143b0a1c4c07a783a07','5.6',0,'a4c77adf301443ae8d6c94cf2c4cacb2'),('934eb5e9429c41b38ca67c02ccdd0bee','Lagos',0,'d77ec472441547ceb13e6552a01b9ece'),('9af8fa2bcec84e37a1dbb38ab24b8669','beef',1,'77f5e7aa2f824636ad19cb4211a1911c'),('9c59bb9fecd2403eb826b0039356c15d','Mombasa',0,'dbd6ca7146de4c249f045cf7c3e0840b'),('a3174af9c4114040b0c3cdd0e4a270d7','50',1,'be3213ff2d934dabb9d7707320d89ac5'),('ad137e7a7bd84b7db47d52ffcf11d392','47',1,'fac2d214c7914186b01f629a5b393794'),('b293eaacfc294e558044d928a494803b','Tanzania',0,'736570ef75f84f98ac740f8236d5334d'),('b5d287e3d62d4644aea822292cb846ae','loud',0,'8cc64443a33848e2b1da158e87e0e9e9'),('bc19ad4edc4242b5ac9ff352f1f685b2','13',0,'764814d0044c4cc2967d4f3a39df5a0f'),('bf41775a167e4d70809d499c366236eb','Arap Moi',1,'036b44935d914e1d8f5e6a6b91393f4d'),('bf451b9ac586410cbeb473518d4949a6','run',0,'af21ababfb0d4c219f334b22197ae288'),('c22f5d747b0c46f78666c138f0a51aec','53',0,'301341b4fadb4fe3a7e12d7ad8838f5a'),('c645e8278813403db7e52a76b9ea70f5','-1.0',1,'fb85b9e65157448fae3acffcc3f573d0'),('ce67b674942644368a1089f220c449b5','50',0,'fac2d214c7914186b01f629a5b393794'),('d2e7cf855f9c45d1978002e09ea14fec','Nairobi',1,'dbd6ca7146de4c249f045cf7c3e0840b'),('dab029239ffe4f4dac964bb1504b27f1','1962',0,'cc3ac08a4e454182b2c2aaad8c9b9d1c'),('dd6f2e63db944d338fc3f63f3473b1a6','beefs',0,'77f5e7aa2f824636ad19cb4211a1911c'),('de80b2d7f0c54a81b1e624d2a7f4324a','Kisumu',0,'dbd6ca7146de4c249f045cf7c3e0840b'),('df9dd70328844cb881c9d89b5d08ef23','10',0,'be3213ff2d934dabb9d7707320d89ac5'),('dff2399f266d40b3b03b3070f5d80f7b','Kenya',0,'736570ef75f84f98ac740f8236d5334d'),('e9b0b2d864234ff19fe696fbcd63a6e7','30',1,'764814d0044c4cc2967d4f3a39df5a0f'),('fb9df51ec0254ced9e04b89aa729c762','Kinshasha',0,'d77ec472441547ceb13e6552a01b9ece'),('fd8681f25c1b4a51a3a6501b8eae89c3','laugh',1,'8cc64443a33848e2b1da158e87e0e9e9');
/*!40000 ALTER TABLE `quiz_option` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `quiz_plannedquiz`
--

DROP TABLE IF EXISTS `quiz_plannedquiz`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `quiz_plannedquiz` (
  `id` char(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `taken` tinyint(1) NOT NULL,
  `student_id` bigint NOT NULL,
  `quiz_id` char(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `quiz_plannedquiz_student_id_quiz_id_fb057356_uniq` (`student_id`,`quiz_id`),
  KEY `quiz_plannedquiz_quiz_id_290d28ef_fk_quiz_quiz_id` (`quiz_id`),
  CONSTRAINT `quiz_plannedquiz_quiz_id_290d28ef_fk_quiz_quiz_id` FOREIGN KEY (`quiz_id`) REFERENCES `quiz_quiz` (`id`),
  CONSTRAINT `quiz_plannedquiz_student_id_37139e14_fk_quiz_customuser_id` FOREIGN KEY (`student_id`) REFERENCES `quiz_customuser` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `quiz_plannedquiz`
--

LOCK TABLES `quiz_plannedquiz` WRITE;
/*!40000 ALTER TABLE `quiz_plannedquiz` DISABLE KEYS */;
/*!40000 ALTER TABLE `quiz_plannedquiz` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `quiz_question`
--

DROP TABLE IF EXISTS `quiz_question`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `quiz_question` (
  `id` char(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `text` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `marks` int unsigned NOT NULL,
  `quiz_id` char(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `quiz_question_quiz_id_b7429966_fk_quiz_quiz_id` (`quiz_id`),
  CONSTRAINT `quiz_question_quiz_id_b7429966_fk_quiz_quiz_id` FOREIGN KEY (`quiz_id`) REFERENCES `quiz_quiz` (`id`),
  CONSTRAINT `quiz_question_chk_1` CHECK ((`marks` >= 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `quiz_question`
--

LOCK TABLES `quiz_question` WRITE;
/*!40000 ALTER TABLE `quiz_question` DISABLE KEYS */;
INSERT INTO `quiz_question` VALUES ('036b44935d914e1d8f5e6a6b91393f4d','Who was the second president of Kenya',3,'43ec6d72a9744064b8bdd92867d590f2'),('2218799db0b1428babefd482ea133478','milk',3,'f51c9f4d8c394733889fb8e3ebbf4645'),('301341b4fadb4fe3a7e12d7ad8838f5a','How many countries are in Africa',5,'77eb954e58194f08a932e25af81f651b'),('49fac0be6ffd4855a33c987f54a8f97b','0.8 + 0.1',5,'eda5dfeb16c641dbb76f2f1723b76a5e'),('736570ef75f84f98ac740f8236d5334d','Which of the following is not in East Africa',3,'77eb954e58194f08a932e25af81f651b'),('764814d0044c4cc2967d4f3a39df5a0f','49 - 19',5,'778f2e3b29fe4b2aa7750788e9ed8a9b'),('77f5e7aa2f824636ad19cb4211a1911c','beef',3,'f51c9f4d8c394733889fb8e3ebbf4645'),('8cc64443a33848e2b1da158e87e0e9e9','cry',5,'33c5539f065c454c939ddae0bad8d309'),('a4c77adf301443ae8d6c94cf2c4cacb2','3.5 - 2.1',5,'eda5dfeb16c641dbb76f2f1723b76a5e'),('a61f05dc685046f8ae4eafab6e42d215','cow',3,'f51c9f4d8c394733889fb8e3ebbf4645'),('af21ababfb0d4c219f334b22197ae288','stand',5,'33c5539f065c454c939ddae0bad8d309'),('be3213ff2d934dabb9d7707320d89ac5','20 + 30',5,'778f2e3b29fe4b2aa7750788e9ed8a9b'),('cb5b1f1ad4a2443fafd1a3accf994a5b','come',5,'33c5539f065c454c939ddae0bad8d309'),('cc3ac08a4e454182b2c2aaad8c9b9d1c','When did Kenya gain Independence?',3,'43ec6d72a9744064b8bdd92867d590f2'),('d77ec472441547ceb13e6552a01b9ece','What is the capital city of Ghana',7,'77eb954e58194f08a932e25af81f651b'),('dbd6ca7146de4c249f045cf7c3e0840b','What is the capital city of Kenya',3,'43ec6d72a9744064b8bdd92867d590f2'),('fac2d214c7914186b01f629a5b393794','How many counties are there in Kenya?',3,'43ec6d72a9744064b8bdd92867d590f2'),('fb85b9e65157448fae3acffcc3f573d0','5.5 - 6.5',5,'eda5dfeb16c641dbb76f2f1723b76a5e');
/*!40000 ALTER TABLE `quiz_question` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `quiz_quiz`
--

DROP TABLE IF EXISTS `quiz_quiz`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `quiz_quiz` (
  `id` char(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `time_limit` int unsigned NOT NULL,
  `max_attempts` int unsigned NOT NULL,
  `pass_mark` int unsigned NOT NULL,
  `created_by_id` bigint NOT NULL,
  `subject_id` char(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `quiz_quiz`
--

LOCK TABLES `quiz_quiz` WRITE;
/*!40000 ALTER TABLE `quiz_quiz` DISABLE KEYS */;
INSERT INTO `quiz_quiz` VALUES ('33c5539f065c454c939ddae0bad8d309','Opposite','Testing simple opposites',3,3,80,2,'8246d936e928470cbe2a718d48c19943',1,'2024-03-31 20:25:47.806201','2024-03-31 20:25:48.185736'),('43ec6d72a9744064b8bdd92867d590f2','History of Kenya','Testing Kenyan History',2,4,70,3,'5958769f0f024759931c67370887263d',1,'2024-03-31 20:25:47.806201','2024-03-31 20:25:48.185736'),('778f2e3b29fe4b2aa7750788e9ed8a9b','Numbers','NATURAL NUMBERS',1,3,80,3,'c8331415aacd4fea9c6defab429807e4',1,'2024-03-31 20:25:47.806201','2024-03-31 20:25:48.185736'),('77eb954e58194f08a932e25af81f651b','Africa','Testing African Location',5,4,65,3,'5958769f0f024759931c67370887263d',1,'2024-03-31 20:25:47.806201','2024-03-31 20:25:48.185736'),('eda5dfeb16c641dbb76f2f1723b76a5e','Decimals','Testing decimals',4,3,70,2,'c8331415aacd4fea9c6defab429807e4',1,'2024-03-31 20:25:47.806201','2024-03-31 20:25:48.185736'),('f51c9f4d8c394733889fb8e3ebbf4645','Plural','Testing simple plurals',4,3,70,3,'8246d936e928470cbe2a718d48c19943',1,'2024-03-31 20:25:47.806201','2024-03-31 20:25:48.185736');
/*!40000 ALTER TABLE `quiz_quiz` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `quiz_quizattempt`
--

DROP TABLE IF EXISTS `quiz_quizattempt`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `quiz_quizattempt` (
  `id` char(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `score` int unsigned NOT NULL,
  `percentage_score` int unsigned NOT NULL,
  `passed` tinyint(1) NOT NULL,
  `date_attempted` datetime(6) NOT NULL,
  `start_time` datetime(6) DEFAULT NULL,
  `end_time` datetime(6) DEFAULT NULL,
  `expired` tinyint(1) NOT NULL,
  `quiz_id` char(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `quiz_quizattempt_quiz_id_2c7782a0_fk_quiz_quiz_id` (`quiz_id`),
  KEY `quiz_quizattempt_user_id_380ce10d_fk_quiz_customuser_id` (`user_id`),
  CONSTRAINT `quiz_quizattempt_quiz_id_2c7782a0_fk_quiz_quiz_id` FOREIGN KEY (`quiz_id`) REFERENCES `quiz_quiz` (`id`),
  CONSTRAINT `quiz_quizattempt_user_id_380ce10d_fk_quiz_customuser_id` FOREIGN KEY (`user_id`) REFERENCES `quiz_customuser` (`id`),
  CONSTRAINT `quiz_quizattempt_chk_1` CHECK ((`score` >= 0)),
  CONSTRAINT `quiz_quizattempt_chk_2` CHECK ((`percentage_score` >= 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `quiz_quizattempt`
--

LOCK TABLES `quiz_quizattempt` WRITE;
/*!40000 ALTER TABLE `quiz_quizattempt` DISABLE KEYS */;
INSERT INTO `quiz_quizattempt` VALUES ('0cf12e999af24a6c91574df032c5a682',0,0,0,'2024-03-31 18:04:11.614743','2024-03-31 18:04:11.614479',NULL,0,'77eb954e58194f08a932e25af81f651b',3),('1e5228adc9774775a021abe28e3b38e2',0,0,0,'2024-03-27 15:28:27.245000','2024-03-27 15:28:27.245000',NULL,0,'43ec6d72a9744064b8bdd92867d590f2',3),('25c8f443f8f340f4bf7632cddc23e589',0,0,0,'2024-03-27 15:24:43.854000','2024-03-27 15:24:43.854000',NULL,0,'43ec6d72a9744064b8bdd92867d590f2',3),('2754d9caac7242979798006496a4a8e1',0,0,0,'2024-03-31 18:18:14.881870','2024-03-31 18:18:14.881510',NULL,0,'77eb954e58194f08a932e25af81f651b',3),('2c2a84db4d594262aa8c359c378e35ec',15,100,1,'2024-03-29 12:00:26.099000','2024-03-29 12:00:26.099000','2024-03-29 12:00:31.704000',0,'33c5539f065c454c939ddae0bad8d309',5),('2d61a8b2566e4bfaaf3d2a6e9277a93a',0,0,0,'2024-03-31 18:26:26.734989','2024-03-31 18:26:26.734374',NULL,0,'77eb954e58194f08a932e25af81f651b',3),('2f4928ce15ef484ca8f2dc6986f269a1',0,0,0,'2024-03-27 15:27:44.762000','2024-03-27 15:27:44.761000',NULL,0,'43ec6d72a9744064b8bdd92867d590f2',3),('3090ffa6a8764f328d73868d32115986',0,0,0,'2024-03-27 15:22:34.211000','2024-03-27 15:22:34.211000',NULL,0,'43ec6d72a9744064b8bdd92867d590f2',3),('34da4f68c692466d93aa26ea6be93800',0,0,0,'2024-03-27 15:26:20.547000','2024-03-27 15:26:20.544000',NULL,0,'43ec6d72a9744064b8bdd92867d590f2',3),('3707f6872641436a858f9d06aaa3b845',0,0,0,'2024-03-31 18:22:44.297457','2024-03-31 18:22:44.297171',NULL,0,'77eb954e58194f08a932e25af81f651b',3),('46da7762dfc04b1097dea00b1b9d7267',15,100,1,'2024-03-26 20:00:17.466000','2024-03-26 20:00:17.466000','2024-03-26 20:00:27.659000',0,'eda5dfeb16c641dbb76f2f1723b76a5e',4),('48dd1df94aba45ed9d8ab94bcf5964cb',0,0,0,'2024-03-31 18:28:02.737336','2024-03-31 18:28:02.737073',NULL,0,'77eb954e58194f08a932e25af81f651b',3),('50bb4cf629ed4cce939ce3ba96e6453d',0,0,0,'2024-03-27 11:46:36.512000','2024-03-27 11:46:36.509000',NULL,0,'43ec6d72a9744064b8bdd92867d590f2',3),('54055160990a4d5b9fdbe90abda7c87f',5,33,0,'2024-03-31 19:26:34.104903','2024-03-31 19:26:34.104274','2024-03-31 19:26:45.733145',0,'77eb954e58194f08a932e25af81f651b',4),('5497413b90e8498795cf76017a2f653a',15,100,1,'2024-03-31 19:30:06.204280','2024-03-31 19:30:06.203944','2024-03-31 19:30:15.745602',0,'77eb954e58194f08a932e25af81f651b',4),('55296bdec838456b96831217b7c23bc4',5,50,0,'2024-03-31 08:28:48.290765','2024-03-31 08:28:48.290385','2024-03-31 08:28:55.710967',0,'778f2e3b29fe4b2aa7750788e9ed8a9b',5),('56c2ebe24ff248eabba6af724adbcc4c',0,0,0,'2024-03-31 18:22:04.400836','2024-03-31 18:22:04.400509',NULL,0,'77eb954e58194f08a932e25af81f651b',3),('5f6cbe643e3a4db4964f584e8352360b',6,67,0,'2024-03-29 12:23:07.001000','2024-03-29 12:23:07.000000','2024-03-29 12:23:15.554000',0,'f51c9f4d8c394733889fb8e3ebbf4645',4),('603217e0c2b94c8c862c0c85258eb3eb',0,0,0,'2024-03-27 15:21:33.635000','2024-03-27 15:21:33.635000',NULL,0,'43ec6d72a9744064b8bdd92867d590f2',3),('6422582c49154da78f7d91474c4d9cb5',10,67,0,'2024-03-29 13:50:52.864900','2024-03-29 13:50:52.864487','2024-03-29 13:51:04.339015',0,'33c5539f065c454c939ddae0bad8d309',4),('6a7fb78b93514903baa6e528c11fe103',12,100,1,'2024-03-28 16:19:16.250000','2024-03-28 16:19:16.245000','2024-03-28 16:19:27.493000',0,'43ec6d72a9744064b8bdd92867d590f2',4),('6e4e60531f8b474ea572a05ef8d1a0db',0,0,0,'2024-03-31 18:27:08.782421','2024-03-31 18:27:08.782130',NULL,0,'77eb954e58194f08a932e25af81f651b',3),('6fed2200430344cf93ec0f8088ff0958',6,50,0,'2024-03-26 20:03:54.283000','2024-03-26 20:03:54.283000','2024-03-26 20:05:13.267000',0,'43ec6d72a9744064b8bdd92867d590f2',5),('74bc6adbea1d41a7b7f5442a262260f2',0,0,0,'2024-03-27 15:17:39.862000','2024-03-27 15:17:39.862000',NULL,0,'43ec6d72a9744064b8bdd92867d590f2',3),('86c1442e2f5f4775bd992be5cc26baa9',10,67,0,'2024-03-26 19:59:35.954000','2024-03-26 19:59:35.954000','2024-03-26 19:59:48.039000',0,'eda5dfeb16c641dbb76f2f1723b76a5e',4),('88134020f2484943abaf93187f739353',15,100,1,'2024-03-29 13:51:09.822467','2024-03-29 13:51:09.822186','2024-03-29 13:51:26.429112',0,'33c5539f065c454c939ddae0bad8d309',4),('887a55d9913b49e398c9e254ddee4e3f',0,0,0,'2024-03-27 15:17:09.264000','2024-03-27 15:17:09.263000',NULL,0,'43ec6d72a9744064b8bdd92867d590f2',3),('8e4580a6a4e0495bb47a856fa6f173a2',10,100,1,'2024-03-31 09:26:34.148908','2024-03-31 09:26:34.148516','2024-03-31 09:26:40.489634',0,'778f2e3b29fe4b2aa7750788e9ed8a9b',5),('90e56dc48e21469aa5b34e123ba834d0',9,75,1,'2024-03-26 20:05:23.426000','2024-03-26 20:05:23.426000','2024-03-26 20:05:32.343000',0,'43ec6d72a9744064b8bdd92867d590f2',5),('94dce219b250484e93c313855acf673d',9,75,1,'2024-03-27 16:26:00.329000','2024-03-27 16:26:00.329000','2024-03-27 16:28:03.178000',0,'43ec6d72a9744064b8bdd92867d590f2',5),('9dbebca2bf3244948b776737d818c6b1',10,67,0,'2024-03-27 18:17:13.781000','2024-03-27 18:17:13.781000','2024-03-27 18:17:26.257000',1,'eda5dfeb16c641dbb76f2f1723b76a5e',5),('9f35aa2ed88f4ed684051d27091cc3b3',12,80,1,'2024-03-31 19:08:30.857367','2024-03-31 19:08:30.857021','2024-03-31 19:08:49.090398',0,'77eb954e58194f08a932e25af81f651b',4),('a82e6cc7e8b040948876155f0901622c',5,33,0,'2024-03-26 19:56:21.510000','2024-03-26 19:56:21.504000','2024-03-26 19:57:22.725000',0,'eda5dfeb16c641dbb76f2f1723b76a5e',4),('b3b7c4c00de445af8287da4d6de7348f',9,75,1,'2024-03-26 20:14:32.370000','2024-03-26 20:14:32.370000','2024-03-26 20:14:41.660000',0,'43ec6d72a9744064b8bdd92867d590f2',4),('b590455383054aaca3735b94490a1940',15,100,1,'2024-03-26 20:13:58.948000','2024-03-26 20:13:58.948000','2024-03-26 20:14:05.291000',1,'eda5dfeb16c641dbb76f2f1723b76a5e',5),('bf4d0175159d4b9e972f8cc3b6e3a419',0,0,0,'2024-03-31 18:08:21.400218','2024-03-31 18:08:21.399886',NULL,0,'77eb954e58194f08a932e25af81f651b',3),('c36bd83f3588458f8f948b9697377353',0,0,0,'2024-03-27 15:19:35.968000','2024-03-27 15:19:35.967000',NULL,0,'43ec6d72a9744064b8bdd92867d590f2',3),('c5bc1fb515a341fbb07863a6f4170256',6,67,0,'2024-03-29 12:14:22.488000','2024-03-29 12:14:22.487000','2024-03-29 12:14:31.177000',0,'f51c9f4d8c394733889fb8e3ebbf4645',5),('c7de6c5d2b5a4cd18812e0c740b2e017',9,100,1,'2024-03-29 12:23:20.176000','2024-03-29 12:23:20.176000','2024-03-29 12:23:26.336000',0,'f51c9f4d8c394733889fb8e3ebbf4645',4),('d059dae3616b4feb9c5bb8d2c21547ae',0,0,0,'2024-03-31 18:15:16.633477','2024-03-31 18:15:16.633012',NULL,0,'77eb954e58194f08a932e25af81f651b',3),('d111e96e90b942cca885257d08841200',3,33,0,'2024-03-29 12:14:01.031000','2024-03-29 12:14:01.031000','2024-03-29 12:14:15.304000',0,'f51c9f4d8c394733889fb8e3ebbf4645',5),('d269ba8dcaf748d9886fea275b57e3f6',0,0,0,'2024-03-31 18:13:47.663802','2024-03-31 18:13:47.663437',NULL,0,'77eb954e58194f08a932e25af81f651b',3),('d4682f62da1a4c1eae1d3ddecd11bed0',12,80,1,'2024-03-31 18:38:35.556784','2024-03-31 18:38:35.555139','2024-03-31 18:38:47.414762',0,'77eb954e58194f08a932e25af81f651b',5),('d86cb70c6ee8458497ca9ade61440034',5,33,0,'2024-03-27 18:13:12.270000','2024-03-27 18:13:12.263000','2024-03-27 18:13:48.155000',1,'eda5dfeb16c641dbb76f2f1723b76a5e',5),('dbc23ff302c64b0c86d18287f61193c6',0,0,0,'2024-03-27 15:20:08.405000','2024-03-27 15:20:08.405000',NULL,0,'43ec6d72a9744064b8bdd92867d590f2',3),('dd98bc898a324d49940e2c9ac5ff04a0',5,33,0,'2024-03-29 12:00:00.033000','2024-03-29 12:00:00.032000','2024-03-29 12:00:05.404000',0,'33c5539f065c454c939ddae0bad8d309',5),('e0b1475ff2a4447aae6455664e473549',0,0,0,'2024-03-31 18:17:31.381929','2024-03-31 18:17:31.381407',NULL,0,'77eb954e58194f08a932e25af81f651b',3),('e5f69863896d46319bc0daf6834426a0',0,0,0,'2024-03-31 18:24:08.141378','2024-03-31 18:24:08.140819',NULL,0,'77eb954e58194f08a932e25af81f651b',3),('e6abef34a705438b9b4bac414ed1193e',0,0,0,'2024-03-31 18:11:25.470182','2024-03-31 18:11:25.469015',NULL,0,'77eb954e58194f08a932e25af81f651b',3),('f31f4414f5b14cd3ae02aa9cc19f3382',0,0,0,'2024-03-31 18:10:03.896219','2024-03-31 18:10:03.895889',NULL,0,'77eb954e58194f08a932e25af81f651b',3),('f3d8c2429672497990eef33e7923ba08',9,100,1,'2024-03-29 12:14:39.168000','2024-03-29 12:14:39.168000','2024-03-29 12:14:59.577000',0,'f51c9f4d8c394733889fb8e3ebbf4645',5);
/*!40000 ALTER TABLE `quiz_quizattempt` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `quiz_subject`
--

DROP TABLE IF EXISTS `quiz_subject`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `quiz_subject` (
  `id` char(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `quiz_subject`
--

LOCK TABLES `quiz_subject` WRITE;
/*!40000 ALTER TABLE `quiz_subject` DISABLE KEYS */;
INSERT INTO `quiz_subject` VALUES ('37fe3b739b13495cbf6d117a71677d0e','Physics'),('5958769f0f024759931c67370887263d','History'),('8246d936e928470cbe2a718d48c19943','English'),('c8331415aacd4fea9c6defab429807e4','Maths');
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

-- Dump completed on 2024-04-01  9:00:41
