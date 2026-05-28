-- MySQL dump 10.13  Distrib 8.0.45, for Win64 (x86_64)
--
-- Host: localhost    Database: ms_hospital
-- ------------------------------------------------------
-- Server version	9.6.0

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
SET @MYSQLDUMP_TEMP_LOG_BIN = @@SESSION.SQL_LOG_BIN;
SET @@SESSION.SQL_LOG_BIN= 0;

--
-- GTID state at the beginning of the backup 
--



--
-- Table structure for table `tbb_pacientes`
--

DROP TABLE IF EXISTS `tbb_pacientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbb_pacientes` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(100) NOT NULL,
  `Apellido_Paterno` varchar(100) NOT NULL,
  `Apellido_Materno` varchar(100) NOT NULL,
  `Genero` varchar(10) NOT NULL,
  `Fecha_Nacimiento` date NOT NULL,
  `Edad_Min` int DEFAULT NULL,
  `Edad_Max` int DEFAULT NULL,
  `Tipo_Sangre` enum('A+','A-','B+','B-','AB+','AB-','O+','O-') NOT NULL,
  `Estado_Vida` enum('Vivo','Finado','Coma','Vegetativo','Desconocido') NOT NULL,
  `Estatus_Medico` enum('Estable','Observacion','Recuperacion','Terapia Intensiva','Cuidados Paliativos') NOT NULL,
  `Alergias` text,
  `CURP` varchar(18) DEFAULT NULL,
  `Fecha_Registro` datetime DEFAULT CURRENT_TIMESTAMP,
  `Activo` bit(1) DEFAULT b'1',
  `Edad` int DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `CURP` (`CURP`)
) ENGINE=InnoDB AUTO_INCREMENT=41315 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tbc_servicios_medicos`
--

DROP TABLE IF EXISTS `tbc_servicios_medicos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbc_servicios_medicos` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `Tipo_Servicio` enum('Consulta','Urgencia','Hospitalizacion','Cirugia','Laboratorio','Radiologia','Enfermeria','Nutricion','Rehabilitacion','Vacunacion','Salud Mental','Odontologia') NOT NULL,
  `Estado_Servicio` enum('Activo','En Proceso','Finalizado','Cancelado') DEFAULT 'Activo',
  `Prioridad` enum('Baja','Media','Alta','Critica') NOT NULL,
  `Fecha_Inicio` datetime NOT NULL,
  `Paciente_ID` int DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `fk_servicio_paciente` (`Paciente_ID`),
  CONSTRAINT `fk_servicio_paciente` FOREIGN KEY (`Paciente_ID`) REFERENCES `tbb_pacientes` (`ID`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=34318 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tbd_citas_medicas`
--

DROP TABLE IF EXISTS `tbd_citas_medicas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbd_citas_medicas` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `Especialidad` varchar(100) NOT NULL,
  `Consultorio` varchar(50) DEFAULT NULL,
  `Tipo_Cita` enum('Consulta','Seguimiento','Urgencia') DEFAULT 'Consulta',
  `Prioridad` enum('Baja','Media','Alta','Critica') NOT NULL,
  `Estado_Cita` enum('Programada','Confirmada','Atendida','Cancelada','No Asistio') DEFAULT 'Programada',
  `Fecha_Cita` datetime DEFAULT CURRENT_TIMESTAMP,
  `Hora_Llegada` datetime DEFAULT NULL,
  `Hora_Atencion` datetime DEFAULT NULL,
  `Servicio_Medico_ID` int DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `fk_cita_servicio` (`Servicio_Medico_ID`),
  CONSTRAINT `fk_cita_servicio` FOREIGN KEY (`Servicio_Medico_ID`) REFERENCES `tbc_servicios_medicos` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=34318 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tbd_valoraciones`
--

DROP TABLE IF EXISTS `tbd_valoraciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbd_valoraciones` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `Cita_ID` int NOT NULL,
  `Diagnostico` text NOT NULL,
  `Temperatura` decimal(4,2) DEFAULT NULL,
  `Presion_Arterial` varchar(10) DEFAULT NULL,
  `Frecuencia_Cardiaca` int DEFAULT NULL,
  `Saturacion_O2` int DEFAULT NULL,
  `Peso_kg` decimal(5,2) DEFAULT NULL,
  `Observaciones` text,
  `Fecha_Valoracion` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID`),
  KEY `fk_valoracion_cita` (`Cita_ID`),
  CONSTRAINT `fk_valoracion_cita` FOREIGN KEY (`Cita_ID`) REFERENCES `tbd_citas_medicas` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=34318 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
SET @@SESSION.SQL_LOG_BIN = @MYSQLDUMP_TEMP_LOG_BIN;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-03-26  0:35:22
