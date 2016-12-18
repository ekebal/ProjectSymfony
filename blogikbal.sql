-- MySQL dump 10.13  Distrib 5.7.12, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: blogikbal
-- ------------------------------------------------------
-- Server version	5.5.5-10.1.16-MariaDB

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
-- Table structure for table `articles`
--

DROP TABLE IF EXISTS `articles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `articles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `author` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `date` datetime NOT NULL,
  `content` longtext COLLATE utf8_unicode_ci NOT NULL,
  `picture` longtext COLLATE utf8_unicode_ci NOT NULL,
  `url` longtext COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `articles`
--

LOCK TABLES `articles` WRITE;
/*!40000 ALTER TABLE `articles` DISABLE KEYS */;
INSERT INTO `articles` VALUES (24,'Angularjs Introduction','ikbalhamdaoui','2016-12-15 23:26:04','<p>AngularJS is a JavaScript framework. It can be added to an HTML page with a tag. AngularJS extends HTML attributes with Directives, and binds data to HTML with Expressions.</p>','http://gaboesquivel.com/slides/intro-to-angularjs/img/angularjs.jpg','introduction-angularjs'),(25,'AngularJS MVC Architecture','ikbalhamdaoui','2016-12-16 10:14:48','<p>MVC stands for Model View Controller which is very popular design pattern in web world. It helps you to organise your application in three different layers and isolate the business logic from its presentation. Model&nbsp;- represent current state and data of your application View&nbsp;- responsible to display/show the data Controller&nbsp;- responsible to controls the relation between Models and Views. Now let&#39;s understand how these three component works in AngularJS MVC Architecture step by step. Model&nbsp;- in AngularJS, model consists of all premitive data type such as integer, string and boolean and complex type in form of object. In simple word model is just a plain javascript object. But you can build your model from any database like Sql Server or Mysql or from JSON file. In below given syntax $scope is an object, customer is variable which is added to scope object.</p>','http://www.technologies-ebusiness.com/files/2014/09/modele_archi_angular_mvvm.jpg','architecture-angularjs'),(26,'AngularJS Data Binding','ikbalhamdaoui','2016-12-16 21:32:38','<p>The HTML container where the AngularJS application is displayed, is called the view. The view has access to the model, and there are several ways of displaying model data in the view. You can use the&nbsp;ng-bind&nbsp;directive, which will bind the innerHTML of the element to the specified model property:</p>','https://docs.angularjs.org/img/One_Way_Data_Binding.png','data-binding-angularjs'),(28,'AngularJS Expressions','ikbalhamdaoui','2016-12-17 16:02:51','<p>AngularJS expressions can be written inside double braces:&nbsp;{{&nbsp;expression&nbsp;}}. AngularJS expressions can also be written inside a directive:&nbsp;ng-bind=&quot;expression&quot;. AngularJS will resolve the expression, and return the result exactly where the expression is written. AngularJS expressions&nbsp;are much like&nbsp;JavaScript expressions:&nbsp;They can contain literals, operators, and variables.</p>','http://3.bp.blogspot.com/-L2y3f2BD3W8/V4q62KcadzI/AAAAAAAAATU/g_5mCnzts_oCMQ0f93sQwIpwOnkOAiI2ACK4B/s1600/angularjs-expression.png','expressions-angularjs'),(29,'AngularJS Modules','ikbalhamdaoui','2016-12-17 16:22:46','<p>An AngularJS module defines an&nbsp;application.</p>\r\n\r\n<p>The module is a container for the different parts of an application.</p>\r\n\r\n<p>The module is a container for the application controllers.</p>\r\n\r\n<p>Controllers always belong to a module.</p>','http://blog.hfarazm.com/wp-content/uploads/sites/2/2014/06/AngularJS-Module-1.png','modules-angularjs');
/*!40000 ALTER TABLE `articles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fos_user`
--

DROP TABLE IF EXISTS `fos_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fos_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(180) COLLATE utf8_unicode_ci NOT NULL,
  `username_canonical` varchar(180) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(180) COLLATE utf8_unicode_ci NOT NULL,
  `email_canonical` varchar(180) COLLATE utf8_unicode_ci NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `salt` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `last_login` datetime DEFAULT NULL,
  `locked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL,
  `confirmation_token` varchar(180) COLLATE utf8_unicode_ci DEFAULT NULL,
  `password_requested_at` datetime DEFAULT NULL,
  `roles` longtext COLLATE utf8_unicode_ci NOT NULL COMMENT '(DC2Type:array)',
  `credentials_expire_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_957A647992FC23A8` (`username_canonical`),
  UNIQUE KEY `UNIQ_957A6479A0D96FBF` (`email_canonical`),
  UNIQUE KEY `UNIQ_957A6479C05FB297` (`confirmation_token`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fos_user`
--

LOCK TABLES `fos_user` WRITE;
/*!40000 ALTER TABLE `fos_user` DISABLE KEYS */;
INSERT INTO `fos_user` VALUES (1,'user@mail.com','user@mail.com','mdp','mdp',1,'q633ieft2qogskkw804gswosg0cos8w','$2y$13$qoW6OeHMaMcSQNVSHdcNgeWeJj7mit6jSl0bGz/TDXtGx1fkbK8dW',NULL,0,NULL,NULL,NULL,'a:0:{}',NULL),(3,'ikbalhamdaoui','ikbalhamdaoui','ikbal@gmail.com','ikbal@gmail.com',1,'1vvjwlxj1dq8484w8k08ggkw8cso084','$2y$13$ha5Q.2VI1f5ZXgEf2bnmk.f4njr3K239b/uCu0l0xOyDAkRJupPJ.','2016-12-18 11:55:08',0,NULL,NULL,NULL,'a:2:{i:0;s:10:\"ROLE_ADMIN\";i:1;s:16:\"ROLE_SUPER_ADMIN\";}',NULL);
/*!40000 ALTER TABLE `fos_user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-12-18 12:24:58
