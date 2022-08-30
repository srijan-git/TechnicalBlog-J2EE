-- MySQL dump 10.13  Distrib 8.0.30, for macos12 (x86_64)
--
-- Host: localhost    Database: technicalblog
-- ------------------------------------------------------
-- Server version	8.0.30

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
-- Table structure for table `posts`
--

DROP TABLE IF EXISTS `posts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `posts` (
  `pid` int NOT NULL AUTO_INCREMENT,
  `pTitle` varchar(150) NOT NULL,
  `pContent` longtext,
  `pCode` longtext,
  `pPic` varchar(100) DEFAULT NULL,
  `pDate` datetime DEFAULT CURRENT_TIMESTAMP,
  `catId` int DEFAULT NULL,
  `userId` int DEFAULT NULL,
  PRIMARY KEY (`pid`),
  KEY `catId_idx` (`catId`),
  KEY `userId_idx` (`userId`),
  CONSTRAINT `catId` FOREIGN KEY (`catId`) REFERENCES `categories` (`cid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `userId` FOREIGN KEY (`userId`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `posts`
--

LOCK TABLES `posts` WRITE;
/*!40000 ALTER TABLE `posts` DISABLE KEYS */;
INSERT INTO `posts` VALUES (1,'What is Java Programming?','Java is a high-level, class-based, object-oriented programming language that is designed to have as few implementation dependencies as possible.','public class Main {\r\n  public static void main(String[] args) {\r\n    System.out.println(\"Hello World\");\r\n  }\r\n}','download.png','2022-08-30 20:46:56',1,1),(2,'What is .Net Framework?','NET Framework is a software development framework for building and running applications on Windows. . NET Framework is part of the . NET platform, a collection of technologies for building apps for Linux, macOS, Windows, iOS, Android, and more.','<html>\r\n<body>\r\n     <h1>Hello Web Pages</h1>\r\n     <p>The time is @DateTime.Now</p>\r\n</body>\r\n</html>','Microsoft_.NET_logo.svg.png','2022-08-30 20:46:56',5,2),(3,'What is Database Programming?','SQL is a standard language for storing, manipulating and retrieving data in databases.\r\n\r\nOur SQL tutorial will teach you how to use SQL in: MySQL, SQL Server, MS Access, Oracle, Sybase, Informix, Postgres, and other database systems.','CREATE TABLE shop (\r\n    article INT UNSIGNED  DEFAULT \'0000\' NOT NULL,\r\n    dealer  CHAR(20)      DEFAULT \'\'     NOT NULL,\r\n    price   DECIMAL(16,2) DEFAULT \'0.00\' NOT NULL,\r\n    PRIMARY KEY(article, dealer));\r\nINSERT INTO shop VALUES\r\n    (1,\'A\',3.45),(1,\'B\',3.99),(2,\'A\',10.99),(3,\'B\',1.45),\r\n    (3,\'C\',1.69),(3,\'D\',1.25),(4,\'D\',19.95);','mysql.png','2022-08-30 20:46:56',4,3),(4,'What is Python Programming?','Python is a high-level, interpreted, general-purpose programming language. Its design philosophy emphasizes code readability with the use of significant indentation. Python is dynamically-typed and garbage-collected','# Python 3: Fibonacci series up to n\r\n>>> def fib(n):\r\n>>>     a, b = 0, 1\r\n>>>     while a < n:\r\n>>>         print(a, end=\' \')\r\n>>>         a, b = b, a+b\r\n>>>     print()\r\n>>> fib(1000)\r\n0 1 1 2 3 5 8 13 21 34 55 89 144 233 377 610 987','Python.jpeg','2022-08-30 20:46:56',2,4),(5,'Why to learn Web Development Technologies?','Cascading Style Sheets is a style sheet language used for describing the presentation of a document written in a markup language such as HTML or XML. CSS is a cornerstone technology of the World Wide Web, alongside HTML and JavaScript','<h1 style=\"color:blue;\">A Blue Heading</h1>\r\n\r\n<p style=\"color:red;\">A red paragraph.</p>','html.png','2022-08-30 20:46:56',3,4);
/*!40000 ALTER TABLE `posts` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-08-30 22:36:59
