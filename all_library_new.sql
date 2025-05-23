-- MySQL dump 10.13  Distrib 8.0.40, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: all_library_new
-- ------------------------------------------------------
-- Server version	8.0.40

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
-- Table structure for table `books`
--

DROP TABLE IF EXISTS `books`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `books` (
  `id_book` int NOT NULL AUTO_INCREMENT,
  `autor` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `deleted` bit(1) NOT NULL,
  PRIMARY KEY (`id_book`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `books`
--

LOCK TABLES `books` WRITE;
/*!40000 ALTER TABLE `books` DISABLE KEYS */;
INSERT INTO `books` VALUES (1,'Лев Толстой','Война и мир',_binary '\0'),(2,'Фёдор Достоевский','Преступление и наказание',_binary '\0'),(3,'Михаил Булгаков','Мастер и Маргарита',_binary '\0'),(4,'Александр Пушкин','Капитанская дочка',_binary '\0'),(5,'Иван Тургенев','Отцы и дети',_binary '\0'),(6,'Максим Горький','На дне',_binary '\0'),(7,'Антон Чехов','Чайка',_binary '\0'),(8,'Владимир Набоков','Лолита',_binary '\0'),(9,'Николай Лесков','Очарованный странник',_binary '\0'),(10,'Андрей Платонов','Котлован',_binary '\0'),(11,'тест','тест',_binary ''),(12,'тест1','тест1',_binary ''),(13,'test228','test228',_binary '');
/*!40000 ALTER TABLE `books` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `borrowed_book`
--

DROP TABLE IF EXISTS `borrowed_book`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `borrowed_book` (
  `id_borrowed_book` int NOT NULL AUTO_INCREMENT,
  `loan_date` date DEFAULT NULL,
  `return_date` date DEFAULT NULL,
  `book_id` int DEFAULT NULL,
  `reader_id` int DEFAULT NULL,
  PRIMARY KEY (`id_borrowed_book`),
  KEY `FKgfew4nhw99hxn1vhfu5dvneos` (`book_id`),
  KEY `FK1xm7hrg2oyc99lm5uypswm9l3` (`reader_id`),
  CONSTRAINT `FK1xm7hrg2oyc99lm5uypswm9l3` FOREIGN KEY (`reader_id`) REFERENCES `readers` (`id_reader`),
  CONSTRAINT `FKgfew4nhw99hxn1vhfu5dvneos` FOREIGN KEY (`book_id`) REFERENCES `books` (`id_book`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `borrowed_book`
--

LOCK TABLES `borrowed_book` WRITE;
/*!40000 ALTER TABLE `borrowed_book` DISABLE KEYS */;
/*!40000 ALTER TABLE `borrowed_book` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `borrowed_books`
--

DROP TABLE IF EXISTS `borrowed_books`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `borrowed_books` (
  `id_borrowed_books` int NOT NULL AUTO_INCREMENT,
  `book_id` int DEFAULT NULL,
  `loan_id` int DEFAULT NULL,
  `reader_id` int DEFAULT NULL,
  `return_date` varchar(255) DEFAULT NULL,
  `loan_date` varchar(255) NOT NULL,
  `id_loaned_books` int NOT NULL,
  PRIMARY KEY (`id_borrowed_books`),
  KEY `book_id` (`book_id`),
  KEY `reader_id` (`reader_id`),
  CONSTRAINT `borrowed_books_ibfk_1` FOREIGN KEY (`book_id`) REFERENCES `books` (`id_book`),
  CONSTRAINT `borrowed_books_ibfk_2` FOREIGN KEY (`reader_id`) REFERENCES `readers` (`id_reader`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `borrowed_books`
--

LOCK TABLES `borrowed_books` WRITE;
/*!40000 ALTER TABLE `borrowed_books` DISABLE KEYS */;
INSERT INTO `borrowed_books` VALUES (1,1,101,1,'2025-04-20','',0),(2,2,102,2,'2025-04-15','',0),(3,3,103,3,NULL,'',0),(4,4,104,4,'2025-04-18','',0),(5,5,105,5,NULL,'',0),(6,6,106,6,'2025-04-10','',0),(7,7,107,7,NULL,'',0),(8,8,108,8,NULL,'',0),(9,9,109,4,'2025-04-22','',0),(10,10,110,1,NULL,'',0);
/*!40000 ALTER TABLE `borrowed_books` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `readers`
--

DROP TABLE IF EXISTS `readers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `readers` (
  `id_reader` int NOT NULL AUTO_INCREMENT,
  `first_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_reader`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `readers`
--

LOCK TABLES `readers` WRITE;
/*!40000 ALTER TABLE `readers` DISABLE KEYS */;
INSERT INTO `readers` VALUES (1,'Иван','Иванов'),(2,'Мария','Смирнова'),(3,'Александр','Кузнецов'),(4,'Николай','Смирнов'),(5,'Наталья','Седова'),(6,'Виталий','Новиков'),(7,'Ярослав','Великий'),(8,'Мирослава','Демидова'),(9,'user112','user112');
/*!40000 ALTER TABLE `readers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `role` varchar(255) NOT NULL,
  `deleted` bit(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=62 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'admin1','admin1','admin',_binary '\0'),(4,'admin12','admin12','user',_binary '\0'),(6,'user15','user15','user',_binary '\0'),(7,'user112','user112','user',_binary '\0'),(8,'user100','user100','USER',_binary '\0'),(9,'user101','user101','USER',_binary '\0'),(11,'user103','user103','USER',_binary '\0'),(12,'user104','user104','USER',_binary '\0'),(13,'user105','user105','USER',_binary '\0'),(14,'user1005','user1005','user',_binary '\0'),(15,'user228','user228','user',_binary '\0'),(16,'api','api1','user',_binary '\0'),(18,'api228','api228','user',_binary '\0'),(19,'dima228','$2a$10$bJZipbWmwUvmTv3gI6gsSe/8GKgouOu6H4So4wPANZAouKvNtNnwO','user',_binary '\0'),(20,'qwer','$2a$10$rBSuSchQBUmcpP7035C3xu1X3cK9s9weAQltDtj7aYUfk2ioGr/WO','user',_binary '\0'),(21,'inf1212','$2a$10$DnrIRgQM/oeLaiMJB6SIIej4bhPYFNjKl8GwR7ecUzwX/HlXXn1BG','user',_binary '\0'),(22,'dima33','$2a$10$V/rZGIzn2I3l.nWc.QNZb.rDH9CsqcCOxKDKOqwaRpOLfyzZcPnsW','user',_binary '\0'),(23,'dima2001','$2a$10$hR4zOhglLeBpadGbaEgMlO/U0Y7vxEHKOQWoQr8HrEVeflQ.BJtg6','user',_binary '\0'),(24,'dima221','$2a$10$R/khbO4iPWmSsoCbG5f9huT/j8RZYtiyCVrSOvrM2rJYmAzbFev7O','user',_binary '\0'),(25,'dima223','$2a$10$cvtqBhy75xgL234dwKM8x.J3llbgWwAZPnWbIgNqPW82KPemKyTCy','user',_binary '\0'),(26,'user39','$2a$10$3atkdxGlrkiwZj/eaITEweDIWDeeXyqaRobtZ6c7m1jPtb/065itu','user',_binary '\0'),(27,'dima12','$2a$10$UODn/ttXyB1LTzGqYT3UFuXs413IVhmcv2grHlkrzpcksHhuX0PpS','user',_binary '\0'),(28,'dima03','$2a$10$9mHrAW6nPpOlmDTq5xq7YOU0OBc74CRSrnH14CiAS2I/lhQrDFHZW','user',_binary '\0'),(29,'we211','$2a$10$ZpGI5uJ/iMtj7DsFfNHvnud1..G340XjCMgZsHl1s107pt1HXduda','USER',_binary '\0'),(30,'dima222','dima222','user',_binary '\0'),(31,'qaz1','qaz1','user',_binary '\0'),(32,'dima2222','$2a$10$K6I23nasOZ7u4XGoSbQY9OejbYn9UALTJv1wmVmVGnLnBSheUauu2','user',_binary '\0'),(33,'dima002','$2a$10$3jPT2bamzin25o6OVa9UVOKJjdidkfhhI92V9Qyjq1.EOOp8H3B0.','user',_binary '\0'),(34,'ded21','$2a$10$TyYlMrvLlPNaPEi6J1g1gOWCUIWjam4ze.suPGJlTdMeVG6eA0I2K','user',_binary '\0'),(35,'ded212','$2a$10$DUqgm8F3K7H6QRRfVZmY.etrkb2JPRegudMQqJxfermn0ORB6QX9W','user',_binary '\0'),(36,'dima33','$2a$10$Amqrud182wSwyO0l4SylU.B.5iJWvvhFO2m4vn.dmn8HJkYuvGnXy','user',_binary '\0'),(37,'dima35','$2a$10$d2qfE0MHgB9RhnHqNCwq1O/JEwrdjuYVAziSEVVYVPkj81BaDUay2','user',_binary '\0'),(38,'dima321','$2a$10$K7UXzl330udkML6LGJyYhujzKzymIOn.bEHUbr50ccoKQgd/T4xv2','user',_binary '\0'),(39,'ccs','$2a$10$hYaPr3vNPGCycOBeM/o2COImn0E9nRiiyRAEbH0JXDrrq/IZ7OXp6','user',_binary '\0'),(40,'admin22','$2a$12$9xuF6T7zUWZvK6QdVhWbCeOyM7B8RrsGcJqYtLZiDk4ZsCmP7nWjO','admin',_binary '\0'),(41,'admin22','admin22','admin',_binary '\0'),(42,'admin222','$2a$10$Qz.lH.tIi0BuCh0eeqibCea8a4phIvENQAccSK52PTZ2pQw/dIwDm','user',_binary '\0'),(43,'admin','$2a$10$rPGBxEyCzuyEjSmoGVi70O9zVsb7Kx.LGlWqGHwU6kCnrxkKAjAri','admin',_binary '\0'),(44,'wew1','$2a$10$wsRhZuFFTQTeqKj8iIM7uexHWmMoSRq/WmxpEDC3H2xyj8Eyr7CtK','user',_binary '\0'),(45,'sosaq','$2a$10$XXdpD5HDzHcYX/sLGT/ePObGYgRfBvrhDExKcnTlN/xLuQ8KOw6fC','user',_binary '\0'),(46,'user133','$2a$10$0j4qrssuCBon0XMoHY6N8.nxQzH2VycUGRuX0RrrSS4AOVfPbD68a','user',_binary '\0'),(47,'user122','$2a$10$f2XjrbSN4sU6VxbvSPawceIzFUdbcQgLdrndnD/WjqRysNDYS44re','user',_binary '\0'),(48,'user1044','$2a$10$CsPZ3X217jScRezBHyS/bO04b6559o/Zubhk8EWrRv/jLD6gfQXt6','user',_binary '\0'),(49,'qw133','$2a$10$zX5wx2rHoeNjVha/e3DuYerQgnS1ZfIxtzwNaDvafyN0A1EMNfBEG','user',_binary '\0'),(50,'user11111','$2a$10$y2eFwknqyQqKXSDJxDxbgu5b/GrAUVV6HapRV9Yx.oV.ESgUZP86W','user',_binary '\0'),(51,'ddd222','$2a$10$RQRxi6w1z4jvKkZQiWUJEuFGzZUXOlNKrEyxJNvbCt7JDdI6PGRFu','user',_binary '\0'),(52,'new1','new1','user',_binary '\0'),(53,'user133','user133','user',_binary '\0'),(54,'user100','user1','user',_binary '\0'),(55,'Koly1','Koly1','user',_binary '\0'),(56,'Admin2004','Admin2004','admin',_binary '\0'),(57,'Seny1','Seny1','user',_binary '\0'),(58,'Ivan3001','Ivan3001','user',_binary '\0'),(59,'Dima118','Dima118','user',_binary '\0'),(60,'тест','тест','user',_binary ''),(61,'test228','test228','user',_binary '');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-05-23 22:44:20
