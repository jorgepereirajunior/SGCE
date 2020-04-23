CREATE DATABASE  IF NOT EXISTS `db_sgce` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_as_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `db_sgce`;
-- MySQL dump 10.13  Distrib 8.0.19, for Win64 (x86_64)
--
-- Host: localhost    Database: db_sgce
-- ------------------------------------------------------
-- Server version	8.0.19

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
-- Table structure for table `tb_aluno`
--

DROP TABLE IF EXISTS `tb_aluno`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_aluno` (
  `RA_Aluno` varchar(8) COLLATE utf8mb4_0900_as_ci NOT NULL,
  `nomeAluno` varchar(20) COLLATE utf8mb4_0900_as_ci NOT NULL,
  `sobrenomeAluno` varchar(40) COLLATE utf8mb4_0900_as_ci NOT NULL,
  `cpf` varchar(20) COLLATE utf8mb4_0900_as_ci NOT NULL,
  `sexo` enum('M','F') COLLATE utf8mb4_0900_as_ci NOT NULL,
  `email` varchar(40) COLLATE utf8mb4_0900_as_ci NOT NULL,
  `whatsapp` varchar(20) COLLATE utf8mb4_0900_as_ci DEFAULT NULL,
  `nomeMae` varchar(80) COLLATE utf8mb4_0900_as_ci NOT NULL,
  `nomePai` varchar(80) COLLATE utf8mb4_0900_as_ci NOT NULL,
  `statusAluno` tinyint(1) DEFAULT NULL,
  `codTurma` int NOT NULL,
  `codCurso` int NOT NULL,
  `endereco` int NOT NULL,
  PRIMARY KEY (`RA_Aluno`),
  UNIQUE KEY `cpf` (`cpf`),
  KEY `fk_aluno_turma` (`codTurma`),
  KEY `fk_aluno_curso` (`codCurso`),
  KEY `fk_aluno_endereco` (`endereco`),
  CONSTRAINT `fk_aluno_curso` FOREIGN KEY (`codCurso`) REFERENCES `tb_curso` (`codCurso`),
  CONSTRAINT `fk_aluno_endereco` FOREIGN KEY (`endereco`) REFERENCES `tb_endereco_aluno` (`codEndereco`),
  CONSTRAINT `fk_aluno_turma` FOREIGN KEY (`codTurma`) REFERENCES `tb_turma` (`codTurma`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_as_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_aluno`
--

LOCK TABLES `tb_aluno` WRITE;
/*!40000 ALTER TABLE `tb_aluno` DISABLE KEYS */;
INSERT INTO `tb_aluno` VALUES ('00000001','João','Medeiros Santos','xxx.xxx.xxx-xx','M','joao@email.com','79988662211','Adelaide Cristina Medeiros','Joaquim Medeiros Santos',1,1,1,1);
/*!40000 ALTER TABLE `tb_aluno` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_aluno_disc`
--

DROP TABLE IF EXISTS `tb_aluno_disc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_aluno_disc` (
  `RA_Aluno` varchar(8) COLLATE utf8mb4_0900_as_ci NOT NULL,
  `codDisciplina` int NOT NULL,
  PRIMARY KEY (`RA_Aluno`,`codDisciplina`),
  KEY `fk_for_disciplina4` (`codDisciplina`),
  CONSTRAINT `fk_for_aluno` FOREIGN KEY (`RA_Aluno`) REFERENCES `tb_aluno` (`RA_Aluno`),
  CONSTRAINT `fk_for_disciplina4` FOREIGN KEY (`codDisciplina`) REFERENCES `tb_disciplina` (`codDisciplina`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_as_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_aluno_disc`
--

LOCK TABLES `tb_aluno_disc` WRITE;
/*!40000 ALTER TABLE `tb_aluno_disc` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_aluno_disc` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_curso`
--

DROP TABLE IF EXISTS `tb_curso`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_curso` (
  `codCurso` int NOT NULL AUTO_INCREMENT,
  `nomeCurso` varchar(100) COLLATE utf8mb4_0900_as_ci DEFAULT NULL,
  `codDepartamento` int NOT NULL,
  PRIMARY KEY (`codCurso`),
  KEY `fk_curso_departamento` (`codDepartamento`),
  CONSTRAINT `fk_curso_departamento` FOREIGN KEY (`codDepartamento`) REFERENCES `tb_departamento` (`codDepartamento`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_as_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_curso`
--

LOCK TABLES `tb_curso` WRITE;
/*!40000 ALTER TABLE `tb_curso` DISABLE KEYS */;
INSERT INTO `tb_curso` VALUES (1,'História per1',2);
/*!40000 ALTER TABLE `tb_curso` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_curso_disc`
--

DROP TABLE IF EXISTS `tb_curso_disc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_curso_disc` (
  `codCurso` int NOT NULL,
  `codDisciplina` int NOT NULL,
  PRIMARY KEY (`codCurso`,`codDisciplina`),
  KEY `fk_for_disciplina2` (`codDisciplina`),
  CONSTRAINT `fk_for_curso` FOREIGN KEY (`codCurso`) REFERENCES `tb_curso` (`codCurso`),
  CONSTRAINT `fk_for_disciplina2` FOREIGN KEY (`codDisciplina`) REFERENCES `tb_disciplina` (`codDisciplina`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_as_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_curso_disc`
--

LOCK TABLES `tb_curso_disc` WRITE;
/*!40000 ALTER TABLE `tb_curso_disc` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_curso_disc` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_departamento`
--

DROP TABLE IF EXISTS `tb_departamento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_departamento` (
  `codDepartamento` int NOT NULL AUTO_INCREMENT,
  `nomeDepartamento` varchar(100) COLLATE utf8mb4_0900_as_ci DEFAULT NULL,
  PRIMARY KEY (`codDepartamento`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_as_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_departamento`
--

LOCK TABLES `tb_departamento` WRITE;
/*!40000 ALTER TABLE `tb_departamento` DISABLE KEYS */;
INSERT INTO `tb_departamento` VALUES (1,'Dpt. Tecnologia da Informação (DTI)'),(2,'Dpt. História (DHI)'),(3,'Dpt. Filosofia (DFL)'),(4,'Dpt. Ciências Sociais (DCS)');
/*!40000 ALTER TABLE `tb_departamento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_disc_historico`
--

DROP TABLE IF EXISTS `tb_disc_historico`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_disc_historico` (
  `codHistorico` int NOT NULL,
  `codDisciplina` int NOT NULL,
  `nota` decimal(5,2) NOT NULL,
  `frequencia` int NOT NULL,
  PRIMARY KEY (`codHistorico`,`codDisciplina`),
  KEY `fk_for_disciplina3` (`codDisciplina`),
  CONSTRAINT `fk_for_disciplina3` FOREIGN KEY (`codDisciplina`) REFERENCES `tb_disciplina` (`codDisciplina`),
  CONSTRAINT `fk_for_historico` FOREIGN KEY (`codHistorico`) REFERENCES `tb_historico` (`codHistorico`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_as_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_disc_historico`
--

LOCK TABLES `tb_disc_historico` WRITE;
/*!40000 ALTER TABLE `tb_disc_historico` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_disc_historico` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_disciplina`
--

DROP TABLE IF EXISTS `tb_disciplina`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_disciplina` (
  `codDisciplina` int NOT NULL AUTO_INCREMENT,
  `nomeDisciplina` varchar(50) COLLATE utf8mb4_0900_as_ci NOT NULL,
  `descDisciplina` varchar(200) COLLATE utf8mb4_0900_as_ci DEFAULT NULL,
  `cargaHoraria` int NOT NULL,
  `numAlunos` int NOT NULL,
  `codDepartamento` int NOT NULL,
  PRIMARY KEY (`codDisciplina`),
  KEY `fk_departamento` (`codDepartamento`),
  CONSTRAINT `fk_departamento` FOREIGN KEY (`codDepartamento`) REFERENCES `tb_departamento` (`codDepartamento`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_as_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_disciplina`
--

LOCK TABLES `tb_disciplina` WRITE;
/*!40000 ALTER TABLE `tb_disciplina` DISABLE KEYS */;
INSERT INTO `tb_disciplina` VALUES (1,'Introdução a Filosofia',NULL,60,0,3),(2,'História e Patrimônio Cultural',NULL,60,0,2),(3,'Temas de História de Sergipe',NULL,60,0,2),(4,'Pré-História',NULL,60,0,2),(5,'Introdução à História',NULL,60,0,2),(9,'Temas de História do Brasil Contemprâneo',NULL,60,0,2),(10,'Temas de História Econômica',NULL,60,0,2),(11,'História Aniga I',NULL,60,0,2),(12,'Sociologia I',NULL,60,0,4);
/*!40000 ALTER TABLE `tb_disciplina` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_endereco_aluno`
--

DROP TABLE IF EXISTS `tb_endereco_aluno`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_endereco_aluno` (
  `codEndereco` int NOT NULL AUTO_INCREMENT,
  `nomeRua` varchar(20) COLLATE utf8mb4_0900_as_ci NOT NULL,
  `numCasa` int NOT NULL,
  `complemento` varchar(40) COLLATE utf8mb4_0900_as_ci DEFAULT NULL,
  `cep` varchar(10) COLLATE utf8mb4_0900_as_ci NOT NULL,
  `codtipoLogradouro` int NOT NULL,
  PRIMARY KEY (`codEndereco`),
  KEY `fk_tipo_logradouro` (`codtipoLogradouro`),
  CONSTRAINT `fk_tipo_logradouro` FOREIGN KEY (`codtipoLogradouro`) REFERENCES `tb_tipo_logradouro` (`codLogradouro`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_as_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_endereco_aluno`
--

LOCK TABLES `tb_endereco_aluno` WRITE;
/*!40000 ALTER TABLE `tb_endereco_aluno` DISABLE KEYS */;
INSERT INTO `tb_endereco_aluno` VALUES (1,'Marechal Dutra',2435,NULL,'49.000-000',1);
/*!40000 ALTER TABLE `tb_endereco_aluno` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_historico`
--

DROP TABLE IF EXISTS `tb_historico`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_historico` (
  `codHistorico` int NOT NULL AUTO_INCREMENT,
  `RA_Aluno` varchar(8) COLLATE utf8mb4_0900_as_ci NOT NULL,
  `dataInicio` date NOT NULL,
  `dataFim` date NOT NULL,
  PRIMARY KEY (`codHistorico`),
  KEY `fk_historico_aluno` (`RA_Aluno`),
  CONSTRAINT `fk_historico_aluno` FOREIGN KEY (`RA_Aluno`) REFERENCES `tb_aluno` (`RA_Aluno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_as_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_historico`
--

LOCK TABLES `tb_historico` WRITE;
/*!40000 ALTER TABLE `tb_historico` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_historico` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_prof_disc`
--

DROP TABLE IF EXISTS `tb_prof_disc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_prof_disc` (
  `idProf` int NOT NULL,
  `codDisciplina` int NOT NULL,
  PRIMARY KEY (`idProf`,`codDisciplina`),
  KEY `fk_for_disciplina` (`codDisciplina`),
  CONSTRAINT `fk_for_disciplina` FOREIGN KEY (`codDisciplina`) REFERENCES `tb_disciplina` (`codDisciplina`),
  CONSTRAINT `fk_for_prof` FOREIGN KEY (`idProf`) REFERENCES `tb_professor` (`idProf`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_as_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_prof_disc`
--

LOCK TABLES `tb_prof_disc` WRITE;
/*!40000 ALTER TABLE `tb_prof_disc` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_prof_disc` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_professor`
--

DROP TABLE IF EXISTS `tb_professor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_professor` (
  `idProf` int NOT NULL AUTO_INCREMENT,
  `nomeProf` varchar(20) COLLATE utf8mb4_0900_as_ci NOT NULL,
  `sobrenomeProf` varchar(40) COLLATE utf8mb4_0900_as_ci NOT NULL,
  `statusProf` tinyint(1) DEFAULT NULL,
  `codDepartamento` int NOT NULL,
  PRIMARY KEY (`idProf`),
  KEY `fk_prof_departamento` (`codDepartamento`),
  CONSTRAINT `fk_prof_departamento` FOREIGN KEY (`codDepartamento`) REFERENCES `tb_departamento` (`codDepartamento`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_as_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_professor`
--

LOCK TABLES `tb_professor` WRITE;
/*!40000 ALTER TABLE `tb_professor` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_professor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_telefone_aluno`
--

DROP TABLE IF EXISTS `tb_telefone_aluno`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_telefone_aluno` (
  `codTelefone` int NOT NULL AUTO_INCREMENT,
  `numTelefone` varchar(15) COLLATE utf8mb4_0900_as_ci DEFAULT NULL,
  `RA_Aluno` varchar(8) COLLATE utf8mb4_0900_as_ci DEFAULT NULL,
  `tipoTelefone` int NOT NULL,
  PRIMARY KEY (`codTelefone`),
  KEY `RA_Aluno` (`RA_Aluno`),
  KEY `tipoTelefone` (`tipoTelefone`),
  CONSTRAINT `tb_telefone_aluno_ibfk_1` FOREIGN KEY (`RA_Aluno`) REFERENCES `tb_aluno` (`RA_Aluno`),
  CONSTRAINT `tb_telefone_aluno_ibfk_2` FOREIGN KEY (`tipoTelefone`) REFERENCES `tb_tipo_telefone` (`codTipoTelefone`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_as_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_telefone_aluno`
--

LOCK TABLES `tb_telefone_aluno` WRITE;
/*!40000 ALTER TABLE `tb_telefone_aluno` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_telefone_aluno` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_tipo_logradouro`
--

DROP TABLE IF EXISTS `tb_tipo_logradouro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_tipo_logradouro` (
  `codLogradouro` int NOT NULL AUTO_INCREMENT,
  `tipoLogradouro` varchar(20) COLLATE utf8mb4_0900_as_ci DEFAULT NULL,
  PRIMARY KEY (`codLogradouro`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_as_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_tipo_logradouro`
--

LOCK TABLES `tb_tipo_logradouro` WRITE;
/*!40000 ALTER TABLE `tb_tipo_logradouro` DISABLE KEYS */;
INSERT INTO `tb_tipo_logradouro` VALUES (1,'Rua'),(2,'Avenida'),(3,'Alameda'),(4,'Travessa'),(5,'Viela'),(6,'Beco');
/*!40000 ALTER TABLE `tb_tipo_logradouro` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_tipo_telefone`
--

DROP TABLE IF EXISTS `tb_tipo_telefone`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_tipo_telefone` (
  `codTipoTelefone` int NOT NULL AUTO_INCREMENT,
  `tipoTelefone` varchar(15) COLLATE utf8mb4_0900_as_ci DEFAULT NULL,
  PRIMARY KEY (`codTipoTelefone`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_as_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_tipo_telefone`
--

LOCK TABLES `tb_tipo_telefone` WRITE;
/*!40000 ALTER TABLE `tb_tipo_telefone` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_tipo_telefone` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_turma`
--

DROP TABLE IF EXISTS `tb_turma`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_turma` (
  `codTurma` int NOT NULL AUTO_INCREMENT,
  `turno` varchar(6) COLLATE utf8mb4_0900_as_ci NOT NULL,
  `numAlunos` int NOT NULL,
  `dataInicio` date NOT NULL,
  `dataFim` date NOT NULL,
  `codCurso` int NOT NULL,
  PRIMARY KEY (`codTurma`),
  KEY `fk_turma_departamento` (`codCurso`),
  CONSTRAINT `fk_turma_departamento` FOREIGN KEY (`codCurso`) REFERENCES `tb_curso` (`codCurso`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_as_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_turma`
--

LOCK TABLES `tb_turma` WRITE;
/*!40000 ALTER TABLE `tb_turma` DISABLE KEYS */;
INSERT INTO `tb_turma` VALUES (1,'Noite',10,'2019-02-01','2023-06-30',1);
/*!40000 ALTER TABLE `tb_turma` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-04-22 21:49:08
