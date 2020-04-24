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
INSERT INTO `tb_aluno` VALUES ('00000001','João','Medeiros Santos','xxx.xxx.xxx-xx','M','joao@email.com','79988662211','Adelaide Cristina Medeiros','Joaquim Medeiros Santos',1,1,1,1),('00000002','Lucas','Silva Xavier','xxx.xxx.xxx-xy','M','lucas@email.com','79991514757','Maria Adélia Souza Xavier','Pedro Silva Xavier',1,1,1,2),('00000003','Mateus','Silva Xavier','xxx.xxx.xxx-xz','M','mateus@email.com',NULL,'Maria Adélia Souza Xavier','Pedro Silva Xavier',1,1,1,2),('00000004','Maria Júlia','Silva Xavier','xxx.xxx.xxx-yy','F','julia@gmail.com','79988454545','Maria Adélia Souza Xavier','Pedro Silva Xavier',1,2,3,2),('00000005','Carlos','Santana Moreira','xxx.xxx.xxy-yx','M','carlos@gmail.com','79991553121','Cecília Silva Moreira','Augusto Santana Moreira',1,2,3,3),('00000006','Samantha','Silva Albuquerque','yyy.yyy.yyy-xx','F','sam@gmail.com','7981663131','Domingas Silva Albuquerque','Luís Antônio Albuquerque',1,2,3,4);
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_as_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_curso`
--

LOCK TABLES `tb_curso` WRITE;
/*!40000 ALTER TABLE `tb_curso` DISABLE KEYS */;
INSERT INTO `tb_curso` VALUES (1,'História',2),(2,'Sistemas de Informação',1),(3,'Letras Português e Inglês',10);
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
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_as_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_departamento`
--

LOCK TABLES `tb_departamento` WRITE;
/*!40000 ALTER TABLE `tb_departamento` DISABLE KEYS */;
INSERT INTO `tb_departamento` VALUES (1,'Dpt. Computação (DCOMP)'),(2,'Dpt. História (DHI)'),(3,'Dpt. Filosofia (DFL)'),(4,'Dpt. Ciências Sociais (DCS)'),(5,'Dpt. Educação (DED)'),(6,'Dpt. Psicologia (DPS)'),(7,'Dpt. Administração (DAD)'),(8,'Dpt. Matemática (DMA)'),(9,'Dpt. Estatísticas e Ciências Atuariais (DECAT)'),(10,'Dpt. Letras Estrangeiras (DLES)');
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
) ENGINE=InnoDB AUTO_INCREMENT=126 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_as_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_disciplina`
--

LOCK TABLES `tb_disciplina` WRITE;
/*!40000 ALTER TABLE `tb_disciplina` DISABLE KEYS */;
INSERT INTO `tb_disciplina` VALUES (1,'Introdução a Filosofia',NULL,60,0,3),(2,'História e Patrimônio Cultural',NULL,60,0,2),(3,'Temas de História de Sergipe I',NULL,60,0,2),(4,'Pré-História',NULL,60,0,2),(5,'Introdução à História',NULL,60,0,2),(9,'Temas de História do Brasil Contemporâneo',NULL,60,0,2),(10,'Temas de História Econômica',NULL,60,0,2),(11,'História Aniga I',NULL,60,0,2),(12,'Sociologia I',NULL,60,0,4),(13,'Estrutura e Funcionamento do Ensino',NULL,60,0,5),(14,'História Medieval I',NULL,60,0,2),(15,'História Medieval II','',60,0,2),(16,'Introdução à Psicologia do Desenvolvimento',NULL,60,0,6),(17,'Teorias da História I',NULL,60,0,2),(18,'Teorias da História II',NULL,60,0,2),(19,'História Moderna I',NULL,60,0,2),(20,'História da África I',NULL,60,0,2),(21,'Introdução à Psicologia da Aprendizagem',NULL,60,0,6),(22,'História do Brasil Colônia',NULL,60,0,2),(23,'Temas de História de Sergipe II',NULL,60,0,2),(24,'História Moderna II',NULL,60,0,2),(25,'História das Américas I',NULL,60,0,2),(26,'História da Cultura Afro-Brasileira',NULL,60,0,2),(27,'História do Brasil Império',NULL,60,0,2),(28,'Metodologia da Pesquisa Histórica',NULL,60,0,2),(29,'Didática e Metodologia do Ensino de História',NULL,60,0,2),(30,'História Contemporânea I',NULL,60,0,2),(31,'História das Américas II',NULL,60,0,2),(32,'História do Brasil República',NULL,60,0,2),(33,'Estágio Supervisionado em Ensino de História I',NULL,135,0,2),(34,'Fundamentos de Estágio Supervisionado I',NULL,60,0,2),(35,'História Contemporânea II',NULL,60,0,2),(36,'Historiografia Brasileira',NULL,60,0,2),(37,'Estágio Supervisionado em Ensino de História II',NULL,150,0,2),(38,'História e Historiografia Sergipana',NULL,30,0,2),(39,'Fundamentos de Estágio Supervisionado II',NULL,60,0,2),(40,'Língua Brasileira de Sinais - Libras',NULL,60,0,5),(41,'Prática de Pesquisa',NULL,60,0,2),(42,'Atividades Complementares de História',NULL,210,0,2),(43,'Introdução à Administração',NULL,60,0,7),(44,'Programação Funcional',NULL,60,0,1),(45,'Seminários em Computação',NULL,30,0,1),(46,'Vetores e Geometria Analítica',NULL,60,0,8),(47,'Cálculo A',NULL,60,0,8),(48,'Organização, Métodos e Sistemas Administrativos',NULL,60,0,7),(49,'Programação Imperativa',NULL,60,0,1),(50,'Informática, Ética e Sociedade',NULL,60,0,1),(51,'Fundamentos Elementares da Matemática',NULL,60,0,8),(52,'Cálculo B',NULL,60,0,8),(53,'Programação Orientada à Objetos',NULL,60,0,1),(54,'Estruturas de Dados',NULL,60,0,1),(55,'Lógica Para Computação',NULL,60,0,1),(56,'Arquitetura de Computadores',NULL,60,0,1),(57,'Estatística Aplicada',NULL,60,0,9),(58,'Sociologia das Organizações',NULL,60,0,7),(59,'Grafos e Algoritmos Computacionais',NULL,60,0,1),(60,'Projeto e Análise de Algoritmos',NULL,60,0,1),(61,'Sistemas Operacionais',NULL,60,0,1),(62,'Métodos e Técnicas de Pesquisa Para Computação',NULL,30,0,1),(63,'Linguagens Formais e Computabilidade',NULL,60,0,1),(64,'Engenharia de Software I',NULL,60,0,1),(65,'Teoria Geral dos Sistemas',NULL,60,0,1),(66,'Banco de Dados I','',60,0,1),(67,'Rede de Computadores',NULL,60,0,1),(68,'Inteligência Artificial',NULL,60,0,1),(69,'Engenharia de Software II',NULL,60,0,1),(70,'Sistemas de Apoio à Decisão',NULL,60,0,1),(71,'Laboratório de Redes Computacionais',NULL,30,0,1),(72,'Sistemas Distribuídos',NULL,60,0,1),(73,'Empreendedorismo e Gestão de Pequenos Negócios',NULL,60,0,7),(74,'Teste de Software',NULL,60,0,1),(75,'Gestão de Sistemas de Informação',NULL,60,0,1),(76,'Qualidade de Software',NULL,60,0,1),(77,'Evolução de Software',NULL,60,0,1),(78,'Gerência de Projetos',NULL,60,0,1),(79,'Prática Orientada em Computação I',NULL,180,0,1),(80,'Trabalho de Conclusão de Curso I',NULL,60,0,1),(81,'Estágio Supervisionado em Computação',NULL,210,0,1),(82,'Prática Orientada em Computação II',NULL,120,0,1),(83,'Trabalho de Conclusão de Curso II',NULL,120,0,1),(84,'Produção e Recepção de Texto I',NULL,60,0,10),(85,'Linguística',NULL,60,0,10),(86,'Fundamentos de Língua Latina','',60,0,10),(87,'Teoria da Literatura I',NULL,60,0,10),(88,'Compreesão de Texto Escrito em Língua Inglesa',NULL,60,0,10),(89,'Língua Inglesa I',NULL,60,0,10),(90,'Língua Portuguesa I',NULL,60,0,10),(91,'Produção e Recepção de Texto II',NULL,60,0,10),(92,'Sociolinguística',NULL,60,0,10),(93,'Teoria da Literatura II',NULL,60,0,10),(94,'Fonética do Inglês',NULL,60,0,10),(95,'Língua Inglesa II',NULL,60,0,10),(96,'Língua Portuguesa II',NULL,60,0,10),(97,'Fundamentos de Literatura Portuguesa',NULL,60,0,10),(98,'Literatura Brasileira I',NULL,60,0,10),(99,'Língua Inglesa III',NULL,60,0,10),(100,'Língua Portuguesa III',NULL,60,0,10),(101,'Literatura Brasileira II',NULL,60,0,10),(102,'Literatura Infanto-Juvenil',NULL,60,0,10),(103,'Metodologia do Ensino-Aprendizagem de Línguas',NULL,60,0,10),(104,'Compreensão e Expressão Oral em Língua Inglesa I',NULL,60,0,10),(105,'Língua Inglesa IV',NULL,60,0,10),(106,'Literatura de Língua Inglesa I',NULL,60,0,10),(107,'Laboratório Para o Ensino de Gêneros Textuais',NULL,60,0,10),(108,'Estágio Supervisionado Geral',NULL,60,0,10),(109,'Metodologia do Ensino-Aprendizagem de Inglês I',NULL,60,0,10),(110,'Língua Inglesa V',NULL,60,0,10),(111,'Temas de Cultura e Civilização Anglo-Americana',NULL,60,0,10),(112,'Literatura de Língua Inglesa II',NULL,60,0,10),(113,'Estágio Supervisionado de Língua Portuguesa I',NULL,60,0,10),(114,'Metodologia do Ensino-Aprendizagem de Inglês II',NULL,60,0,10),(115,'Expressão Escrita em Língua Inglesa I',NULL,60,0,10),(116,'Língua Inglesa VI',NULL,60,0,10),(117,'Literatura de Língua Inglesa III',NULL,60,0,10),(118,'Estágio Supervisionado de Língua Portuguesa I',NULL,120,0,10),(119,'Estágio Supervisionado de Inglês I',NULL,60,0,10),(120,'Trabalho de Conclusão de Curso I',NULL,60,0,10),(121,'Língua Inglesa VII',NULL,60,0,10),(122,'Literatura de Língua Inglesa IV',NULL,60,0,10),(123,'Atividades Complementares de Letras II',NULL,240,0,10),(124,'Estágio Supervisionado de Inglês II',NULL,120,0,10),(125,'Trabalho de Conclusão de Curso II',NULL,165,0,10);
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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_as_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_endereco_aluno`
--

LOCK TABLES `tb_endereco_aluno` WRITE;
/*!40000 ALTER TABLE `tb_endereco_aluno` DISABLE KEYS */;
INSERT INTO `tb_endereco_aluno` VALUES (1,'Marechal Dutra',2435,NULL,'49.000-000',1),(2,'Barbacena',741,'Conjunto Velho','49.000-000',1),(3,'Canário Belo',300,NULL,'49.000-000',2),(4,'Campo do Brito',366,'Bairro São José','49.000-000',1),(5,'Ladeira',415,'Conjunto Terra Natal','49.000-000',2);
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_as_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_turma`
--

LOCK TABLES `tb_turma` WRITE;
/*!40000 ALTER TABLE `tb_turma` DISABLE KEYS */;
INSERT INTO `tb_turma` VALUES (1,'Noite',10,'2019-02-01','2023-06-30',1),(2,'Noite',20,'2017-02-01','2021-11-05',3);
/*!40000 ALTER TABLE `tb_turma` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `vw_cadastro_aluno`
--

DROP TABLE IF EXISTS `vw_cadastro_aluno`;
/*!50001 DROP VIEW IF EXISTS `vw_cadastro_aluno`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_cadastro_aluno` AS SELECT 
 1 AS `RA_Aluno`,
 1 AS `cpf`,
 1 AS `nomeAluno`,
 1 AS `sobrenomeAluno`,
 1 AS `sexo`,
 1 AS `nomeMae`,
 1 AS `nomePai`,
 1 AS `tipoLogradouro`,
 1 AS `nomeRua`,
 1 AS `numCasa`,
 1 AS `complemento`*/;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `vw_cadastro_aluno`
--

/*!50001 DROP VIEW IF EXISTS `vw_cadastro_aluno`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`jorginho`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_cadastro_aluno` AS select `alu`.`RA_Aluno` AS `RA_Aluno`,`alu`.`cpf` AS `cpf`,`alu`.`nomeAluno` AS `nomeAluno`,`alu`.`sobrenomeAluno` AS `sobrenomeAluno`,`alu`.`sexo` AS `sexo`,`alu`.`nomeMae` AS `nomeMae`,`alu`.`nomePai` AS `nomePai`,`logr`.`tipoLogradouro` AS `tipoLogradouro`,`ende`.`nomeRua` AS `nomeRua`,`ende`.`numCasa` AS `numCasa`,`ende`.`complemento` AS `complemento` from ((`tb_aluno` `alu` join `tb_endereco_aluno` `ende` on((`alu`.`endereco` = `ende`.`codEndereco`))) join `tb_tipo_logradouro` `logr` on((`ende`.`codtipoLogradouro` = `logr`.`codLogradouro`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-04-24 15:30:12
