CREATE DATABASE  IF NOT EXISTS `bank` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `bank`;
-- MySQL dump 10.13  Distrib 8.0.31, for macos12 (x86_64)
--
-- Host: localhost    Database: bank
-- ------------------------------------------------------
-- Server version	8.0.32

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
-- Table structure for table `Accounts`
--

DROP TABLE IF EXISTS `Accounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Accounts` (
  `Account_Number` bigint unsigned NOT NULL AUTO_INCREMENT,
  `Date_Of_Creation` date NOT NULL,
  `Customer_Id` int NOT NULL,
  `Account_Balance` decimal(10,2) NOT NULL,
  `Account_Type` int NOT NULL,
  PRIMARY KEY (`Account_Number`),
  UNIQUE KEY `Account_Number` (`Account_Number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Accounts`
--

LOCK TABLES `Accounts` WRITE;
/*!40000 ALTER TABLE `Accounts` DISABLE KEYS */;
/*!40000 ALTER TABLE `Accounts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Bank_Representative`
--

DROP TABLE IF EXISTS `Bank_Representative`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Bank_Representative` (
  `Employee_Id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `First_Name` varchar(255) NOT NULL,
  `Last_Name` varchar(255) NOT NULL,
  `Employee_Type` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Employee_Id`),
  UNIQUE KEY `Employee_Id` (`Employee_Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Bank_Representative`
--

LOCK TABLES `Bank_Representative` WRITE;
/*!40000 ALTER TABLE `Bank_Representative` DISABLE KEYS */;
/*!40000 ALTER TABLE `Bank_Representative` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Business_Policies`
--

DROP TABLE IF EXISTS `Business_Policies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Business_Policies` (
  `Policy_Name` varchar(255) NOT NULL,
  `Policy_Desc` text NOT NULL,
  PRIMARY KEY (`Policy_Name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Business_Policies`
--

LOCK TABLES `Business_Policies` WRITE;
/*!40000 ALTER TABLE `Business_Policies` DISABLE KEYS */;
/*!40000 ALTER TABLE `Business_Policies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Cards`
--

DROP TABLE IF EXISTS `Cards`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Cards` (
  `Card_Id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `Card_Type` varchar(25) NOT NULL,
  `Account_Number` int NOT NULL,
  `Card_Number` varchar(16) NOT NULL,
  `Pin` varchar(4) NOT NULL,
  `CVV` varchar(3) NOT NULL,
  `Expiration_Date` date NOT NULL,
  `Issue_Date` date NOT NULL,
  `Card_Status` int NOT NULL,
  PRIMARY KEY (`Card_Id`),
  UNIQUE KEY `Card_Id` (`Card_Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Cards`
--

LOCK TABLES `Cards` WRITE;
/*!40000 ALTER TABLE `Cards` DISABLE KEYS */;
/*!40000 ALTER TABLE `Cards` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Credentials`
--

DROP TABLE IF EXISTS `Credentials`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Credentials` (
  `Customer_Id` int NOT NULL,
  `User_Type` varchar(255) NOT NULL,
  `Username` varchar(255) NOT NULL,
  `Password` varchar(255) NOT NULL,
  PRIMARY KEY (`Customer_Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Credentials`
--

LOCK TABLES `Credentials` WRITE;
/*!40000 ALTER TABLE `Credentials` DISABLE KEYS */;
/*!40000 ALTER TABLE `Credentials` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Customer`
--

DROP TABLE IF EXISTS `Customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Customer` (
  `Customer_Id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `First_Name` varchar(255) NOT NULL,
  `Last_Name` varchar(255) NOT NULL,
  `Address` varchar(255) DEFAULT NULL,
  `Cell_Phone` varchar(15) DEFAULT NULL,
  `Email` varchar(255) DEFAULT NULL,
  `DOB` date DEFAULT NULL,
  PRIMARY KEY (`Customer_Id`),
  UNIQUE KEY `Customer_Id` (`Customer_Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Customer`
--

LOCK TABLES `Customer` WRITE;
/*!40000 ALTER TABLE `Customer` DISABLE KEYS */;
/*!40000 ALTER TABLE `Customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Meeting_Schedule`
--

DROP TABLE IF EXISTS `Meeting_Schedule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Meeting_Schedule` (
  `Customer_Id` int NOT NULL,
  `Employee_Id` int NOT NULL,
  `Meeting_Time` timestamp NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Meeting_Schedule`
--

LOCK TABLES `Meeting_Schedule` WRITE;
/*!40000 ALTER TABLE `Meeting_Schedule` DISABLE KEYS */;
/*!40000 ALTER TABLE `Meeting_Schedule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Policy_Rates`
--

DROP TABLE IF EXISTS `Policy_Rates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Policy_Rates` (
  `Policy_Name` varchar(255) NOT NULL,
  `rate` decimal(5,2) NOT NULL,
  PRIMARY KEY (`Policy_Name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Policy_Rates`
--

LOCK TABLES `Policy_Rates` WRITE;
/*!40000 ALTER TABLE `Policy_Rates` DISABLE KEYS */;
/*!40000 ALTER TABLE `Policy_Rates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Transactions`
--

DROP TABLE IF EXISTS `Transactions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Transactions` (
  `Transaction_Id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `Transaction_Type` varchar(255) NOT NULL,
  `Transaction_Amount` decimal(10,2) NOT NULL,
  `Customer_Id` int NOT NULL,
  `Account_Num_From` int DEFAULT NULL,
  `Account_Num_To` int DEFAULT NULL,
  `Timestamp_Start` timestamp NOT NULL,
  `Timestamp_End` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`Transaction_Id`),
  UNIQUE KEY `Transaction_Id` (`Transaction_Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Transactions`
--

LOCK TABLES `Transactions` WRITE;
/*!40000 ALTER TABLE `Transactions` DISABLE KEYS */;
/*!40000 ALTER TABLE `Transactions` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-10-16 14:48:52
