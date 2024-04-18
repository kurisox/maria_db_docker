-- MariaDB dump 10.19  Distrib 10.5.10-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: uebungen
-- ------------------------------------------------------
-- Server version	10.5.10-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `t_abt`
--

DROP Database IF EXISTS `uebungen`;
CREATE Database `uebungen`;

DROP DATABASE IF EXISTS `bibliothek`;
CREATE DATABASE `bibliothek`;

use uebungen;


DROP TABLE IF EXISTS `t_abt`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_abt` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `ort` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_abt`
--


INSERT INTO `t_abt` VALUES (1,'Einkauf','Frankfurt'),(2,'Marketing','Berlin'),(3,'Verkauf','Hamburg'),(4,'Produktion','Wien'),(5,'Abt_Organisation','Berlin'),(6,'Controlling','Bern'),(7,'F&E','Zürich'),(8,'Personal','Berlin');


--
-- Table structure for table `t_artikel`
--

DROP TABLE IF EXISTS `t_artikel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_artikel` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL DEFAULT '',
  `code` varchar(30) NOT NULL DEFAULT '',
  `lieferant` int(11) DEFAULT NULL,
  `bemerkung` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `namecodeindex` (`name`,`code`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_artikel`
--


INSERT INTO `t_artikel` VALUES (22,'Bleistift B (10 Stück)','3423',1,NULL),(23,'Bleistift H (10 Stück)','3123',1,NULL),(33,'Füllhalter P1','4346',1,NULL),(35,'Füllhalter P','4344',2,NULL),(38,'Füllhalter P2 Rechtshänder','4322',1,NULL),(43,'Kugelschreiber KG1','5232',2,NULL),(44,'Kugelschreiber KG2','5223',2,NULL),(45,'Bleistift HB (10 Stück)','4342',1,NULL),(46,'Füllhalter P2 Linkshänder','4323',1,NULL),(47,'Füllhalter','4333',2,NULL),(48,'Kugelschreiber KG5','5222',2,NULL),(49,'Kugelschreiber Edel','5233',3,NULL),(50,'Fineliner (10 Stück)','4444',2,NULL);


--
-- Table structure for table `t_lager`
--

DROP TABLE IF EXISTS `t_lager`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_lager` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `stueck` int(11) DEFAULT NULL,
  `preis` float DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_lager`
--


INSERT INTO `t_lager` 
VALUES (22,267,22),(23,100,10),(33,134,8.5),(38,89,35.8),(45,156,9.5),(46,322,12),(47,46,24.8),(48,245,5.5),(49,144,14.6),(50,45,34);


--
-- Table structure for table `t_liefer`
--

DROP TABLE IF EXISTS `t_liefer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_liefer` (
  `id` int(11) NOT NULL DEFAULT 0,
  `name` varchar(150) DEFAULT NULL,
  `plz` varchar(5) DEFAULT NULL,
  `ort` varchar(100) DEFAULT NULL,
  `str` varchar(100) DEFAULT NULL,
  `hnr` varchar(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_liefer`
--


INSERT INTO `t_liefer` VALUES (1,'Berger','10115','Berlin','Blumenstr.','3'),(2,'Knapp','21029','Hamburg','Brunnenstr.','31'),(3,'Schubert','60320','Frankfurt','Opernstr.','13');
/*!40000 ALTER TABLE `t_liefer` ENABLE KEYS */;

/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER trig_liefer_nr BEFORE INSERT
  ON t_liefer FOR EACH ROW BEGIN
    DECLARE lid INTEGER;
    IF (NEW.id = 0) THEN 
      SELECT MAX(id)+1 FROM t_liefer INTO lid;
      SET NEW.id = lid;
    END IF;
  END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `t_m_p`
--

DROP TABLE IF EXISTS `t_m_p`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_m_p` (
  `ma_id` int(11) NOT NULL,
  `id` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_m_p`
--


INSERT INTO `t_m_p` VALUES (2,'1'),(5,'1'),(8,'1'),(11,'1'),(36,'4'),(48,'4');


--
-- Table structure for table `t_ma`
--

DROP TABLE IF EXISTS `t_ma`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_ma` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `vname` varchar(50) DEFAULT NULL,
  `str` varchar(150) DEFAULT NULL,
  `plz` varchar(5) DEFAULT NULL,
  `ort` varchar(50) DEFAULT NULL,
  `abtnr` int(11) DEFAULT NULL,
  `hnr` varchar(5) DEFAULT NULL,
  `gebdat` date DEFAULT NULL,
  `land` varchar(4) DEFAULT 'D',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=70 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_ma`
--

INSERT INTO `t_ma` VALUES (1,'Fuchs','Peter','Martinplatz','22397','Hamburg',3,'70','1969-08-11','D'),(2,'Baumann','Lilly','Tannenstr.','21029','Hamburg',6,'49','1993-02-07','D'),(3,'Dorff','Norbert','Turmstr.','1060','Wien',4,'23','1968-12-23','AT'),(5,'Bayerle','Saskia','Buchenweg','8000','Zürich',7,'48','1976-06-05','CH'),(6,'Berger','Sebastian','Zentralplatz','60323','Frankfurt',1,'43','1986-05-15','D'),(7,'Kirsch','Karin','Albert-Schweitzer-Str.','1080','Wien',4,'47','1988-05-24','AT'),(8,'Bergstein','Roland','Waldstr.','21029','Hamburg',3,'16','1988-09-07','D'),(11,'Schwönsdorf','Lisa','Bahnhofstr.','1210','Wien',4,'1','1981-11-15','AT'),(12,'Luxemburg','Johann','Brunnenweg','22159','Hamburg',3,'78','1985-02-03','D'),(13,'Ülkü','Dilara','Lessingstr.','10179','Berlin',5,'12','1995-04-15','D'),(14,'Mannschatz','Annabell','Bahnhofstr.','60388','Frankfurt',1,'12','1967-07-06','D'),(15,'Nöller','Erwin','Industriestr.','21129','Hamburg',3,'4','1980-05-04','D'),(16,'Brio','Constantin','Hauptstr.','3005','Bern',6,'54','1977-04-21','CH'),(17,'Eppel','Andreas','Schillerstr.','1060','Wien',4,'9','1979-02-06','AT'),(18,'Classmann','Andrea','Buchenweg','8000','Zürich',7,'1','1985-02-02','CH'),(19,'Glahn','Stefanie','Ratsstr.','1080','Wien',4,'1','1978-05-02','AT'),(20,'Fiedler','Klaus','Schillerstr.','60388','Frankfurt',6,'3','1968-03-01','D'),(21,'Döring','Laura','Hafenweg','22111','Hamburg',3,'87','1969-03-01','D'),(22,'Margolin','Peter','Goethestr.','22159','Hamburg',3,'9','1973-04-21','D'),(23,'Seeau','Andrea','Goethestr.','10247','Berlin',2,'125','1976-11-16','D'),(24,'Klotz','Siglinde','Mittelstr.','1120','Wien',4,'75','1971-01-01','AT'),(25,'Stern','Hanna','Leibnizstr.','10247','Berlin',2,'23','1973-03-17','D'),(26,'Meier','Kerstin','Nordstr.','1120','Wien',4,'6','1966-12-27','AT'),(27,'Wolff','Gudrun','Hauptstr.','8038','Zürich',7,'32','1982-08-16','CH'),(28,'Ahrens','Enzo','Neugasse','1060','Wien',4,'62','1974-05-05','AT'),(29,'Schuster','Gabriele','Maienweg','22297','Hamburg',3,'89','1969-01-14','D'),(30,'Bläuel','Stefan','Rathausplatz','10119','Berlin',5,'1','1977-07-05','D'),(31,'Ebert','Jan','Wasserturmstr.','10119','Berlin',5,'44','1989-09-02','D'),(32,'Hallenbacher','Irmgart','Schillerstr.','22397','Hamburg',3,'29','1990-05-02','D'),(33,'Holzhäußer','Björn','Schillerstr.','8039','Zürich',2,'47 ','1976-03-24','CH'),(34,'Meyer','Matthias','Schulstr.','8038','Zürich',6,'6','1972-05-23','CH'),(35,'Walther','Steve','Siedlungsweg','3005','Bern',6,'12','1986-03-24','CH'),(36,'Meyer','Peter','Am Ring','60594','Frankfurt',1,'6','1974-08-13','D'),(37,'Bäumer','Paul','Keplerstr.','10115','Berlin',5,'49','1988-04-30','D'),(38,'Möller','Jochen','Am Kirchhof','22111','Hamburg',3,'23','1978-09-19','D'),(39,'Bonkowski','Hubert','Albert-Schweitzer-Str.','22111','Hamburg',3,'92','1974-03-14','D'),(40,'Eichenau','Maria','Alte Dorfstr.','10119','Berlin',2,'65','1987-05-15','D'),(41,'Guth','Stephan','Zentralplatz','10179','Berlin',2,'67','1975-12-06','D'),(42,'Berger','Sonja','Hauptstr.','21029','Hamburg',3,'37','1967-09-08','D'),(43,'Conolly','Sean','Goethestr.','8008','Zürich',7,'21','1976-04-26','CH'),(44,'Klapp','Frank','Buchenweg','22159','Hamburg',3,'46','1978-06-12','D'),(45,'Murnau','Anna','Goethestr.','1120','Wien',4,'78','1990-02-06','AT'),(46,'Untergärtner','Tobias','Ringstr.','21129','Hamburg',3,'26','1973-02-06','D'),(47,'Beyersdörfer','Ute','Ringstr.','10115','Berlin',5,'87','1985-08-12','D'),(48,'Elser','Stefano','Bahnhofstr.','22111','Hamburg',3,'20','1982-06-23','D'),(49,'Dröger','Maria','Ringstr.','1060','Wien',4,'53','1981-06-27','AT'),(50,'Kron-Köppers','Tina','Schillerstr.','10179','Berlin',2,'53','1975-11-06','D'),(51,'Stifter','Ansgar','Alte Gasse','1210','Wien',3,'21','1980-05-05','AT'),(52,'Mahn','Detlev','Goethestr.','1120','Wien',4,'27','1973-06-12','AT'),(53,'Zielecki','Norbert','Kleiststr.','21129','Hamburg',3,'32','1972-07-23','D'),(54,'Blücher','Barbara','Tannenstr.','8000','Zürich',3,'45','1995-01-26','CH'),(55,'Färber','Liane','Goethestr.','8008','Zürich',7,'23','1968-01-14','CH'),(56,'Holt','Sören','Eisenbahnstr.','1080','Wien',4,'23','1980-12-23','AT'),(57,'Loster-Schneider','Elena','Schulstr.','22159','Hamburg',3,'57','1976-12-21','D'),(58,'Maier','Frank','Mittelstr.','60320','Frankfurt',1,'37','1978-01-12','D'),(59,'Manz','Fridolin','Hauptstr.','1120','Wien',4,'89','1988-02-03','AT'),(60,'Otterstädter','Charlotte','Baumschulenweg','1210','Wien',4,'7','1978-08-12','AT'),(61,'Seiler','Jacqueline','Kantonsstr.','3001','Bern',5,'14','1987-03-04','CH'),(62,'Schmadtke','Chris','Friedensplatz','60388','Frankfurt',1,'99','1973-07-08','D'),(63,'Segebrecht','Annemarie','Taunusweg','60594','Frankfurt',1,'5','1971-07-11','D'),(64,'Trieschmann','Lars','Eisenbahnstr..','8038','Zürich',3,'58','1977-04-06','CH'),(65,'Unterwegner','Daniel','Zentralplatz','1210','Wien',4,'45','1991-09-05','AT'),(66,'Brauer','Sophie','Albert-Schweitzer-Str.','60320','Frankfurt',1,'48','1981-06-13','D'),(67,'Carstedt','Sabine','Goethestr.','60323','Frankfurt',1,'46','1969-08-12','D'),(68,'Eberspächer','Gerlinde','Bahnhofstr.','8008','Zürich',7,'45','1994-03-23','CH'),(69,'Frawley','Lutz','Schwedenstr.','22397','Hamburg',3,'21','1979-09-09','D');


--
-- Table structure for table `t_ma_proj`
--

DROP TABLE IF EXISTS `t_ma_proj`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_ma_proj` (
  `ma_id` int(11) NOT NULL,
  `proj_id` int(11) NOT NULL,
  KEY `ma_id` (`ma_id`),
  KEY `proj_id` (`proj_id`),
  CONSTRAINT `t_ma_proj_ibfk_1` FOREIGN KEY (`ma_id`) REFERENCES `t_ma` (`id`) ON DELETE CASCADE,
  CONSTRAINT `t_ma_proj_ibfk_2` FOREIGN KEY (`proj_id`) REFERENCES `t_proj` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_ma_proj`
--


INSERT INTO `t_ma_proj` VALUES (2,1),(5,1),(8,1),(11,1),(36,4),(48,4);


--
-- Table structure for table `t_produkt`
--

DROP TABLE IF EXISTS `t_produkt`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_produkt` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `bemerk` varchar(100) DEFAULT NULL,
  `datum` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `i_produkt_name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_produkt`
--


INSERT INTO `t_produkt` VALUES (1,'Schraube M4','lieferbar','2021-03-01'),(2,'Schraube M6','lieferbar','2021-03-01'),(3,'Schraube M8','lieferbar','2021-02-01'),(4,'Schraube M10','lieferbar','2020-12-01'),(5,'Mutter M4','lieferbar','2021-01-05'),(6,'Mutter M6','lieferbar','2020-11-10'),(7,'Mutter M8','lieferbar','2020-12-12'),(8,'Mutter M10','lieferbar','2021-01-10'),(9,'Unterlegscheibe M4','lieferbar','2021-02-07'),(10,'Unterlegscheibe M6','lieferbar','2020-12-09'),(11,'Unterlegscheibe M8','lieferbar','2021-01-09'),(12,'Unterlegscheibe M10','lieferbar','2021-03-05');


--
-- Table structure for table `t_proj`
--

DROP TABLE IF EXISTS `t_proj`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_proj` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `beginn` date DEFAULT NULL,
  `ende` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_proj`
--


INSERT INTO `t_proj` VALUES (1,'Buchprojekt','2020-11-01','2021-08-20'),(2,'Renovierung des Pausenraumes','2021-02-01','2021-09-28'),(3,'Anlegen eines Pflichtenheftes','2021-02-10','2021-07-21'),(4,'Kundenumfrage','2021-03-01','2021-11-30');
/*!40000 ALTER TABLE `t_proj` ENABLE KEYS */;


/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-07-02 16:22:10

/**
 * Code für die Aufgaben
 */

/**
Erstellen Sie eine Tabelle t_person mit den Datenfeldern id, vname und name.
Verwenden Sie dabei geeignete Datentypen.
Für alle Datenfelder soll eine Eingabe erforderlich sein. Erweitern Sie die Definition der
Datenfelder für diesen Zweck.
Fügen Sie ein neues Datenfeld beschaeftigt_seit in die Tabelle ein. Es soll einen Datumswert
speichern. 
 */

 
CREATE TABLE `t_person` (
    id INT NOT NULL,
    vname VARCHAR(50) NOT NULL,
    name VARCHAR(50) NOT NULL,
    PRIMARY KEY (id)
);

ALTER TABLE t_person
ADD beschaeftigt_seit DATE;

/**
 * Erstellen Sie eine Tabelle t_ma mit den Datenfeldern id, name, vname, str, plz, ort, abtnr, hnr, gebdat, land.
 * Verwenden Sie dabei geeignete Datentypen.
 * Für alle Datenfelder soll eine Eingabe erforderlich sein. Erweitern Sie die Definition der
*/

ALTER TABLE t_lager
ADD name VARCHAR(100);


/**
Fügen Sie folgende Datensätze in die Tabelle t_lager ein.
ID Name Stückzahl Preis
1 Kugelschreiber 200 2,99
2 Ordner 123 2,50
3 Heftklammern 423 0,99
4 Bleistift 170 0,99
5 Umschläge B6 230 0,80 
*/

INSERT INTO t_lager (id,stueck, preis, name)
VALUES
(1, 200, 2.99, 'Kugelschreiber'),
(2, 123, 2.50, 'Ordner'),
(3, 423, 0.99, 'Heftklammern'),
(4, 170, 0.99, 'Bleistift'),
(5, 230, 0.80, 'Umschläge B6');


/**
Fügen Sie einen Datensatz für den Artikel Schreibblock A4 mit dem Preis 1,99 und der ID 6
hinzu. Für diesen Artikel ist keine Stückzahl bekannt. 
*/
INSERT INTO t_lager (id, name, preis)
VALUES (6, 'Schreibblock A4', 1.99);

/**
Ändern Sie die Stückzahl der vorhandenen Bleistifte von 170 auf 270. 
*/
UPDATE t_lager SET stueck = 270 WHERE id = 4;

/**
Ändern Sie den Preis der Ordner von 2,50 auf 2,80. 
*/
UPDATE t_lager SET preis = 2.80 WHERE id = 2;

/**
Löschen Sie den Datensatz Schreibblock A4. 
+*/

DELETE FROM t_lager WHERE id = 6;

/**
Fügen Sie folgende Datensätze in die Tabelle t_ma_dt ein.
Name Vorname Straße Hausnummer PLZ Ort Geburtsdatum Land
Haas Martina Blumenweg 23 63065 Offenbach 01.06.1972 D 
Richter Carsten Frankfurter Str. 16 63067 Offenbach 18.10.1982 D 
Seiler Janine Goethestr. 61 63067 Offenbach 11.11.1990 D
Hartmann Jochen Berliner Str. 23 60528 Frankfurt 25.03.1979 D 
Goldbach Martin Frankfurter Str. 6 60529 Frankfurt 06.07.1981 D 
Naumann Norbert Goethestr. 161 60594 Frankfurt 06.11.1972 D 
*/

CREATE TABLE `t_ma_dt` (
    name VARCHAR(255),
    vorname VARCHAR(255),
    strasse VARCHAR(255),
    hausnummer VARCHAR(255),
    plz VARCHAR(255),
    ort VARCHAR(255),
    geburtsdatum DATE,
    land CHAR(2)
);


INSERT INTO t_ma_dt (name, vorname, strasse, hausnummer, plz, ort, geburtsdatum, land)
VALUES
('Haas', 'Martina', 'Blumenweg', '23', '63065', 'Offenbach', '1972-06-01', 'D'),
('Richter', 'Carsten', 'Frankfurter Str.', '16', '63067', 'Offenbach', '1982-10-18', 'D'),
('Seiler', 'Janine', 'Goethestr.', '61', '63067', 'Offenbach', '1990-11-11', 'D'),
('Hartmann', 'Jochen', 'Berliner Str.', '23', '60528', 'Frankfurt', '1979-03-25', 'D'),
('Goldbach', 'Martin', 'Frankfurter Str.', '6', '60529', 'Frankfurt', '1981-07-06', 'D'),
('Naumann', 'Norbert', 'Goethestr.', '161', '60594', 'Frankfurt', '1972-11-06', 'D');

/**
In die Tabelle t_ma_frankfurt sollen alle Datensätze aus der Tabelle t_ma_dt eingefügt
werden, bei denen der Ort den Wert Frankfurt oder Offenbach besitzt.
Erstellen Sie zu diesem Zweck eine INSERT-Anweisung mit einer geeigneten Unterabfrage.
Die WHERE-Klausel soll dabei folgendermaßen lauten:
ort = "Frankfurt" OR ort = "Offenbach"
*/


CREATE TABLE `t_ma_frankfurt` (
    name VARCHAR(255),
    vorname VARCHAR(255),
    strasse VARCHAR(255),
    hausnummer VARCHAR(255),
    plz VARCHAR(255),
    ort VARCHAR(255),
    geburtsdatum DATE,
    land CHAR(2)
);

INSERT INTO t_ma_frankfurt (name, vorname, strasse, hausnummer, plz, ort, geburtsdatum, land)
SELECT name, vorname, strasse, hausnummer, plz, ort, geburtsdatum, land
FROM t_ma_dt
WHERE ort = 'Frankfurt' OR ort = 'Offenbach';

/**
Ändern Sie in den Datensätzen der Tabelle t_ma_frankfurt den Wert Frankfurt in
Frankfurt/Main. 
*/

UPDATE t_ma_frankfurt
SET ort = 'Frankfurt/Main'
WHERE ort = 'Frankfurt';

/**
Erstellen Sie eine neue Datenbank Bibliothek.
Wechseln Sie in diese Datenbank. 
*/

use bibliothek;

/**
Erstellen Sie die Tabelle t_buecher mit folgenden Datenfeldern:
 isbn, Text mit maximal 13 Zeichen
 titel, autor, Text mit maximal 100 Zeichen
 auflage, preis.
Wählen Sie geeignete Datentypen.
Definieren Sie das Feld isbn als Primärschlüssel. 
*/

CREATE TABLE `t_buecher` (
    isbn VARCHAR(13) PRIMARY KEY,
    titel VARCHAR(13),
    autor VARCHAR(100),
    auflage VARCHAR(100),
    preis DECIMAL(10,2)
);

/**
Erstellen Sie die Tabelle t_leser mit folgenden Datenfeldern:
 nr, name, vname, gebdat und adr.
Wählen Sie geeignete Datentypen.
Definieren Sie das Feld nr als Primärschlüssel. 
*/

CREATE TABLE `t_leser` (
    nr INT PRIMARY KEY,
    name VARCHAR(255),
    vname VARCHAR(255),
    gebdat DATE,
    adr VARCHAR(255)
);

/**
Erstellen Sie eine weitere Tabelle t_verleih, die eine Verbindung zwischen den Lesern und
den Büchern herstellt. Sie soll folgende Datenfelder enthalten:
 isbn, leser, datum.
Wählen Sie geeignete Datentypen.
Erstellen Sie eine geeignete Fremdschlüsselbeziehung zu den anderen beiden Tabellen.
Beim Löschen eines Buches oder eines Lesers sollen auch alle zugehörigen
Datensätze dieser Tabelle gelöscht werden. 
*/

CREATE TABLE `t_verleih` (
    isbn VARCHAR(13),
    leser INT,
    datum DATE,
    FOREIGN KEY (isbn) REFERENCES t_buecher(isbn) ON DELETE CASCADE,
    FOREIGN KEY (leser) REFERENCES t_leser(nr) ON DELETE CASCADE
);

/**
Definieren Sie einen Index für das Datenfeld autor der Tabelle t_buecher.
*/

CREATE INDEX idx_autor ON t_buecher (autor);

/**
*/
CREATE INDEX idx_titel ON t_buecher (titel);

/**
Definieren Sie einen kombinierten Index für die Datenfelder isbn und leser der Tabelle
t_ verleih. 
*/

CREATE INDEX idx_isbn_leser ON t_verleih (isbn, leser);

/**
Erstellen Sie einen Index für die Suche im Feld name der Tabelle t_leser.
*/

/**
Erzeugen Sie eine neue Tabelle t_mess, in der Messwerte erfasst werden sollen.
Die Tabelle soll die Felder nr und wert haben. Das Feld nr soll ein Selbstzählfeld sein. 
*/

CREATE TABLE t_mess (nr INT AUTO_INCREMENT PRIMARY KEY, wert INTEGER);

INSERT INTO t_mess (wert) VALUES (ROUND(1 + RAND() * 1000));
INSERT INTO t_mess (wert) VALUES (ROUND(1 + RAND() * 1000));
INSERT INTO t_mess (wert) VALUES (ROUND(1 + RAND() * 1000));
INSERT INTO t_mess (wert) VALUES (ROUND(1 + RAND() * 1000));
INSERT INTO t_mess (wert) VALUES (ROUND(1 + RAND() * 1000));
INSERT INTO t_mess (wert) VALUES (ROUND(1 + RAND() * 1000));
INSERT INTO t_mess (wert) VALUES (ROUND(1 + RAND() * 1000));
INSERT INTO t_mess (wert) VALUES (ROUND(1 + RAND() * 1000));
INSERT INTO t_mess (wert) VALUES (ROUND(1 + RAND() * 1000));
INSERT INTO t_mess (wert) VALUES (ROUND(1 + RAND() * 1000));
INSERT INTO t_mess (wert) VALUES (ROUND(1 + RAND() * 1000));