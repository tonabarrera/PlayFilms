-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: localhost    Database: adoo
-- ------------------------------------------------------
-- Server version	5.7.17-log

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
-- Table structure for table `actor`
--

DROP TABLE IF EXISTS `actor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `actor` (
  `idActor` int(11) NOT NULL,
  `nombre` varchar(255) DEFAULT NULL,
  `rol` varchar(45) NOT NULL,
  PRIMARY KEY (`idActor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `actor`
--

LOCK TABLES `actor` WRITE;
/*!40000 ALTER TABLE `actor` DISABLE KEYS */;
/*!40000 ALTER TABLE `actor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `capitulo`
--

DROP TABLE IF EXISTS `capitulo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `capitulo` (
  `numeroEpisodio` int(11) NOT NULL,
  `nombre` varchar(45) DEFAULT NULL,
  `descripcion` varchar(45) DEFAULT NULL,
  `idContenido` int(11) NOT NULL,
  PRIMARY KEY (`numeroEpisodio`,`idContenido`),
  KEY `fk_capitulo_contenido1_idx` (`idContenido`),
  CONSTRAINT `fk_capitulo_contenido1` FOREIGN KEY (`idContenido`) REFERENCES `contenido` (`idContenido`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `capitulo`
--

LOCK TABLES `capitulo` WRITE;
/*!40000 ALTER TABLE `capitulo` DISABLE KEYS */;
/*!40000 ALTER TABLE `capitulo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categoria`
--

DROP TABLE IF EXISTS `categoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categoria` (
  `idcategoria` int(11) NOT NULL,
  `nombre` varchar(45) NOT NULL,
  PRIMARY KEY (`idcategoria`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categoria`
--

LOCK TABLES `categoria` WRITE;
/*!40000 ALTER TABLE `categoria` DISABLE KEYS */;
/*!40000 ALTER TABLE `categoria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `conenido_actores`
--

DROP TABLE IF EXISTS `conenido_actores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `conenido_actores` (
  `idContenido` int(11) NOT NULL,
  `idActor` int(11) NOT NULL,
  PRIMARY KEY (`idContenido`,`idActor`),
  KEY `fk_conenido_actores_actor1_idx` (`idActor`),
  CONSTRAINT `fk_conenido_actores_actor1` FOREIGN KEY (`idActor`) REFERENCES `actor` (`idActor`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_conenido_actores_contenido1` FOREIGN KEY (`idContenido`) REFERENCES `contenido` (`idContenido`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `conenido_actores`
--

LOCK TABLES `conenido_actores` WRITE;
/*!40000 ALTER TABLE `conenido_actores` DISABLE KEYS */;
/*!40000 ALTER TABLE `conenido_actores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contenido`
--

DROP TABLE IF EXISTS `contenido`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contenido` (
  `idContenido` int(11) NOT NULL,
  `nombre` varchar(45) NOT NULL,
  `descripcion` varchar(45) DEFAULT NULL,
  `idCategoria` int(11) NOT NULL,
  `idTipo` int(11) NOT NULL,
  `calificacion` double DEFAULT NULL,
  PRIMARY KEY (`idContenido`),
  KEY `fk_contenido_categoria1_idx` (`idCategoria`),
  KEY `fk_contenido_tipo1_idx` (`idTipo`),
  CONSTRAINT `fk_contenido_categoria1` FOREIGN KEY (`idCategoria`) REFERENCES `categoria` (`idcategoria`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_contenido_tipo1` FOREIGN KEY (`idTipo`) REFERENCES `tipo` (`idTipo`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contenido`
--

LOCK TABLES `contenido` WRITE;
/*!40000 ALTER TABLE `contenido` DISABLE KEYS */;
/*!40000 ALTER TABLE `contenido` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `favoritos`
--

DROP TABLE IF EXISTS `favoritos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `favoritos` (
  `idContenido` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  PRIMARY KEY (`idContenido`,`email`),
  KEY `fk_favoritos_contenido1_idx` (`idContenido`),
  KEY `fk_favoritos_usuario1_idx` (`email`),
  CONSTRAINT `fk_favoritos_contenido1` FOREIGN KEY (`idContenido`) REFERENCES `contenido` (`idContenido`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_favoritos_usuario1` FOREIGN KEY (`email`) REFERENCES `usuario` (`email`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `favoritos`
--

LOCK TABLES `favoritos` WRITE;
/*!40000 ALTER TABLE `favoritos` DISABLE KEYS */;
/*!40000 ALTER TABLE `favoritos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `puntuacion`
--

DROP TABLE IF EXISTS `puntuacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `puntuacion` (
  `idpuntuacion` int(11) NOT NULL,
  `puntuacion` int(11) NOT NULL,
  PRIMARY KEY (`idpuntuacion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `puntuacion`
--

LOCK TABLES `puntuacion` WRITE;
/*!40000 ALTER TABLE `puntuacion` DISABLE KEYS */;
/*!40000 ALTER TABLE `puntuacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tarjeta`
--

DROP TABLE IF EXISTS `tarjeta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tarjeta` (
  `idtarjeta` int(11) NOT NULL,
  `numero` int(16) NOT NULL,
  `propietario` varchar(45) NOT NULL,
  `fechaVenc` date NOT NULL,
  `cvv` int(4) NOT NULL,
  `email` varchar(255) NOT NULL,
  PRIMARY KEY (`idtarjeta`,`email`),
  KEY `fk_tarjeta_usuario1_idx` (`email`),
  CONSTRAINT `fk_tarjeta_usuario1` FOREIGN KEY (`email`) REFERENCES `usuario` (`email`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tarjeta`
--

LOCK TABLES `tarjeta` WRITE;
/*!40000 ALTER TABLE `tarjeta` DISABLE KEYS */;
/*!40000 ALTER TABLE `tarjeta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipo`
--

DROP TABLE IF EXISTS `tipo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tipo` (
  `idTipo` int(11) NOT NULL,
  `nombre` varchar(45) NOT NULL,
  PRIMARY KEY (`idTipo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo`
--

LOCK TABLES `tipo` WRITE;
/*!40000 ALTER TABLE `tipo` DISABLE KEYS */;
/*!40000 ALTER TABLE `tipo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipousuario`
--

DROP TABLE IF EXISTS `tipousuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tipousuario` (
  `idTipoUsuario` int(11) NOT NULL,
  `tipo` varchar(20) NOT NULL,
  PRIMARY KEY (`idTipoUsuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipousuario`
--

LOCK TABLES `tipousuario` WRITE;
/*!40000 ALTER TABLE `tipousuario` DISABLE KEYS */;
/*!40000 ALTER TABLE `tipousuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usuario` (
  `email` varchar(255) NOT NULL,
  `password` varchar(32) NOT NULL,
  `nombres` varchar(100) NOT NULL,
  `apellidos` varchar(100) NOT NULL,
  `verificado` tinyint(4) NOT NULL,
  `idTipoUsuario` int(11) NOT NULL,
  PRIMARY KEY (`email`),
  KEY `fk_usuario_tipoUsuario1_idx` (`idTipoUsuario`),
  CONSTRAINT `fk_usuario_tipoUsuario1` FOREIGN KEY (`idTipoUsuario`) REFERENCES `tipousuario` (`idTipoUsuario`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vistas`
--

DROP TABLE IF EXISTS `vistas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vistas` (
  `email` varchar(255) NOT NULL,
  `idContenido` int(11) NOT NULL,
  `puntuacion_idpuntuacion` int(11) DEFAULT NULL,
  PRIMARY KEY (`email`,`idContenido`),
  KEY `fk_vistas_usuario_idx` (`email`),
  KEY `fk_vistas_contenido1_idx` (`idContenido`),
  KEY `fk_vistas_puntuacion1_idx` (`puntuacion_idpuntuacion`),
  CONSTRAINT `fk_vistas_contenido1` FOREIGN KEY (`idContenido`) REFERENCES `contenido` (`idContenido`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_vistas_puntuacion1` FOREIGN KEY (`puntuacion_idpuntuacion`) REFERENCES `puntuacion` (`idpuntuacion`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_vistas_usuario` FOREIGN KEY (`email`) REFERENCES `usuario` (`email`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vistas`
--

LOCK TABLES `vistas` WRITE;
/*!40000 ALTER TABLE `vistas` DISABLE KEYS */;
/*!40000 ALTER TABLE `vistas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'adoo'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-05-06 14:17:27
