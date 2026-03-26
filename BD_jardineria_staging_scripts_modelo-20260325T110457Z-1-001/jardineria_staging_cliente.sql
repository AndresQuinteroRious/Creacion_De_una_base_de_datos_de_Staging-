-- MySQL dump 10.13  Distrib 8.0.19, for Win64 (x86_64)
--
-- Host: localhost    Database: jardineria_staging
-- ------------------------------------------------------
-- Server version	8.0.19

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
-- Table structure for table `cliente`
--

DROP TABLE IF EXISTS `cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cliente` (
  `ID_cliente` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `telefono` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ciudad` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `codigo_postal` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `limite_credito` decimal(15,2) DEFAULT NULL,
  PRIMARY KEY (`ID_cliente`),
  KEY `idx_ciudad` (`ciudad`),
  KEY `idx_nombre` (`nombre`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente`
--

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
INSERT INTO `cliente` VALUES (1,'GoldFish Garden','5556901745','San Francisco','24006',3000.00),(2,'Gardening Associates','5557410345','Miami','24010',6000.00),(3,'Gerudo Valley','5552323129','New York','85495',12000.00),(4,'Tendo Garden','55591233210','Miami','696969',600000.00),(5,'Lasas S.A.','34916540145','Fuenlabrada','28945',154310.00),(6,'Beragua','654987321','Madrid','28942',20000.00),(7,'Club Golf Puerta del hierro','62456810','Madrid','28930',40000.00),(8,'Naturagua','689234750','Madrid','28947',32000.00),(9,'DaraDistribuciones','675598001','Madrid','28946',50000.00),(10,'MadrileÃƒÂ±a de riegos','655983045','Madrid','28943',20000.00),(11,'Lasas S.A.','34916540145','Fuenlabrada','28945',154310.00),(12,'Camunas Jardines S.L.','34914873241','San Lorenzo del Escorial','28145',16481.00),(13,'Dardena S.A.','34912453217','Madrid','28003',321000.00),(14,'Jardin de Flores','654865643','Madrid','28950',40000.00),(15,'Flores Marivi','666555444','Fuenlabrada','28945',1500.00),(16,'Flowers, S.A','698754159','Montornes del valles','24586',3500.00),(17,'Naturajardin','612343529','Madrid','28011',5050.00),(18,'Golf S.A.','916458762','Santa cruz de Tenerife','38297',30000.00),(19,'Americh Golf Management SL','964493072','Barcelona','12320',20000.00),(20,'Aloha','916485852','Canarias','35488',50000.00),(21,'El Prat','916882323','Barcelona','12320',30000.00),(22,'Sotogrande','915576622','Sotogrande','11310',60000.00),(23,'Vivero Humanes','654987690','Humanes','28970',7430.00),(24,'Fuenla City','675842139','Fuenlabrada','28574',4500.00),(25,'Jardines y Mansiones Cactus SL','916877445','Madrid','29874',76000.00),(26,'JardinerÃƒÂ­as MatÃƒÂ­as SL','916544147','Madrid','37845',100500.00),(27,'Agrojardin','675432926','Getafe','28904',8040.00),(28,'Top Campo','685746512','Humanes','28574',5500.00),(29,'Jardineria Sara','675124537','Fuenlabrada','27584',7500.00),(30,'Campohermoso','645925376','Fuenlabrada','28945',3250.00),(31,'france telecom','(33)5120578961','Paris','75010',10000.00),(32,'MusÃƒÂ©e du Louvre','(33)0140205050','Paris','75058',30000.00),(33,'Tutifruti S.A','2 9261-2433','Sydney','2000',10000.00),(34,'Flores S.L.','654352981','Madrid','29643',6000.00),(35,'The Magic Garden','926523468','London','65930',10000.00),(36,'El Jardin Viviente S.L','2 8005-7161','Sydney','2003',8000.00);
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-03-24 22:55:18
