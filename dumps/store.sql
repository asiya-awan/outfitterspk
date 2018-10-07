-- MySQL dump 10.13  Distrib 8.0.12, for Win64 (x86_64)
--
-- Host: localhost    Database: store
-- ------------------------------------------------------
-- Server version	8.0.12

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `billingaddress`
--

DROP TABLE IF EXISTS `billingaddress`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `billingaddress` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `firstName` varchar(350) NOT NULL,
  `lastName` varchar(350) NOT NULL,
  `address` varchar(350) DEFAULT NULL,
  `city` varchar(350) DEFAULT NULL,
  `region` varchar(350) DEFAULT NULL,
  `country` varchar(350) DEFAULT NULL,
  `postalCode` varchar(6) DEFAULT NULL,
  `phone` varchar(15) DEFAULT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `order_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKBillingCustomerId_idx` (`customer_id`),
  KEY `FKBillingOrderId_idx` (`order_id`),
  CONSTRAINT `FKBillingCustomerId` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`id`),
  CONSTRAINT `FKBillingOrderId` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `billingaddress`
--

LOCK TABLES `billingaddress` WRITE;
/*!40000 ALTER TABLE `billingaddress` DISABLE KEYS */;
INSERT INTO `billingaddress` VALUES (1,'Muhammad','Riaz','34 Pembina','Winnipeg','Manitoba','Canada',NULL,'+13132345',1,NULL),(2,'Saad','Ahmed','234 Solo','Winnipeg','Manitoba','Canada','R34LA','+124523452',21,NULL),(15,'asiya','awan','342 Pembina','Winipg','Manitoba','Canada','J3A2LA','adfadsfa',1,NULL),(16,'Sonai','Iqbal','234 Yale','Ontario','adsf','Canada','R3L3AI','+13235423425',1,NULL),(17,'Samina ','Sarfaraz','43 Civil line','Winnipeg','Manitoba','Canada','R1L3K2','+19225345234',1,NULL),(18,'Muhammad','Riaz','343 Pembian','Winnipeg','Manitoba','Canada','R2WU4A','+1203353535',1,NULL),(19,'Sam','avy','34 Pembina','Winnipeg','Manitoba','Canada','R4L3K4','+1204464564',16,NULL),(20,'Riz','memon','344 Pembina','Winnipeg','Manitoba','Canada','R3T3LA','+1234235535',2,NULL),(21,'Said','salman','342 Waverly','Winnipeg','Manitoba','Canada','R2A3KL','+1325345234523',2,NULL),(22,'Said','salman','342 Waverly','Winnipeg','Manitoba','Canada','R2A3KL','+1325345234523',2,NULL),(23,'hkjghkj','khjlj','khlkj','jkhljk','jklhkj','jkhlkj','jkhlkk','hlkjhl',2,NULL),(24,'jhkjh','jgkjhg','hgkjh','jhkgjh','hjgkjhg','jhgkjh','jhgkjh','jhgkjh',24,NULL),(25,'abc','jkl','423 pembina','Winnipeg','Manitoba','Canada','R34LA1','235523452',2,NULL),(26,'Asia','Awan','342 JimTim','Winnipeg','Manitoba','Canada','R21KL2','+124235254',30,21),(27,'Shazia','Aamir','34 James Street','Winnipeg','Manitoba','Canada','R31TJ9','+12042346456',8,23),(28,'Andrea','Miz','89 Crescent','Winnipeg','Manitoba','Canada','R2A6KL','+1204245432',1,30),(29,'Andrea','Miz','89 Crescent','Winnipeg','Manitoba','Canada','R2A6KL','+1204245432',1,31),(30,'Andrea','Miz','89 Crescent','Winnipeg','Manitoba','Canada','R2A6KL','+1204245432',1,32),(31,'Riz','Masood','88 Dalhousie','Winnipeg','Manitoba','Canada','R34LK2','+12043454535',31,52),(32,'Riz','Masood','88 Dalhousie','Winnipeg','Manitoba','Canada','R34LK2','+12043454535',31,53),(33,'Riz','Masood','88 Dalhousie','Winnipeg','Manitoba','Canada','R34LK2','+12043454535',31,54),(34,'Riz','Masood','88 Dalhousie','Winnipeg','Manitoba','Canada','R34LK2','+12043454535',31,55),(35,'Sadia','Malik','78 Pembina','Winnipeg','Manitoba','Canada','R2R2A2','+1203353453',1,59),(36,'Sadia','Malik','78 Pembina','Winnipeg','Manitoba','Canada','R2R2A2','+1203353453',1,60),(37,'Naeem','Khan','34 Waverley','Winnipeg','Manitoba','Canada','RTHLA3','+132434234',32,61),(38,'sdfg','sgdfg','34 sdfgsdf','sdfg','dfg','sdfgd','635464','64365463',34,63);
/*!40000 ALTER TABLE `billingaddress` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `categoryname` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (1,'Men'),(2,'Women'),(3,'Juniors');
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categorysubcategory`
--

DROP TABLE IF EXISTS `categorysubcategory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `categorysubcategory` (
  `category_id` int(11) NOT NULL,
  `subcategory_id` int(11) NOT NULL,
  PRIMARY KEY (`category_id`,`subcategory_id`),
  KEY `subcategory_id` (`subcategory_id`),
  CONSTRAINT `categorysubcategory_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`),
  CONSTRAINT `categorysubcategory_ibfk_2` FOREIGN KEY (`subcategory_id`) REFERENCES `subcategory` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categorysubcategory`
--

LOCK TABLES `categorysubcategory` WRITE;
/*!40000 ALTER TABLE `categorysubcategory` DISABLE KEYS */;
INSERT INTO `categorysubcategory` VALUES (1,1),(2,1),(3,1),(1,2),(2,2),(3,2),(1,3),(2,3),(3,3),(1,4),(2,4),(3,4);
/*!40000 ALTER TABLE `categorysubcategory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `customer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `firstName` varchar(350) DEFAULT NULL,
  `lastName` varchar(350) DEFAULT NULL,
  `email` varchar(350) DEFAULT NULL,
  `cpassword` varchar(100) DEFAULT NULL,
  `address` varchar(350) DEFAULT NULL,
  `city` varchar(350) DEFAULT NULL,
  `region` varchar(350) DEFAULT NULL,
  `country` varchar(350) DEFAULT NULL,
  `postalCode` varchar(50) DEFAULT NULL,
  `phone` varchar(15) DEFAULT NULL,
  `useAddressAsBillingAddress` tinyint(4) DEFAULT '1',
  `isCustomer` tinyint(4) DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES (1,'Asia','Awan','asia.awan@hotmail.com','32250170a0dca92d53ec9624f336ca24','124 Pembina','Winnipeg','Manitoba','Canada','R3T6P2','204 234 2234',1,1),(2,'Ali','Khan','ali.khan@hotmail.com','32250170a0dca92d53ec9624f336ca24','123 Greencrest','Winnipeg','Manitoba','Canada','R3T45L','+123452345',0,0),(6,'Nazneen','Malik','nazneen@hotmail.com','32250170a0dca92d53ec9624f336ca24',NULL,NULL,NULL,NULL,NULL,NULL,NULL,1),(8,'safia','Malik','safia@hotmail.com','32250170a0dca92d53ec9624f336ca24','999 Dalhousie','Winnipeg','Manitoba','Canada','R2AL2A','+1234232525',1,1),(9,'wainny','ta','wainny','32250170a0dca92d53ec9624f336ca24',NULL,NULL,NULL,NULL,NULL,NULL,NULL,1),(10,'Javaid','Ahmed','javaid@hotmail.com','32250170a0dca92d53ec9624f336ca24','234 Pembina','Winnipeg','Manitoba','Canada','TK2L3A','+1203424234',NULL,1),(13,'Ali','Ahmed','ali@comit.com','32250170a0dca92d53ec9624f336ca24','35 Dakota st','Winnipeg','Manitoba','Canada','R3T2AP','+120434534',NULL,1),(14,'Taha','umer','taha@hotmail.com','32250170a0dca92d53ec9624f336ca24',NULL,NULL,NULL,NULL,NULL,NULL,NULL,1),(16,'Ally','Bossin','aly@comit.com','32250170a0dca92d53ec9624f336ca24','123 Pemina','Winnipeg','Manitoba','Canada','R3T5L22','+343242234',0,1),(18,'suman','qazi','suman@comit.com','32250170a0dca92d53ec9624f336ca24','45 Pembina','Winiipeg','Manitoba','Canada','4TL23AL','+120434324234',1,1),(19,'Sonam','Kapoor','sonam@neovation.com','32250170a0dca92d53ec9624f336ca24','34 University crescent road','Winnipeg','Manitoba','Canada','R2AL4D','+1203535454',NULL,1),(21,'Sania','Ahmed','sania@hotmail.com',NULL,'36 Jubillee','Winnipeg','Manitoba','Canada','R3T4L1','+1234253442',0,0),(23,'Sumera','Arain','sumera@hotmail.com',NULL,'34 Greencrest','Winnipeg','','Canada','W29L1A','+12435535',1,0),(24,'Shafaq','Khan','shafaq@hotmail.com',NULL,'34 Polo Club','Winnipeg','Manitoba ','Canada','R2KL1E','+1234423424',0,0),(25,'Emaan','Fatima','emaan@hotmail.com',NULL,'34 Polo Park','Winnipeg','Manitoba','Canada','R32K1A','+123423234',1,0),(26,'Shaan','Mirza','shani@hotmail.com',NULL,'23 La fleche','Winnipeg','Manitoba','Canada','R2ATJ2','+123453453',1,0),(27,'Suman','Kazi','suman@hotmail.com',NULL,'123 Ulster Street','Winnipeg','Manitoba','Canada','R3T2LA','+12342352',1,0),(28,'Tania','Saeed','tania@hotmail.com',NULL,'34 James street','Winnipeg','Manitoba','Canada','R2ALO1','+120435354',1,0),(29,'Hadia','Ansari','hadia@hotmail.com',NULL,'24 Bahria town','Winnipeg ','Manitoba','Canada','R3A2KL','+1245235453',1,0),(30,'Jina','Jo','jina@hotmail.com',NULL,'232 Provencher Blvd','Winnipeg','Manitoba','Canada','R2T3KL','+1203455453',0,0),(31,'Jannat','Awan','jannat@comit.com','32250170a0dca92d53ec9624f336ca24','45 Allegheny drive','Winnipeg ','Manitoba ','Canada','R2ALR2','+12044645656',0,1),(32,'Faiz','Ahmed','faiz@hotmail.com',NULL,'344 Pembina','Winnipeg','Manitoba','Canada','R4TL3A','+12033243423',0,0),(33,'Farwa','Memona','ferwa@hotmail.com','32250170a0dca92d53ec9624f336ca24','9993 Dalhousie','Winnipeg','Manitoba ','Canada','TH3LK2','+1033523423',1,1),(34,'Saads','Ahmaed','saad@hotmail.com','32250170a0dca92d53ec9624f336ca24','344 Pembina ','Winnipeg','Manitoba','Canada','R34fR','34234234',0,1);
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notcustomer`
--

DROP TABLE IF EXISTS `notcustomer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `notcustomer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `firstName` varchar(350) NOT NULL,
  `lastName` varchar(350) NOT NULL,
  `address` varchar(350) DEFAULT NULL,
  `city` varchar(350) DEFAULT NULL,
  `region` varchar(350) DEFAULT NULL,
  `country` varchar(350) DEFAULT NULL,
  `postalCode` varchar(6) DEFAULT NULL,
  `phone` varchar(15) DEFAULT NULL,
  `useAddressAsBillingAddress` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notcustomer`
--

LOCK TABLES `notcustomer` WRITE;
/*!40000 ALTER TABLE `notcustomer` DISABLE KEYS */;
/*!40000 ALTER TABLE `notcustomer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orderdetails`
--

DROP TABLE IF EXISTS `orderdetails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `orderdetails` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `productVariant_id` int(11) DEFAULT NULL,
  `price` float DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `order_id` (`order_id`),
  KEY `product_id` (`product_id`),
  KEY `productVariant_id` (`productVariant_id`),
  CONSTRAINT `orderdetails_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`),
  CONSTRAINT `orderdetails_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`),
  CONSTRAINT `orderdetails_ibfk_3` FOREIGN KEY (`productVariant_id`) REFERENCES `productvariant` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=82 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orderdetails`
--

LOCK TABLES `orderdetails` WRITE;
/*!40000 ALTER TABLE `orderdetails` DISABLE KEYS */;
INSERT INTO `orderdetails` VALUES (1,9,9,23,28,3),(2,9,23,61,29,1),(3,11,10,27,9,2),(4,11,9,23,28,3),(5,11,8,20,28,1),(6,13,23,61,29,1),(7,14,3,12,35,1),(8,17,9,23,28,1),(9,17,2,7,40,1),(10,19,10,27,9,2),(11,19,2,7,40,1),(12,20,9,23,28,1),(13,21,10,27,9,2),(14,22,10,27,9,2),(15,22,2,7,40,3),(16,23,10,27,9,2),(17,23,2,7,40,3),(18,24,8,20,28,1),(19,25,2,7,40,2),(20,30,2,7,40,2),(21,30,1,1,35,1),(22,31,2,7,40,2),(23,31,1,1,35,1),(24,32,2,7,40,2),(25,32,1,1,35,1),(26,33,2,7,40,2),(27,33,1,1,35,1),(28,34,2,7,40,2),(29,34,3,12,35,1),(30,35,2,7,40,2),(31,35,3,12,35,1),(32,36,2,7,40,2),(33,36,3,12,35,1),(34,37,2,7,40,2),(35,37,3,12,35,1),(36,38,2,7,40,2),(37,38,3,12,35,1),(38,39,2,7,40,2),(39,39,3,12,35,1),(40,40,2,7,40,2),(41,40,3,12,35,1),(42,41,2,7,40,2),(43,41,3,12,35,1),(44,42,2,7,40,1),(45,42,8,21,28,1),(46,43,2,7,40,1),(47,43,9,26,28,1),(48,45,9,23,28,1),(49,45,2,9,40,2),(50,46,9,23,28,1),(51,46,2,9,40,2),(52,48,2,7,40,2),(53,48,8,20,28,1),(54,49,2,7,40,1),(55,49,10,30,9,2),(56,50,2,7,40,1),(57,50,10,30,9,2),(58,51,2,7,40,1),(59,51,10,30,9,2),(60,52,1,6,35,3),(61,52,2,11,40,1),(62,53,1,6,35,3),(63,53,2,11,40,1),(64,54,1,6,35,3),(65,54,2,11,40,1),(66,55,1,6,35,3),(67,55,2,11,40,1),(68,56,2,7,40,1),(69,56,3,12,35,3),(70,57,2,7,40,3),(71,57,11,33,40,2),(72,58,2,7,40,2),(73,58,1,3,35,1),(74,59,3,13,35,1),(75,60,3,13,35,1),(76,61,9,24,28,3),(77,61,30,81,24,4),(78,62,4,17,28,2),(79,62,8,20,28,1),(80,63,12,38,40,3),(81,63,9,23,28,2);
/*!40000 ALTER TABLE `orderdetails` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `orders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) DEFAULT NULL,
  `orderDate` datetime DEFAULT NULL,
  `requiredDate` datetime DEFAULT NULL,
  `shippedDate` datetime DEFAULT NULL,
  `ShipVia` varchar(350) DEFAULT NULL,
  `orderStatus` varchar(45) DEFAULT 'Building',
  PRIMARY KEY (`id`),
  KEY `customer_id` (`customer_id`),
  CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=64 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (9,1,'2018-09-01 00:00:00','2018-09-08 00:00:00','2018-09-02 00:00:00','Courier','Completed'),(11,16,'2018-09-01 00:00:00','2018-09-08 00:00:00','2018-09-08 00:00:00','Courier','Completed'),(13,2,'2018-09-01 00:00:00','2018-09-08 00:00:00','2018-09-08 00:00:00','Courier','Shipped'),(14,2,'2018-09-01 00:00:00','2018-09-08 00:00:00','2018-09-08 00:00:00','Courier','Shipped'),(15,2,'2018-09-01 00:00:00','2018-09-08 00:00:00','2018-09-08 00:00:00','Courier','Shipped'),(17,2,'2018-09-02 00:00:00','2018-09-09 00:00:00',NULL,'Courier','Building'),(19,28,'2018-09-02 00:00:00','2018-09-09 00:00:00',NULL,'Courier','Building'),(20,29,'2018-09-02 00:00:00','2018-09-09 00:00:00',NULL,'Courier','Building'),(21,30,'2018-09-02 00:00:00','2018-09-09 00:00:00',NULL,'Courier','Building'),(22,8,'2018-09-02 00:00:00','2018-09-09 00:00:00','2018-09-03 00:00:00','Courier','Shipped'),(23,8,'2018-09-02 00:00:00','2018-09-09 00:00:00',NULL,'Courier','Building'),(24,10,'2018-09-02 00:00:00','2018-09-09 00:00:00',NULL,'Courier','Building'),(25,19,'2018-09-02 00:00:00','2018-09-09 00:00:00',NULL,'Courier','Building'),(26,19,'2018-09-02 00:00:00','2018-09-09 00:00:00',NULL,'Courier','Building'),(27,19,'2018-09-02 00:00:00','2018-09-09 00:00:00',NULL,'Courier','Building'),(28,19,'2018-09-02 00:00:00','2018-09-09 00:00:00',NULL,'Courier','Building'),(29,19,'2018-09-02 00:00:00','2018-09-09 00:00:00',NULL,'Courier','Building'),(30,1,'2018-09-02 00:00:00','2018-09-09 00:00:00',NULL,'Courier','Building'),(31,1,'2018-09-02 00:00:00','2018-09-09 00:00:00',NULL,'Courier','Building'),(32,1,'2018-09-02 00:00:00','2018-09-09 00:00:00',NULL,'Courier','Building'),(33,1,'2018-09-02 00:00:00','2018-09-09 00:00:00',NULL,'Courier','Building'),(34,1,'2018-09-02 00:00:00','2018-09-09 00:00:00',NULL,'Courier','Building'),(35,1,'2018-09-02 00:00:00','2018-09-09 00:00:00',NULL,'Courier','Building'),(36,1,'2018-09-02 00:00:00','2018-09-09 00:00:00',NULL,'Courier','Building'),(37,1,'2018-09-02 00:00:00','2018-09-09 00:00:00',NULL,'Courier','Building'),(38,1,'2018-09-02 00:00:00','2018-09-09 00:00:00',NULL,'Courier','Building'),(39,1,'2018-09-02 00:00:00','2018-09-09 00:00:00',NULL,'Courier','Building'),(40,1,'2018-09-02 00:00:00','2018-09-09 00:00:00',NULL,'Courier','Building'),(41,1,'2018-09-02 00:00:00','2018-09-09 00:00:00',NULL,'Courier','Building'),(42,1,'2018-09-02 00:00:00','2018-09-09 00:00:00',NULL,'Courier','Building'),(43,1,'2018-09-02 00:00:00','2018-09-09 00:00:00',NULL,'Courier','Building'),(45,2,'2018-09-02 00:00:00','2018-09-09 00:00:00',NULL,'Courier','Building'),(46,2,'2018-09-02 00:00:00','2018-09-09 00:00:00',NULL,'Courier','Building'),(47,2,'2018-09-02 00:00:00','2018-09-09 00:00:00',NULL,'Courier','Building'),(48,2,'2018-09-02 00:00:00','2018-09-09 00:00:00',NULL,'Courier','Building'),(49,2,'2018-09-02 00:00:00','2018-09-09 00:00:00',NULL,'Courier','Building'),(50,2,'2018-09-02 00:00:00','2018-09-09 00:00:00',NULL,'Courier','Building'),(51,2,'2018-09-02 00:00:00','2018-09-09 00:00:00',NULL,'Courier','Building'),(52,31,'2018-09-02 00:00:00','2018-09-09 00:00:00',NULL,'Courier','Building'),(53,31,'2018-09-02 00:00:00','2018-09-09 00:00:00',NULL,'Courier','Building'),(54,31,'2018-09-02 00:00:00','2018-09-09 00:00:00',NULL,'Courier','Building'),(55,31,'2018-09-02 00:00:00','2018-09-09 00:00:00',NULL,'Courier','Building'),(56,1,'2018-09-02 00:00:00','2018-09-09 00:00:00',NULL,'Courier','Building'),(57,13,'2018-09-02 00:00:00','2018-09-09 00:00:00',NULL,'Courier','Building'),(58,13,'2018-09-02 00:00:00','2018-09-09 00:00:00',NULL,'Courier','Building'),(59,1,'2018-09-04 00:00:00','2018-09-11 00:00:00',NULL,'Courier','Building'),(60,1,'2018-09-04 00:00:00','2018-09-11 00:00:00','2018-09-11 00:00:00','Courier','Completed'),(61,32,'2018-09-04 00:00:00','2018-09-11 00:00:00','2018-09-11 00:00:00','Courier','Shipped'),(62,33,'2018-09-04 00:00:00','2018-09-11 00:00:00','2018-09-11 00:00:00','Courier','Shipped'),(63,34,'2018-09-05 00:00:00','2018-09-12 00:00:00',NULL,'Courier','Building');
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `product` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `productname` varchar(350) DEFAULT NULL,
  `description` text,
  `specs` varchar(350) DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `subcategory_id` int(11) DEFAULT NULL,
  `SKU` varchar(50) DEFAULT NULL,
  `picturesUrl` varchar(750) DEFAULT NULL,
  `price` float DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `category_id` (`category_id`),
  KEY `subcategory_id` (`subcategory_id`),
  CONSTRAINT `product_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`),
  CONSTRAINT `product_ibfk_2` FOREIGN KEY (`subcategory_id`) REFERENCES `subcategory` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (1,'Jersey Tank Top With Corded Lace Yoke','Your comfy jersey tank top just got a little more stylish with the feminine corded lace yoke on this design','100% viscose, Lace 60% cotton, 35% nylon, 5% spandex',2,1,'23231344','https://cdn.shopify.com/s/files/1/2290/7887/products/WTP282015-BLK-1_1_1024x1024.jpg?v=1531288081;https://cdn.shopify.com/s/files/1/2290/7887/products/WTP282015-RED-1_2_1024;https://cdn.shopify.com/s/files/1/2290/7887/products/WTP282015-RED-1_1_1024x1024.jpg?v=1531288081x1024.jpg?v=1531288081;',34),(2,'Cotton Tank Top With two colors','Your comfy cotton tank top just got a little more stylish with this design','100% cotton, Model Size: M, 5% spandex',2,1,'1324152','https://cdn.shopify.com/s/files/1/2290/7887/products/WTY282411-RDY-1_1_1024x1024.jpg?v=1531288146;https://cdn.shopify.com/s/files/1/2290/7887/products/WTY282411-RDY-1_3_1024x1024.jpg?v=1531288146;https://cdn.shopify.com/s/files/1/2290/7887/products/WTY282411-RDY-1_4_1024x1024.jpg?v=1531288146;https://cdn.shopify.com/s/files/1/2290/7887/products/WTY282411-BWT-1_1_1024x1024.jpg?v=1531288146',40),(3,'Striped Cold Shoulder Top with Front and Back Keyholes','This sweet, short-sleeved cold shoulder top is accented by trendy stripes and flirty keyholes in the front and back.','Model\'s Size: XS,\nModel\'s Height: 5\'10\",\n96% viscose, 4% spandex,\nMachine wash in cold water, hang to dry,\nDo not bleach',2,1,'13413414','https://cdn.shopify.com/s/files/1/1981/3263/products/021056836931-10-1_x1500.jpg?v=1528984308; ',35),(4,'Striped Crochet Tank Top with Knit Back','Stripes are the staple that you can never have enough of, so match this versatile print with a flirty crochet front and comfy knit back for your new favorite tank top.','Model\'s Size: XS,\nModel\'s Height: 5\'10\",\n100% viscose,\nCrochet: 100% polyester,\nLining: 100% polyester,\nHand wash in cold water- hang to dry,\nDo not bleach',2,2,'1234132','https://cdn.shopify.com/s/files/1/1981/3263/products/021053567218-11-0_x1500.jpg?v=1529332584',28),(8,'Striped Tank Top with Star Burst Pleat','You love stripes, so mix it up with the cool variegated design on this tank top, featuring a side star burst pleat.','Model\'s Size: S,\nModel\'s Height: 5\'10\",\n92% polyester, 8% spandex\nMachine wash in cold water- hang to dry\nDo not bleach',2,2,'1234123','https://cdn.shopify.com/s/files/1/1981/3263/products/021046877764-01-0_x1500.jpg?v=1530632588;',28),(9,'Ditsy Floral Dolman Top with Sleeve Buttons','Reflect the blue summer sky in this sweet, ditsy floral top with sleeve button detailing.','Model\'s Size: XS,\nModel\'s Height: 5\'10\",\n96% polyester, 4% spandex\nMachine wash in cold water, hang to dry\nDo not bleach',2,2,'134132','https://cdn.shopify.com/s/files/1/1981/3263/products/021053567285-43-1_x1500.jpg?v=1530632584;\nhttps://cdn.shopify.com/s/files/1/1981/3263/products/021053567285-43-3_x1500.jpg?v=1530632588;\nhttps://cdn.shopify.com/s/files/1/1981/3263/products/021053567285-43-1_x1500.jpg?v=1530632584',28),(10,'Scoop Neck Tank Top','You can\'t go wrong with this staple tank top in your wardrobe; ideal for a layered effect, or wear it with a jacket for a fun pop of stripes.','Model\'s Size: S,\nModel\'s Height: 5\'10\",\n50% cotton, 50% modal,\nMachine wash in cold water- hang to dry\nDo not bleach',2,2,'132413','https://cdn.shopify.com/s/files/1/2290/7887/products/WTY282201-NVY-1_1_1024x1024.jpg?v=1526981322;\nhttps://cdn.shopify.com/s/files/1/2290/7887/products/WTY282201-NVY-1_3_1024x1024.jpg?v=1526981322',9),(11,'Shirt','You can\'t go wrong with this elegant shirt in your wardrobe; ideal for work environment.','Model\'s Size: M,\nModel\'s Height: 5\'7\",\n50% cotton, 50% modal,\nMachine wash in cold water- hang to dry\nDo not bleach',1,1,'1324132','https://cdn.shopify.com/s/files/1/2290/7887/products/MTY281411-GRN_6_1024x1024.jpg?v=1530182618',40),(12,'Stripped Shirt','You can\'t go wrong with this stripped shirt in your wardrobe; ideal for work environment.','Model\'s Size: M,\nModel\'s Height: 5\'7\",\n50% cotton, 50% modal,\nMachine wash in cold water- hang to dry\nDo not bleach',1,1,'542543','https://cdn.shopify.com/s/files/1/2290/7887/products/MTY281230-RED_3_1024x1024.jpg?v=1530181847;https://cdn.shopify.com/s/files/1/2290/7887/products/MTP281026-GRN_5_1024x1024.jpg?v=1530180672',40),(13,'Stripped Shirt','You can\'t go wrong with this t-shirt in your wardrobe; ideal for casual.','Model\'s Size: M,\nModel\'s Height: 5\'7\",\n50% cotton, 50% modal,\nMachine wash in cold water- hang to dry\nDo not bleach',1,2,'23525','https://cdn.shopify.com/s/files/1/2290/7887/products/MTY-281402-WHT-1_1024x1024.jpg?v=1531284149;\nhttps://cdn.shopify.com/s/files/1/2290/7887/products/MTY-281402-WHT_1024x1024.jpg?v=1531284149;\nhttps://cdn.shopify.com/s/files/1/2290/7887/products/MTY281402-BLK_3_1024x1024.jpg?v=1531284149',16),(14,'T-Shirt','You can\'t go wrong with this t-shirt in your wardrobe; ideal for casual.','Model\'s Size: M,\nModel\'s Height: 5\'7\",\n50% cotton, 50% modal,\nMachine wash in cold water- hang to dry\nDo not bleach',1,2,'3234534','https://cdn.shopify.com/s/files/1/2290/7887/products/MTP281012-BLK-_1_1024x1024.jpg?v=1531284157;\nhttps://cdn.shopify.com/s/files/1/2290/7887/products/MTP281012-WHT-_1_1024x1024.jpg?v=1531284157;\nhttps://cdn.shopify.com/s/files/1/2290/7887/products/MTP281012-BLK-_3_1024x1024.jpg?v=1531284157',15),(15,'Regular Fit Crew Neck Short Sleeve Tee','You can\'t go wrong with this t-shirt in your wardrobe; ideal for casual.','Model\'s Size: M,\nModel\'s Height: 5\'7\",\n50% cotton, 50% modal,\nMachine wash in cold water- hang to dry\nDo not bleach',1,2,'32435','https://cdn.shopify.com/s/files/1/2290/7887/products/MTY281217-WHT-_2_1024x1024.jpg?v=1528797315;\nhttps://cdn.shopify.com/s/files/1/2290/7887/products/MTY281217-WHT-_4_1024x1024.jpg?v=1528797315;\nhttps://cdn.shopify.com/s/files/1/2290/7887/products/MTY281217-WHT-_3_1024x1024.jpg?v=1528797315',11),(23,'Printed Off Shoulder Top with Ruffle Details','It doesn\'t take much to look great when the striking color and off shoulder design of this sweet top does it for you.','Printed mustard, Model\'s Size: XS, Model\'s Height: 5\'10\", 97% polyester, 3% spandex, Machine wash in cold water, hang to dry Do not bleach',2,1,'134124','https://cdn.shopify.com/s/files/1/2290/7887/products/WTY282218-WTB-1_3_large.jpg?v=1531288136;https://cdn.shopify.com/s/files/1/2290/7887/products/WTY282218-WTB-1_4_1024x1024.jpg?v=1531288136;https://cdn.shopify.com/s/files/1/2290/7887/products/WTY282218-WTB-1_3_1024x1024.jpg?v=1531288136',29),(25,'Blue Top','Cotton','',3,1,'9901','https://cdn.shopify.com/s/files/1/2290/7887/products/JGTT386021-RWT_1_1024x1024.jpg?v=1535456647',15),(26,'T-Shirt','Cotton','Cotton',3,2,'9902','https://cdn.shopify.com/s/files/1/2290/7887/products/TGTT385005-BPK_3_1024x1024.jpg?v=1535456772',8),(27,'White Cotton Shirt','Cotton','Cotton',3,1,'9003','https://cdn.shopify.com/s/files/1/2290/7887/products/JGTT386015-OFT_2_1024x1024.jpg?v=1535456557',12),(28,'Trouser','Cotton','Cotton',3,4,'9904','https://cdn.shopify.com/s/files/1/2290/7887/products/JGBT386024-PNK_1_1024x1024.jpg?v=1535695821',15),(29,'Trouser','Cotton','Cotton',3,4,'9905','https://cdn.shopify.com/s/files/1/2290/7887/products/JGBT386026-NVY_1_1024x1024.jpg?v=1535696118',13),(30,'5 Pocket Jeans','Denim','Denim',3,3,'9006','https://cdn.shopify.com/s/files/1/2290/7887/products/JBBT384030-MBL_1_1024x1024.jpg?v=1533725651',24);
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `productvariant`
--

DROP TABLE IF EXISTS `productvariant`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `productvariant` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `size` varchar(30) DEFAULT NULL,
  `color` varchar(50) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `product_id` (`product_id`),
  CONSTRAINT `productvariant_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=83 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productvariant`
--

LOCK TABLES `productvariant` WRITE;
/*!40000 ALTER TABLE `productvariant` DISABLE KEYS */;
INSERT INTO `productvariant` VALUES (1,'M','Red',100,1),(2,'S','Red',50,1),(3,'L','Red',25,1),(4,'S','Black',10,1),(5,'M','Black',40,1),(6,'L','Black',15,1),(7,'S','RDW',100,2),(8,'M','RDW',50,2),(9,'L','RDW',40,2),(10,'S','BWT',100,2),(11,'M','BWT',30,2),(12,'S','BWT',100,3),(13,'M','BWT',100,3),(14,'XS','BWT',100,3),(16,'M','BWT',50,4),(17,'S','BWT',50,4),(18,'XS','BWT',50,4),(19,'L','BWT',50,4),(20,'S','RDW',30,8),(21,'M','RDW',40,8),(22,'L','RDW',30,8),(23,'S','Blue',10,9),(24,'M','Blue',30,9),(25,'L','Blue',30,9),(26,'XL','Blue',20,9),(27,'S','Navy',20,10),(28,'M','Navy',20,10),(29,'L','Navy',20,10),(30,'XL','Navy',20,10),(31,'M','Green',40,11),(32,'L','Green',40,11),(33,'S','Green',10,11),(34,'XL','Green',10,11),(38,'L','Gray',10,12),(39,'S','Gray',10,12),(40,'M','Gray',40,12),(41,'S','Red',40,12),(42,'M','Red',40,12),(43,'L','Red',40,12),(44,'M','White',20,13),(45,'S','White',20,13),(46,'L','White',20,13),(47,'S','Black',30,13),(48,'M','Black',30,13),(49,'XL','Black',30,13),(50,'L','Black',30,13),(51,'S','Black',30,14),(52,'M','Black',30,14),(53,'L','Black',30,14),(54,'XL','Black',30,14),(55,'S','White',30,14),(56,'M','White',30,14),(57,'S','White',10,15),(58,'M','White',20,15),(59,'L','White',20,15),(60,'XL','White',40,15),(61,'M','WHB',10,23),(62,'S','WHB',20,23),(63,'5-6','RDW',20,25),(64,'5-6','BWT',23,25),(65,'6-7','RDW',18,25),(66,'6-7','White',20,26),(67,'6-7','Pink',20,26),(68,'7-8','White',20,26),(69,'7-8','Pink',25,26),(70,'6-7','Pink',23,27),(71,'7-8','Pink',23,27),(72,'6-7','White',25,27),(73,'7-8','White',23,27),(74,'11-12','Pink',44,28),(75,'11-12','Black',33,28),(76,'12-13','Balck',33,28),(77,'11-12','Pink',23,28),(78,'11-12','Blue',33,29),(79,'12-13','Blue',23,29),(80,'11-12','MBL',44,30),(81,'12-13','MBL',44,30),(82,'13-14','MBL',23,30);
/*!40000 ALTER TABLE `productvariant` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subcategory`
--

DROP TABLE IF EXISTS `subcategory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `subcategory` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `subcategoryname` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subcategory`
--

LOCK TABLES `subcategory` WRITE;
/*!40000 ALTER TABLE `subcategory` DISABLE KEYS */;
INSERT INTO `subcategory` VALUES (1,'Shirts'),(2,'T-Shirts'),(3,'Denim'),(4,'Non-Denim');
/*!40000 ALTER TABLE `subcategory` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-10-06 17:21:40
