CREATE DATABASE  IF NOT EXISTS `empleadoss_departamentoss` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_bin */;
USE `empleadoss_departamentoss`;
-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: localhost    Database: empleadoss_departamentoss
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
-- Table structure for table `departamentos`
--

DROP TABLE IF EXISTS `departamentoss`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `departamentos` (
  `codDepto` varchar(4) COLLATE utf8_bin NOT NULL,
  `nombreDpto` varchar(20) COLLATE utf8_bin NOT NULL,
  `ciudad` varchar(15) COLLATE utf8_bin DEFAULT NULL,
  `codDirector` varchar(12) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`codDepto`),
  KEY `FK_EmpDir` (`codDirector`),
  CONSTRAINT `FK_EmpDir` FOREIGN KEY (`codDirector`) REFERENCES `empleadoss` (`jefeID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `departamentos`
--

LOCK TABLES `departamentos` WRITE;
/*!40000 ALTER TABLE `departamentos` DISABLE KEYS */;
INSERT INTO `departamentos` VALUES ('1000','GERENCIA','CIUDAD REAL','31.840.269');
INSERT INTO `departamentos` VALUES ('1500','PRODUCCIÓN','CIUDAD REAL','16.211.383');
INSERT INTO `departamentos` VALUES ('2000','VENTAS','CIUDAD REAL','31.178.144');
INSERT INTO `departamentos` VALUES ('2100','VENTAS','BARCELONA','16.211.383');
INSERT INTO `departamentos` VALUES ('2200','VENTAS','VALENCIA','16.211.383');
INSERT INTO `departamentos` VALUES ('2300','VENTAS','MADRID','16.759.060');
INSERT INTO `departamentos` VALUES ('3000','INVESTIGACIÓN','CIUDAD REAL','16.759.060');
INSERT INTO `departamentos` VALUES ('3500','MERCADEO','CIUDAD REAL','22.222.222');
INSERT INTO `departamentos` VALUES ('4000','MANTENIMIENTO','CIUDAD REAL','333.333.333');
INSERT INTO `departamentos` VALUES ('4100','MANTENIMIENTO','BARCELONA','16.759.060');
INSERT INTO `departamentos` VALUES ('4200','MANTENIMIENTO','VALENCIA','16.759.060');
INSERT INTO `departamentos` VALUES ('4300','MANTENIMIENTO','MADRID','16.759.060');
/*!40000 ALTER TABLE `departamentos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `empleados`
--

DROP TABLE IF EXISTS `empleados`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `empleados` (
  `nDIEmp` varchar(12) COLLATE utf8_bin NOT NULL,
  `nomEmp` varchar(30) COLLATE utf8_bin NOT NULL,
  `sexEmp` char(1) COLLATE utf8_bin NOT NULL,
  `fecNac` date NOT NULL,
  `fecIncorporacion` date NOT NULL,
  `salEmp` float NOT NULL,
  `comisionE` float NOT NULL,
  `cargoE` varchar(15) COLLATE utf8_bin NOT NULL,
  `jefeID` varchar(12) COLLATE utf8_bin DEFAULT NULL,
  `codDepto` varchar(4) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`nDIEmp`),
  KEY `FK_Empl` (`jefeID`),
  KEY `FK_Dpto` (`codDepto`),
  CONSTRAINT `FK_Dpto` FOREIGN KEY (`codDepto`) REFERENCES `departamentos` (`codDepto`),
  CONSTRAINT `FK_Empl` FOREIGN KEY (`jefeID`) REFERENCES `empleados` (`nDIEmp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empleados`
--

LOCK TABLES `empleados` WRITE;
/*!40000 ALTER TABLE `empleados` DISABLE KEYS */;
INSERT INTO `empleados` VALUES ('1.130.222','José Giraldo','M','1985-01-20','2000-11-01',1200000,400000,'Asesor','22.222.222','3500');
INSERT INTO `empleados` VALUES ('1.130.333','Pedro Blanco','M','1987-10-28','2000-10-01',800000,3000000,'Vendedor','31.178.144','2000');
INSERT INTO `empleados` VALUES ('1.130.444','Jesús Alfonso','M','1988-03-14','2000-10-01',800000,3500000,'Vendedor','31.178.144','2000');
INSERT INTO `empleados` VALUES ('1.130.555','Julián Mora','M','1989-07-03','2000-10-01',800000,3100000,'Vendedor','31.178.144','2200');
INSERT INTO `empleados` VALUES ('1.130.666','Manuel Millán','M','1990-12-08','2004-06-01',800000,3700000,'Vendedor','31.178.144','2300');
INSERT INTO `empleados` VALUES ('1.130.777','Marcos Cortez','M','1986-06-23','2000-04-16',2550000,500000,'Mecánico','333.333.333','4000');
INSERT INTO `empleados` VALUES ('1.130.782','Antonio Gil','M','1980-01-23','2010-04-16',850000,1500000,'Técnico','16.211.383','1500');
INSERT INTO `empleados` VALUES ('1.751.219','Melissa Roa','F','1960-06-19','2001-03-16',2250000,2500000,'Vendedor','31.178.144','2100');
INSERT INTO `empleados` VALUES ('11.111.111','Irene Díaz','F','1979-09-28','2004-06-01',1050000,200000,'Mecánico','333.333.333','4200');
INSERT INTO `empleados` VALUES ('16.211.383','Luis Pérez','M','1956-02-25','2000-01-01',5050000,0,'Director','31.840.269','1500');
INSERT INTO `empleados` VALUES ('16.759.060','Darío Casas','M','1960-04-05','1992-11-01',4500000,500000,'Investigador','31.840.269','3000');
INSERT INTO `empleados` VALUES ('19.709.802','William Daza','M','1982-10-09','1999-12-16',2250000,1000000,'Investigador','16.759.060','3000');
INSERT INTO `empleados` VALUES ('22.222.222','Carla López','F','1975-05-11','2005-07-16',4500000,500000,'Jefe Mercadeo','31.840.269','3500');
INSERT INTO `empleados` VALUES ('22.222.333','Carlos Rozo','M','1975-05-11','2001-09-16',750000,500000,'Vigilante','31.840.269','3500');
INSERT INTO `empleados` VALUES ('31.174.099','Diana Solarte','F','1957-11-19','1990-05-16',1250000,500000,'Secretaria','31.840.269','1000');
INSERT INTO `empleados` VALUES ('31.178.144','Rosa Angulo','F','1957-03-15','1998-08-16',3250000,3500000,'Jefe Ventas','31.840.269','2000');
INSERT INTO `empleados` VALUES ('31.840.269','María Rojas','F','1959-01-15','1990-05-16',6250000,1500000,'Gerente',NULL,'1000');
INSERT INTO `empleados` VALUES ('333.333.333','Elisa Rojas','F','1979-09-28','2004-06-01',3000000,1000000,'Jefe Mecánicos','31.840.269','4000');
INSERT INTO `empleados` VALUES ('333.333.334','Marisol Pulido','F','1979-10-01','1990-05-16',3250000,1000000,'Investigador','16.759.060','3000');
INSERT INTO `empleados` VALUES ('333.333.335','Ana Moreno','F','1992-01-05','2004-06-01',1200000,400000,'Secretaria','16.759.060','3000');
INSERT INTO `empleados` VALUES ('333.333.336','Carolina Ríos','F','1992-02-15','2000-10-01',1250000,500000,'Secretaria','16.211.383','1500');
INSERT INTO `empleados` VALUES ('333.333.337','Edith Muñoz','F','1992-03-31','2000-10-01',800000,3600000,'Vendedor','31.178.144','2100');
INSERT INTO `empleados` VALUES ('444.444','Abel Gómez','M','1939-12-24','2000-10-01',1050000,200000,'Mecánico','333.333.333','4300');
INSERT INTO `empleados` VALUES ('737.689','Mario Llano','M','1945-08-30','1990-05-16',2250000,2500000,'Vendedor','31.178.144','2300');
INSERT INTO `empleados` VALUES ('768.782','Joaquín Rosas','M','1947-07-07','1990-05-16',2250000,2500000,'Vendedor','31.178.144','2200');
INSERT INTO `empleados` VALUES ('888.888','Iván Duarte','M','1955-08-12','1998-05-16',1050000,200000,'Mecánico','333.333.333','4100');
/*!40000 ALTER TABLE `empleados` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-06-19 16:00:50

-- Dump completed on 2017-06-19 16:00:50
-- ahora empezamos apracticar 28-3-24

-- 1. Obtener los datos completos de los empleados.
/*2. Obtener los datos completos de los departamentos
3. Obtener los datos de los empleados con cargo 'Secretaria'.
4. Obtener el nombre y salario de los empleados.
5. Obtener los datos de los empleados vendedores, ordenado por nombre.
6. Listar el nombre de los departamentos
7. Obtener el nombre y cargo de todos los empleados, ordenado por salario*/

select *
from empleados;

select *
from departamentos;

select * 
from empleados
where cargoE='Secretaria';

select nomEmp,salEmp
from empleados;

select *
from empleados
where cargoE='Vendedor'
order by nomEmp;

select distinct nombreDpto
from departamentos;

select nomEmp,cargoE
from empleados
order by salEmp;

/*8. Listar los salarios y comisiones de los empleados del departamento 2000, ordenado por comisión
9. Listar todas las comisiones
10. Obtener el valor total a pagar que resulta de sumar a los empleados del departamento 3000 una
bonificación de 500.000, en orden alfabético del empleado
11. Obtener la lista de los empleados que ganan una comisión superior a su sueldo.
12. Listar los empleados cuya comisión es menor o igual que el 30% de su sueldo.*/

/*select e.salEmp,e.comisionE
from empleados e
where codDepto.e=codDepto.departamentos and codDepto='2000'
order by comisionE;*/

select salEmp,comisionE
from empleados
order by comisionE;



select distinct comisionE
from empleados;

select nomEmp,salEmp,(salemp+500000) as 'pago estimado'
from empleados
where codDepto='3000'
order by nomEmp;

select nomEmp,salemp,comisionE
from empleados
where comisionE>salEmp;

select nomEmp,salemp,comisionE
from Empleados
where comisionE<=0.30*salEmp;

/*13.Elabore un listado donde para cada fila, figure ‘Nombre’ y ‘Cargo’ antes del valor respectivo para cada empleado.
14. Hallar el salario y la comisión de aquellos empleados cuyo número de documento de identidad es
superior al '19.709.802'
15. Muestra los empleados cuyo nombre empiece entre las letras J y Z (rango).
Liste estos empleados y su cargo por orden alfabético.
16. Listar el salario, la comisión, el salario total (salario + comisión), documento de identidad del
empleado y nombre, de aquellos empleados que tienen comisión superior a 1.000.000, ordenar el
informe por el número del documento de identidad
17. Obtener un listado similar al anterior, pero de aquellos empleados que NO tienen comisión
18. Hallar los empleados cuyo nombre no contiene la cadena "MA"
19. Obtener los nombres de los departamentos que no sean “Ventas” ni “Investigación” NI
'MANTENIMIENTO', ordenados por ciudad.*/

select nomEmp as 'Nombre',cargoE as 'Cargo'
from empleados;

select nomEmp,salEmp,comisionE,ndiEmp
from empleados
where ndiEmp>'19709802'
order by ndiEmp;

select nomEmp
from empleados	
where  lower(nomEmp)> 'j' and lower(nomEmp)<'z'
order by nomEmp;

select salEmp,comisionE, salEmp+comisionE as 'salario total', ndiemp,nomemp
from empleados
where comisione>1000000
order by ndiemp;

select salEmp,comisionE, salEmp+comisionE as 'salario total', ndiemp,nomemp
from empleados
where comisione=0
order by ndiemp;

select nomEmp
from empleados
where lower(nomEmp) not like '%ma%';



select distinct nombreDpto
from departamentos
where lower(nombreDpto) not in ('ventas' ,'investigacion','mantenimiento')
order by ciudad;


/*20. Obtener el nombre y el departamento de los empleados con cargo 'Secretaria' , que
no trabajan en el departamento de “PRODUCCION”, cuyo salario es superior a $1.000.000,
ordenados por fecha de incorporación.
21. Obtener información de los empleados cuyo nombre tiene exactamente 11 caracteres
22. Obtener información de los empleados cuyo nombre tiene al menos 11 caracteres
23. Listar los datos de los empleados cuyo nombre inicia por la letra 'M', su salario es mayor a $800.000
y reciben comisión y trabajan para el departamento de 'VENTAS'
24. Obtener los nombres, salarios y comisiones de los empleados que reciben un salario situado entre la
mitad de la comisión la propia comisión*/



select e.nomemp, d.nombreDpto
from empleados e, departamentos d
where e.codDepto=d.codDepto and lower(e.cargoE)='secretaria' 
and lower(d.nombreDpto)<>'produccción' and e.salEmp > 1000000
order by e.fecIncorporacion;

select e.nomemp
from empleados e 
where char_length( e.nomemp)=11; 

select e.nomemp
from empleados e 
where char_length( e.nomemp)<=11;

select  e.nomEmp,d.nombredpto,e.salemp
from empleados e,departamentos d
where e.coddepto=d.coddepto and  lower(e.nomemp) like 'm%'
and e.salemp>800000 and e.comisione>0 and lower (d.nombredpto)<>'ventas';


 /*Obtener los nombres, salarios y comisiones de los empleados que reciben un salario situado entre la
mitad de la comisión la propia comisión*/

select nomemp,salemp,comisione
from empleados
where lower (salemp) between (comisione/2) and comisione ;

/*
25. Mostrar el salario más alto de la empresa.
26. Mostrar cada una de las comisiones y el número de empleados que las reciben. Solo si tiene comision.
27. Mostrar el nombre del último empleado de la lista por orden alfabético.
28. Hallar el salario más alto, el más bajo y la diferencia entre ellos.
29. Mostrar el número de empleados de sexo femenino y de sexo masculino, por departamento.
30. Hallar el salario promedio por departamento.
*/

select nomemp,salemp
from empleados
order by salemp desc
limit 1;

select  comisione, count(*) as numero_empleados_que_la_reciben
from empleados
where comisione>0
group by comisione
order by  numero_empleados_que_la_reciben,comisione;


select nomemp
from empleados
order by nomemp desc
limit 1;

select nomemp,max(salemp) as maximo_salario ,nomemp,min(salemp)as minimo_salario,(max(salemp)-min(salemp))as diferencia
from empleados;

select count(e.sexemp)as cantidad,e.sexemp as sexo_empleado,d.nombredpto
from empleados e, departamentos d
where e.coddepto=d.coddepto
group by e.sexemp,d.nombredpto;

select avg(e.salemp)as salario_promedio,d.nombredpto
from empleados e,departamentos d
where e.coddepto=d.coddepto
group by d.nombredpto;


















