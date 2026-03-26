CREATE DATABASE  IF NOT EXISTS `jardineria` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `jardineria`;
-- MySQL dump 10.13  Distrib 8.0.19, for Win64 (x86_64)
--
-- Host: localhost    Database: jardineria
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
-- Table structure for table `empleado`
--

DROP TABLE IF EXISTS `empleado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `empleado` (
  `ID_empleado` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  `apellido1` varchar(50) NOT NULL,
  `apellido2` varchar(50) DEFAULT NULL,
  `extension` varchar(10) NOT NULL,
  `email` varchar(100) NOT NULL,
  `ID_oficina` int NOT NULL,
  `ID_jefe` int DEFAULT NULL,
  `puesto` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`ID_empleado`),
  KEY `ID_oficina` (`ID_oficina`),
  KEY `ID_jefe` (`ID_jefe`),
  CONSTRAINT `empleado_ibfk_1` FOREIGN KEY (`ID_oficina`) REFERENCES `oficina` (`ID_oficina`),
  CONSTRAINT `empleado_ibfk_2` FOREIGN KEY (`ID_jefe`) REFERENCES `empleado` (`ID_empleado`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empleado`
--

LOCK TABLES `empleado` WRITE;
/*!40000 ALTER TABLE `empleado` DISABLE KEYS */;
INSERT INTO `empleado` VALUES (1,'Marcos','MagaÃƒÂ±a','Perez','3897','marcos@jardineria.es',8,NULL,'Director General'),(2,'Ruben','LÃƒÂ³pez','Martinez','2899','rlopez@jardineria.es',8,1,'Subdirector Marketing'),(3,'Alberto','Soria','Carrasco','2837','asoria@jardineria.es',8,2,'Subdirector Ventas'),(4,'Maria','SolÃƒÂ­s','Jerez','2847','msolis@jardineria.es',8,2,'Secretaria'),(5,'Felipe','Rosas','Marquez','2844','frosas@jardineria.es',8,3,'Representante Ventas'),(6,'Juan Carlos','Ortiz','Serrano','2845','cortiz@jardineria.es',8,3,'Representante Ventas'),(7,'Carlos','Soria','Jimenez','2444','csoria@jardineria.es',4,3,'Director Oficina'),(8,'Mariano','LÃƒÂ³pez','Murcia','2442','mlopez@jardineria.es',4,7,'Representante Ventas'),(9,'Lucio','Campoamor','MartÃƒÂ­n','2442','lcampoamor@jardineria.es',4,7,'Representante Ventas'),(10,'Hilario','Rodriguez','Huertas','2444','hrodriguez@jardineria.es',4,7,'Representante Ventas'),(11,'Emmanuel','MagaÃƒÂ±a','Perez','2518','manu@jardineria.es',1,3,'Director Oficina'),(12,'JosÃƒÂ© Manuel','Martinez','De la Osa','2519','jmmart@hotmail.es',1,11,'Representante Ventas'),(13,'David','Palma','Aceituno','2519','dpalma@jardineria.es',1,11,'Representante Ventas'),(14,'Oscar','Palma','Aceituno','2519','opalma@jardineria.es',1,11,'Representante Ventas'),(15,'Francois','Fignon','','9981','ffignon@gardening.com',5,3,'Director Oficina'),(16,'Lionel','Narvaez','','9982','lnarvaez@gardening.com',5,15,'Representante Ventas'),(17,'Laurent','Serra','','9982','lserra@gardening.com',5,15,'Representante Ventas'),(18,'Michael','Bolton','','7454','mbolton@gardening.com',6,3,'Director Oficina'),(19,'Walter Santiago','Sanchez','Lopez','7454','wssanchez@gardening.com',6,18,'Representante Ventas'),(20,'Hilary','Washington','','7565','hwashington@gardening.com',2,3,'Director Oficina'),(21,'Marcus','Paxton','','7565','mpaxton@gardening.com',2,20,'Representante Ventas'),(22,'Lorena','Paxton','','7665','lpaxton@gardening.com',2,20,'Representante Ventas'),(23,'Nei','Nishikori','','8734','nnishikori@gardening.com',9,3,'Director Oficina'),(24,'Narumi','Riko','','8734','nriko@gardening.com',9,23,'Representante Ventas'),(25,'Takuma','Nomura','','8735','tnomura@gardening.com',9,23,'Representante Ventas'),(26,'Amy','Johnson','','3321','ajohnson@gardening.com',3,3,'Director Oficina'),(27,'Larry','Westfalls','','3322','lwestfalls@gardening.com',3,26,'Representante Ventas'),(28,'John','Walton','','3322','jwalton@gardening.com',3,26,'Representante Ventas'),(29,'Kevin','Fallmer','','3210','kfalmer@gardening.com',7,3,'Director Oficina'),(30,'Julian','Bellinelli','','3211','jbellinelli@gardening.com',7,29,'Representante Ventas'),(31,'Mariko','Kishi','','3211','mkishi@gardening.com',7,29,'Representante Ventas');
/*!40000 ALTER TABLE `empleado` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-03-24 21:01:58
