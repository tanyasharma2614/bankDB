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
  `Account_Number` int NOT NULL AUTO_INCREMENT,
  `Date_Of_Creation` date NOT NULL,
  `Account_Balance` decimal(10,2) NOT NULL,
  PRIMARY KEY (`Account_Number`)
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
-- Table structure for table `Admin`
--

DROP TABLE IF EXISTS `Admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Admin` (
  `Admin_Id` int NOT NULL AUTO_INCREMENT,
  `First_Name` varchar(255) NOT NULL,
  `Last_Name` varchar(255) NOT NULL,
  `Employee_Id` int NOT NULL,
  `Admin_Type` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Admin_Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Admin`
--

LOCK TABLES `Admin` WRITE;
/*!40000 ALTER TABLE `Admin` DISABLE KEYS */;
/*!40000 ALTER TABLE `Admin` ENABLE KEYS */;
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
  KEY `Customer_Id` (`Customer_Id`),
  CONSTRAINT `credentials_ibfk_1` FOREIGN KEY (`Customer_Id`) REFERENCES `Customer` (`Customer_Id`)
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
  `Customer_Id` int NOT NULL AUTO_INCREMENT,
  `First_Name` varchar(255) NOT NULL,
  `Last_Name` varchar(255) NOT NULL,
  `Address` varchar(255) DEFAULT NULL,
  `Cell_Phone` varchar(15) DEFAULT NULL,
  `Email` varchar(255) DEFAULT NULL,
  `DOB` date DEFAULT NULL,
  PRIMARY KEY (`Customer_Id`)
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
-- Table structure for table `Customer_Account_Rel`
--

DROP TABLE IF EXISTS `Customer_Account_Rel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Customer_Account_Rel` (
  `Customer_Id` int NOT NULL,
  `Account_Number` int NOT NULL,
  `Account_Type` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Customer_Id`,`Account_Number`),
  KEY `Account_Number` (`Account_Number`),
  CONSTRAINT `customer_account_rel_ibfk_1` FOREIGN KEY (`Customer_Id`) REFERENCES `Customer` (`Customer_Id`),
  CONSTRAINT `customer_account_rel_ibfk_2` FOREIGN KEY (`Account_Number`) REFERENCES `Accounts` (`Account_Number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Customer_Account_Rel`
--

LOCK TABLES `Customer_Account_Rel` WRITE;
/*!40000 ALTER TABLE `Customer_Account_Rel` DISABLE KEYS */;
/*!40000 ALTER TABLE `Customer_Account_Rel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Debit_Cards`
--

DROP TABLE IF EXISTS `Debit_Cards`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Debit_Cards` (
  `Card_Id` int NOT NULL AUTO_INCREMENT,
  `Account_Number` int NOT NULL,
  `Card_Number` varchar(16) NOT NULL,
  `Pin` varchar(4) NOT NULL,
  `CVV` varchar(3) NOT NULL,
  `Expiration_Date` date NOT NULL,
  `Issue_Date` date NOT NULL,
  `Card_Status` enum('active','locked','deleted') NOT NULL,
  PRIMARY KEY (`Card_Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Debit_Cards`
--

LOCK TABLES `Debit_Cards` WRITE;
/*!40000 ALTER TABLE `Debit_Cards` DISABLE KEYS */;
/*!40000 ALTER TABLE `Debit_Cards` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Interest_Rates`
--

DROP TABLE IF EXISTS `Interest_Rates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Interest_Rates` (
  `Account_Type` varchar(255) NOT NULL,
  `Interest_Rate` decimal(5,2) NOT NULL,
  PRIMARY KEY (`Account_Type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Interest_Rates`
--

LOCK TABLES `Interest_Rates` WRITE;
/*!40000 ALTER TABLE `Interest_Rates` DISABLE KEYS */;
/*!40000 ALTER TABLE `Interest_Rates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Teller`
--

DROP TABLE IF EXISTS `Teller`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Teller` (
  `Teller_Id` int NOT NULL AUTO_INCREMENT,
  `First_Name` varchar(255) NOT NULL,
  `Last_Name` varchar(255) NOT NULL,
  `Employee_Id` int NOT NULL,
  `Teller_Type` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Teller_Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Teller`
--

LOCK TABLES `Teller` WRITE;
/*!40000 ALTER TABLE `Teller` DISABLE KEYS */;
/*!40000 ALTER TABLE `Teller` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Transactions`
--

DROP TABLE IF EXISTS `Transactions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Transactions` (
  `Transaction_Id` int NOT NULL AUTO_INCREMENT,
  `Transaction_Type` varchar(255) NOT NULL,
  `Transaction_Amount` decimal(10,2) NOT NULL,
  `Customer_Id` int NOT NULL,
  `Account_From_Id` int DEFAULT NULL,
  `Account_To_Id` int DEFAULT NULL,
  `Timestamp_Start` datetime NOT NULL,
  `Timestamp_End` datetime DEFAULT NULL,
  PRIMARY KEY (`Transaction_Id`),
  KEY `Customer_Id` (`Customer_Id`),
  KEY `Account_From_Id` (`Account_From_Id`),
  KEY `Account_To_Id` (`Account_To_Id`),
  CONSTRAINT `transactions_ibfk_1` FOREIGN KEY (`Customer_Id`) REFERENCES `Customer` (`Customer_Id`),
  CONSTRAINT `transactions_ibfk_2` FOREIGN KEY (`Account_From_Id`) REFERENCES `Accounts` (`Account_Number`),
  CONSTRAINT `transactions_ibfk_3` FOREIGN KEY (`Account_To_Id`) REFERENCES `Accounts` (`Account_Number`)
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

-- Dump completed on 2023-09-27 13:17:12
