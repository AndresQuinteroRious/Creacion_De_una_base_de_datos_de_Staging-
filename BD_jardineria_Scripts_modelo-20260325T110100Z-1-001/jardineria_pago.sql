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
-- Table structure for table `pago`
--

DROP TABLE IF EXISTS `pago`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pago` (
  `ID_cliente` int NOT NULL,
  `forma_pago` varchar(40) NOT NULL,
  `id_transaccion` varchar(50) NOT NULL,
  `fecha_pago` date NOT NULL,
  `total` decimal(15,2) NOT NULL,
  PRIMARY KEY (`ID_cliente`,`id_transaccion`),
  CONSTRAINT `pago_ibfk_1` FOREIGN KEY (`ID_cliente`) REFERENCES `cliente` (`ID_cliente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pago`
--

LOCK TABLES `pago` WRITE;
/*!40000 ALTER TABLE `pago` DISABLE KEYS */;
INSERT INTO `pago` VALUES (1,'PayPal','ak-std-000001','2008-11-10',2000.00),(1,'PayPal','ak-std-000002','2008-12-10',2000.00),(3,'PayPal','ak-std-000003','2009-01-16',5000.00),(3,'PayPal','ak-std-000004','2009-02-16',5000.00),(3,'PayPal','ak-std-000005','2009-02-19',926.00),(4,'PayPal','ak-std-000006','2007-01-08',20000.00),(4,'PayPal','ak-std-000007','2007-01-08',20000.00),(4,'PayPal','ak-std-000008','2007-01-08',20000.00),(4,'PayPal','ak-std-000009','2007-01-08',20000.00),(4,'PayPal','ak-std-000010','2007-01-08',1849.00),(5,'Transferencia','ak-std-000011','2006-01-18',23794.00),(7,'Cheque','ak-std-000012','2009-01-13',2390.00),(9,'PayPal','ak-std-000013','2009-01-06',929.00),(13,'PayPal','ak-std-000014','2008-08-04',2246.00),(14,'PayPal','ak-std-000015','2008-07-15',4160.00),(15,'PayPal','ak-std-000016','2009-01-15',2081.00),(15,'PayPal','ak-std-000035','2009-02-15',10000.00),(16,'PayPal','ak-std-000017','2009-02-16',4399.00),(19,'PayPal','ak-std-000018','2009-03-06',232.00),(23,'PayPal','ak-std-000019','2009-03-26',272.00),(26,'PayPal','ak-std-000020','2008-03-18',18846.00),(27,'PayPal','ak-std-000021','2009-02-08',10972.00),(28,'PayPal','ak-std-000022','2009-01-13',8489.00),(30,'PayPal','ak-std-000024','2009-01-16',7863.00);
/*!40000 ALTER TABLE `pago` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-03-24 21:01:59
