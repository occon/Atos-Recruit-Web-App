CREATE DATABASE  IF NOT EXISTS `atos_bd` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `atos_bd`;
-- MySQL dump 10.13  Distrib 8.0.29, for macos12 (x86_64)
--
-- Host: localhost    Database: atos_bd
-- ------------------------------------------------------
-- Server version	8.0.29

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
-- Table structure for table `Administrador`
--

DROP TABLE IF EXISTS `Administrador`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Administrador` (
  `id_admin` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(200) NOT NULL,
  `apellido` varchar(100) NOT NULL,
  `user` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  PRIMARY KEY (`id_admin`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Administrador`
--

LOCK TABLES `Administrador` WRITE;
/*!40000 ALTER TABLE `Administrador` DISABLE KEYS */;
INSERT INTO `Administrador` VALUES (1,'Hugo','Palomares','hugo','abc'),(2,'Katia','Gonzalez','katia','def');
/*!40000 ALTER TABLE `Administrador` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Aplicante`
--

DROP TABLE IF EXISTS `Aplicante`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Aplicante` (
  `id_aplicante` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(200) NOT NULL,
  `apellido` varchar(100) NOT NULL,
  `correo` varchar(100) NOT NULL,
  `cv_existe` tinyint NOT NULL,
  `vj_terminado` tinyint NOT NULL,
  `status_ap` tinyint NOT NULL,
  PRIMARY KEY (`id_aplicante`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Aplicante`
--

LOCK TABLES `Aplicante` WRITE;
/*!40000 ALTER TABLE `Aplicante` DISABLE KEYS */;
INSERT INTO `Aplicante` VALUES (1,'Hugo','Palomares','h.palomares@atos.com',1,1,1),(5,'Katia','Gonzalez','katiagzz@atos.com',0,0,0),(8,'Arturo','Garza','arturogarza@atos.com',1,0,0),(11,'David','Gonzalez','dg@gmail.com',0,0,0),(12,'Maritza','Torres','maritzatf@gmail.com',1,0,0);
/*!40000 ALTER TABLE `Aplicante` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Aplicante_Habilidad`
--

DROP TABLE IF EXISTS `Aplicante_Habilidad`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Aplicante_Habilidad` (
  `id_habilidad` int NOT NULL AUTO_INCREMENT,
  `id_aplicante` int NOT NULL,
  `habilidad` varchar(100) DEFAULT NULL,
  `porcentaje` int DEFAULT NULL,
  PRIMARY KEY (`id_habilidad`),
  KEY `id_aplicante_idx` (`id_aplicante`),
  CONSTRAINT `id_aplicante` FOREIGN KEY (`id_aplicante`) REFERENCES `Aplicante` (`id_aplicante`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Aplicante_Habilidad`
--

LOCK TABLES `Aplicante_Habilidad` WRITE;
/*!40000 ALTER TABLE `Aplicante_Habilidad` DISABLE KEYS */;
INSERT INTO `Aplicante_Habilidad` VALUES (1,1,'c#',87),(2,8,'C#',76),(5,12,'Bitchin',100);
/*!40000 ALTER TABLE `Aplicante_Habilidad` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Aplicante_Idioma`
--

DROP TABLE IF EXISTS `Aplicante_Idioma`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Aplicante_Idioma` (
  `id_aplicante` int NOT NULL,
  `id_idioma` int NOT NULL,
  `porcentaje` int DEFAULT NULL,
  PRIMARY KEY (`id_aplicante`,`id_idioma`),
  KEY `id_aplicante_idx` (`id_aplicante`),
  KEY `id_idioma_idx` (`id_idioma`),
  CONSTRAINT `aplicante_idioma_ibfk_1` FOREIGN KEY (`id_aplicante`) REFERENCES `Aplicante` (`id_aplicante`),
  CONSTRAINT `id_idioma` FOREIGN KEY (`id_idioma`) REFERENCES `Idioma` (`id_idioma`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Aplicante_Idioma`
--

LOCK TABLES `Aplicante_Idioma` WRITE;
/*!40000 ALTER TABLE `Aplicante_Idioma` DISABLE KEYS */;
INSERT INTO `Aplicante_Idioma` VALUES (1,34,100),(8,14,100),(12,34,100);
/*!40000 ALTER TABLE `Aplicante_Idioma` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Aplicante_Perfiles`
--

DROP TABLE IF EXISTS `Aplicante_Perfiles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Aplicante_Perfiles` (
  `id_aplicante` int NOT NULL,
  `id_perfil` int NOT NULL,
  PRIMARY KEY (`id_perfil`,`id_aplicante`),
  KEY `id_aplicante_idx` (`id_aplicante`),
  CONSTRAINT `aplicante_perfiles_ibfk_1` FOREIGN KEY (`id_aplicante`) REFERENCES `Aplicante` (`id_aplicante`),
  CONSTRAINT `id_perfil` FOREIGN KEY (`id_perfil`) REFERENCES `Perfil` (`id_perfil`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Aplicante_Perfiles`
--

LOCK TABLES `Aplicante_Perfiles` WRITE;
/*!40000 ALTER TABLE `Aplicante_Perfiles` DISABLE KEYS */;
INSERT INTO `Aplicante_Perfiles` VALUES (1,4),(8,3),(12,3);
/*!40000 ALTER TABLE `Aplicante_Perfiles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Aplicante_Redes`
--

DROP TABLE IF EXISTS `Aplicante_Redes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Aplicante_Redes` (
  `id_ap_red` int NOT NULL AUTO_INCREMENT,
  `id_aplicante` int NOT NULL,
  `id_red` int DEFAULT NULL,
  `usuario` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id_ap_red`,`id_aplicante`),
  KEY `id_aplicante` (`id_aplicante`),
  KEY `id_red` (`id_red`),
  CONSTRAINT `aplicante_redes_ibfk_1` FOREIGN KEY (`id_aplicante`) REFERENCES `Aplicante` (`id_aplicante`),
  CONSTRAINT `id_red` FOREIGN KEY (`id_red`) REFERENCES `Redes_sociales` (`id_red`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Aplicante_Redes`
--

LOCK TABLES `Aplicante_Redes` WRITE;
/*!40000 ALTER TABLE `Aplicante_Redes` DISABLE KEYS */;
INSERT INTO `Aplicante_Redes` VALUES (2,1,3,'occon'),(3,8,4,'Arturo Garza'),(6,12,1,'maritzatf');
/*!40000 ALTER TABLE `Aplicante_Redes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Edo_civil`
--

DROP TABLE IF EXISTS `Edo_civil`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Edo_civil` (
  `id_edocivil` int NOT NULL,
  `edo_civil` varchar(100) NOT NULL,
  PRIMARY KEY (`id_edocivil`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Edo_civil`
--

LOCK TABLES `Edo_civil` WRITE;
/*!40000 ALTER TABLE `Edo_civil` DISABLE KEYS */;
INSERT INTO `Edo_civil` VALUES (1,'Single'),(2,'Married'),(3,'Separated'),(4,'Divorced'),(5,'Widowed');
/*!40000 ALTER TABLE `Edo_civil` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Entidad_Educativa`
--

DROP TABLE IF EXISTS `Entidad_Educativa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Entidad_Educativa` (
  `id_entidad` int NOT NULL AUTO_INCREMENT,
  `id_aplicante` int NOT NULL,
  `entidad_educativa` varchar(100) NOT NULL,
  `localidad` varchar(100) NOT NULL,
  `carrera` varchar(100) NOT NULL,
  `campo_estudio` varchar(250) NOT NULL,
  `mes_fin` int NOT NULL,
  `anio_fin` int NOT NULL,
  PRIMARY KEY (`id_entidad`,`id_aplicante`),
  KEY `id_aplicante` (`id_aplicante`),
  CONSTRAINT `entidad_educativa_ibfk_1` FOREIGN KEY (`id_aplicante`) REFERENCES `Aplicante` (`id_aplicante`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Entidad_Educativa`
--

LOCK TABLES `Entidad_Educativa` WRITE;
/*!40000 ALTER TABLE `Entidad_Educativa` DISABLE KEYS */;
INSERT INTO `Entidad_Educativa` VALUES (1,1,'ITESM','Monterrey','ITC','Engineering',6,2024),(3,8,'ITESM','Monterrey','ITC','STEM',0,2024),(6,12,'p','p','p','p',2,2022);
/*!40000 ALTER TABLE `Entidad_Educativa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Experiencia`
--

DROP TABLE IF EXISTS `Experiencia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Experiencia` (
  `id_experiencia` int NOT NULL AUTO_INCREMENT,
  `id_aplicante` int NOT NULL,
  `puesto` varchar(100) DEFAULT NULL,
  `descripcion` varchar(250) DEFAULT NULL,
  `empresa` varchar(100) DEFAULT NULL,
  `ciudad` varchar(150) DEFAULT NULL,
  `id_pais` int DEFAULT NULL,
  `mes_inicio` int DEFAULT NULL,
  `anio_inicio` int DEFAULT NULL,
  `mes_fin` int DEFAULT NULL,
  `anio_fin` int DEFAULT NULL,
  PRIMARY KEY (`id_experiencia`,`id_aplicante`),
  KEY `id_pais_idx` (`id_pais`),
  KEY `id_aplicante` (`id_aplicante`),
  CONSTRAINT `experiencia_ibfk_2` FOREIGN KEY (`id_pais`) REFERENCES `Pais` (`id_pais`),
  CONSTRAINT `experiencia_ibfk_3` FOREIGN KEY (`id_aplicante`) REFERENCES `Aplicante` (`id_aplicante`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Experiencia`
--

LOCK TABLES `Experiencia` WRITE;
/*!40000 ALTER TABLE `Experiencia` DISABLE KEYS */;
INSERT INTO `Experiencia` VALUES (2,1,'Web Developer','','ITESM','Monterrey',64,1,2020,1,2022),(4,8,'Unity Developer','','Atos','Monterrey',64,0,2022,0,2022),(7,12,'p','a','p','p',5,4,2020,3,2022);
/*!40000 ALTER TABLE `Experiencia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Genero`
--

DROP TABLE IF EXISTS `Genero`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Genero` (
  `id_genero` int NOT NULL,
  `genero` varchar(100) NOT NULL,
  PRIMARY KEY (`id_genero`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Genero`
--

LOCK TABLES `Genero` WRITE;
/*!40000 ALTER TABLE `Genero` DISABLE KEYS */;
INSERT INTO `Genero` VALUES (1,'Male'),(2,'Female'),(3,'Prefer not to say');
/*!40000 ALTER TABLE `Genero` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Idioma`
--

DROP TABLE IF EXISTS `Idioma`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Idioma` (
  `id_idioma` int NOT NULL AUTO_INCREMENT,
  `idioma` varchar(100) NOT NULL,
  PRIMARY KEY (`id_idioma`)
) ENGINE=InnoDB AUTO_INCREMENT=96 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Idioma`
--

LOCK TABLES `Idioma` WRITE;
/*!40000 ALTER TABLE `Idioma` DISABLE KEYS */;
INSERT INTO `Idioma` VALUES (1,'Afrikaans'),(2,'Albanian'),(3,'Arabic'),(4,'Armenian'),(5,'Azerbaijani'),(6,'Basque'),(7,'Belarusian'),(8,'Bengali'),(9,'Bosnian'),(10,'Bulgarian'),(11,'Catalan'),(12,'Cebuano'),(13,'Chichewa'),(14,'Chinese'),(15,'Croatian'),(16,'Czech'),(17,'Danish'),(18,'Dutch'),(19,'English'),(20,'Esperanto'),(21,'Estonian'),(22,'Filipino'),(23,'Finnish'),(24,'French'),(25,'Galician'),(26,'Georgian'),(27,'German'),(28,'Greek'),(29,'Gujarati'),(30,'Haitian Creole'),(31,'Hausa'),(32,'Hawaiian'),(33,'Hebrew'),(34,'High Valyrian'),(35,'Hindi'),(36,'Hmong'),(37,'Hungarian'),(38,'Icelandic'),(39,'Iqbo'),(40,'Indonesian'),(41,'Irish'),(42,'Italian'),(43,'Japanese'),(44,'Javanese'),(45,'Kannada'),(46,'Kazakh'),(47,'Khmer'),(48,'Klingon'),(49,'Korean'),(50,'Lao'),(51,'Latin'),(52,'Latvian'),(53,'Lithuanian'),(54,'Macedonian'),(55,'Malagasy'),(56,'Malay'),(57,'Malayalam'),(58,'Maltese'),(59,'Maori'),(60,'Marathi'),(61,'Mongoloian'),(62,'Myanmar'),(63,'Nepali'),(64,'Norwegian'),(65,'Persian'),(66,'Polish'),(67,'Portuquese'),(68,'Punjabi'),(69,'Romanian'),(70,'Russian'),(71,'Scottish Gaelic'),(72,'Serbian'),(73,'Sesotho'),(74,'Sinhala'),(75,'Slovak'),(76,'Slovenian'),(77,'Somali'),(78,'Spanish'),(79,'Sudanese'),(80,'Swahili'),(81,'Swedish'),(82,'Tajik'),(83,'Tamil'),(84,'Telugu'),(85,'Thai'),(86,'Turkish'),(87,'Ukrainian'),(88,'Uzbek'),(89,'Urdu'),(90,'Vietnamese'),(91,'Welsh'),(92,'Yiddish'),(93,'Yoruba'),(94,'Zulu');
/*!40000 ALTER TABLE `Idioma` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Info_personal`
--

DROP TABLE IF EXISTS `Info_personal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Info_personal` (
  `id_aplicante` int NOT NULL,
  `nacimiento` date DEFAULT NULL,
  `id_edocivil` int DEFAULT NULL,
  `id_genero` int DEFAULT NULL,
  `id_nacionalidad` int DEFAULT NULL,
  `direccion` varchar(250) DEFAULT NULL,
  `zip_code` int DEFAULT NULL,
  `ciudad` varchar(150) DEFAULT NULL,
  `estado` varchar(150) DEFAULT NULL,
  `id_pais` int DEFAULT NULL,
  `telefono` double DEFAULT NULL,
  `sobre_mi` varchar(250) DEFAULT NULL,
  `segundo_Nombre` varchar(100) DEFAULT NULL,
  `segundo_Apellido` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id_aplicante`),
  KEY `id_edocivil_idx` (`id_edocivil`),
  KEY `id_genero_idx` (`id_genero`),
  KEY `id_nacionalidad_idx` (`id_nacionalidad`),
  KEY `id_pais_idx` (`id_pais`),
  CONSTRAINT `id_edocivil` FOREIGN KEY (`id_edocivil`) REFERENCES `Edo_civil` (`id_edocivil`),
  CONSTRAINT `id_genero` FOREIGN KEY (`id_genero`) REFERENCES `Genero` (`id_genero`),
  CONSTRAINT `id_nacionalidad` FOREIGN KEY (`id_nacionalidad`) REFERENCES `Nacionalidad` (`id_nacionalidad`),
  CONSTRAINT `id_pais` FOREIGN KEY (`id_pais`) REFERENCES `Pais` (`id_pais`),
  CONSTRAINT `info_personal_ibfk_1` FOREIGN KEY (`id_aplicante`) REFERENCES `Aplicante` (`id_aplicante`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Info_personal`
--

LOCK TABLES `Info_personal` WRITE;
/*!40000 ALTER TABLE `Info_personal` DISABLE KEYS */;
INSERT INTO `Info_personal` VALUES (1,'2001-11-29',2,1,30,'Rio de Janeiro 102',64840,'Monterrey','Nuevo Leon',64,6679968847,'About me.','Edgar','Estrella'),(8,'1999-12-22',1,1,64,'Eugenio Garza Sada 129',64800,'Monterrey','Nuevo Leon',64,12345678,'','','Campusano'),(12,'2002-11-05',1,2,102,'Sesame Street 123',66779,'Chicago','Illinois',102,12345678,'im a bitch','','');
/*!40000 ALTER TABLE `Info_personal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Juego`
--

DROP TABLE IF EXISTS `Juego`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Juego` (
  `id_juego` int NOT NULL AUTO_INCREMENT,
  `id_aplicante` int NOT NULL,
  `id_perfil` int NOT NULL,
  `tiempo` int DEFAULT NULL,
  `puntuacion` int NOT NULL,
  `fecha_juego` date DEFAULT NULL,
  PRIMARY KEY (`id_juego`),
  KEY `id_perfil` (`id_perfil`),
  KEY `id_aplicante` (`id_aplicante`),
  CONSTRAINT `juego_ibfk_2` FOREIGN KEY (`id_perfil`) REFERENCES `Perfil` (`id_perfil`),
  CONSTRAINT `juego_ibfk_3` FOREIGN KEY (`id_aplicante`) REFERENCES `Aplicante` (`id_aplicante`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Juego`
--

LOCK TABLES `Juego` WRITE;
/*!40000 ALTER TABLE `Juego` DISABLE KEYS */;
INSERT INTO `Juego` VALUES (1,1,4,NULL,16,NULL),(2,8,3,NULL,0,NULL),(5,12,3,NULL,0,NULL);
/*!40000 ALTER TABLE `Juego` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Nacionalidad`
--

DROP TABLE IF EXISTS `Nacionalidad`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Nacionalidad` (
  `id_nacionalidad` int NOT NULL AUTO_INCREMENT,
  `nacionalidad` varchar(100) NOT NULL,
  PRIMARY KEY (`id_nacionalidad`)
) ENGINE=InnoDB AUTO_INCREMENT=109 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Nacionalidad`
--

LOCK TABLES `Nacionalidad` WRITE;
/*!40000 ALTER TABLE `Nacionalidad` DISABLE KEYS */;
INSERT INTO `Nacionalidad` VALUES (1,'Afghan'),(2,'Algerian'),(3,'Angolan'),(4,'Argentine'),(5,'Austrian'),(6,'Australian'),(7,'Bangladeshi'),(8,'Belarusian'),(9,'Belgian'),(10,'Bolivian'),(11,'Bosnian/Herzegovinian'),(12,'Brazilian'),(13,'British'),(14,'Bulgarian'),(15,'Cambodian'),(16,'Cameroonian'),(17,'Canadian'),(18,'Central African'),(19,'Chadian'),(20,'Chinese'),(21,'Colombian'),(22,'Costa Rican'),(23,'Croatian'),(24,'Czech'),(25,'Congolese'),(26,'Danish'),(27,'Ecuadorian'),(28,'Egyptian'),(29,'Salvadoran'),(30,'English'),(31,'Estonian'),(32,'Ethiopian'),(33,'Finnish'),(34,'French'),(35,'German'),(36,'Ghanaian'),(37,'Greek'),(38,'Guatemalan'),(39,'Dutch'),(40,'Honduran'),(41,'Hungarian'),(42,'Icelandic'),(43,'Indian'),(44,'Indonesian'),(45,'Iranian'),(46,'Iraqi'),(47,'Irish'),(48,'Israeli'),(49,'Italian'),(50,'Ivorian'),(51,'Jamaican'),(52,'Japanese'),(53,'Jordanian'),(54,'Kazakh'),(55,'Kenyan'),(56,'Lao'),(57,'Latvian'),(58,'Libyan'),(59,'Lithuanian'),(60,'Malagasy'),(61,'Malaysian'),(62,'Malian'),(63,'Mauritanian'),(64,'Mexican'),(65,'Moroccan'),(66,'Namibian'),(67,'New Zealand'),(68,'Nicaraguan'),(69,'Nigerien'),(70,'Nigerian'),(71,'Norwegian'),(72,'Omani'),(73,'Pakistani'),(74,'Panamanian'),(75,'Paraguayan'),(76,'Peruvian'),(77,'Philippine'),(78,'Polish'),(79,'Portuguese'),(80,'Congolese'),(81,'Romanian'),(82,'Russian'),(83,'Saudi, Saudi Arabian'),(84,'Scottish'),(85,'Senegalese'),(86,'Serbian'),(87,'Singaporean'),(88,'Slovak'),(89,'Somalian'),(90,'South African'),(91,'Spanish'),(92,'Sudanese'),(93,'Swedish'),(94,'Swiss'),(95,'Syrian'),(96,'Thai'),(97,'Tunisian'),(98,'Turkish'),(99,'Turkmen'),(100,'Ukranian'),(101,'Emirati'),(102,'American'),(103,'Uruguayan'),(104,'Vietnamese'),(105,'Welsh'),(106,'Zambian'),(107,'Zimbabwean');
/*!40000 ALTER TABLE `Nacionalidad` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Pais`
--

DROP TABLE IF EXISTS `Pais`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Pais` (
  `id_pais` int NOT NULL AUTO_INCREMENT,
  `pais` varchar(100) NOT NULL,
  PRIMARY KEY (`id_pais`)
) ENGINE=InnoDB AUTO_INCREMENT=109 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Pais`
--

LOCK TABLES `Pais` WRITE;
/*!40000 ALTER TABLE `Pais` DISABLE KEYS */;
INSERT INTO `Pais` VALUES (1,'Afghanistan'),(2,'Algeria'),(3,'Angola'),(4,'Argentina'),(5,'Austria'),(6,'Australia'),(7,'Bangladesh'),(8,'Belarus'),(9,'Belgium'),(10,'Bolivia'),(11,'Bosnia and Herzegovina'),(12,'Brazil'),(13,'Britain'),(14,'Bulgaria'),(15,'Cambodia'),(16,'Cameroon'),(17,'Canada'),(18,'Central African Republic'),(19,'Chad'),(20,'China'),(21,'Colombia'),(22,'Costa Rica'),(23,'Croatia'),(24,'the Czech Republic'),(25,'Democratic Republic of the Congo'),(26,'Denmark'),(27,'Ecuador'),(28,'Egypt'),(29,'El Salvador'),(30,'England'),(31,'Estonia'),(32,'Ethiopia'),(33,'Finland'),(34,'France'),(35,'Germany'),(36,'Ghana'),(37,'Greece'),(38,'Guatemala'),(39,'Holland'),(40,'Honduras'),(41,'Hungary'),(42,'Iceland'),(43,'India'),(44,'Indonesia'),(45,'Iran'),(46,'Iraq'),(47,'Ireland'),(48,'Israel'),(49,'Italy'),(50,'Ivory Coast'),(51,'Jamaica'),(52,'Japan'),(53,'Jordan'),(54,'Kazakhstan'),(55,'Kenya'),(56,'Laos'),(57,'Latvia'),(58,'Libya'),(59,'Lithuania'),(60,'Madagascar'),(61,'Malaysia'),(62,'Mali'),(63,'Mauritania'),(64,'Mexico'),(65,'Morocco'),(66,'Namibia'),(67,'New Zealand'),(68,'Nicaragua'),(69,'Niger'),(70,'Nigeria'),(71,'Norway'),(72,'Oman'),(73,'Pakistan'),(74,'Panama'),(75,'Paraguay'),(76,'Peru'),(77,'The Philippines'),(78,'Poland'),(79,'Portugal'),(80,'Republic of the Congo'),(81,'Romania'),(82,'Russia'),(83,'Saudi Arabia'),(84,'Scotland'),(85,'Senegal'),(86,'Serbia'),(87,'Singapore'),(88,'Slovakia'),(89,'Somalia'),(90,'South Africa'),(91,'Spain'),(92,'Sudan'),(93,'Sweden'),(94,'Switzerland'),(95,'Syria'),(96,'Thailand'),(97,'Tunisia'),(98,'Turkey'),(99,'Turkmenistan'),(100,'Ukraine'),(101,'The United Arab Emirates'),(102,'The United States'),(103,'Uruguay'),(104,'Vietnam'),(105,'Wales'),(106,'Zambia'),(107,'Zimbabwe');
/*!40000 ALTER TABLE `Pais` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Perfil`
--

DROP TABLE IF EXISTS `Perfil`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Perfil` (
  `id_perfil` int NOT NULL,
  `perfil` varchar(100) NOT NULL,
  PRIMARY KEY (`id_perfil`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Perfil`
--

LOCK TABLES `Perfil` WRITE;
/*!40000 ALTER TABLE `Perfil` DISABLE KEYS */;
INSERT INTO `Perfil` VALUES (1,'Data Scientist'),(2,'Data Engineer'),(3,'Java Developer'),(4,'.Net Developer'),(5,'QA Automation'),(6,'Front End Developer');
/*!40000 ALTER TABLE `Perfil` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Preguntas`
--

DROP TABLE IF EXISTS `Preguntas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Preguntas` (
  `id_pregunta` int unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) DEFAULT NULL,
  `respuesta` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_pregunta`),
  UNIQUE KEY `id_pregunta_UNIQUE` (`id_pregunta`)
) ENGINE=InnoDB AUTO_INCREMENT=121 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Preguntas`
--

LOCK TABLES `Preguntas` WRITE;
/*!40000 ALTER TABLE `Preguntas` DISABLE KEYS */;
INSERT INTO `Preguntas` VALUES (1,'DE_Question1','b'),(2,'DE_Question2','d'),(3,'DE_Question3','c'),(4,'DE_Question4','a'),(5,'DE_Question5','a'),(6,'DE_Question6','b'),(7,'DE_Question7','c'),(8,'DE_Question8','d'),(9,'DE_Question9','d'),(10,'DE_Question10','b'),(11,'DE_Question11','a'),(12,'DE_Question12','d'),(13,'DE_Question13','c'),(14,'DE_Question14','b'),(15,'DE_Question15','c'),(16,'DE_Question16','a'),(17,'DE_Question17','d'),(18,'DE_Question18','c'),(19,'DE_Question19','b'),(20,'DE_Question20','a'),(21,'DS_Question1','b'),(22,'DS_Question2','d'),(23,'DS_Question3','c'),(24,'DS_Question4','c'),(25,'DS_Question5','d'),(26,'DS_Question6','a'),(27,'DS_Question7','c'),(28,'DS_Question8','b'),(29,'DS_Question9','c'),(30,'DS_Question10','a'),(31,'DS_Question11','d'),(32,'DS_Question12','c'),(33,'DS_Question13','a'),(34,'DS_Question14','b'),(35,'DS_Question15','c'),(36,'DS_Question16','b'),(37,'DS_Question17','a'),(38,'DS_Question18','d'),(39,'DS_Question19','b'),(40,'DS_Question20','c'),(41,'JD_Question1','a'),(42,'JD_Question2','d'),(43,'JD_Question3','c'),(44,'JD_Question4','c'),(45,'JD_Question5','b'),(46,'JD_Question6','d'),(47,'JD_Question7','c'),(48,'JD_Question8','a'),(49,'JD_Question9','c'),(50,'JD_Question10','a'),(51,'JD_Question11','a'),(52,'JD_Question12','b'),(53,'JD_Question13','d'),(54,'JD_Question14','d'),(55,'JD_Question15','a'),(56,'JD_Question16','d'),(57,'JD_Question17','a'),(58,'JD_Question18','a'),(59,'JD_Question19','c'),(60,'JD_Question20','b'),(61,'ND_Question1','b'),(62,'ND_Question2','c'),(63,'ND_Question3','c'),(64,'ND_Question4','a'),(65,'ND_Question5','d'),(66,'ND_Question6','d'),(67,'ND_Question7','d'),(68,'ND_Question8','c'),(69,'ND_Question9','a'),(70,'ND_Question10','c'),(71,'ND_Question11','a'),(72,'ND_Question12','b'),(73,'ND_Question13','c'),(74,'ND_Question14','d'),(75,'ND_Question15','a'),(76,'ND_Question16','b'),(77,'ND_Question17','c'),(78,'ND_Question18','d'),(79,'ND_Question19','a'),(80,'ND_Question20','b'),(81,'QA_Question1','a'),(82,'QA_Question2','d'),(83,'QA_Question3','a'),(84,'QA_Question4','b'),(85,'QA_Question5','d'),(86,'QA_Question6','a'),(87,'QA_Question7','c'),(88,'QA_Question8','a'),(89,'QA_Question9','d'),(90,'QA_Question10','b'),(91,'QA_Question11','c'),(92,'QA_Question12','b'),(93,'QA_Question13','a'),(94,'QA_Question14','a'),(95,'QA_Question15','c'),(96,'QA_Question16','d'),(97,'QA_Question17','c'),(98,'QA_Question18','c'),(99,'QA_Question19','b'),(100,'QA_Question20','b'),(101,'FE_Question1','b'),(102,'FE_Question2','a'),(103,'FE_Question3','b'),(104,'FE_Question4','d'),(105,'FE_Question5','a'),(106,'FE_Question6','c'),(107,'FE_Question7','a'),(108,'FE_Question8','a'),(109,'FE_Question9','d'),(110,'FE_Question10','c'),(111,'FE_Question11','c'),(112,'FE_Question12','a'),(113,'FE_Question13','b'),(114,'FE_Question14','a'),(115,'FE_Question15','b'),(116,'FE_Question16','b'),(117,'FE_Question17','a'),(118,'FE_Question18','c'),(119,'FE_Question19','d'),(120,'FE_Question20','c');
/*!40000 ALTER TABLE `Preguntas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Redes_sociales`
--

DROP TABLE IF EXISTS `Redes_sociales`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Redes_sociales` (
  `id_red` int NOT NULL,
  `red_social` varchar(100) NOT NULL,
  PRIMARY KEY (`id_red`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Redes_sociales`
--

LOCK TABLES `Redes_sociales` WRITE;
/*!40000 ALTER TABLE `Redes_sociales` DISABLE KEYS */;
INSERT INTO `Redes_sociales` VALUES (1,'Instagram'),(2,'Twitter'),(3,'GitHub'),(4,'Facebook'),(5,'Linkedin');
/*!40000 ALTER TABLE `Redes_sociales` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'atos_bd'
--

--
-- Dumping routines for database 'atos_bd'
--
/*!50003 DROP PROCEDURE IF EXISTS `filter_by_profile` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `filter_by_profile`(id_profile int)
begin
	select aplicante.id_aplicante, aplicante.nombre, Aplicante.apellido, perfil.perfil, aplicante.status_ap, juego.puntuacion
	from aplicante 
	left join atos_bd.Aplicante_Perfiles on aplicante.id_aplicante = aplicante_perfiles.id_aplicante
	left join atos_bd.perfil on aplicante_perfiles.id_perfil = perfil.id_perfil
	left join atos_bd.juego on aplicante.id_aplicante = juego.id_aplicante
where Aplicante_Perfiles.id_perfil = id_profile;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `filter_by_status` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `filter_by_status`(id_status int)
begin
	select aplicante.id_aplicante, aplicante.nombre, Aplicante.apellido, perfil.perfil, aplicante.status_ap, juego.puntuacion
	from aplicante 
	left join atos_bd.Aplicante_Perfiles on aplicante.id_aplicante = aplicante_perfiles.id_aplicante
	left join atos_bd.perfil on aplicante_perfiles.id_perfil = perfil.id_perfil
	left join atos_bd.juego on aplicante.id_aplicante = juego.id_aplicante
	where aplicante.status_ap = id_status;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getApplicant` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getApplicant`(id int)
begin
	SELECT Aplicante.id_aplicante, Aplicante.nombre, Aplicante.apellido, Perfil.perfil, Aplicante.status_ap, Juego.puntuacion
	FROM atos_bd.Aplicante 
	INNER JOIN atos_bd.Aplicante_Perfiles ON Aplicante.id_aplicante = Aplicante_Perfiles.id_aplicante
	INNER JOIN atos_bd.Perfil ON Aplicante_Perfiles.id_perfil = Perfil.id_perfil
	INNER JOIN atos_bd.Juego ON Aplicante.id_aplicante = Juego.id_aplicante
	WHERE Aplicante.id_aplicante = id;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getApplicants` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getApplicants`()
begin
	SELECT Aplicante.id_aplicante, Aplicante.nombre, Aplicante.apellido, Perfil.perfil, Aplicante.status_ap, Juego.puntuacion
	FROM atos_bd.Aplicante 
	LEFT JOIN atos_bd.Aplicante_Perfiles ON Aplicante.id_aplicante = Aplicante_Perfiles.id_aplicante
	LEFT JOIN atos_bd.Perfil ON Aplicante_Perfiles.id_perfil = Perfil.id_perfil
	LEFT JOIN atos_bd.Juego ON Aplicante.id_aplicante = Juego.id_aplicante;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `orderBy` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `orderBy`(id_order int)
begin
	if id_order = 1 then
		select aplicante.id_aplicante, aplicante.nombre, Aplicante.apellido, perfil.perfil, aplicante.status_ap, juego.puntuacion
		from aplicante 
		left join atos_bd.Aplicante_Perfiles on aplicante.id_aplicante = aplicante_perfiles.id_aplicante
		left join atos_bd.perfil on aplicante_perfiles.id_perfil = perfil.id_perfil
		left join atos_bd.juego on aplicante.id_aplicante = juego.id_aplicante
		order by aplicante.nombre;
	elseif id_order = 2 then
		select aplicante.id_aplicante, aplicante.nombre, Aplicante.apellido, perfil.perfil, aplicante.status_ap, juego.puntuacion
		from aplicante 
		left join atos_bd.Aplicante_Perfiles on aplicante.id_aplicante = aplicante_perfiles.id_aplicante
		left join atos_bd.perfil on aplicante_perfiles.id_perfil = perfil.id_perfil
		left join atos_bd.juego on aplicante.id_aplicante = juego.id_aplicante
		order by aplicante.nombre desc;
	elseif id_order = 3 then
		select aplicante.id_aplicante, aplicante.nombre, Aplicante.apellido, perfil.perfil, aplicante.status_ap, juego.puntuacion
		from aplicante 
		left join atos_bd.Aplicante_Perfiles on aplicante.id_aplicante = aplicante_perfiles.id_aplicante
		left join atos_bd.perfil on aplicante_perfiles.id_perfil = perfil.id_perfil
		left join atos_bd.juego on aplicante.id_aplicante = juego.id_aplicante
		order by juego.puntuacion;
	elseif id_order = 4 then
		select aplicante.id_aplicante, aplicante.nombre, Aplicante.apellido, perfil.perfil, aplicante.status_ap, juego.puntuacion
		from aplicante 
		left join atos_bd.Aplicante_Perfiles on aplicante.id_aplicante = aplicante_perfiles.id_aplicante
		left join atos_bd.perfil on aplicante_perfiles.id_perfil = perfil.id_perfil
		left join atos_bd.juego on aplicante.id_aplicante = juego.id_aplicante
		order by juego.puntuacion desc;
	end if;
end ;;
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

-- Dump completed on 2022-07-07 11:07:14
