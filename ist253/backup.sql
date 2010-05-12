-- MySQL dump 10.11
--
-- Host: localhost    Database: ist253
-- ------------------------------------------------------
-- Server version	5.0.84-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `CUSTOMER`
--

DROP TABLE IF EXISTS `CUSTOMER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CUSTOMER` (
  `CustomerAccountNo` int(18) unsigned NOT NULL auto_increment,
  `CustomerLName` char(20) default NULL,
  `CustomerFName` char(20) default NULL,
  `CustomerAddress` char(20) default NULL,
  `CustomerCity` char(20) default NULL,
  `CustomerState` char(20) default NULL,
  `CustomerZip` char(20) default NULL,
  `CustomerPhone` char(20) default NULL,
  PRIMARY KEY  (`CustomerAccountNo`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CUSTOMER`
--

LOCK TABLES `CUSTOMER` WRITE;
/*!40000 ALTER TABLE `CUSTOMER` DISABLE KEYS */;
INSERT INTO `CUSTOMER` VALUES (1,'Mills','Julia','1 Robin Court','West Windsor','NJ','08550','(609)789-1234'),(2,'Wells','Homer','2 Robin Court','West Windsor','NJ','08550','(609)789-1235'),(3,'Norbert','Bob','3 Robin Court','West Windsor','NJ','08550','(609)789-1236'),(4,'Kendall','Candy','1 Colt Ave','West Windsor','NJ','08550','(609)123-9876'),(5,'Dodge','Mariah','101 Village Road','West Windsor','NJ','08550','(732)789-1235'),(6,'Dodge','Tess','55 Marie Court','West Windsor','NJ','08550','(609)587-1236'),(7,'Kendall','Joe','86  Flock Road','West Windsor','NJ','08550','(732)222-9876'),(8,'Colan','Cristopher','101 Salon Ave','West Windsor','NJ','08550','(609)789-1235'),(9,'Brazzi','Luke','4 Alexander Court','West Windsor','NJ','08550','(609)987-0609'),(10,'Pilgrim','William','10 Eric Circle','West Windsor','NJ','08550','(732)587-4454'),(11,'Smith','Bob','123 Pyramid Lane, Ap','Caracas','VN','08550','1234567890'),(12,'Smith','Bob','123 Pyramid Lane, Ap','Caracas','VN','08550','1234567890'),(13,'Smith','Bob','123 Pyramid Lane, Ap','Caracas','VN','08550','1234567890');
/*!40000 ALTER TABLE `CUSTOMER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CUSTOMER_PRODUCT`
--

DROP TABLE IF EXISTS `CUSTOMER_PRODUCT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CUSTOMER_PRODUCT` (
  `CustProdNo` int(18) unsigned NOT NULL auto_increment,
  `CustomerAccountNo` int(18) unsigned NOT NULL,
  `ProdSerNo` char(18) NOT NULL,
  `SerPlanNo` int(18) unsigned NOT NULL,
  PRIMARY KEY  (`CustProdNo`),
  KEY `CustomerAccountNo` (`CustomerAccountNo`),
  KEY `ProdSerNo` (`ProdSerNo`),
  KEY `SerPlanNo` (`SerPlanNo`),
  CONSTRAINT `CUSTOMER_PRODUCT_ibfk_1` FOREIGN KEY (`CustomerAccountNo`) REFERENCES `CUSTOMER` (`CustomerAccountNo`),
  CONSTRAINT `CUSTOMER_PRODUCT_ibfk_2` FOREIGN KEY (`ProdSerNo`) REFERENCES `PRODUCT` (`ProdSerNo`),
  CONSTRAINT `CUSTOMER_PRODUCT_ibfk_3` FOREIGN KEY (`SerPlanNo`) REFERENCES `SERVICE_PLAN` (`SerPlanNo`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COMMENT='Links the Customers to the Products';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CUSTOMER_PRODUCT`
--

LOCK TABLES `CUSTOMER_PRODUCT` WRITE;
/*!40000 ALTER TABLE `CUSTOMER_PRODUCT` DISABLE KEYS */;
INSERT INTO `CUSTOMER_PRODUCT` VALUES (1,1,'W2100',1),(2,2,'D2100',2),(3,3,'R2100',3),(4,3,'W2200',8),(5,4,'O2100',4),(6,5,'DW2100',5),(7,6,'M2100',6),(8,7,'S2100',7),(9,8,'DW2100',10),(10,9,'M2100',9),(11,10,'W2100',11);
/*!40000 ALTER TABLE `CUSTOMER_PRODUCT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `DIAGNOSTIC`
--

DROP TABLE IF EXISTS `DIAGNOSTIC`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DIAGNOSTIC` (
  `DiagNo` int(18) unsigned NOT NULL auto_increment,
  `DiagBeginDate` date NOT NULL,
  `DiagEndDate` date default NULL,
  `DiagResult` varchar(20) default NULL,
  PRIMARY KEY  (`DiagNo`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DIAGNOSTIC`
--

LOCK TABLES `DIAGNOSTIC` WRITE;
/*!40000 ALTER TABLE `DIAGNOSTIC` DISABLE KEYS */;
INSERT INTO `DIAGNOSTIC` VALUES (1,'2009-11-01','2009-11-01','P'),(2,'2009-12-01','2009-12-01','P'),(3,'2010-01-01','2010-01-01','P'),(4,'2010-02-01','2010-02-01','P'),(5,'2010-03-01','2010-03-01','P'),(6,'2010-04-01','2010-04-01','P'),(7,'2009-10-02','2009-10-02','P'),(8,'2010-02-14','2010-02-14','P'),(9,'2009-08-14','2009-08-14','P'),(10,'2010-02-14','2010-02-14','P'),(11,'2008-06-19','2008-06-19','P'),(12,'2008-12-19','2008-12-19','P'),(13,'2009-06-19','2009-06-19','F'),(14,'2009-12-19','2009-12-19','P'),(15,'2009-10-15','2009-10-15','F'),(16,'2010-02-13','2010-02-13','P'),(17,'2010-03-13','2010-03-13','F'),(18,'2010-04-13','2010-04-13','P'),(19,'2010-03-01','2010-03-01','F'),(20,'2009-11-15','2009-11-15','P');
/*!40000 ALTER TABLE `DIAGNOSTIC` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `INVENTORY`
--

DROP TABLE IF EXISTS `INVENTORY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `INVENTORY` (
  `PartNo` char(18) NOT NULL,
  `PartName` varchar(20) NOT NULL,
  `PartAvail` tinyint(1) NOT NULL,
  `ProdType` varchar(20) NOT NULL,
  PRIMARY KEY  (`PartNo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `INVENTORY`
--

LOCK TABLES `INVENTORY` WRITE;
/*!40000 ALTER TABLE `INVENTORY` DISABLE KEYS */;
INSERT INTO `INVENTORY` VALUES ('DW001','Pump',1,'Dishwasher'),('MW003','Dish Spindal',1,'Microwave'),('OV003','Oven Sensor',1,'Oven'),('RG001','Burners',1,'Stove');
/*!40000 ALTER TABLE `INVENTORY` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `INVOICE`
--

DROP TABLE IF EXISTS `INVOICE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `INVOICE` (
  `InvNo` int(18) unsigned NOT NULL auto_increment,
  `InvDate` date NOT NULL,
  `SalesTax` decimal(10,2) NOT NULL,
  `InvDueDate` date NOT NULL,
  PRIMARY KEY  (`InvNo`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `INVOICE`
--

LOCK TABLES `INVOICE` WRITE;
/*!40000 ALTER TABLE `INVOICE` DISABLE KEYS */;
INSERT INTO `INVOICE` VALUES (1,'2009-11-01','0.35','2009-11-11'),(2,'2009-12-01','0.35','2009-12-11'),(3,'2010-01-01','0.35','2010-01-11'),(4,'2010-02-01','0.35','2010-02-11'),(5,'2010-03-01','0.35','2010-03-11'),(6,'2010-04-01','0.35','2010-04-11'),(7,'2009-10-02','0.35','2009-10-12'),(8,'2010-02-14','1.12','2010-02-24'),(9,'2009-08-14','0.63','2009-08-24'),(10,'2010-02-14','0.63','2010-02-24'),(11,'2008-06-19','0.63','2008-06-29'),(12,'2008-12-19','0.63','2008-12-29'),(13,'2009-06-19','0.63','2009-06-29'),(14,'2009-12-19','0.63','2009-12-29'),(15,'2009-10-15','2.45','2009-10-25'),(16,'2010-02-13','0.35','2010-02-23'),(17,'2010-03-13','0.35','2010-03-23'),(18,'2010-04-13','0.35','2010-04-23'),(19,'2010-03-01','1.12','2010-03-11'),(20,'2009-11-15','0.35','2009-11-25');
/*!40000 ALTER TABLE `INVOICE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `INVOICE_SERVICE`
--

DROP TABLE IF EXISTS `INVOICE_SERVICE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `INVOICE_SERVICE` (
  `InvNo` int(18) unsigned NOT NULL,
  `SerPlanNo` int(18) unsigned NOT NULL,
  KEY `InvNo` (`InvNo`),
  KEY `SerPlanNo` (`SerPlanNo`),
  CONSTRAINT `INVOICE_SERVICE_ibfk_2` FOREIGN KEY (`SerPlanNo`) REFERENCES `SERVICE_PLAN` (`SerPlanNo`),
  CONSTRAINT `INVOICE_SERVICE_ibfk_1` FOREIGN KEY (`InvNo`) REFERENCES `INVOICE` (`InvNo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Links service plans with an invoice';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `INVOICE_SERVICE`
--

LOCK TABLES `INVOICE_SERVICE` WRITE;
/*!40000 ALTER TABLE `INVOICE_SERVICE` DISABLE KEYS */;
INSERT INTO `INVOICE_SERVICE` VALUES (1,1),(2,2),(3,3),(4,4),(5,5),(6,6),(7,7),(8,8),(9,9),(10,10),(11,11),(12,1),(13,2),(14,3),(15,4),(16,5),(17,6),(18,7),(19,8),(20,9);
/*!40000 ALTER TABLE `INVOICE_SERVICE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PRODUCT`
--

DROP TABLE IF EXISTS `PRODUCT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PRODUCT` (
  `ProdSerNo` char(18) NOT NULL,
  `ProdType` varchar(18) NOT NULL,
  PRIMARY KEY  (`ProdSerNo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PRODUCT`
--

LOCK TABLES `PRODUCT` WRITE;
/*!40000 ALTER TABLE `PRODUCT` DISABLE KEYS */;
INSERT INTO `PRODUCT` VALUES ('D2100','Dryer'),('DW2100','Dishwasher'),('M2100','Microwave'),('O2100','Oven'),('R2100','Refrigerator'),('S2100','Stove'),('W2100','Washer'),('W2200','Washer');
/*!40000 ALTER TABLE `PRODUCT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SERVICE_PLAN`
--

DROP TABLE IF EXISTS `SERVICE_PLAN`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SERVICE_PLAN` (
  `SerPlanNo` int(18) unsigned NOT NULL auto_increment,
  `SerPlanType` varchar(20) NOT NULL,
  `SerPlanRate` decimal(10,2) NOT NULL,
  `SerPlanIssued` date NOT NULL,
  PRIMARY KEY  (`SerPlanNo`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SERVICE_PLAN`
--

LOCK TABLES `SERVICE_PLAN` WRITE;
/*!40000 ALTER TABLE `SERVICE_PLAN` DISABLE KEYS */;
INSERT INTO `SERVICE_PLAN` VALUES (1,'A','5.00','2009-10-01'),(2,'B','9.00','2008-10-02'),(3,'C','16.00','2004-02-13'),(4,'D','35.00','2009-02-14'),(5,'A','5.00','2007-12-19'),(6,'B','9.00','2009-11-06'),(7,'C','16.00','2008-07-07'),(8,'D','35.00','2010-01-13'),(9,'A','5.00','2009-03-02'),(10,'B','9.00','2009-05-12'),(11,'C','16.00','2005-08-03');
/*!40000 ALTER TABLE `SERVICE_PLAN` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TEST_RESULTS`
--

DROP TABLE IF EXISTS `TEST_RESULTS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TEST_RESULTS` (
  `TestResNo` int(18) unsigned NOT NULL auto_increment,
  `ProdSerNo` char(18) default NULL,
  `DiagNo` int(18) unsigned default NULL,
  `Status` varchar(18) default NULL,
  `PartNo` char(18) default NULL,
  `EstSerDate` date default NULL,
  PRIMARY KEY  (`TestResNo`),
  KEY `DiagNo` (`DiagNo`),
  KEY `ProdSerNo` (`ProdSerNo`),
  KEY `PartNo` (`PartNo`),
  CONSTRAINT `TEST_RESULTS_ibfk_3` FOREIGN KEY (`PartNo`) REFERENCES `INVENTORY` (`PartNo`),
  CONSTRAINT `TEST_RESULTS_ibfk_1` FOREIGN KEY (`DiagNo`) REFERENCES `DIAGNOSTIC` (`DiagNo`),
  CONSTRAINT `TEST_RESULTS_ibfk_2` FOREIGN KEY (`ProdSerNo`) REFERENCES `PRODUCT` (`ProdSerNo`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TEST_RESULTS`
--

LOCK TABLES `TEST_RESULTS` WRITE;
/*!40000 ALTER TABLE `TEST_RESULTS` DISABLE KEYS */;
INSERT INTO `TEST_RESULTS` VALUES (1,'W2100',1,NULL,NULL,'0000-00-00'),(2,'W2100',2,NULL,NULL,'0000-00-00'),(3,'W2100',3,NULL,NULL,'0000-00-00'),(4,'W2100',4,NULL,NULL,'0000-00-00'),(5,'W2100',5,NULL,NULL,'0000-00-00'),(6,'W2100',6,NULL,NULL,'0000-00-00'),(7,'D2100',7,NULL,NULL,'0000-00-00'),(8,'R2100',8,NULL,NULL,'0000-00-00'),(9,'W2200',9,NULL,NULL,'0000-00-00'),(10,'W2200',10,NULL,NULL,'0000-00-00'),(11,'O2100',11,NULL,NULL,'0000-00-00'),(12,'O2100',12,NULL,NULL,'0000-00-00'),(13,'O2100',13,'Active','OV003','2009-06-24'),(14,'O2100',14,NULL,NULL,'0000-00-00'),(15,'M2100',15,'Active','MW003','2009-10-20'),(16,'S2100',16,NULL,NULL,'0000-00-00'),(17,'S2100',17,'Active','RG001','2010-03-18'),(18,'S2100',18,NULL,NULL,'0000-00-00'),(19,'DW2100',19,'Active','DW001','2010-03-06'),(20,'M2100',20,NULL,NULL,'0000-00-00');
/*!40000 ALTER TABLE `TEST_RESULTS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL auto_increment,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `group_id` (`group_id`,`permission_id`),
  KEY `permission_id_refs_id_5886d21f` (`permission_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_message`
--

DROP TABLE IF EXISTS `auth_message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_message` (
  `id` int(11) NOT NULL auto_increment,
  `user_id` int(11) NOT NULL,
  `message` longtext NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `auth_message_user_id` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_message`
--

LOCK TABLES `auth_message` WRITE;
/*!40000 ALTER TABLE `auth_message` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_message` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(50) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `content_type_id` (`content_type_id`,`codename`),
  KEY `auth_permission_content_type_id` (`content_type_id`)
) ENGINE=MyISAM AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add permission',1,'add_permission'),(2,'Can change permission',1,'change_permission'),(3,'Can delete permission',1,'delete_permission'),(4,'Can add group',2,'add_group'),(5,'Can change group',2,'change_group'),(6,'Can delete group',2,'delete_group'),(7,'Can add user',3,'add_user'),(8,'Can change user',3,'change_user'),(9,'Can delete user',3,'delete_user'),(10,'Can add message',4,'add_message'),(11,'Can change message',4,'change_message'),(12,'Can delete message',4,'delete_message'),(13,'Can add content type',5,'add_contenttype'),(14,'Can change content type',5,'change_contenttype'),(15,'Can delete content type',5,'delete_contenttype'),(16,'Can add session',6,'add_session'),(17,'Can change session',6,'change_session'),(18,'Can delete session',6,'delete_session'),(19,'Can add site',7,'add_site'),(20,'Can change site',7,'change_site'),(21,'Can delete site',7,'delete_site'),(22,'Can add poll',8,'add_poll'),(23,'Can change poll',8,'change_poll'),(24,'Can delete poll',8,'delete_poll'),(25,'Can add choice',9,'add_choice'),(26,'Can change choice',9,'change_choice'),(27,'Can delete choice',9,'delete_choice');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL auto_increment,
  `username` varchar(30) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(75) NOT NULL,
  `password` varchar(128) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `last_login` datetime NOT NULL,
  `date_joined` datetime NOT NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'dk','','','kayd@student.mccc.edu','sha1$eef60$dcb1f4df470487ab609292f40a526af6bda91600',1,1,1,'2010-05-12 02:39:31','2010-05-12 02:39:31');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL auto_increment,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `user_id` (`user_id`,`group_id`),
  KEY `group_id_refs_id_f116770` (`group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL auto_increment,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `user_id` (`user_id`,`permission_id`),
  KEY `permission_id_refs_id_67e79cb` (`permission_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(100) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `app_label` (`app_label`,`model`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'permission','auth','permission'),(2,'group','auth','group'),(3,'user','auth','user'),(4,'message','auth','message'),(5,'content type','contenttypes','contenttype'),(6,'session','sessions','session'),(7,'site','sites','site'),(8,'poll','polls','poll'),(9,'choice','polls','choice');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime NOT NULL,
  PRIMARY KEY  (`session_key`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_site`
--

DROP TABLE IF EXISTS `django_site`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_site` (
  `id` int(11) NOT NULL auto_increment,
  `domain` varchar(100) NOT NULL,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_site`
--

LOCK TABLES `django_site` WRITE;
/*!40000 ALTER TABLE `django_site` DISABLE KEYS */;
INSERT INTO `django_site` VALUES (1,'example.com','example.com');
/*!40000 ALTER TABLE `django_site` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `polls_choice`
--

DROP TABLE IF EXISTS `polls_choice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `polls_choice` (
  `id` int(11) NOT NULL auto_increment,
  `poll_id` int(11) NOT NULL,
  `choice` varchar(200) NOT NULL,
  `votes` int(11) NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `polls_choice_poll_id` (`poll_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `polls_choice`
--

LOCK TABLES `polls_choice` WRITE;
/*!40000 ALTER TABLE `polls_choice` DISABLE KEYS */;
/*!40000 ALTER TABLE `polls_choice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `polls_poll`
--

DROP TABLE IF EXISTS `polls_poll`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `polls_poll` (
  `id` int(11) NOT NULL auto_increment,
  `question` varchar(200) NOT NULL,
  `pub_date` datetime NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `polls_poll`
--

LOCK TABLES `polls_poll` WRITE;
/*!40000 ALTER TABLE `polls_poll` DISABLE KEYS */;
/*!40000 ALTER TABLE `polls_poll` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2010-05-12  4:28:02
