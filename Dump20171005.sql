-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: localhost    Database: mamie_clafoutie
-- ------------------------------------------------------
-- Server version	5.7.19-log

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
-- Table structure for table `categorie`
--

DROP TABLE IF EXISTS `categorie`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categorie` (
  `id_categorie` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_categorie`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categorie`
--

LOCK TABLES `categorie` WRITE;
/*!40000 ALTER TABLE `categorie` DISABLE KEYS */;
INSERT INTO `categorie` VALUES (1,'Pain'),(2,'Viennoiserie'),(3,'Patisserie');
/*!40000 ALTER TABLE `categorie` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ligne de commande`
--

DROP TABLE IF EXISTS `ligne de commande`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ligne de commande` (
  `quantite` int(11) DEFAULT NULL,
  `fk id produit` int(11) NOT NULL,
  `fk id commande` int(11) NOT NULL,
  KEY `fk id produit _idx` (`fk id produit`),
  KEY `fk id commande_idx` (`fk id commande`),
  CONSTRAINT `fk id commande` FOREIGN KEY (`fk id commande`) REFERENCES `table commande` (`id_commande`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk id produit ` FOREIGN KEY (`fk id produit`) REFERENCES `table produit` (`id_produit`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ligne de commande`
--

LOCK TABLES `ligne de commande` WRITE;
/*!40000 ALTER TABLE `ligne de commande` DISABLE KEYS */;
INSERT INTO `ligne de commande` VALUES (2,30,1),(4,33,1),(5,35,2);
/*!40000 ALTER TABLE `ligne de commande` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `table commande`
--

DROP TABLE IF EXISTS `table commande`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `table commande` (
  `id_commande` int(11) NOT NULL AUTO_INCREMENT,
  `date` date DEFAULT NULL,
  `fk id employe` int(11) NOT NULL,
  PRIMARY KEY (`id_commande`),
  KEY `fk nom employe_idx` (`fk id employe`),
  CONSTRAINT `fk id employe` FOREIGN KEY (`fk id employe`) REFERENCES `table employe` (`id_emp`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `table commande`
--

LOCK TABLES `table commande` WRITE;
/*!40000 ALTER TABLE `table commande` DISABLE KEYS */;
INSERT INTO `table commande` VALUES (1,'2017-10-03',3),(2,'2017-10-02',3);
/*!40000 ALTER TABLE `table commande` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `table compose`
--

DROP TABLE IF EXISTS `table compose`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `table compose` (
  `quantite` int(11) DEFAULT NULL,
  `table recette_id_recette` int(11) NOT NULL,
  `table ingredient_id_ingredient` int(11) NOT NULL,
  KEY `fk_table compose_table recette1_idx` (`table recette_id_recette`),
  KEY `fk_table compose_table ingredient1_idx` (`table ingredient_id_ingredient`),
  CONSTRAINT `fk_table compose_table ingredient1` FOREIGN KEY (`table ingredient_id_ingredient`) REFERENCES `table ingredient` (`id_ingredient`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_table compose_table recette1` FOREIGN KEY (`table recette_id_recette`) REFERENCES `table recette` (`id_recette`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `table compose`
--

LOCK TABLES `table compose` WRITE;
/*!40000 ALTER TABLE `table compose` DISABLE KEYS */;
INSERT INTO `table compose` VALUES (100,1,1),(30,1,2),(40,1,3),(20,2,1),(30,2,2),(60,2,3),(60,2,8),(50,3,1),(50,3,2),(40,3,3),(70,3,9),(50,4,1),(30,4,2),(30,4,3),(20,5,7),(60,5,10),(20,6,7),(70,6,11),(50,7,7),(80,7,12),(70,8,7),(90,9,1),(60,9,4),(70,9,5),(70,9,6),(60,9,10),(60,10,1),(70,10,4),(60,10,5),(60,10,6),(50,10,13),(70,11,1),(70,11,4),(40,11,5),(80,11,6),(60,11,10),(40,12,5),(40,12,6),(70,12,10);
/*!40000 ALTER TABLE `table compose` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `table employe`
--

DROP TABLE IF EXISTS `table employe`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `table employe` (
  `id_emp` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(45) DEFAULT NULL,
  `prenom` varchar(45) DEFAULT NULL,
  `phone` varchar(45) DEFAULT NULL,
  `adresse` varchar(45) DEFAULT NULL,
  `table fonction employe_id_fonc` int(11) NOT NULL,
  PRIMARY KEY (`id_emp`),
  KEY `fk_table employe_table fonction employe_idx` (`table fonction employe_id_fonc`),
  CONSTRAINT `fk_table employe_table fonction employe` FOREIGN KEY (`table fonction employe_id_fonc`) REFERENCES `table fonction employe` (`id_fonc`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `table employe`
--

LOCK TABLES `table employe` WRITE;
/*!40000 ALTER TABLE `table employe` DISABLE KEYS */;
INSERT INTO `table employe` VALUES (1,'Hatem','Chabaan','514-222-2222','244 rue olympia',1),(2,'Tania','El-Asmar','514-342-3456','543 rue olympia',2),(3,'Rafael','Rubio','514-234-5435','898 rue olympia',3);
/*!40000 ALTER TABLE `table employe` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `table employe_has_table vente`
--

DROP TABLE IF EXISTS `table employe_has_table vente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `table employe_has_table vente` (
  `table employe_id_emp` int(11) NOT NULL,
  `table vente_ord_id` int(11) NOT NULL,
  PRIMARY KEY (`table employe_id_emp`,`table vente_ord_id`),
  KEY `fk_table employe_has_table vente_table vente1_idx` (`table vente_ord_id`),
  KEY `fk_table employe_has_table vente_table employe1_idx` (`table employe_id_emp`),
  CONSTRAINT `fk_table employe_has_table vente_table employe1` FOREIGN KEY (`table employe_id_emp`) REFERENCES `table employe` (`id_emp`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_table employe_has_table vente_table vente1` FOREIGN KEY (`table vente_ord_id`) REFERENCES `table vente` (`id_ord`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `table employe_has_table vente`
--

LOCK TABLES `table employe_has_table vente` WRITE;
/*!40000 ALTER TABLE `table employe_has_table vente` DISABLE KEYS */;
/*!40000 ALTER TABLE `table employe_has_table vente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `table fonction employe`
--

DROP TABLE IF EXISTS `table fonction employe`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `table fonction employe` (
  `id_fonc` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(45) DEFAULT NULL,
  `type` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_fonc`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `table fonction employe`
--

LOCK TABLES `table fonction employe` WRITE;
/*!40000 ALTER TABLE `table fonction employe` DISABLE KEYS */;
INSERT INTO `table fonction employe` VALUES (1,'Validation des commandes','Admin'),(2,'Prise des commandes','Directrice'),(3,'Inventaire','Vendeur');
/*!40000 ALTER TABLE `table fonction employe` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `table ingredient`
--

DROP TABLE IF EXISTS `table ingredient`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `table ingredient` (
  `id_ingredient` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_ingredient`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `table ingredient`
--

LOCK TABLES `table ingredient` WRITE;
/*!40000 ALTER TABLE `table ingredient` DISABLE KEYS */;
INSERT INTO `table ingredient` VALUES (1,'Farine'),(2,'Eau'),(3,'Sel'),(4,'Oeuf'),(5,'Lait'),(6,'Sucre'),(7,'Pate'),(8,'Seigle'),(9,'Levain'),(10,'Chocolat'),(11,'Abricot'),(12,'Raisin'),(13,'Vanille');
/*!40000 ALTER TABLE `table ingredient` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `table produit`
--

DROP TABLE IF EXISTS `table produit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `table produit` (
  `id_produit` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(45) DEFAULT NULL,
  `prix` double DEFAULT NULL,
  `description` varchar(45) DEFAULT NULL,
  `image` varchar(45) DEFAULT NULL,
  `categorie_id_categorie` int(11) NOT NULL,
  `table recette_id_recette` int(11) NOT NULL,
  PRIMARY KEY (`id_produit`),
  KEY `fk_table produit_categorie1_idx` (`categorie_id_categorie`),
  KEY `fk_table produit_table recette1_idx` (`table recette_id_recette`),
  CONSTRAINT `fk_table produit_categorie1` FOREIGN KEY (`categorie_id_categorie`) REFERENCES `categorie` (`id_categorie`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_table produit_table recette1` FOREIGN KEY (`table recette_id_recette`) REFERENCES `table recette` (`id_recette`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `table produit`
--

LOCK TABLES `table produit` WRITE;
/*!40000 ALTER TABLE `table produit` DISABLE KEYS */;
INSERT INTO `table produit` VALUES (29,'Baguette',2.6,'Farine blanche','images/baguette.jpg',1,1),(30,'Pain de campagne',3.45,'Farine blanche et seigle','images/pain-campagne.jpg',1,2),(31,'Froment',3.45,'Farine blanche et levain','images/froment.jpg',1,3),(32,'Roll',0.4,'Farine blanche','images/roll.jpg',1,4),(33,'Chocolatine',2.75,'Pate feuilletee','images/chocolatine.jpg',2,5),(34,'Croissant aux amandes',2.75,'Pate feuilletee avec pate damande','images/croissant-amandes.jpg',2,6),(35,'Pain aux raisins',2.5,'Pate feuilletee et raisins','images/pain-raisins.jpg',2,7),(36,'Croissant',2.3,'Pate feuilletee et beurre','images/croissant.jpg',2,8),(37,'Foret noire',28.75,'Eponge chocolat avec creme chantilly','images/foret-noire.jpg',3,9),(38,'Choco framboise',32.75,'Mousse au chocolat avec gelee aux framboises','images/choco-framboise.jpg',3,10),(39,'Suisse',28.75,'Eponge au chocolat avec creme chantilly','images/suisse.jpg',3,11),(40,'Royal',28.75,'Mousse au  chocolat avec une base pralinee','images/royal.jpg',3,12);
/*!40000 ALTER TABLE `table produit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `table recette`
--

DROP TABLE IF EXISTS `table recette`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `table recette` (
  `id_recette` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_recette`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `table recette`
--

LOCK TABLES `table recette` WRITE;
/*!40000 ALTER TABLE `table recette` DISABLE KEYS */;
INSERT INTO `table recette` VALUES (1,'Baguette'),(2,'Pain de campagne'),(3,'Froment'),(4,'Roll'),(5,'Chocolatine'),(6,'Abricotine'),(7,'Pain aux raisin'),(8,'Croissant'),(9,'Opera'),(10,'Shortcake aux fraises'),(11,'Suisse'),(12,'Royal');
/*!40000 ALTER TABLE `table recette` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `table vente`
--

DROP TABLE IF EXISTS `table vente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `table vente` (
  `id_ord` int(11) NOT NULL AUTO_INCREMENT,
  `quantite total` varchar(45) DEFAULT NULL,
  `quantite restante` int(11) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `science` varchar(45) DEFAULT NULL,
  `table employe_id_emp` int(11) NOT NULL,
  `table produit_id_produit` int(11) NOT NULL,
  PRIMARY KEY (`id_ord`),
  KEY `fk_table vente_table employe1_idx` (`table employe_id_emp`),
  KEY `fk_table vente_table produit1_idx` (`table produit_id_produit`),
  CONSTRAINT `fk_table vente_table employe1` FOREIGN KEY (`table employe_id_emp`) REFERENCES `table employe` (`id_emp`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_table vente_table produit1` FOREIGN KEY (`table produit_id_produit`) REFERENCES `table produit` (`id_produit`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `table vente`
--

LOCK TABLES `table vente` WRITE;
/*!40000 ALTER TABLE `table vente` DISABLE KEYS */;
INSERT INTO `table vente` VALUES (1,'60',22,'2017-10-02','jour',3,29),(4,'20',5,'2017-10-04','jour',3,30);
/*!40000 ALTER TABLE `table vente` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-10-05 12:13:32
