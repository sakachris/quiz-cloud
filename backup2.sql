-- MySQL dump 10.13  Distrib 8.0.39, for Linux (x86_64)
--
-- Host: localhost    Database: quizcloudstaging
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
  `name` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
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
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
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
  `object_id` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `object_repr` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `action_flag` smallint unsigned NOT NULL,
  `change_message` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_quiz_customuser_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_quiz_customuser_id` FOREIGN KEY (`user_id`) REFERENCES `quiz_customuser` (`id`),
  CONSTRAINT `django_admin_log_chk_1` CHECK ((`action_flag` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=74 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2024-03-26 19:23:18.236000','c8331415-aacd-4fea-9c6d-efab429807e4','Maths',1,'[{\"added\": {}}]',7,1),(2,'2024-03-26 19:23:24.130000','8246d936-e928-470c-be2a-718d48c19943','English',1,'[{\"added\": {}}]',7,1),(3,'2024-03-26 19:23:31.662000','37fe3b73-9b13-495c-bf6d-117a71677d0e','Physics',1,'[{\"added\": {}}]',7,1),(4,'2024-03-26 19:23:39.157000','5958769f-0f02-4759-931c-67370887263d','History',1,'[{\"added\": {}}]',7,1),(5,'2024-04-02 16:43:07.044207','f31f4414-f5b1-4cd3-ae02-aa9cc19f3382','Charles\'s attempt on Africa',3,'',11,1),(6,'2024-04-02 16:43:07.050496','e6abef34-a705-438b-9b4b-ac414ed1193e','Charles\'s attempt on Africa',3,'',11,1),(7,'2024-04-02 16:43:07.059546','e5f69863-896d-4631-9bc0-daf6834426a0','Charles\'s attempt on Africa',3,'',11,1),(8,'2024-04-02 16:43:07.065276','e0b1475f-f2a4-447a-ae64-55664e473549','Charles\'s attempt on Africa',3,'',11,1),(9,'2024-04-02 16:43:07.072428','dd98bc89-8a32-4d49-940e-2c9ac5ff04a0','Grace\'s attempt on Opposite',3,'',11,1),(10,'2024-04-02 16:43:07.076906','dbc23ff3-02c6-4b0c-86d1-8287f61193c6','Charles\'s attempt on History of Kenya',3,'',11,1),(11,'2024-04-02 16:43:07.081699','d86cb70c-6ee8-4584-97ca-9ade61440034','Grace\'s attempt on Decimals',3,'',11,1),(12,'2024-04-02 16:43:07.086623','d4682f62-da1a-4c1e-ae1d-3ddecd11bed0','Grace\'s attempt on Africa',3,'',11,1),(13,'2024-04-02 16:43:07.090979','d269ba8d-caf7-48d9-886f-ea275b57e3f6','Charles\'s attempt on Africa',3,'',11,1),(14,'2024-04-02 16:43:07.095175','d059dae3-616b-4feb-9c5b-b8d2c21547ae','Charles\'s attempt on Africa',3,'',11,1),(15,'2024-04-02 16:43:07.099882','c36bd83f-3588-458f-8f94-8b9697377353','Charles\'s attempt on History of Kenya',3,'',11,1),(16,'2024-04-02 16:43:07.104126','bf4d0175-159d-4b9e-972f-8cc3b6e3a419','Charles\'s attempt on Africa',3,'',11,1),(17,'2024-04-02 16:43:07.108832','bd0b7914-81d1-41ed-9296-9418a2a650b1','saka\'s attempt on History of Kenya',3,'',11,1),(18,'2024-04-02 16:43:07.112820','b771f656-2b8a-4a9a-8b6c-37ff23a6a39a','saka\'s attempt on Africa',3,'',11,1),(19,'2024-04-02 16:43:07.121871','b5904553-8305-4aac-a373-5b94490a1940','Grace\'s attempt on Decimals',3,'',11,1),(20,'2024-04-02 16:43:07.127539','b3b7c4c0-0de4-45af-8287-da4d6de7348f','Edith\'s attempt on History of Kenya',3,'',11,1),(21,'2024-04-02 16:43:07.133209','a82e6cc7-e8b0-4094-8876-155f0901622c','Edith\'s attempt on Decimals',3,'',11,1),(22,'2024-04-02 16:43:07.140088','9f35aa2e-d88f-4ed6-8405-1d27091cc3b3','Edith\'s attempt on Africa',3,'',11,1),(23,'2024-04-02 16:43:07.144206','9dbebca2-bf32-4494-8b77-6737d818c6b1','Grace\'s attempt on Decimals',3,'',11,1),(24,'2024-04-02 16:43:07.154352','94dce219-b250-484e-93c3-13855acf673d','Grace\'s attempt on History of Kenya',3,'',11,1),(25,'2024-04-02 16:43:07.161203','90e56dc4-8e21-469a-a5b3-4e123ba834d0','Grace\'s attempt on History of Kenya',3,'',11,1),(26,'2024-04-02 16:43:07.166519','8e4580a6-a4e0-495b-b47a-856fa6f173a2','Grace\'s attempt on Numbers',3,'',11,1),(27,'2024-04-02 16:43:07.172392','887a55d9-913b-49e3-98c9-e254ddee4e3f','Charles\'s attempt on History of Kenya',3,'',11,1),(28,'2024-04-02 16:43:07.177205','88134020-f248-4943-abaf-93187f739353','Edith\'s attempt on Opposite',3,'',11,1),(29,'2024-04-02 16:43:07.184857','86c1442e-2f5f-4775-bd99-2be5cc26baa9','Edith\'s attempt on Decimals',3,'',11,1),(30,'2024-04-02 16:43:07.189445','854cd4c4-c21c-4848-915d-33efb5d17ad3','saka\'s attempt on Africa',3,'',11,1),(31,'2024-04-02 16:43:07.196039','74bc6adb-ea1d-41a7-b7f5-442a262260f2','Charles\'s attempt on History of Kenya',3,'',11,1),(32,'2024-04-02 16:43:07.200586','6fed2200-4303-44cf-93ec-0f8088ff0958','Grace\'s attempt on History of Kenya',3,'',11,1),(33,'2024-04-02 16:43:07.206233','6e4e6053-1f8b-474e-a572-a05ef8d1a0db','Charles\'s attempt on Africa',3,'',11,1),(34,'2024-04-02 16:43:07.211581','6a7fb78b-9351-4903-baa6-e528c11fe103','Edith\'s attempt on History of Kenya',3,'',11,1),(35,'2024-04-02 16:43:07.217979','6422582c-4915-4da7-8f7d-91474c4d9cb5','Edith\'s attempt on Opposite',3,'',11,1),(36,'2024-04-02 16:43:07.224334','603217e0-c2b9-4c8c-862c-0c85258eb3eb','Charles\'s attempt on History of Kenya',3,'',11,1),(37,'2024-04-02 16:43:07.229029','56c2ebe2-4ff2-48ea-bba6-af724adbcc4c','Charles\'s attempt on Africa',3,'',11,1),(38,'2024-04-02 16:43:07.237416','55296bde-c838-456b-9683-1217b7c23bc4','Grace\'s attempt on Numbers',3,'',11,1),(39,'2024-04-02 16:43:07.243769','5497413b-90e8-4987-95cf-76017a2f653a','Edith\'s attempt on Africa',3,'',11,1),(40,'2024-04-02 16:43:07.248074','54055160-990a-4d5b-9fdb-e90abda7c87f','Edith\'s attempt on Africa',3,'',11,1),(41,'2024-04-02 16:43:07.252803','50bb4cf6-29ed-4cce-939c-e3ba96e6453d','Charles\'s attempt on History of Kenya',3,'',11,1),(42,'2024-04-02 16:43:07.257239','4e9cc7d8-5392-4e09-936c-03064013130c','saka\'s attempt on History of Kenya',3,'',11,1),(43,'2024-04-02 16:43:07.263263','48dd1df9-4aba-45ed-9d8a-b94bcf5964cb','Charles\'s attempt on Africa',3,'',11,1),(44,'2024-04-02 16:43:07.268521','46da7762-dfc0-4b10-97de-a00b1b9d7267','Edith\'s attempt on Decimals',3,'',11,1),(45,'2024-04-02 16:43:07.276829','3707f687-2641-436a-858f-9d06aaa3b845','Charles\'s attempt on Africa',3,'',11,1),(46,'2024-04-02 16:43:07.283118','34da4f68-c692-466d-93aa-26ea6be93800','Charles\'s attempt on History of Kenya',3,'',11,1),(47,'2024-04-02 16:43:07.287451','3090ffa6-a876-4f32-8d73-868d32115986','Charles\'s attempt on History of Kenya',3,'',11,1),(48,'2024-04-02 16:43:07.293986','2f4928ce-15ef-484c-a8f2-dc6986f269a1','Charles\'s attempt on History of Kenya',3,'',11,1),(49,'2024-04-02 16:43:07.298765','2d61a8b2-566e-4bfa-af3d-2a6e9277a93a','Charles\'s attempt on Africa',3,'',11,1),(50,'2024-04-02 16:43:07.303400','2c2a84db-4d59-4262-aa8c-359c378e35ec','Grace\'s attempt on Opposite',3,'',11,1),(51,'2024-04-02 16:43:07.308515','2754d9ca-ac72-4297-9798-006496a4a8e1','Charles\'s attempt on Africa',3,'',11,1),(52,'2024-04-02 16:43:07.314356','25c8f443-f8f3-40f4-bf76-32cddc23e589','Charles\'s attempt on History of Kenya',3,'',11,1),(53,'2024-04-02 16:43:07.319976','1e5228ad-c977-4775-a021-abe28e3b38e2','Charles\'s attempt on History of Kenya',3,'',11,1),(54,'2024-04-02 16:43:07.325842','0cf12e99-9af2-4a6c-9157-4df032c5a682','Charles\'s attempt on Africa',3,'',11,1),(55,'2024-04-02 16:43:07.334851','06d14432-3f4e-4449-b86f-5fb5e83eb68c','saka\'s attempt on Africa',3,'',11,1),(56,'2024-04-02 17:50:14.383367','6','saka',3,'',13,1),(57,'2024-04-03 16:07:31.450969','a483607a-d70b-447c-8e6d-9b4c09b85baf','Kiswahili',1,'[{\"added\": {}}]',6,1),(58,'2024-04-03 16:07:42.721329','0348d1a1-2048-4fc4-a293-82378efd29e3','Chemistry',1,'[{\"added\": {}}]',6,1),(59,'2024-04-03 16:07:49.412190','61aa49a8-1021-4000-a71b-a331d672b324','Biology',1,'[{\"added\": {}}]',6,1),(60,'2024-04-03 16:08:00.758914','84b5db6a-1897-42b3-9f33-613eff600421','Geography',1,'[{\"added\": {}}]',6,1),(61,'2024-04-03 16:08:09.012445','7b276e5e-2ae0-4db8-b6c2-6105be616732','CRE',1,'[{\"added\": {}}]',6,1),(62,'2024-04-03 16:08:14.382716','d1360892-d313-406b-bf84-a0229c032789','IRE',1,'[{\"added\": {}}]',6,1),(63,'2024-04-03 16:08:20.729718','351ea01a-1d0b-4096-b943-229e7e73b6f3','Computer',1,'[{\"added\": {}}]',6,1),(64,'2024-04-03 16:08:41.303026','07ffd89e-d574-4549-bbb0-1d610a7682b5','Business Studies',1,'[{\"added\": {}}]',6,1),(65,'2024-04-03 16:08:53.139445','b61763a3-e73a-4db1-933f-a72b63de1d9b','Home Science',1,'[{\"added\": {}}]',6,1),(66,'2024-04-03 16:08:57.717542','8137369f-cdab-4707-ba4c-344a052a2683','Agriculture',1,'[{\"added\": {}}]',6,1),(67,'2024-04-03 16:09:03.882128','5737f2cd-d06a-4439-82ed-653627f0f6af','General',1,'[{\"added\": {}}]',6,1),(68,'2024-04-03 16:09:09.792723','eff3d8c5-16bb-432e-85f8-9f063ffa7000','Life Skills',1,'[{\"added\": {}}]',6,1),(69,'2024-04-03 16:09:20.550778','cf125989-0e45-469f-a914-1b1ed75f244d','French',1,'[{\"added\": {}}]',6,1),(70,'2024-04-03 16:10:03.508712','07ffd89e-d574-4549-bbb0-1d610a7682b5','Business',2,'[{\"changed\": {\"fields\": [\"Name\"]}}]',6,1),(71,'2024-04-03 16:10:22.213923','bf70bee9-0388-4b79-b594-a53210c84f01','Music',1,'[{\"added\": {}}]',6,1),(72,'2024-04-03 16:10:42.868803','57edddd1-faae-4594-9c40-6a14dcecff20','Social Studies',1,'[{\"added\": {}}]',6,1),(73,'2024-04-03 16:11:00.371556','355524c0-b55e-44dd-9600-3f1fb758859f','Science',1,'[{\"added\": {}}]',6,1);
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
  `app_label` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `model` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
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
  `app` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
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
  `session_key` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `session_data` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
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
INSERT INTO `django_session` VALUES ('1vyedwio37jg6cv0f73bpv377rld4a2b','.eJxVi0sOAiEQBe_C2ky6gebj0sRzEGiYQPwkyrDRePcZk1nosl69eosQx1LD6OUZWhZHgeLwu6XIl3L_isdor2nHPp1vsV1Pu_wraux1u89EGbwxkn2R2hJZcs5rhAQaIElVaCbLjCoZdAAWIiCydDYzu6LEZwUVPTDE:1rrhCJ:kO478tOkyuBzUUZBNmItR30TUQPhc3lI7zOpEilyalk','2024-04-16 16:41:19.557022'),('2yx0xuplif3f1ufemimw4loa5jgcgawk','.eJxVi0kKQjEQBe_Sa_lk6EwuBc8ROkmHBAfQ_GwU767CX-iyXr16QqS5tjgH32MvsAeE3e-WKJ_4-hW32R_LhmM5XqifD5v8KxqN9rmzssWwZ1nJoPCuZCF9sKYE4XSuqTBLp6TVKmUMSaMzhFitVF4zG4bXG1C0Mf4:1rs5iz:fEXJHPqnZstRHOt5kiVqVKVDmvoR1k87-KmYybBTPNk','2024-04-17 18:52:41.089303'),('52mxzzhueb3bus1vbs2r2iajzmwwbhwy','.eJxVi8sKAjEMRf-laxloMjWpS8HvKElaafEB2ulG8d9VmIUuzz33PF2SsdQ0ermnlt3Oodv8bip2KtevuI32mFbs0-Ei7bxf5V9RpdfPnTwzQfQIBkGjmS_EksHoSDGAR89Rg1FQRAoIJds8i2U12maI7F5vLNUxpQ:1rrNet:DhW3tweQPtJSJPuNmrFBC1WlDiZDmUgkWcLAV7ydskw','2024-04-15 19:49:31.290346'),('8vxzkged7c10jqexkdduseer34bfxx3m','.eJxVi0sOAiEQBe_C2ky6gebj0sRzEGiYQPwkyrDRePcZk1nosl69eosQx1LD6OUZWhZHgeLwu6XIl3L_isdor2nHPp1vsV1Pu_wraux1u89EGbwxkn2R2hJZcs5rhAQaIElVaCbLjCoZdAAWIiCydDYzu6LEZwUVPTDE:1rpCNn:K0f02NtRQjGhAh8k1v3y4laGlHa4wl3BHjPlyc5I47Q','2024-04-09 19:22:51.347000'),('bgxc2i3xc51q87qfa4kfegutggoxbcxe','.eJxVjs0KwjAQhN8lV23Zppvm5yj4Bt5Dkk1osAqaVFDx3W2hBz3OfDPDvJl1cx3tXOLdZmKGcbb_9bwL53hdwW3Or3aTpT1eXJ4OG_xrjK6MS1xGrRVIFzF10QehJUkNlEh5J4XHiAEpDUolIg8RpSY-9ABKcYGK0jI6uVKtCzU_cn2u14BjA9h0_QnQgDYoWo1SQb8DMADs8wX5AD-V:1rvUi1:PO9vLLql4VQ3C5acOaHw0a4pGDdd27cSzVVn_Hx_ZNE','2024-04-13 12:09:45.997852'),('c7ckyxs69549xl7czaxvhnsqor8x9ch6','.eJxVi0sOAiEQBe_C2ky6gebj0sRzEGiYQPwkyrDRePcZk1nosl69eosQx1LD6OUZWhZHgeLwu6XIl3L_isdor2nHPp1vsV1Pu_wraux1u89EGbwxkn2R2hJZcs5rhAQaIElVaCbLjCoZdAAWIiCydDYzu6LEZwUVPTDE:1rsR4w:St-3N7Uj8qQsDGviOVJ7iHRusn_364HEbnL625omQrE','2024-04-18 17:40:46.674552'),('cjwxihno3eex9aexwud2za7drrzfg67d','.eJxVjMsKAjEMRf-laxlIM21Gl4LfUdIkpcUH6Ew3iv-uA7PQ5bmHc18ucV9q6rM9UlN3cOR2v1tmOdttFffensOG83C6crscN_lXVJ7r-rMXJTGkbCEoKKAUMog4sQcsOIrHEnPQidUbUKAMxl8WiqZjcO8PalAy5w:1rrnOd:Qes9D7Hc2xCPcmIvd417kpHfASOvUTS0LNnflRacwyI','2024-04-16 23:18:27.886696'),('csqzfy4gur91t7wwvhlcspdt1xmssut2','.eJxVi0sOAiEQBe_C2kwQm-nGpYnnIA3dBOInUYaNxrurySx0Wa9ePU3ksdQ4ut5jE7M3zmx-t8T5pNevuI32mFbs0_HC7XxY5V9RudfPHTUEssgKZasp-4CCwUoRSow-gUIGKTNREUlWAYO4eWctkfNAUszrDW2_Mq0:1rqdX9:k9S_t1fQ61SkWKc3JZr6MWqu4hmt81xF1mhY2lTMPK8','2024-04-13 18:34:27.341676'),('dj7u3opvhewloqe7laab7tjth217s99l','.eJxVi0sOAiEQBe_C2ky6gebj0sRzEGiYQPwkyrDRePcZk1nosl69eosQx1LD6OUZWhZHgeLwu6XIl3L_isdor2nHPp1vsV1Pu_wraux1u89EGbwxkn2R2hJZcs5rhAQaIElVaCbLjCoZdAAWIiCydDYzu6LEZwUVPTDE:1rtpyl:TtX7x6dk8Wa0s4oxfgrqwe698LZe5W6VCkgaEQFTJgI','2024-04-22 14:28:11.548549'),('ei5nawipxqmmv0hir3k7xc5wesnyjcrt','.eJxVjs0KwjAQhN8lV23Zxk13k6PgG3gvSTehwR_QpoKK724LPehx5psZ5q06P5Whm8Z477Iop7Ta_nrB96d4XcBtyq96lWN9uPh83q_wrzH4cZjjFK1lIB8xNTH0xpKQBUnCwZMJGLFHSS1zEgkQkazodgfArA2ypHn07MfS-b7kRy7P5RporACrRh8bcpqdoVojNaw3AA5Afb75Hj-V:1rvKht:PY65KfqCO_BxZBOaEGMqSLOEzUQ2ZODaQAgeqDZuSzs','2024-04-13 01:28:57.272291'),('hg6v66t5ndtiejyudg76sly48r02xybr','.eJxVi8sKAjEMRf-laxloMjWpS8HvKElaafEB2ulG8d9VmIUuzz33PF2SsdQ0ermnlt3Oodv8bip2KtevuI32mFbs0-Ei7bxf5V9RpdfPnTwzQfQIBkGjmS_EksHoSDGAR89Rg1FQRAoIJds8i2U12maI7F5vLNUxpQ:1rqhmK:2e0HUKyyHD9igetchpQBguhX49aUph958rEQkZOjB7A','2024-04-13 23:06:24.433556'),('jag2q5346a05lfjpcl4f11x959fp5gjm','.eJxVjMsOgjAQRf-lW4VMh6EtLE38A_fN0EdoRBMtmKjx3y0JC12e-zhvYXmZR7vkcLfJi15IKfa_4cDuHK5rc1vSq94w18cLp-mwlX-PkfO4igwpIyM4Q10LzeCZ0KmIWpLSxJ5Zd9EjhrLjxmiDTANQuVFUIEORTpxny25OjzQ_ixIBqQKqJJ4k9Ag9qLoliZ3ZQQEQny-Vmz44:1rvE0s:5IaIDTsNfsd0j8G9_GH7sBiBHdWlN_4M7anevEosLmA','2024-04-12 18:20:06.689450'),('kjr83jfoh5dkpz7n9cib2o7mcx1q7ykj','.eJxVi0sOAiEQBe_C2ky6gebj0sRzEGiYQPwkyrDRePcZk1nosl69eosQx1LD6OUZWhZHgeLwu6XIl3L_isdor2nHPp1vsV1Pu_wraux1u89EGbwxkn2R2hJZcs5rhAQaIElVaCbLjCoZdAAWIiCydDYzu6LEZwUVPTDE:1rspy1:787D7l6F9uWGAAOLECDhj3z8cJRcWN17-0hTr9KKQD0','2024-04-19 20:15:17.740865'),('kx7edjzn92wqbmgnr3fo4uk8xu4surkh','.eJxVjMsKAjEMRf-laxlIM21Gl4LfUdIkpcUH6Ew3iv-uA7PQ5bmHc18ucV9q6rM9UlN3cOR2v1tmOdttFffensOG83C6crscN_lXVJ7r-rMXJTGkbCEoKKAUMog4sQcsOIrHEnPQidUbUKAMxl8WiqZjcO8PalAy5w:1rrnSF:-F1RSlLTCKYmzRSjDYOyzDVp4lz3-QdY9s9B2pvXSrc','2024-04-16 23:22:11.417295'),('kys883shpt9hw4zs24t1865965whli5z','.eJxVi0sOAiEQBe_C2kyAoenWpYnnIHTbBOInUYaNxrurySx0Wa9ePU3KY6lpdL2ndjQ746zZ_I6c5aTXr7mN9phW7NPhktt5v8q_ouZeP3fySBElkhDMqhYZORCxsyBWPAMy-W2EWMDPIIjoixYJKmEujqx5vQFPuDGu:1rtHXq:wiXfzO5U-pHuJSneRgbchSvMf4gLKJ8Ff61D5dt1QFg','2024-04-21 01:42:06.943347'),('l4rgqf2icthkd25ur2abppg0upgs58mm','.eJxVi0kKQjEQBe_Sa_lk6EwuBc8ROkmHBAfQ_GwU767CX-iyXr16QqS5tjgH32MvsAeE3e-WKJ_4-hW32R_LhmM5XqifD5v8KxqN9rmzssWwZ1nJoPCuZCF9sKYE4XSuqTBLp6TVKmUMSaMzhFitVF4zG4bXG1C0Mf4:1rs2zC:FtPUNiLczHhwMfSCQR470SL5O5OCA79jpwgtFKU1dXc','2024-04-17 15:57:14.704629'),('ljr7nuko55o80txm1eaklldq5ye2rnwj','.eJxVi0sOAiEQBe_C2kwQm-nGpYnnIA3dBOInUYaNxrurySx0Wa9ePU3ksdQ4ut5jE7M3zmx-t8T5pNevuI32mFbs0_HC7XxY5V9RudfPHTUEssgKZasp-4CCwUoRSow-gUIGKTNREUlWAYO4eWctkfNAUszrDW2_Mq0:1rtZx2:XgwxGcz6zAS5QWPQGqj5UyB7TgDBtr90uDQ7rks1dYA','2024-04-21 21:21:20.674438'),('mpfj66z98lbk05p1norfod9pseg8l0hn','e30:1rqdVE:OWTif2GfVfn6Q0ES2RtP0ttT5o5Y-gPYiiAwAr6A1V0','2024-04-13 18:32:28.052968'),('nai8yh4sntxu7dtb18gmm6umfoclu4wn','.eJxVjEsKwzAMBe_idQmyZcmhy0LPYaTIwaYfaBNvWnr3EsiiXc4b3rxdlr7W3JfyzM3c0ZE7_G4q06XcN_Ho7TXsuAznm7TraZd_jypL3TqsBsheKCAG9QlUp1mUwSyA-WRRBEsizxxHQBwJLSriTBC5kPt8AUHRMWw:1rqCgg:rWn0Uc2x3qPeJFwaF4WmCehqhS_90xqSxuiWAo3O_4w','2024-04-12 13:54:30.713178'),('nsapgmj68cuurxn325vjsop1k8tm9y9k','.eJxVi80KwjAQhN8lZynJ7qapHgWfI-ymGxL8AU17UXx3I_Sgp2Hm--ZlIq9LiWvTR6yzOZjJ7H434XTW2xfc1_octtqG05Xr5bjBv0fhVrouFMAmTNmhYxK0PlhRP3oFQZ9nUB_GnntHE3eDMAdUSyAAFimY9wdBODFI:1rscjC:FPnNqWwZ7fBxIoaUbFxcFZy714aAZr_zrkyLhjlROfA','2024-04-19 06:07:06.052373'),('qcchem722il282ble1x4sit5taa63zbs','.eJxVi0kKQjEQBe_Sa_lk6EwuBc8ROkmHBAfQ_GwU767CX-iyXr16QqS5tjgH32MvsAeE3e-WKJ_4-hW32R_LhmM5XqifD5v8KxqN9rmzssWwZ1nJoPCuZCF9sKYE4XSuqTBLp6TVKmUMSaMzhFitVF4zG4bXG1C0Mf4:1rs3j4:ZZ4W9ChDQF3RLmM3avHxgkK_880WCzZzaCH1KIase2s','2024-04-17 16:44:38.494206'),('sdrwpv8zaiezranceypsqn3ui231umwf','.eJxVjssKwjAURP8lW225ibd5LQX_wH1IchMafIAmFVT8d1voQpczZ2aYN3N-aqObarq7Qswywba_XvDxlK4LuE3l1a-y9oeLL-f9Cv8ao6_jHFfJGA3KJ8w8hTgYRcoAZdLBqyFgwoiUpdaZKEBCZUjIHYDWYkBNeR49-9qcj608Snsu10BgB9hxfuTGIrcCegFGarkBsADs8wX4cD-O:1rv0IS:BAfoX1ITyve-pMesNvR1d_vY0_om_LJxNCw7CMlrUbU','2024-04-12 03:41:20.243649'),('suc7wxevfdxjoi7wa31vimr792fi319s','.eJxVi0kKQjEQBe_Sa_lk6EwuBc8ROkmHBAfQ_GwU767CX-iyXr16QqS5tjgH32MvsAeE3e-WKJ_4-hW32R_LhmM5XqifD5v8KxqN9rmzssWwZ1nJoPCuZCF9sKYE4XSuqTBLp6TVKmUMSaMzhFitVF4zG4bXG1C0Mf4:1rs5Xj:vlxddTbpILTFGs3FEyVQcQnHfg9KKuDXJkfQrUMe25I','2024-04-17 18:41:03.719837'),('viyiryntpb5if2m46vr8i737uld9ymlh','.eJxVi0kKQjEQBe_Sa_lk6EwuBc8ROkmHBAfQ_GwU767CX-iyXr16QqS5tjgH32MvsAeE3e-WKJ_4-hW32R_LhmM5XqifD5v8KxqN9rmzssWwZ1nJoPCuZCF9sKYE4XSuqTBLp6TVKmUMSaMzhFitVF4zG4bXG1C0Mf4:1rqf5d:0oIb6m5RVsiSBK1q-oB14j8ripUKQbbgdPc2FPvXChs','2024-04-13 20:14:09.534123'),('vztmqdqrfx5oorw9e03p79244lhnj7d4','.eJxVjMsKAjEMRf-laxlIM21Gl4LfUdIkpcUH6Ew3iv-uA7PQ5bmHc18ucV9q6rM9UlN3cOR2v1tmOdttFffensOG83C6crscN_lXVJ7r-rMXJTGkbCEoKKAUMog4sQcsOIrHEnPQidUbUKAMxl8WiqZjcO8PalAy5w:1rrvVc:nPv3HWGkA_4CKdRy6G5x9SPyoTI3jN-T8Rb4SGOjHXM','2024-04-17 07:58:12.771810'),('wzn6efzt6y2xl4erav8eaqdlo384pkfj','.eJxVjMsOgjAURP-lW4XMvfTS0qWJf-CelFJC4yPRgoka_11MWOhy5sycl2r9PI3tnOOtTb1yitT2t-t8OMbLF1zn9CzXmMv92afTboV_j9HncZkPIj2auubQRNZGxIi1jSZ00EDHVZRBTAhUdTVZwMCDKLA1fQg2Vov05PPU-jCle5oei5LBuoAuiA8Ex9ahKsVKQ3oDOEC9Pz5sPaQ:1rvE8Z:OkJcANIftBKrWq1eBHHx0muGr2b8d2cAc8GzDBu2Zo0','2024-04-12 18:28:03.588952'),('x5iqsmztdvz2ufhxgjrf5cub63do89wz','.eJxVjMsKAjEMRf-laxlIM21Gl4LfUdIkpcUH6Ew3iv-uA7PQ5bmHc18ucV9q6rM9UlN3cOR2v1tmOdttFffensOG83C6crscN_lXVJ7r-rMXJTGkbCEoKKAUMog4sQcsOIrHEnPQidUbUKAMxl8WiqZjcO8PalAy5w:1rtqja:FotJFcsNFvW67Z0i5-l8XRLNPoX7_P1DJyxxiIoyFj4','2024-04-22 15:16:34.776868');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `quiz_answer`
--

DROP TABLE IF EXISTS `quiz_answer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `quiz_answer` (
  `id` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `question_id` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `quiz_attempt_id` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
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
INSERT INTO `quiz_answer` VALUES ('06f4ebbe63a5473788825937ced704f1','68ab8093d9de4b71b700b98e25fce920','4060b83c5c6143578efb2d3c2ef3a73e'),('0723be167eb14277aa789556404eb819','cd0936ee3de1412da01940c045fcf657','aae263c7b50c4e2f9df04dff7494190c'),('0d16953ab3124197b22fc8410d612cd2','6b9e2d9497684e6ea9d85a98686e4dab','868f997b7dcd47f8a78415e5b8ffbedc'),('18cb662ecc6245a88bb47769b97a522a','cc3ac08a4e454182b2c2aaad8c9b9d1c','c2035039603e4124a4052b187a81784e'),('197056595e064d6983bfd5fe968e3d07','cd0936ee3de1412da01940c045fcf657','f660ec7e07bf425790901f641ab570b7'),('1a515f158bb24341a12dfbaf60cfc906','cd0936ee3de1412da01940c045fcf657','820443c8e6f2442ca716ded509b0c506'),('271d6c125fa94a98968753435aed6d63','68ab8093d9de4b71b700b98e25fce920','868f997b7dcd47f8a78415e5b8ffbedc'),('2ae8789ef776449994fe73aeb1622d9c','cc3ac08a4e454182b2c2aaad8c9b9d1c','f879f77bf6cd41f798ec6ddb743fb837'),('2b44305fb9bc4e29b9fd3cb7e5dd25dc','5a9c9f5568c9453b924b869f9d90ad12','1c0092c14d3d4c2a9cb77503ceae8c67'),('2e88908e8771433c80a825cebcf10721','b7dd2ade76c74ca79b5a1e7e05f3d4f3','1c0092c14d3d4c2a9cb77503ceae8c67'),('2f0b10939465467f9b05d422afbb77ed','fac2d214c7914186b01f629a5b393794','411f2e6ab2c64a61b94d5336352f100b'),('306e62a166404029ad7f03b91fdd7861','a4c77adf301443ae8d6c94cf2c4cacb2','c84126950d524914883296c0e82dacbf'),('30aa3fb45a93475fa36555a57225359a','d013882925234561b5d29a04a9be5279','9e4a3f227a7a44d89389b3c0721c1e51'),('314024eab6d5408d9c0b46d7e1b946bb','a4c77adf301443ae8d6c94cf2c4cacb2','820443c8e6f2442ca716ded509b0c506'),('318603133e6246838060887bc8aa496c','036b44935d914e1d8f5e6a6b91393f4d','f879f77bf6cd41f798ec6ddb743fb837'),('3296b2f7bd254565a3cf636242015dd6','cd0936ee3de1412da01940c045fcf657','9c31b76661514151b5bd51d8bff670a4'),('33d2d3e5f1b247d5affb7a253334facf','5a9c9f5568c9453b924b869f9d90ad12','6709165421564b9498b73529a777c86e'),('3872d7045c304fcebb15668bbc416716','68ab8093d9de4b71b700b98e25fce920','fd87c719ca5340f1822070127d6567cc'),('395c0c5a24be47678881f94f332a83f5','fb85b9e65157448fae3acffcc3f573d0','090ea6535afb4ee9b04dd7187b41dfe1'),('39e1ad9ce5004a2996b88fbffb059276','301341b4fadb4fe3a7e12d7ad8838f5a','062f9c4f3a7a45519b2b000065e4a20c'),('3a9d6969fee14897982e39e017b12232','dbd6ca7146de4c249f045cf7c3e0840b','c2035039603e4124a4052b187a81784e'),('3d34ec8e683f4d5181d0cffadc681bdc','a4c77adf301443ae8d6c94cf2c4cacb2','9c31b76661514151b5bd51d8bff670a4'),('3f9936e101ae4efdba6926ebeb5d6246','b7dd2ade76c74ca79b5a1e7e05f3d4f3','4060b83c5c6143578efb2d3c2ef3a73e'),('42a735bc3f8e42c5a749c07a9c2805b1','fac2d214c7914186b01f629a5b393794','5911f5a3edaf49c0b5805286aefb9379'),('440576080e4e4832b883c51138004f75','764814d0044c4cc2967d4f3a39df5a0f','d3a7d20476aa49afb1fc8e0b2dc4786f'),('45d646c03a414579b43397f50acf4081','be3213ff2d934dabb9d7707320d89ac5','41dc6828209d4ac9aeaf6fd97abefefb'),('4cebb4eb54724fb8b06f086566d621cf','68ab8093d9de4b71b700b98e25fce920','9e4a3f227a7a44d89389b3c0721c1e51'),('4e2df9532e464a0d94ce6502ff7336f4','cd0936ee3de1412da01940c045fcf657','022740595c2147a3be6b40cb4d84a1e9'),('4edab12ca630435298c8e4d2a417e4aa','fb85b9e65157448fae3acffcc3f573d0','f660ec7e07bf425790901f641ab570b7'),('4fa0ab7d7bc64ea49ef3cffa6225a477','d77ec472441547ceb13e6552a01b9ece','062f9c4f3a7a45519b2b000065e4a20c'),('4fb2e2a6af284e47aadabdefe085f649','fac2d214c7914186b01f629a5b393794','c2035039603e4124a4052b187a81784e'),('500a3f1138bc47ea87fcc19ff01a6e8c','be3213ff2d934dabb9d7707320d89ac5','d3a7d20476aa49afb1fc8e0b2dc4786f'),('53594ec9150749f3840b4289a07cf54c','5a9c9f5568c9453b924b869f9d90ad12','14db95ceace047168ba9c3ffe616fb59'),('5a2cd8df2cdc474b9d9c220e44122d19','cd0936ee3de1412da01940c045fcf657','be60e2c0cd9b4b9d9289c047783b7801'),('5bb4407b4126465db44bdb30393a9ed5','a4c77adf301443ae8d6c94cf2c4cacb2','007e4af43e574f74ab6a4f3550e404ec'),('5c3b020dbeff49029e4a046fb9a5b7e3','736570ef75f84f98ac740f8236d5334d','062f9c4f3a7a45519b2b000065e4a20c'),('600351a28551457cbcf4e7666f379db8','b7dd2ade76c74ca79b5a1e7e05f3d4f3','6709165421564b9498b73529a777c86e'),('61faf76ee4c34db38c5d0b64f2a12d4e','d013882925234561b5d29a04a9be5279','868f997b7dcd47f8a78415e5b8ffbedc'),('663cafcf807045c887beacd91328412c','fb85b9e65157448fae3acffcc3f573d0','9c31b76661514151b5bd51d8bff670a4'),('67a29ee1e4f24e52b956712b96480cfc','301341b4fadb4fe3a7e12d7ad8838f5a','db07537fb1a74df89947297417fec95b'),('682524463e244b24baeb8044e08bc998','d013882925234561b5d29a04a9be5279','4060b83c5c6143578efb2d3c2ef3a73e'),('687edba734034f00852e9d2cec31e413','5a9c9f5568c9453b924b869f9d90ad12','a3eccf204736412ea843b143f597d227'),('6a786dd4abd849b7808474f2167ad87c','fb85b9e65157448fae3acffcc3f573d0','022740595c2147a3be6b40cb4d84a1e9'),('70ba1f54f8cd491c9ec9ff1b3bba74d7','736570ef75f84f98ac740f8236d5334d','db07537fb1a74df89947297417fec95b'),('72576e7240134101ac0f6d8957115a85','68ab8093d9de4b71b700b98e25fce920','1c0092c14d3d4c2a9cb77503ceae8c67'),('7552099adcfc4708a58a4180ef61a88f','a4c77adf301443ae8d6c94cf2c4cacb2','f660ec7e07bf425790901f641ab570b7'),('7ebe02d472694c469689558cc3241bc5','cd0936ee3de1412da01940c045fcf657','c84126950d524914883296c0e82dacbf'),('8174ac3ee47147f8994f5b9568ed606d','d013882925234561b5d29a04a9be5279','fd87c719ca5340f1822070127d6567cc'),('83de7dcf31e540e99565c47b49f28cdb','d013882925234561b5d29a04a9be5279','a3eccf204736412ea843b143f597d227'),('843367e3c046439a8e435d052fbb6c7f','a4c77adf301443ae8d6c94cf2c4cacb2','022740595c2147a3be6b40cb4d84a1e9'),('84b5a8e3ec1d4ced955b04b07bc24c31','dbd6ca7146de4c249f045cf7c3e0840b','5911f5a3edaf49c0b5805286aefb9379'),('89d56b725c2f49bfb1a35c99199c15c5','6b9e2d9497684e6ea9d85a98686e4dab','4060b83c5c6143578efb2d3c2ef3a73e'),('8a4213f1ca9e4017814c956256292e9a','a4c77adf301443ae8d6c94cf2c4cacb2','090ea6535afb4ee9b04dd7187b41dfe1'),('8ae96d886b914cb5b47e2803c5382009','036b44935d914e1d8f5e6a6b91393f4d','c2035039603e4124a4052b187a81784e'),('8d4d8f8745a0480d9c15608bbac8ca9a','cd0936ee3de1412da01940c045fcf657','090ea6535afb4ee9b04dd7187b41dfe1'),('8f30bc0ce23d4b2a8b57001539063b8d','036b44935d914e1d8f5e6a6b91393f4d','411f2e6ab2c64a61b94d5336352f100b'),('8ffbc99ceb1042f18eec699cdaf3c010','a4c77adf301443ae8d6c94cf2c4cacb2','be60e2c0cd9b4b9d9289c047783b7801'),('950194df41bd4d74b05c55a617a3bc02','d77ec472441547ceb13e6552a01b9ece','db07537fb1a74df89947297417fec95b'),('9d9d4ce5640842a4ad6c438a9ac87daf','b7dd2ade76c74ca79b5a1e7e05f3d4f3','9e4a3f227a7a44d89389b3c0721c1e51'),('9ea174dd6d6c4733a465b2dfc181201a','036b44935d914e1d8f5e6a6b91393f4d','5911f5a3edaf49c0b5805286aefb9379'),('9fbf90613d3a48b6af08aa237cabc8cb','68ab8093d9de4b71b700b98e25fce920','14db95ceace047168ba9c3ffe616fb59'),('a2ba986ede9148649996e613a113efd3','a4c77adf301443ae8d6c94cf2c4cacb2','bb83852d8db74811a3072697c52b0f0e'),('a4628361af3844a098ed5dcb7f46a1ec','6b9e2d9497684e6ea9d85a98686e4dab','1c0092c14d3d4c2a9cb77503ceae8c67'),('a59c591e3d3b4521af2f1674d75238bc','68ab8093d9de4b71b700b98e25fce920','6709165421564b9498b73529a777c86e'),('a86509c23842458ba98ac5867f091eeb','d013882925234561b5d29a04a9be5279','14db95ceace047168ba9c3ffe616fb59'),('a9c015f273014ac8be1de28aa688624e','a4c77adf301443ae8d6c94cf2c4cacb2','aae263c7b50c4e2f9df04dff7494190c'),('aa20e82bc585496596b0cef60aafb794','b7dd2ade76c74ca79b5a1e7e05f3d4f3','868f997b7dcd47f8a78415e5b8ffbedc'),('b0226a0f0afd444aa7f3d3cf1436f5ef','fb85b9e65157448fae3acffcc3f573d0','be60e2c0cd9b4b9d9289c047783b7801'),('b2219f9e051a4bceb1228b027991135f','cd0936ee3de1412da01940c045fcf657','007e4af43e574f74ab6a4f3550e404ec'),('b67b1db275c2463c8bd820b2715e53b3','cc3ac08a4e454182b2c2aaad8c9b9d1c','5911f5a3edaf49c0b5805286aefb9379'),('c701a195b0074abba50a2fc8e2edc11d','fb85b9e65157448fae3acffcc3f573d0','820443c8e6f2442ca716ded509b0c506'),('c7227c37ef4440908cab67c72a07a3c9','cc3ac08a4e454182b2c2aaad8c9b9d1c','411f2e6ab2c64a61b94d5336352f100b'),('c86ecc7058684513b0f85a89327399eb','d013882925234561b5d29a04a9be5279','6709165421564b9498b73529a777c86e'),('cb35dccbaa71435b9390c3c308e65144','dbd6ca7146de4c249f045cf7c3e0840b','f879f77bf6cd41f798ec6ddb743fb837'),('cf41e5959c2c49b390b7a162f1a78e10','6b9e2d9497684e6ea9d85a98686e4dab','6709165421564b9498b73529a777c86e'),('d16bab9d43814c439b36f18b47e111f2','fb85b9e65157448fae3acffcc3f573d0','aae263c7b50c4e2f9df04dff7494190c'),('d56b4cd9d9c24ad7a54d2b70b8336f7f','fb85b9e65157448fae3acffcc3f573d0','007e4af43e574f74ab6a4f3550e404ec'),('d71ba39ab0034fa5bf033117e91ffb0d','5a9c9f5568c9453b924b869f9d90ad12','868f997b7dcd47f8a78415e5b8ffbedc'),('d85454d29fbd4a93ba47d46a46adae43','5a9c9f5568c9453b924b869f9d90ad12','4060b83c5c6143578efb2d3c2ef3a73e'),('db659c287bf741be999ea61b7d8f1cff','6b9e2d9497684e6ea9d85a98686e4dab','9e4a3f227a7a44d89389b3c0721c1e51'),('dbbcc037eb5843e483eb97b360f06414','6b9e2d9497684e6ea9d85a98686e4dab','a3eccf204736412ea843b143f597d227'),('dd5d0824a8e54cfc9abf81ccba41f0a8','fb85b9e65157448fae3acffcc3f573d0','c84126950d524914883296c0e82dacbf'),('e702913a2dbc4a92835cc30fdb9a4a01','6b9e2d9497684e6ea9d85a98686e4dab','fd87c719ca5340f1822070127d6567cc'),('e80fb9249cf3443b95c2592ae3d72c5a','5a9c9f5568c9453b924b869f9d90ad12','9e4a3f227a7a44d89389b3c0721c1e51'),('ec7d39a7e3784d32be80165aee3e57f7','d013882925234561b5d29a04a9be5279','1c0092c14d3d4c2a9cb77503ceae8c67'),('ece611774bb5467bb0861549b7844688','fb85b9e65157448fae3acffcc3f573d0','bb83852d8db74811a3072697c52b0f0e'),('ee24151b5d5a4dbe8bca3ebd76825ded','b7dd2ade76c74ca79b5a1e7e05f3d4f3','14db95ceace047168ba9c3ffe616fb59'),('ef00b6572af449099e99d58461d415a4','6b9e2d9497684e6ea9d85a98686e4dab','14db95ceace047168ba9c3ffe616fb59'),('f46c495427d24b7f8c18093105a96e7d','b7dd2ade76c74ca79b5a1e7e05f3d4f3','a3eccf204736412ea843b143f597d227'),('f6f16f646e33498ba3b7b4cef6351ce3','764814d0044c4cc2967d4f3a39df5a0f','41dc6828209d4ac9aeaf6fd97abefefb'),('f85f27635e16458ca38a6cdbdcd56b5e','b7dd2ade76c74ca79b5a1e7e05f3d4f3','fd87c719ca5340f1822070127d6567cc'),('faec148640b7416cbd2924da716f440b','dbd6ca7146de4c249f045cf7c3e0840b','411f2e6ab2c64a61b94d5336352f100b'),('fcadce550df4497a8143691c39fd83bd','cd0936ee3de1412da01940c045fcf657','bb83852d8db74811a3072697c52b0f0e'),('fcfe502f3cff43a39dfd2d72631667c9','fac2d214c7914186b01f629a5b393794','f879f77bf6cd41f798ec6ddb743fb837'),('fda948ad203e4cb5b7e21d2a6fe75a57','5a9c9f5568c9453b924b869f9d90ad12','fd87c719ca5340f1822070127d6567cc'),('ff360f01359b4211bb7581def9b85e67','68ab8093d9de4b71b700b98e25fce920','a3eccf204736412ea843b143f597d227');
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
  `answer_id` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `option_id` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `quiz_answer_selected_options_answer_id_option_id_43f52688_uniq` (`answer_id`,`option_id`),
  KEY `quiz_answer_selected_option_id_5d14b3c8_fk_quiz_opti` (`option_id`),
  CONSTRAINT `quiz_answer_selected_answer_id_70672bb5_fk_quiz_answ` FOREIGN KEY (`answer_id`) REFERENCES `quiz_answer` (`id`),
  CONSTRAINT `quiz_answer_selected_option_id_5d14b3c8_fk_quiz_opti` FOREIGN KEY (`option_id`) REFERENCES `quiz_option` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=346 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `quiz_answer_selected_options`
--

LOCK TABLES `quiz_answer_selected_options` WRITE;
/*!40000 ALTER TABLE `quiz_answer_selected_options` DISABLE KEYS */;
INSERT INTO `quiz_answer_selected_options` VALUES (214,'06f4ebbe63a5473788825937ced704f1','117741d1fe484154858220ecec4eeb9e'),(199,'0723be167eb14277aa789556404eb819','a484e3324fe14ecbbab8ebb46e0941ae'),(200,'0723be167eb14277aa789556404eb819','eb0a7f77b937455895962428d505e46c'),(194,'0d16953ab3124197b22fc8410d612cd2','d26dbb8e7a2f4b6aa3d0e08315eb4934'),(224,'18cb662ecc6245a88bb47769b97a522a','698a3a638a8d4b60b3ff7e046e791b69'),(259,'197056595e064d6983bfd5fe968e3d07','a484e3324fe14ecbbab8ebb46e0941ae'),(260,'197056595e064d6983bfd5fe968e3d07','c6aded622eee45d58686f84803374a09'),(261,'197056595e064d6983bfd5fe968e3d07','eb0a7f77b937455895962428d505e46c'),(291,'1a515f158bb24341a12dfbaf60cfc906','a484e3324fe14ecbbab8ebb46e0941ae'),(292,'1a515f158bb24341a12dfbaf60cfc906','eb0a7f77b937455895962428d505e46c'),(193,'271d6c125fa94a98968753435aed6d63','117741d1fe484154858220ecec4eeb9e'),(220,'2ae8789ef776449994fe73aeb1622d9c','0c605a8b1e5244428d02413680e63d2a'),(185,'2b44305fb9bc4e29b9fd3cb7e5dd25dc','d0f6bc42570f4b66907ddc0951206e27'),(188,'2e88908e8771433c80a825cebcf10721','4bda9b63051248cba6469383a0599273'),(189,'2e88908e8771433c80a825cebcf10721','7a0730d3496847668c9d1b098828d54c'),(345,'2f0b10939465467f9b05d422afbb77ed','ad137e7a7bd84b7db47d52ffcf11d392'),(202,'306e62a166404029ad7f03b91fdd7861','4b94871198e343d9b298077ea7706287'),(242,'30aa3fb45a93475fa36555a57225359a','3009df2a032847d8834f7e2f4fb3e7ee'),(290,'314024eab6d5408d9c0b46d7e1b946bb','4b94871198e343d9b298077ea7706287'),(219,'318603133e6246838060887bc8aa496c','0ce936051c7547ed863a10e20c5efb20'),(312,'3296b2f7bd254565a3cf636242015dd6','a484e3324fe14ecbbab8ebb46e0941ae'),(251,'33d2d3e5f1b247d5affb7a253334facf','5ff5c242a8f445fd9793213e12184eab'),(252,'33d2d3e5f1b247d5affb7a253334facf','d0f6bc42570f4b66907ddc0951206e27'),(230,'3872d7045c304fcebb15668bbc416716','280f6c948bbb4993a332880f3574e5c6'),(341,'395c0c5a24be47678881f94f332a83f5','c645e8278813403db7e52a76b9ea70f5'),(297,'39e1ad9ce5004a2996b88fbffb059276','08a5a912103f4956ab1b42d5dba02dd5'),(225,'3a9d6969fee14897982e39e017b12232','d2e7cf855f9c45d1978002e09ea14fec'),(311,'3d34ec8e683f4d5181d0cffadc681bdc','4b94871198e343d9b298077ea7706287'),(216,'3f9936e101ae4efdba6926ebeb5d6246','4bda9b63051248cba6469383a0599273'),(217,'3f9936e101ae4efdba6926ebeb5d6246','7a0730d3496847668c9d1b098828d54c'),(184,'42a735bc3f8e42c5a749c07a9c2805b1','ad137e7a7bd84b7db47d52ffcf11d392'),(280,'440576080e4e4832b883c51138004f75','e9b0b2d864234ff19fe696fbcd63a6e7'),(279,'45d646c03a414579b43397f50acf4081','a3174af9c4114040b0c3cdd0e4a270d7'),(238,'4cebb4eb54724fb8b06f086566d621cf','bac5fc9acc6141bd97b2017b9f753d97'),(288,'4e2df9532e464a0d94ce6502ff7336f4','a484e3324fe14ecbbab8ebb46e0941ae'),(262,'4edab12ca630435298c8e4d2a417e4aa','1d3ef92f9c9941819e6058e8b109e5f8'),(299,'4fa0ab7d7bc64ea49ef3cffa6225a477','8ad07c790c6546038949452409e8c451'),(226,'4fb2e2a6af284e47aadabdefe085f649','ad137e7a7bd84b7db47d52ffcf11d392'),(281,'500a3f1138bc47ea87fcc19ff01a6e8c','a3174af9c4114040b0c3cdd0e4a270d7'),(206,'53594ec9150749f3840b4289a07cf54c','5ff5c242a8f445fd9793213e12184eab'),(207,'53594ec9150749f3840b4289a07cf54c','d0f6bc42570f4b66907ddc0951206e27'),(283,'5a2cd8df2cdc474b9d9c220e44122d19','a484e3324fe14ecbbab8ebb46e0941ae'),(284,'5a2cd8df2cdc474b9d9c220e44122d19','c6aded622eee45d58686f84803374a09'),(285,'5a2cd8df2cdc474b9d9c220e44122d19','eb0a7f77b937455895962428d505e46c'),(263,'5bb4407b4126465db44bdb30393a9ed5','4b94871198e343d9b298077ea7706287'),(298,'5c3b020dbeff49029e4a046fb9a5b7e3','0c36a75d636749b49bfc938e99730844'),(255,'600351a28551457cbcf4e7666f379db8','4bda9b63051248cba6469383a0599273'),(256,'600351a28551457cbcf4e7666f379db8','7a0730d3496847668c9d1b098828d54c'),(197,'61faf76ee4c34db38c5d0b64f2a12d4e','3009df2a032847d8834f7e2f4fb3e7ee'),(313,'663cafcf807045c887beacd91328412c','c645e8278813403db7e52a76b9ea70f5'),(294,'67a29ee1e4f24e52b956712b96480cfc','08a5a912103f4956ab1b42d5dba02dd5'),(218,'682524463e244b24baeb8044e08bc998','3009df2a032847d8834f7e2f4fb3e7ee'),(243,'687edba734034f00852e9d2cec31e413','4ad1856b14b045c79bbedbddb026bab0'),(244,'687edba734034f00852e9d2cec31e413','5ff5c242a8f445fd9793213e12184eab'),(245,'687edba734034f00852e9d2cec31e413','d0f6bc42570f4b66907ddc0951206e27'),(289,'6a786dd4abd849b7808474f2167ad87c','c645e8278813403db7e52a76b9ea70f5'),(295,'70ba1f54f8cd491c9ec9ff1b3bba74d7','0c36a75d636749b49bfc938e99730844'),(186,'72576e7240134101ac0f6d8957115a85','117741d1fe484154858220ecec4eeb9e'),(258,'7552099adcfc4708a58a4180ef61a88f','923f81d15c764143b0a1c4c07a783a07'),(203,'7ebe02d472694c469689558cc3241bc5','a484e3324fe14ecbbab8ebb46e0941ae'),(204,'7ebe02d472694c469689558cc3241bc5','eb0a7f77b937455895962428d505e46c'),(234,'8174ac3ee47147f8994f5b9568ed606d','3009df2a032847d8834f7e2f4fb3e7ee'),(250,'83de7dcf31e540e99565c47b49f28cdb','3009df2a032847d8834f7e2f4fb3e7ee'),(287,'843367e3c046439a8e435d052fbb6c7f','4b94871198e343d9b298077ea7706287'),(183,'84b5a8e3ec1d4ced955b04b07bc24c31','d2e7cf855f9c45d1978002e09ea14fec'),(215,'89d56b725c2f49bfb1a35c99199c15c5','d26dbb8e7a2f4b6aa3d0e08315eb4934'),(338,'8a4213f1ca9e4017814c956256292e9a','4b94871198e343d9b298077ea7706287'),(223,'8ae96d886b914cb5b47e2803c5382009','0ce936051c7547ed863a10e20c5efb20'),(339,'8d4d8f8745a0480d9c15608bbac8ca9a','a484e3324fe14ecbbab8ebb46e0941ae'),(340,'8d4d8f8745a0480d9c15608bbac8ca9a','eb0a7f77b937455895962428d505e46c'),(342,'8f30bc0ce23d4b2a8b57001539063b8d','0ce936051c7547ed863a10e20c5efb20'),(282,'8ffbc99ceb1042f18eec699cdaf3c010','4b94871198e343d9b298077ea7706287'),(296,'950194df41bd4d74b05c55a617a3bc02','8891d1fd10ea4652a5a7cde9f6685c27'),(240,'9d9d4ce5640842a4ad6c438a9ac87daf','4bda9b63051248cba6469383a0599273'),(241,'9d9d4ce5640842a4ad6c438a9ac87daf','7a0730d3496847668c9d1b098828d54c'),(181,'9ea174dd6d6c4733a465b2dfc181201a','0ce936051c7547ed863a10e20c5efb20'),(208,'9fbf90613d3a48b6af08aa237cabc8cb','117741d1fe484154858220ecec4eeb9e'),(268,'a2ba986ede9148649996e613a113efd3','923f81d15c764143b0a1c4c07a783a07'),(187,'a4628361af3844a098ed5dcb7f46a1ec','d26dbb8e7a2f4b6aa3d0e08315eb4934'),(253,'a59c591e3d3b4521af2f1674d75238bc','117741d1fe484154858220ecec4eeb9e'),(211,'a86509c23842458ba98ac5867f091eeb','3009df2a032847d8834f7e2f4fb3e7ee'),(198,'a9c015f273014ac8be1de28aa688624e','2ca30f4070e044fe84add59781b2351c'),(195,'aa20e82bc585496596b0cef60aafb794','4bda9b63051248cba6469383a0599273'),(196,'aa20e82bc585496596b0cef60aafb794','7a0730d3496847668c9d1b098828d54c'),(286,'b0226a0f0afd444aa7f3d3cf1436f5ef','c645e8278813403db7e52a76b9ea70f5'),(264,'b2219f9e051a4bceb1228b027991135f','a484e3324fe14ecbbab8ebb46e0941ae'),(265,'b2219f9e051a4bceb1228b027991135f','c6aded622eee45d58686f84803374a09'),(266,'b2219f9e051a4bceb1228b027991135f','eb0a7f77b937455895962428d505e46c'),(182,'b67b1db275c2463c8bd820b2715e53b3','698a3a638a8d4b60b3ff7e046e791b69'),(293,'c701a195b0074abba50a2fc8e2edc11d','c645e8278813403db7e52a76b9ea70f5'),(343,'c7227c37ef4440908cab67c72a07a3c9','698a3a638a8d4b60b3ff7e046e791b69'),(257,'c86ecc7058684513b0f85a89327399eb','3009df2a032847d8834f7e2f4fb3e7ee'),(221,'cb35dccbaa71435b9390c3c308e65144','d2e7cf855f9c45d1978002e09ea14fec'),(254,'cf41e5959c2c49b390b7a162f1a78e10','d26dbb8e7a2f4b6aa3d0e08315eb4934'),(201,'d16bab9d43814c439b36f18b47e111f2','c645e8278813403db7e52a76b9ea70f5'),(267,'d56b4cd9d9c24ad7a54d2b70b8336f7f','921f996439ea4fbe866ffc5824249a6b'),(191,'d71ba39ab0034fa5bf033117e91ffb0d','5ff5c242a8f445fd9793213e12184eab'),(192,'d71ba39ab0034fa5bf033117e91ffb0d','d0f6bc42570f4b66907ddc0951206e27'),(212,'d85454d29fbd4a93ba47d46a46adae43','5ff5c242a8f445fd9793213e12184eab'),(213,'d85454d29fbd4a93ba47d46a46adae43','d0f6bc42570f4b66907ddc0951206e27'),(239,'db659c287bf741be999ea61b7d8f1cff','d26dbb8e7a2f4b6aa3d0e08315eb4934'),(247,'dbbcc037eb5843e483eb97b360f06414','d26dbb8e7a2f4b6aa3d0e08315eb4934'),(205,'dd5d0824a8e54cfc9abf81ccba41f0a8','c645e8278813403db7e52a76b9ea70f5'),(231,'e702913a2dbc4a92835cc30fdb9a4a01','d26dbb8e7a2f4b6aa3d0e08315eb4934'),(235,'e80fb9249cf3443b95c2592ae3d72c5a','4ad1856b14b045c79bbedbddb026bab0'),(236,'e80fb9249cf3443b95c2592ae3d72c5a','5ff5c242a8f445fd9793213e12184eab'),(237,'e80fb9249cf3443b95c2592ae3d72c5a','d0f6bc42570f4b66907ddc0951206e27'),(190,'ec7d39a7e3784d32be80165aee3e57f7','3009df2a032847d8834f7e2f4fb3e7ee'),(272,'ece611774bb5467bb0861549b7844688','c645e8278813403db7e52a76b9ea70f5'),(210,'ee24151b5d5a4dbe8bca3ebd76825ded','4bda9b63051248cba6469383a0599273'),(209,'ef00b6572af449099e99d58461d415a4','d26dbb8e7a2f4b6aa3d0e08315eb4934'),(248,'f46c495427d24b7f8c18093105a96e7d','4bda9b63051248cba6469383a0599273'),(249,'f46c495427d24b7f8c18093105a96e7d','7a0730d3496847668c9d1b098828d54c'),(278,'f6f16f646e33498ba3b7b4cef6351ce3','bc19ad4edc4242b5ac9ff352f1f685b2'),(232,'f85f27635e16458ca38a6cdbdcd56b5e','4bda9b63051248cba6469383a0599273'),(233,'f85f27635e16458ca38a6cdbdcd56b5e','7a0730d3496847668c9d1b098828d54c'),(344,'faec148640b7416cbd2924da716f440b','d2e7cf855f9c45d1978002e09ea14fec'),(269,'fcadce550df4497a8143691c39fd83bd','a484e3324fe14ecbbab8ebb46e0941ae'),(270,'fcadce550df4497a8143691c39fd83bd','c6aded622eee45d58686f84803374a09'),(271,'fcadce550df4497a8143691c39fd83bd','eb0a7f77b937455895962428d505e46c'),(222,'fcfe502f3cff43a39dfd2d72631667c9','ad137e7a7bd84b7db47d52ffcf11d392'),(227,'fda948ad203e4cb5b7e21d2a6fe75a57','4ad1856b14b045c79bbedbddb026bab0'),(228,'fda948ad203e4cb5b7e21d2a6fe75a57','5ff5c242a8f445fd9793213e12184eab'),(229,'fda948ad203e4cb5b7e21d2a6fe75a57','d0f6bc42570f4b66907ddc0951206e27'),(246,'ff360f01359b4211bb7581def9b85e67','bac5fc9acc6141bd97b2017b9f753d97');
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
  `password` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `first_name` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  `email` varchar(254) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `school` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `quiz_customuser`
--

LOCK TABLES `quiz_customuser` WRITE;
/*!40000 ALTER TABLE `quiz_customuser` DISABLE KEYS */;
INSERT INTO `quiz_customuser` VALUES (1,'pbkdf2_sha256$720000$m7kbhz8ip0Rm0WZkPfuR0a$nxWGf86VphkIPBK/Ga07o8pnHXWNO6Fe5fRg5GF+UsY=','2024-04-16 18:01:41.066781',1,'admin','','',1,1,'2024-03-26 19:21:53.070000','admin@test.com','student','','default/user.jpg'),(2,'pbkdf2_sha256$720000$2Ssw7p9mHU2oiwuaABYJi4$DPwj4srjZ3lfzKJH7l81NttDwA1pofaWrTRv0sACN7k=','2024-09-11 04:42:32.574233',0,'Chris','Chrispine','Saka',0,1,'2024-03-26 19:27:56.837000','sakachris90@gmail.com','teacher','Nuru Academy','Users/Chris/user1.png'),(3,'pbkdf2_sha256$720000$GVuix9kwn4vGb7jQQ2TU3f$XNZVUm3lgqumWWOerHEd54nS+GLOlrureaoqWpOZFWI=','2024-04-15 19:01:34.300563',0,'Charles','Charles','Odoyo',0,1,'2024-03-26 19:31:43.822000','sakachrispo@gmail.com','teacher','Bidii Academy','Users/Charles/User3.jpeg'),(4,'pbkdf2_sha256$720000$nHPmDvYtUD71hQh51Xat3x$pf0kag9e+eYdX6+2kWCBkxCQqkveuau/jjttArlc48E=','2024-09-11 04:44:58.831389',0,'Edith','Edith','Mumbi',0,1,'2024-03-26 19:36:04.099000','sakachrispine388@gmail.com','student','Nuru Academy','Users/Edith/User2_vcNWAcB.png'),(5,'pbkdf2_sha256$720000$M95co9nPYMMDEEXMdAqcnH$z04bM1paqOJLZ7oPs0CwA7IplehqJeE6+bc5lyapx/s=','2024-04-03 19:03:19.927150',0,'Grace','Grace','Achieng',0,1,'2024-03-26 19:38:24.671000','sakachrispine@gmail.com','student','Bidii Academy','Users/Grace/User2.png'),(7,'pbkdf2_sha256$720000$ooaQnd5KVTSJWmcaxvwaR5$cNx/6eRiapWqN30+32LxIyGBNuCJkj8+uRUx/IYLty8=','2024-04-08 15:23:52.193075',0,'saka','','',0,1,'2024-04-02 17:55:07.567114','saka@cloudoon.com','student','Bidii Academy','Users/saka/User4.jpeg'),(8,'pbkdf2_sha256$720000$xphYauvlzRDWiso83PhzzA$STwsN9z2dbIY+eE1tnDphgduDiWhfH3SD7971t0bVWo=','2024-04-05 06:07:06.046003',0,'Oliver','Oliver','Othieno',0,1,'2024-04-05 06:04:53.065519','oliverothieno@gmail.com','teacher','Sombo','default/user.jpg'),(9,'pbkdf2_sha256$720000$lbJAqSqfRV46gUYQK2UT03$77igrpctYA/UJfZF25mZgDkHfQtGvbxvD9og1heYjps=',NULL,0,'Stacy','An','Je',0,0,'2024-04-05 11:52:35.535016','anzelkoech@gmail.com','student','Na','default/user.jpg'),(10,'pbkdf2_sha256$720000$N01jLbBeVkzgn9lPtGpWGE$4iTMF93E/Sw9J+fY7kHcwccawNfrm0KrREPUnlZIEgU=','2024-04-07 01:42:06.938098',0,'JackJavi','Jack','Javi',0,1,'2024-04-07 01:41:07.053078','javiartsofficial@gmail.com','student','Alx','default/user.jpg'),(11,'pbkdf2_sha256$720000$9ht5gfCegN0VwdTYTKaLc7$D8Jh9KwJu5un5kjsbYMM097vhPpSpYUqP4flFEu2w3Q=','2024-04-16 18:03:52.576082',0,'Hope','Chris','Saka',0,1,'2024-04-08 15:41:01.392856','sakachrispine1@gmail.com','student','Nuru Academy','default/user.jpg');
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
  `subject_id` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `quiz_customuser_subjects_customuser_id_subject_id_6c9dc438_uniq` (`customuser_id`,`subject_id`),
  KEY `quiz_customuser_subjects_subject_id_d4595f45_fk_quiz_subject_id` (`subject_id`),
  CONSTRAINT `quiz_customuser_subj_customuser_id_c73c3578_fk_quiz_cust` FOREIGN KEY (`customuser_id`) REFERENCES `quiz_customuser` (`id`),
  CONSTRAINT `quiz_customuser_subjects_subject_id_d4595f45_fk_quiz_subject_id` FOREIGN KEY (`subject_id`) REFERENCES `quiz_subject` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `quiz_customuser_subjects`
--

LOCK TABLES `quiz_customuser_subjects` WRITE;
/*!40000 ALTER TABLE `quiz_customuser_subjects` DISABLE KEYS */;
INSERT INTO `quiz_customuser_subjects` VALUES (46,4,'37fe3b739b13495cbf6d117a71677d0e'),(37,4,'5958769f0f024759931c67370887263d'),(35,4,'c8331415aacd4fea9c6defab429807e4'),(36,7,'37fe3b739b13495cbf6d117a71677d0e'),(21,7,'5958769f0f024759931c67370887263d'),(19,7,'8246d936e928470cbe2a718d48c19943'),(20,7,'c8331415aacd4fea9c6defab429807e4'),(38,10,'8137369fcdab4707ba4c344a052a2683'),(40,10,'8246d936e928470cbe2a718d48c19943'),(39,10,'d1360892d313406bbf84a0229c032789'),(42,11,'37fe3b739b13495cbf6d117a71677d0e'),(45,11,'5958769f0f024759931c67370887263d'),(41,11,'61aa49a810214000a71ba331d672b324'),(43,11,'8246d936e928470cbe2a718d48c19943'),(44,11,'c8331415aacd4fea9c6defab429807e4');
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
  `id` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `text` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_correct` tinyint(1) NOT NULL,
  `question_id` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
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
INSERT INTO `quiz_option` VALUES ('06fd05c9601d4faeb43645edcf285932','48',0,'fac2d214c7914186b01f629a5b393794'),('08a5a912103f4956ab1b42d5dba02dd5','54',1,'301341b4fadb4fe3a7e12d7ad8838f5a'),('08c0553ded6c465bb76078f8a68dfcda','a',0,'7c0c31cb2e3742a8bb0615ce98496a34'),('098b0ad3d95349c18f408dde1e33077f','Gravitational energy',1,'1179756083e545619796f298488cc094'),('0c36a75d636749b49bfc938e99730844','Nigeria',1,'736570ef75f84f98ac740f8236d5334d'),('0c605a8b1e5244428d02413680e63d2a','1965',0,'cc3ac08a4e454182b2c2aaad8c9b9d1c'),('0ce936051c7547ed863a10e20c5efb20','Daniel Moi',1,'036b44935d914e1d8f5e6a6b91393f4d'),('0efae0467daa4fa3a9a11a3244c4d863','They are transverse waves.',0,'1f42f0f1969d4940bb99cc3a02cb84ae'),('104e5fef190b4b3cbe9327c4bb9d9acf','10',0,'d013882925234561b5d29a04a9be5279'),('1083defc647a4c6d83dee40117488c97','She moves with a light step.',0,'24e905ec1c634378bab22aedae81c1d5'),('117741d1fe484154858220ecec4eeb9e','14x−15',1,'68ab8093d9de4b71b700b98e25fce920'),('13a86152eb0e43ea8d9d3bbeb3f0586e','Declarative',0,'0fb783f662cf424c90678d54e3b6fb0b'),('13acdd6f784f49e8bf041aec50ab18b0','The unpredictability of weather',0,'a03dcf5a847e4417b888596671c295ed'),('15a503338cfa49e083b5af1eceaef82d','Holding a heavy bag still',0,'4166e27942fc490db9dff8258890ea18'),('168cd6af2dc642fd8671a1981801dc5a','Gorgeous',0,'6c49ccb5d395437aacec97d00d7c6207'),('19deb521f672473bbccdca67cd524a9d','goes',0,'442278f43a044e6db345fea02a230599'),('1a656585ae9344f2881fcf878cb1e5b2','49',0,'fac2d214c7914186b01f629a5b393794'),('1bf215cbf78e4a01a26174bb7b151b33','Personification',1,'1e60d0cc29cb4112a282d8fc5a18a19b'),('1d3ef92f9c9941819e6058e8b109e5f8','12',0,'fb85b9e65157448fae3acffcc3f573d0'),('2550903595a84727874df5915553d7f9','The destructiveness of nature',0,'a03dcf5a847e4417b888596671c295ed'),('27e0adf1c7694e838e6eedadae9d0140','Uganda',0,'736570ef75f84f98ac740f8236d5334d'),('280f6c948bbb4993a332880f3574e5c6','12x+10',0,'68ab8093d9de4b71b700b98e25fce920'),('2c5fbd425cca4e83b2deb179e1fbd516','2.5',0,'d013882925234561b5d29a04a9be5279'),('2ca30f4070e044fe84add59781b2351c','5.5',0,'a4c77adf301443ae8d6c94cf2c4cacb2'),('2d6856b5e8ef4a9c96b2ad9227ec389e','Speed = Distance / Time',1,'cd5d34ca7efc4bcb9f1c2d7e82bc5d10'),('2dbada047e714d9395e264f8cca40d60','Calendar',0,'fa25160dc5264fb6aa7bd82f3e29dddd'),('2df5e5d4ff8c4894852982002f584254','The light from the window woke me up.',1,'24e905ec1c634378bab22aedae81c1d5'),('3009df2a032847d8834f7e2f4fb3e7ee','5',1,'d013882925234561b5d29a04a9be5279'),('325008388058490fb4a78aa14779015f','Rwanda',0,'736570ef75f84f98ac740f8236d5334d'),('32518590ac4c462594d0892ab244fc57','Beleive',1,'fa25160dc5264fb6aa7bd82f3e29dddd'),('34fb867c4bc54259ba4a9a9529ff11b5','Attractive',0,'6c49ccb5d395437aacec97d00d7c6207'),('3c443b4c2d5c47058db314d787fd4755','The object has no net force acting on it.',1,'5e0e6e28e4884cac802b9234d73b0713'),('4074c22efe2643ef96780ee16a14fdbf','The industrialization of society',0,'a03dcf5a847e4417b888596671c295ed'),('43f49e3c9cf24f31891b4ecd90aaed4b','57',0,'301341b4fadb4fe3a7e12d7ad8838f5a'),('44f3781c088548c8b54c534ae3cbbc58','Fahrenheit (°F)',0,'cdb3f3ccbb6c4f15ada67e4639a8dcd4'),('4a21ea4a179d45d883443f5153216e33','They can travel through a vacuum.',0,'1f42f0f1969d4940bb99cc3a02cb84ae'),('4ad1856b14b045c79bbedbddb026bab0','6(x−1.5)',0,'5a9c9f5568c9453b924b869f9d90ad12'),('4b7f1a51a8144524a0928d3bc54e07fa','Pretty',0,'6c49ccb5d395437aacec97d00d7c6207'),('4b94871198e343d9b298077ea7706287','1.4',1,'a4c77adf301443ae8d6c94cf2c4cacb2'),('4bda9b63051248cba6469383a0599273','11',1,'b7dd2ade76c74ca79b5a1e7e05f3d4f3'),('4f1bd3dc23304644a87889f84ed22c42','55',0,'301341b4fadb4fe3a7e12d7ad8838f5a'),('5220f3e3494d401aad553e2b90766b83','Force',0,'7ed9191d0f504c9b82216827d1400140'),('5273ffa867224ef1857cfdb2a26258a3','Watt (W)',0,'3a99cf1a389e4d59bd314572e753e392'),('55f98478ce3345a8872adc04c555a63c','15',0,'b7dd2ade76c74ca79b5a1e7e05f3d4f3'),('572de8a64d164d33a4793155a5c7bfc5','go',0,'442278f43a044e6db345fea02a230599'),('58b50e4335b74e8ab6f0cff27d7fc7f8','Dispersion',0,'8376f95cf2644b059dbcbac754845d24'),('5ac9d37e2d584737a80dfc777ddeb695','2a',1,'09a2d66fb3da419a97b43667a5d4133e'),('5ddb7c0c8f0f4af3a0a6f8d7ddb5fa03','Nakuru',0,'dbd6ca7146de4c249f045cf7c3e0840b'),('5ede0b1c80434488880a80f8b0007f53','Velocity',0,'7ed9191d0f504c9b82216827d1400140'),('5ff5c242a8f445fd9793213e12184eab','9(2x/3−1)',1,'5a9c9f5568c9453b924b869f9d90ad12'),('61e0d63065844246975f3ab58405a2f2','Onomatopoeia',0,'1e60d0cc29cb4112a282d8fc5a18a19b'),('65e0ce569bd945d780dbbae47752cb28','Oginga Odinga',0,'036b44935d914e1d8f5e6a6b91393f4d'),('698a3a638a8d4b60b3ff7e046e791b69','1963',1,'cc3ac08a4e454182b2c2aaad8c9b9d1c'),('6b9b68473e80488a8db6b4d166fcdc8c','went',1,'442278f43a044e6db345fea02a230599'),('6cc65ad9a63f40e58d9608a9a60f9d80','2a',1,'7c0c31cb2e3742a8bb0615ce98496a34'),('6de7ac76ce8d4e96af3bedb06a5a640c','To introduce new topics',0,'af3da80ca04a4f889a6c1e884c090b12'),('7150340f84cc4ec9aaaf087170b61f27','Ugly',1,'6c49ccb5d395437aacec97d00d7c6207'),('71c99be96bff4d819d6c80f347d9b946','Refraction',1,'8376f95cf2644b059dbcbac754845d24'),('72af4f776283458d9089b2bdaaad0034','To confuse the audience',0,'af3da80ca04a4f889a6c1e884c090b12'),('751b4cfeb4614b70b64a781ceadc4a6d','64 cm',0,'6b9e2d9497684e6ea9d85a98686e4dab'),('76106e45d20c42799aaca06509c61562','The object is accelerating.',0,'5e0e6e28e4884cac802b9234d73b0713'),('77f5b8535b1e4a61938747abd4a948a0','Acquaintance',0,'fa25160dc5264fb6aa7bd82f3e29dddd'),('791a83f0ec094e9694ca1041196ab64a','Simile',0,'1e60d0cc29cb4112a282d8fc5a18a19b'),('7a0730d3496847668c9d1b098828d54c','19',1,'b7dd2ade76c74ca79b5a1e7e05f3d4f3'),('7bf198bbc8204059a27ba724c9e8e6a6','1964',0,'cc3ac08a4e454182b2c2aaad8c9b9d1c'),('7d2b7eb10bb2401b83761952652b6731','To emphasize a point or provoke thought',1,'af3da80ca04a4f889a6c1e884c090b12'),('7df123191b7745c98d7d338725ba06ba','Thermal energy',1,'1179756083e545619796f298488cc094'),('7f9f77e036fc46a99184d2db055c9f9e','The beauty and tranquility of nature',1,'a03dcf5a847e4417b888596671c295ed'),('837c776d26a14f83acf353acac503132','Abuja',0,'d77ec472441547ceb13e6552a01b9ece'),('8891d1fd10ea4652a5a7cde9f6685c27','Nairobi',0,'d77ec472441547ceb13e6552a01b9ece'),('8ad07c790c6546038949452409e8c451','Accra',1,'d77ec472441547ceb13e6552a01b9ece'),('8c06ed39723248bf87d2b7f58272e59b','Jomo Kenyatta',0,'036b44935d914e1d8f5e6a6b91393f4d'),('8fc9b4e10645481ea245dee6d5f84e4a','Pushing a box and causing it to move',1,'4166e27942fc490db9dff8258890ea18'),('921f996439ea4fbe866ffc5824249a6b','1.0',0,'fb85b9e65157448fae3acffcc3f573d0'),('923f81d15c764143b0a1c4c07a783a07','5.6',0,'a4c77adf301443ae8d6c94cf2c4cacb2'),('932d4f0e5ce345aab1349d3def9b4d1f','Reflection',0,'8376f95cf2644b059dbcbac754845d24'),('934eb5e9429c41b38ca67c02ccdd0bee','Lagos',0,'d77ec472441547ceb13e6552a01b9ece'),('95b7d4c86b664108ac6e213e18940821','16 cm',0,'6b9e2d9497684e6ea9d85a98686e4dab'),('984c9240b52a41a7ab9fd477b05c6682','Lifting a book from the floor to a table',1,'4166e27942fc490db9dff8258890ea18'),('98925f4fd69b46b3a1d956562b79b09e','going',0,'442278f43a044e6db345fea02a230599'),('9b2c63259ab24851ac0e713a92f62371','Time',1,'7ed9191d0f504c9b82216827d1400140'),('9c59bb9fecd2403eb826b0039356c15d','Mombasa',0,'dbd6ca7146de4c249f045cf7c3e0840b'),('9f7ccc490f144e9eacf2b81a940d9cac','Kinetic energy',1,'1179756083e545619796f298488cc094'),('a0b438d1f6104b16b0b5a7d748d620f8','Metaphor',0,'1e60d0cc29cb4112a282d8fc5a18a19b'),('a3174af9c4114040b0c3cdd0e4a270d7','50',1,'be3213ff2d934dabb9d7707320d89ac5'),('a484e3324fe14ecbbab8ebb46e0941ae','0.90',1,'cd0936ee3de1412da01940c045fcf657'),('a5722e119b044fb09964147c21c3195b','Newton\'s first law of motion',0,'ed69f7c7f7f542e8a29380a9463857da'),('ac8c12a132f04755b8a0f96cd65d3cd6','They decided to light a fire.',0,'24e905ec1c634378bab22aedae81c1d5'),('ad137e7a7bd84b7db47d52ffcf11d392','47',1,'fac2d214c7914186b01f629a5b393794'),('ae2af11b361942ed8b837f8afe881d99','Definitely',0,'fa25160dc5264fb6aa7bd82f3e29dddd'),('aff1a3cb07ab448cb195438e08b5f189','Pascal\'s principle',0,'ed69f7c7f7f542e8a29380a9463857da'),('b293eaacfc294e558044d928a494803b','Tanzania',0,'736570ef75f84f98ac740f8236d5334d'),('b3172ee4f32a40f1ae85f1016af1a484','Pascal (Pa)',0,'3a99cf1a389e4d59bd314572e753e392'),('b3dae7a4765141d6b226de992788c341','Speed = Distance + Time',0,'cd5d34ca7efc4bcb9f1c2d7e82bc5d10'),('b401eda16c824c40b230299271a0bc3f','Newton (N)',1,'3a99cf1a389e4d59bd314572e753e392'),('b94dff2584da4ca19fe1612ed35d89c0','5.5',0,'d013882925234561b5d29a04a9be5279'),('ba464d8b7fc1453385f32943f873ff3f','Interrogative',1,'0fb783f662cf424c90678d54e3b6fb0b'),('bac5fc9acc6141bd97b2017b9f753d97','12x−15',0,'68ab8093d9de4b71b700b98e25fce920'),('bb7245468d92400cbf0c09a11f9bea1b','Distance',1,'7ed9191d0f504c9b82216827d1400140'),('bc19ad4edc4242b5ac9ff352f1f685b2','13',0,'764814d0044c4cc2967d4f3a39df5a0f'),('bf0da459e78c48eeb4910fae709043f8','14x+10',0,'68ab8093d9de4b71b700b98e25fce920'),('bf41775a167e4d70809d499c366236eb','Mwai Kibaki',0,'036b44935d914e1d8f5e6a6b91393f4d'),('c22f5d747b0c46f78666c138f0a51aec','53',0,'301341b4fadb4fe3a7e12d7ad8838f5a'),('c645e8278813403db7e52a76b9ea70f5','-1.0',1,'fb85b9e65157448fae3acffcc3f573d0'),('c6aded622eee45d58686f84803374a09','0.7',0,'cd0936ee3de1412da01940c045fcf657'),('c99ffe65b6db49a0a239a9262254211d','Elastic energy',1,'1179756083e545619796f298488cc094'),('cace4c06dd6e4cec84272e6c5b6b027d','2(3x−4.5)',0,'5a9c9f5568c9453b924b869f9d90ad12'),('ce1216108e6a4b559c4d6fb149077870','The object is decelerating.',0,'5e0e6e28e4884cac802b9234d73b0713'),('ce67b674942644368a1089f220c449b5','50',0,'fac2d214c7914186b01f629a5b393794'),('d0f6bc42570f4b66907ddc0951206e27','3(2x−3)',1,'5a9c9f5568c9453b924b869f9d90ad12'),('d219be0cf2544d6c8f92f30ffa7e00c2','Bernoulli\'s principle',0,'ed69f7c7f7f542e8a29380a9463857da'),('d26dbb8e7a2f4b6aa3d0e08315eb4934','8 cm',1,'6b9e2d9497684e6ea9d85a98686e4dab'),('d2e7cf855f9c45d1978002e09ea14fec','Nairobi',1,'dbd6ca7146de4c249f045cf7c3e0840b'),('d3c9430d0920490f90ac3791f0d41261','Speed = Time / Distance',0,'cd5d34ca7efc4bcb9f1c2d7e82bc5d10'),('d618529c046647cbba9c93b437e254b8','The object has a net force acting on it.',0,'5e0e6e28e4884cac802b9234d73b0713'),('d70227bd3676492c9c43b4f3d74a7369','Joule (J)',0,'3a99cf1a389e4d59bd314572e753e392'),('d7cfdb3b878444bdaf0dacc5a6b9206c','21',0,'b7dd2ade76c74ca79b5a1e7e05f3d4f3'),('d7f04d75544b485da97d4bac150b6c8e','a',0,'09a2d66fb3da419a97b43667a5d4133e'),('d83c05ec6e904399bcada4d6132cbea9','To answer the audience\'s questions',0,'af3da80ca04a4f889a6c1e884c090b12'),('d937765d7c624e54a626f9f867a493ec','Joule (J)',0,'cdb3f3ccbb6c4f15ada67e4639a8dcd4'),('da1a2666b18a48a58ea7e21080bde1c1','Can you light the candle?',0,'24e905ec1c634378bab22aedae81c1d5'),('dab029239ffe4f4dac964bb1504b27f1','1962',0,'cc3ac08a4e454182b2c2aaad8c9b9d1c'),('dcb3428efc8a44d3bf45ddd33a257774','Kelvin (K)',1,'cdb3f3ccbb6c4f15ada67e4639a8dcd4'),('de80b2d7f0c54a81b1e624d2a7f4324a','Kisumu',0,'dbd6ca7146de4c249f045cf7c3e0840b'),('df9dd70328844cb881c9d89b5d08ef23','10',0,'be3213ff2d934dabb9d7707320d89ac5'),('dff2399f266d40b3b03b3070f5d80f7b','Kenya',0,'736570ef75f84f98ac740f8236d5334d'),('e15a9971518b4d1f9a15c246ee11d4b4','They require a medium to travel through.',1,'1f42f0f1969d4940bb99cc3a02cb84ae'),('e2e42b53156f41dba311506c88b9137f','Imperative',0,'0fb783f662cf424c90678d54e3b6fb0b'),('e6d676c2415549bca629094a79ab5094','Diffraction',0,'8376f95cf2644b059dbcbac754845d24'),('e987793ab5e34cbfb70325b34dc4143c','32 cm',0,'6b9e2d9497684e6ea9d85a98686e4dab'),('e9b0b2d864234ff19fe696fbcd63a6e7','30',1,'764814d0044c4cc2967d4f3a39df5a0f'),('eb0a7f77b937455895962428d505e46c','0.9',1,'cd0936ee3de1412da01940c045fcf657'),('ec3c8d69c93740c48c52aee670eaad7a','They travel faster in air than in water.',0,'1f42f0f1969d4940bb99cc3a02cb84ae'),('ed34e19fb3c941e0bb224a9f324b69b8','Speed = Distance × Time',0,'cd5d34ca7efc4bcb9f1c2d7e82bc5d10'),('f060da848ab945f985898d822d02f749','Archimedes\' principle',1,'ed69f7c7f7f542e8a29380a9463857da'),('f2233ec25904488fa189d1c5f9b5f229','Sliding a book across a table with constant velocity',1,'4166e27942fc490db9dff8258890ea18'),('f28bd2f8b4944ed1afb949c82d1cd030','Celsius (°C)',0,'cdb3f3ccbb6c4f15ada67e4639a8dcd4'),('faf92bd0a8ca4744956daaf12ea149e9','Exclamatory',0,'0fb783f662cf424c90678d54e3b6fb0b'),('fb9df51ec0254ced9e04b89aa729c762','Kinshasha',0,'d77ec472441547ceb13e6552a01b9ece');
/*!40000 ALTER TABLE `quiz_option` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `quiz_plannedquiz`
--

DROP TABLE IF EXISTS `quiz_plannedquiz`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `quiz_plannedquiz` (
  `id` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `taken` tinyint(1) NOT NULL,
  `student_id` bigint NOT NULL,
  `quiz_id` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
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
INSERT INTO `quiz_plannedquiz` VALUES ('09930488c0bf4268a43a4fd2c8be81a4',0,4,'3d1bdc47ef6142da88a42c0d865afe76'),('26d468a5e83d4845bd077c340342139a',0,7,'778f2e3b29fe4b2aa7750788e9ed8a9b'),('720ca707d9d74c7ab0fa2624c4da522b',0,11,'43ec6d72a9744064b8bdd92867d590f2'),('de9bd2878b9b47b58c928b3252ad2af4',0,10,'5748b6d45dae4effba3645b11596c115');
/*!40000 ALTER TABLE `quiz_plannedquiz` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `quiz_question`
--

DROP TABLE IF EXISTS `quiz_question`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `quiz_question` (
  `id` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `text` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `marks` int unsigned NOT NULL,
  `quiz_id` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
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
INSERT INTO `quiz_question` VALUES ('036b44935d914e1d8f5e6a6b91393f4d','Who was the second president of Kenya',3,'43ec6d72a9744064b8bdd92867d590f2'),('09a2d66fb3da419a97b43667a5d4133e','3a - a',5,'9595e9dca8fd4bc7ae2720d10fe9a527'),('0fb783f662cf424c90678d54e3b6fb0b','Identify the type of the following sentence: \"Can you pass me the salt?\"',1,'5748b6d45dae4effba3645b11596c115'),('1179756083e545619796f298488cc094','Which of the following are types of energy? (More than one answer can be correct)',2,'3d1bdc47ef6142da88a42c0d865afe76'),('1e60d0cc29cb4112a282d8fc5a18a19b','Identify the figure of speech in the sentence: \"The wind whispered through the trees.\"',1,'5748b6d45dae4effba3645b11596c115'),('1f42f0f1969d4940bb99cc3a02cb84ae','Which of the following statements about sound waves is true?',1,'3d1bdc47ef6142da88a42c0d865afe76'),('24e905ec1c634378bab22aedae81c1d5','In which of the following sentences is the word \"light\" used as a noun?',1,'5748b6d45dae4effba3645b11596c115'),('301341b4fadb4fe3a7e12d7ad8838f5a','How many countries are in Africa',5,'77eb954e58194f08a932e25af81f651b'),('3a99cf1a389e4d59bd314572e753e392','What is the unit of force in the International System of Units (SI)?',1,'3d1bdc47ef6142da88a42c0d865afe76'),('4166e27942fc490db9dff8258890ea18','In which situation is work done on an object? (More than one answer can be correct)',2,'3d1bdc47ef6142da88a42c0d865afe76'),('442278f43a044e6db345fea02a230599','Choose the correct form of the verb to complete the sentence: \"She _____ to the market yesterday.\"',1,'5748b6d45dae4effba3645b11596c115'),('5a9c9f5568c9453b924b869f9d90ad12','Which of the following expressions are equivalent to 6x−9? (Choose all that apply)',2,'2b3e6b8d59404eef9d67c93475480327'),('5e0e6e28e4884cac802b9234d73b0713','If an object is moving at a constant velocity, which of the following statements is true?',1,'3d1bdc47ef6142da88a42c0d865afe76'),('68ab8093d9de4b71b700b98e25fce920','What is the simplified form of the expression 3(4x−5)+2x',2,'2b3e6b8d59404eef9d67c93475480327'),('6b9e2d9497684e6ea9d85a98686e4dab','If the area of a square is  64 cm2, what is the length of one side of the square?',1,'2b3e6b8d59404eef9d67c93475480327'),('6c49ccb5d395437aacec97d00d7c6207','Which of the following words is an antonym for \"beautiful\"?',1,'5748b6d45dae4effba3645b11596c115'),('6ca9e53def5949f7a282042aad469d14','Name three physiological process',3,'058b11ca3d044001b95914e47565c9b6'),('736570ef75f84f98ac740f8236d5334d','Which of the following is not in East Africa',3,'77eb954e58194f08a932e25af81f651b'),('764814d0044c4cc2967d4f3a39df5a0f','49 - 19',5,'778f2e3b29fe4b2aa7750788e9ed8a9b'),('7c0c31cb2e3742a8bb0615ce98496a34','a + a',5,'9595e9dca8fd4bc7ae2720d10fe9a527'),('7ed9191d0f504c9b82216827d1400140','Which of the following are scalar quantities? (More than one answer can be correct)',2,'3d1bdc47ef6142da88a42c0d865afe76'),('8376f95cf2644b059dbcbac754845d24','What is the phenomenon of light bending as it passes from one medium to another called?',1,'3d1bdc47ef6142da88a42c0d865afe76'),('a03dcf5a847e4417b888596671c295ed','What is the main theme of the poem where the speaker reflects on the beauty of nature and its calming effect on the soul?',1,'5748b6d45dae4effba3645b11596c115'),('a4c77adf301443ae8d6c94cf2c4cacb2','3.5 - 2.1',5,'eda5dfeb16c641dbb76f2f1723b76a5e'),('af3da80ca04a4f889a6c1e884c090b12','What is the purpose of using rhetorical questions in a speech?',1,'5748b6d45dae4effba3645b11596c115'),('b7dd2ade76c74ca79b5a1e7e05f3d4f3','Which of the following numbers are prime? (Choose all that apply)',2,'2b3e6b8d59404eef9d67c93475480327'),('be3213ff2d934dabb9d7707320d89ac5','20 + 30',5,'778f2e3b29fe4b2aa7750788e9ed8a9b'),('cc3ac08a4e454182b2c2aaad8c9b9d1c','When did Kenya gain Independence?',3,'43ec6d72a9744064b8bdd92867d590f2'),('cd0936ee3de1412da01940c045fcf657','0.8 + 0.10',5,'eda5dfeb16c641dbb76f2f1723b76a5e'),('cd5d34ca7efc4bcb9f1c2d7e82bc5d10','What is the formula to calculate the speed of an object?',1,'3d1bdc47ef6142da88a42c0d865afe76'),('cdb3f3ccbb6c4f15ada67e4639a8dcd4','What is the SI unit of temperature?',1,'3d1bdc47ef6142da88a42c0d865afe76'),('d013882925234561b5d29a04a9be5279','What is the value of  x in the equation 2x+5=15?',1,'2b3e6b8d59404eef9d67c93475480327'),('d77ec472441547ceb13e6552a01b9ece','What is the capital city of Ghana',7,'77eb954e58194f08a932e25af81f651b'),('dbd6ca7146de4c249f045cf7c3e0840b','What is the capital city of Kenya',3,'43ec6d72a9744064b8bdd92867d590f2'),('ed69f7c7f7f542e8a29380a9463857da','Which principle explains why a ship floats in water?',1,'3d1bdc47ef6142da88a42c0d865afe76'),('fa25160dc5264fb6aa7bd82f3e29dddd','Choose the word that is spelled incorrectly:',1,'5748b6d45dae4effba3645b11596c115'),('fac2d214c7914186b01f629a5b393794','How many counties are there in Kenya?',3,'43ec6d72a9744064b8bdd92867d590f2'),('fb85b9e65157448fae3acffcc3f573d0','5.5 - 6.5',5,'eda5dfeb16c641dbb76f2f1723b76a5e');
/*!40000 ALTER TABLE `quiz_question` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `quiz_quiz`
--

DROP TABLE IF EXISTS `quiz_quiz`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `quiz_quiz` (
  `id` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `time_limit` int unsigned NOT NULL,
  `max_attempts` int unsigned NOT NULL,
  `pass_mark` int unsigned NOT NULL,
  `created_by_id` bigint NOT NULL,
  `subject_id` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
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
INSERT INTO `quiz_quiz` VALUES ('058b11ca3d044001b95914e47565c9b6','Cell physiology','Answer all questions',1,3,80,8,'61aa49a810214000a71ba331d672b324',0,'2024-04-05 06:08:58.093261','2024-04-05 06:08:58.093317'),('2b3e6b8d59404eef9d67c93475480327','Form 1 Maths Test','Testing algebra, geometry, arithmetic operations and sequences',5,3,90,2,'c8331415aacd4fea9c6defab429807e4',1,'2024-04-02 17:10:03.932057','2024-04-02 17:43:38.820694'),('3d1bdc47ef6142da88a42c0d865afe76','Fundamental Concepts','Assessing basic of Physics concepts and principles',10,5,70,3,'37fe3b739b13495cbf6d117a71677d0e',1,'2024-04-01 18:57:57.556269','2024-04-02 17:29:46.371867'),('43ec6d72a9744064b8bdd92867d590f2','History of Kenya','Testing Kenyan History',2,4,70,3,'5958769f0f024759931c67370887263d',1,'2024-03-31 20:25:47.806201','2024-04-11 18:13:39.626378'),('5748b6d45dae4effba3645b11596c115','Form One English Proficiency Assessment','Testing application of basic English language concepts',5,5,80,2,'8246d936e928470cbe2a718d48c19943',1,'2024-04-02 16:51:11.360046','2024-04-15 17:38:57.858519'),('778f2e3b29fe4b2aa7750788e9ed8a9b','Numbers','NATURAL NUMBERS',1,3,80,3,'c8331415aacd4fea9c6defab429807e4',1,'2024-03-31 20:25:47.806201','2024-04-03 19:43:14.664995'),('77eb954e58194f08a932e25af81f651b','Africa','Testing African Location',5,4,65,3,'5958769f0f024759931c67370887263d',1,'2024-03-31 20:25:47.806201','2024-04-02 17:30:15.151061'),('9595e9dca8fd4bc7ae2720d10fe9a527','Algebra','Testing algebra',1,3,80,2,'c8331415aacd4fea9c6defab429807e4',0,'2024-04-07 21:15:55.639795','2024-04-08 15:15:31.849184'),('eda5dfeb16c641dbb76f2f1723b76a5e','Decimals','Testing decimals',4,3,70,2,'c8331415aacd4fea9c6defab429807e4',1,'2024-03-31 20:25:47.806201','2024-04-02 17:56:58.723957');
/*!40000 ALTER TABLE `quiz_quiz` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `quiz_quizattempt`
--

DROP TABLE IF EXISTS `quiz_quizattempt`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `quiz_quizattempt` (
  `id` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `score` int unsigned NOT NULL,
  `percentage_score` int unsigned NOT NULL,
  `passed` tinyint(1) NOT NULL,
  `date_attempted` datetime(6) NOT NULL,
  `start_time` datetime(6) DEFAULT NULL,
  `end_time` datetime(6) DEFAULT NULL,
  `expired` tinyint(1) NOT NULL,
  `quiz_id` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
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
INSERT INTO `quiz_quizattempt` VALUES ('007e4af43e574f74ab6a4f3550e404ec',10,67,0,'2024-04-04 10:30:39.456249','2024-04-04 10:30:39.455449','2024-04-04 10:31:13.666712',1,'eda5dfeb16c641dbb76f2f1723b76a5e',4),('022740595c2147a3be6b40cb4d84a1e9',10,67,0,'2024-04-04 17:35:49.151308','2024-04-04 17:35:49.150976','2024-04-04 17:36:07.549506',0,'eda5dfeb16c641dbb76f2f1723b76a5e',7),('062f9c4f3a7a45519b2b000065e4a20c',15,100,1,'2024-04-04 17:37:27.885591','2024-04-04 17:37:27.884962','2024-04-04 17:37:39.565556',0,'77eb954e58194f08a932e25af81f651b',7),('090ea6535afb4ee9b04dd7187b41dfe1',15,100,1,'2024-04-15 19:08:35.789569','2024-04-15 19:08:35.789020','2024-04-15 19:09:26.882601',0,'eda5dfeb16c641dbb76f2f1723b76a5e',11),('14db95ceace047168ba9c3ffe616fb59',6,75,0,'2024-04-02 18:50:50.831525','2024-04-02 18:50:50.830908','2024-04-02 18:51:29.050622',0,'2b3e6b8d59404eef9d67c93475480327',7),('19528c5650294a048320fc0957d3eda3',0,0,0,'2024-04-05 06:10:39.018250','2024-04-05 06:10:39.017839','2024-04-05 06:10:43.475649',0,'058b11ca3d044001b95914e47565c9b6',8),('1c0092c14d3d4c2a9cb77503ceae8c67',6,75,0,'2024-04-02 17:48:23.493200','2024-04-02 17:48:23.492844','2024-04-02 17:48:41.178929',1,'2b3e6b8d59404eef9d67c93475480327',4),('4060b83c5c6143578efb2d3c2ef3a73e',8,100,1,'2024-04-02 18:51:34.613440','2024-04-02 18:51:34.612898','2024-04-02 18:51:49.439133',0,'2b3e6b8d59404eef9d67c93475480327',7),('411f2e6ab2c64a61b94d5336352f100b',12,100,1,'2024-09-11 04:46:25.184844','2024-09-11 04:46:25.184311','2024-09-11 04:46:41.197383',0,'43ec6d72a9744064b8bdd92867d590f2',4),('41dc6828209d4ac9aeaf6fd97abefefb',5,50,0,'2024-04-04 17:33:18.788643','2024-04-04 17:33:18.788112','2024-04-04 17:33:25.505059',0,'778f2e3b29fe4b2aa7750788e9ed8a9b',4),('5911f5a3edaf49c0b5805286aefb9379',12,100,1,'2024-04-02 17:47:12.280226','2024-04-02 17:47:12.279475','2024-04-02 17:47:31.461104',0,'43ec6d72a9744064b8bdd92867d590f2',4),('6709165421564b9498b73529a777c86e',8,100,1,'2024-04-04 10:26:53.855819','2024-04-04 10:26:53.855472','2024-04-04 10:27:23.628790',0,'2b3e6b8d59404eef9d67c93475480327',4),('820443c8e6f2442ca716ded509b0c506',15,100,1,'2024-04-04 17:36:16.864460','2024-04-04 17:36:16.863973','2024-04-04 17:36:27.728889',0,'eda5dfeb16c641dbb76f2f1723b76a5e',7),('868f997b7dcd47f8a78415e5b8ffbedc',8,100,1,'2024-04-02 17:48:51.642558','2024-04-02 17:48:51.642213','2024-04-02 17:49:09.989267',1,'2b3e6b8d59404eef9d67c93475480327',4),('96cc28fd60f94774812cd15a1e9a5e7e',0,0,0,'2024-04-02 19:33:37.733471','2024-04-02 19:33:37.733113','2024-04-02 19:37:41.999667',1,'eda5dfeb16c641dbb76f2f1723b76a5e',7),('9c31b76661514151b5bd51d8bff670a4',10,67,0,'2024-04-08 15:44:55.595724','2024-04-08 15:44:55.595159','2024-04-08 15:46:49.591423',0,'eda5dfeb16c641dbb76f2f1723b76a5e',11),('9e4a3f227a7a44d89389b3c0721c1e51',6,75,0,'2024-04-04 10:24:42.653606','2024-04-04 10:24:42.652838','2024-04-04 10:25:21.983431',0,'2b3e6b8d59404eef9d67c93475480327',4),('a3eccf204736412ea843b143f597d227',6,75,0,'2024-04-04 10:25:39.069562','2024-04-04 10:25:39.069042','2024-04-04 10:26:25.062727',0,'2b3e6b8d59404eef9d67c93475480327',4),('a59c2ff0854b4b0587cbd00d04971595',0,0,0,'2024-04-07 01:45:34.624310','2024-04-07 01:45:34.623872',NULL,0,'5748b6d45dae4effba3645b11596c115',10),('aae263c7b50c4e2f9df04dff7494190c',10,67,0,'2024-04-02 17:57:12.463637','2024-04-02 17:57:12.463155','2024-04-02 17:57:19.238436',1,'eda5dfeb16c641dbb76f2f1723b76a5e',7),('bb83852d8db74811a3072697c52b0f0e',10,67,0,'2024-04-04 10:31:27.082316','2024-04-04 10:31:27.081950','2024-04-04 10:31:39.653156',1,'eda5dfeb16c641dbb76f2f1723b76a5e',4),('be60e2c0cd9b4b9d9289c047783b7801',10,67,0,'2024-04-04 17:35:21.175972','2024-04-04 17:35:21.175605','2024-04-04 17:35:38.280204',0,'eda5dfeb16c641dbb76f2f1723b76a5e',7),('c2035039603e4124a4052b187a81784e',12,100,1,'2024-04-02 18:53:20.029477','2024-04-02 18:53:20.029010','2024-04-02 18:53:32.089489',0,'43ec6d72a9744064b8bdd92867d590f2',7),('c84126950d524914883296c0e82dacbf',15,100,1,'2024-04-02 17:57:24.577012','2024-04-02 17:57:24.576511','2024-04-02 17:57:31.500630',1,'eda5dfeb16c641dbb76f2f1723b76a5e',7),('d3a7d20476aa49afb1fc8e0b2dc4786f',10,100,1,'2024-04-04 17:33:31.025682','2024-04-04 17:33:31.025274','2024-04-04 17:33:35.061902',0,'778f2e3b29fe4b2aa7750788e9ed8a9b',4),('db07537fb1a74df89947297417fec95b',8,53,0,'2024-04-04 17:37:06.325839','2024-04-04 17:37:06.325117','2024-04-04 17:37:17.210364',0,'77eb954e58194f08a932e25af81f651b',7),('f660ec7e07bf425790901f641ab570b7',5,33,0,'2024-04-04 10:29:57.230278','2024-04-04 10:29:57.229880','2024-04-04 10:30:15.566762',1,'eda5dfeb16c641dbb76f2f1723b76a5e',4),('f879f77bf6cd41f798ec6ddb743fb837',9,75,1,'2024-04-02 18:52:32.687409','2024-04-02 18:52:32.686947','2024-04-02 18:52:46.410920',0,'43ec6d72a9744064b8bdd92867d590f2',7),('fd87c719ca5340f1822070127d6567cc',6,75,0,'2024-04-04 10:17:43.780464','2024-04-04 10:17:43.779703','2024-04-04 10:22:45.997116',1,'2b3e6b8d59404eef9d67c93475480327',4);
/*!40000 ALTER TABLE `quiz_quizattempt` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `quiz_subject`
--

DROP TABLE IF EXISTS `quiz_subject`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `quiz_subject` (
  `id` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `quiz_subject`
--

LOCK TABLES `quiz_subject` WRITE;
/*!40000 ALTER TABLE `quiz_subject` DISABLE KEYS */;
INSERT INTO `quiz_subject` VALUES ('0348d1a120484fc4a29382378efd29e3','Chemistry'),('07ffd89ed5744549bbb01d610a7682b5','Business'),('351ea01a1d0b4096b943229e7e73b6f3','Computer'),('355524c0b55e44dd96003f1fb758859f','Science'),('37fe3b739b13495cbf6d117a71677d0e','Physics'),('5737f2cdd06a443982ed653627f0f6af','General'),('57edddd1faae45949c406a14dcecff20','Social Studies'),('5958769f0f024759931c67370887263d','History'),('61aa49a810214000a71ba331d672b324','Biology'),('7b276e5e2ae04db8b6c26105be616732','CRE'),('8137369fcdab4707ba4c344a052a2683','Agriculture'),('8246d936e928470cbe2a718d48c19943','English'),('84b5db6a189742b39f33613eff600421','Geography'),('a483607ad70b447c8e6d9b4c09b85baf','Kiswahili'),('b61763a3e73a4db1933fa72b63de1d9b','Home Science'),('bf70bee903884b79b594a53210c84f01','Music'),('c8331415aacd4fea9c6defab429807e4','Maths'),('cf1259890e45469fa9141b1ed75f244d','French'),('d1360892d313406bbf84a0229c032789','IRE'),('eff3d8c516bb432e85f89f063ffa7000','Life Skills');
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

-- Dump completed on 2024-09-29 10:43:05
