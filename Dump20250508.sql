-- MySQL dump 10.13  Distrib 8.0.38, for Win64 (x86_64)
--
-- Host: localhost    Database: rpg_db
-- ------------------------------------------------------
-- Server version	8.0.39

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
-- Table structure for table `character_inventory`
--

DROP TABLE IF EXISTS `character_inventory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `character_inventory` (
  `inventory_id` int NOT NULL AUTO_INCREMENT,
  `character_id` int NOT NULL,
  `item_id` int NOT NULL,
  PRIMARY KEY (`inventory_id`),
  UNIQUE KEY `unique_char_item` (`character_id`,`item_id`),
  KEY `item_id` (`item_id`),
  CONSTRAINT `character_inventory_ibfk_1` FOREIGN KEY (`character_id`) REFERENCES `characters` (`id`) ON DELETE CASCADE,
  CONSTRAINT `character_inventory_ibfk_2` FOREIGN KEY (`item_id`) REFERENCES `items` (`item_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `character_inventory`
--

LOCK TABLES `character_inventory` WRITE;
/*!40000 ALTER TABLE `character_inventory` DISABLE KEYS */;
/*!40000 ALTER TABLE `character_inventory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `characters`
--

DROP TABLE IF EXISTS `characters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `characters` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `class` varchar(50) NOT NULL,
  `strength` int DEFAULT NULL,
  `intelligence` int DEFAULT NULL,
  `agility` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `characters`
--

LOCK TABLES `characters` WRITE;
/*!40000 ALTER TABLE `characters` DISABLE KEYS */;
INSERT INTO `characters` VALUES (1,'Bob','Wizard',2,10,6),(3,'Ed','Warrior',10,2,6),(4,'Joe','Wizard',2,10,6),(5,'Bill','Wizard',2,10,6),(6,'Bobby','Thief',6,2,10),(8,'Ma','Warrior',10,2,6),(10,'Bob','Warrior',10,2,6),(11,'Po','Thief',6,2,10),(12,'Bob','Thief',6,2,10),(13,'Bob','Thief',6,2,10),(14,'Steve','Thief',6,2,10),(15,'Frank','Wizard',2,10,6),(16,'Frank','Wizard',2,10,6),(17,'Bob','Thief',6,2,10),(18,'TT','Wizard',2,10,6),(20,'Mario','Wizard',2,10,6),(21,'John','Wizard',2,10,6),(22,'Mark','Warrior',10,2,6),(23,'Billy','Thief',6,2,10),(24,'Dave','Wizard',2,10,6);
/*!40000 ALTER TABLE `characters` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inventory`
--

DROP TABLE IF EXISTS `inventory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `inventory` (
  `id` int NOT NULL AUTO_INCREMENT,
  `character_id` int DEFAULT NULL,
  `item_name` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `character_id` (`character_id`),
  CONSTRAINT `inventory_ibfk_1` FOREIGN KEY (`character_id`) REFERENCES `characters` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=60 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inventory`
--

LOCK TABLES `inventory` WRITE;
/*!40000 ALTER TABLE `inventory` DISABLE KEYS */;
INSERT INTO `inventory` VALUES (1,1,'Magic Staff'),(4,3,'Sword'),(5,3,'Shield'),(8,5,'Magic Staff'),(9,5,'Spellbook'),(10,6,'Dagger'),(11,6,'Lockpicks'),(14,8,'Basic Sword'),(15,8,'Plate Mail'),(16,8,'Kite Shield'),(20,10,'Basic Sword'),(21,10,'Plate Mail'),(22,10,'Kite Shield'),(23,11,'Dagger'),(24,11,'Stiletto'),(25,11,'Black Cloak'),(26,12,'Basic Sword'),(27,12,'Leather Jerkin'),(28,12,'Weighted Gloves'),(29,13,'Dagger'),(30,13,'Stiletto'),(31,13,'Black Cloak'),(35,15,'Magic Staff'),(36,15,'Wizard Robes'),(37,15,'Spellbook'),(38,16,'Magic Staff'),(39,16,'Wizard Robes'),(40,17,'Basic Sword'),(41,17,'Leather Jerkin'),(42,18,'Magic Staff'),(43,18,'Wizard Robes'),(44,14,'Basic Sword'),(45,14,'Leather Jerkin'),(46,4,'Magic Staff'),(49,20,'Magic Staff'),(50,20,'Wizard Robes'),(51,21,'Magic Staff'),(52,21,'Wizard Robes'),(53,22,'Basic Sword'),(54,22,'Plate Mail'),(55,22,'Kite Shield'),(57,23,'Black Cloak'),(58,24,'Magic Staff'),(59,24,'Wizard Robes');
/*!40000 ALTER TABLE `inventory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `items`
--

DROP TABLE IF EXISTS `items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `items` (
  `item_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `type` enum('WEAPON','ARMOR','POTION','QUEST','GENERIC') NOT NULL DEFAULT 'GENERIC',
  `attack_bonus` int DEFAULT '0',
  `defense_bonus` int DEFAULT '0',
  `heal_amount` int DEFAULT '0',
  `description` text,
  PRIMARY KEY (`item_id`),
  UNIQUE KEY `name` (`name`),
  KEY `name_2` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `items`
--

LOCK TABLES `items` WRITE;
/*!40000 ALTER TABLE `items` DISABLE KEYS */;
INSERT INTO `items` VALUES (1,'Basic Sword','WEAPON',3,0,0,'A simple but reliable sword.'),(2,'Magic Staff','WEAPON',1,0,0,'A staff humming with faint arcane energy.'),(3,'Plate Mail','ARMOR',0,15,0,'Heavy, protective metal armor.'),(4,'Kite Shield','ARMOR',0,8,0,'A large shield offering good protection.'),(5,'Wizard Robes','ARMOR',0,3,0,'Robes often worn by spellcasters.'),(6,'Leather Jerkin','ARMOR',0,6,0,'Tough leather torso protection.'),(7,'Black Cloak','ARMOR',0,1,0,'A dark cloak useful for blending into shadows.');
/*!40000 ALTER TABLE `items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `skills`
--

DROP TABLE IF EXISTS `skills`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `skills` (
  `id` int NOT NULL AUTO_INCREMENT,
  `character_id` int DEFAULT NULL,
  `skill_name` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `character_id` (`character_id`),
  CONSTRAINT `skills_ibfk_1` FOREIGN KEY (`character_id`) REFERENCES `characters` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=64 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `skills`
--

LOCK TABLES `skills` WRITE;
/*!40000 ALTER TABLE `skills` DISABLE KEYS */;
INSERT INTO `skills` VALUES (1,1,'Fireball'),(2,1,'Lightning Bolt'),(5,3,'Sword Mastery'),(6,3,'Shield Bash'),(9,5,'Fireball'),(10,5,'Lightning Bolt'),(11,6,'Stealth'),(12,6,'Lockpicking'),(13,6,'Backstab'),(16,8,'Power Strike'),(17,8,'Shield Block'),(20,10,'Power Strike'),(21,10,'Shield Block'),(22,11,'Stealth'),(23,11,'Backstab'),(24,11,'Poison Use'),(25,12,'Unarmed Strike'),(26,12,'Evasion'),(27,12,'Rapid Strikes'),(28,13,'Stealth'),(29,13,'Backstab'),(30,13,'Poison Use'),(34,15,'Fireball'),(35,15,'Arcane Bolt'),(36,16,'Fireball'),(37,16,'Arcane Bolt'),(38,17,'Unarmed Strike'),(39,17,'Evasion'),(40,17,'Rapid Strikes'),(41,18,'Fireball'),(42,18,'Arcane Bolt'),(43,14,'Unarmed Strike'),(44,14,'Evasion'),(45,14,'Rapid Strikes'),(46,4,'Fireball'),(47,4,'Lightning Bolt'),(50,20,'Fireball'),(51,20,'Arcane Bolt'),(52,21,'Fireball'),(53,21,'Arcane Bolt'),(54,22,'Power Strike'),(55,22,'Shield Block'),(59,23,'Stealth'),(60,23,'Backstab'),(61,23,'Poison Use'),(62,24,'Fireball'),(63,24,'Arcane Bolt');
/*!40000 ALTER TABLE `skills` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-05-08 15:04:56
