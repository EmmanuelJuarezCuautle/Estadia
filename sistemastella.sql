/*
SQLyog Community v13.2.0 (64 bit)
MySQL - 8.0.30 : Database - sistemastella
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`sistemastella` /*!40100 DEFAULT CHARACTER SET utf16 COLLATE utf16_spanish_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `sistemastella`;

/*Table structure for table `administradores` */

DROP TABLE IF EXISTS `administradores`;

CREATE TABLE `administradores` (
  `id_admin` int NOT NULL AUTO_INCREMENT,
  `nombre_admin` varchar(255) COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `correo_admin` varchar(255) COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `activo` varchar(2) COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `tipo_admin` varchar(255) COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`id_admin`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

/*Data for the table `administradores` */

insert  into `administradores`(`id_admin`,`nombre_admin`,`correo_admin`,`password`,`activo`,`tipo_admin`) values 
(1,'Eros','eros@gmail.com','123456','Si','Admin'),
(2,'Emmanuel','luna@example.com','123456','Si','Admin'),
(4,'Juan','emmanuel@example.com','$2y$12$xOvB.PYd8uTAPhHo3PDzp.87YZYEvgTQhHdDZcDsa7z53g5C5e7xW','Si','Admin'),
(6,'Carlos','eje@eje.com','$2y$12$sE6SDEp43phmam92KCjOSe1mIQwLO48XQGGIVXdQscLoE6eueudVq','Si','Practicante'),
(7,'alma','alma@alma.com','$2y$12$N6OpZn3df4qXXWhjhaq12uQcWEntZv0D.X10sVrel5dq2Mvj1Ie5C','Si','Admin'),
(8,'ejemplo','e@e.com','$2y$12$bQVIi7OXjAKEvjswqDHlKuEn5DfClUf2WHR1dM7LwcPAnjTTln2tG','Si','Admin');

/*Table structure for table `agencias` */

DROP TABLE IF EXISTS `agencias`;

CREATE TABLE `agencias` (
  `id_agencia` int NOT NULL AUTO_INCREMENT,
  `nombre_age` varchar(255) CHARACTER SET utf16 COLLATE utf16_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`id_agencia`)
) ENGINE=InnoDB AUTO_INCREMENT=60 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

/*Data for the table `agencias` */

insert  into `agencias`(`id_agencia`,`nombre_age`) values 
(1,'Fuertes'),
(2,'Dorada'),
(4,'Angelopolis'),
(54,'Serdan'),
(55,'Zacatelco'),
(58,'aaaaaa');

/*Table structure for table `antivirus` */

DROP TABLE IF EXISTS `antivirus`;

CREATE TABLE `antivirus` (
  `id_antivirus` int NOT NULL AUTO_INCREMENT,
  `nombre_antivirus` varchar(255) COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`id_antivirus`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

/*Data for the table `antivirus` */

insert  into `antivirus`(`id_antivirus`,`nombre_antivirus`) values 
(1,'Avira'),
(2,'Avast'),
(3,'No tiene');

/*Table structure for table `areas` */

DROP TABLE IF EXISTS `areas`;

CREATE TABLE `areas` (
  `id_area` int NOT NULL AUTO_INCREMENT,
  `nombre_area` varchar(255) COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`id_area`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

/*Data for the table `areas` */

insert  into `areas`(`id_area`,`nombre_area`) values 
(1,'Gerencia de Ventas'),
(2,'Gerente General'),
(3,'Director de Marca'),
(5,'Control General Refacciones'),
(6,'Bodega'),
(7,'Gerencia Administracion'),
(8,'area1'),
(9,'area2'),
(10,'area3');

/*Table structure for table `cache` */

DROP TABLE IF EXISTS `cache`;

CREATE TABLE `cache` (
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `cache` */

insert  into `cache`(`key`,`value`,`expiration`) values 
('equipos_paginate','O:42:\"Illuminate\\Pagination\\LengthAwarePaginator\":11:{s:8:\"\0*\0items\";O:39:\"Illuminate\\Database\\Eloquent\\Collection\":2:{s:8:\"\0*\0items\";a:6:{i:0;O:34:\"App\\Models\\ModuloComputadoraEquipo\":30:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";s:26:\"modulo_computadora_equipos\";s:13:\"\0*\0primaryKey\";s:9:\"id_equipo\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:0:{}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:18:{s:9:\"id_equipo\";i:1;s:9:\"id_catego\";i:2;s:8:\"id_marca\";i:2;s:9:\"id_modelo\";i:1;s:12:\"numero_serie\";s:12:\"5CGBX5634NAQ\";s:5:\"id_so\";i:1;s:8:\"id_licso\";i:1;s:6:\"id_cpu\";i:1;s:5:\"id_dd\";i:1;s:9:\"id_tipodd\";i:1;s:6:\"id_ram\";i:1;s:12:\"id_antivirus\";i:1;s:9:\"id_office\";i:1;s:12:\"id_licoffice\";i:1;s:12:\"fecha_compra\";s:10:\"2024-11-15\";s:5:\"costo\";s:6:\"$12000\";s:10:\"created_at\";N;s:10:\"updated_at\";N;}s:11:\"\0*\0original\";a:18:{s:9:\"id_equipo\";i:1;s:9:\"id_catego\";i:2;s:8:\"id_marca\";i:2;s:9:\"id_modelo\";i:1;s:12:\"numero_serie\";s:12:\"5CGBX5634NAQ\";s:5:\"id_so\";i:1;s:8:\"id_licso\";i:1;s:6:\"id_cpu\";i:1;s:5:\"id_dd\";i:1;s:9:\"id_tipodd\";i:1;s:6:\"id_ram\";i:1;s:12:\"id_antivirus\";i:1;s:9:\"id_office\";i:1;s:12:\"id_licoffice\";i:1;s:12:\"fecha_compra\";s:10:\"2024-11-15\";s:5:\"costo\";s:6:\"$12000\";s:10:\"created_at\";N;s:10:\"updated_at\";N;}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:0:{}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:12:{s:9:\"categoria\";O:20:\"App\\Models\\Categoria\":30:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";s:10:\"categorias\";s:13:\"\0*\0primaryKey\";s:9:\"id_catego\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:0:{}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:2:{s:9:\"id_catego\";i:2;s:13:\"nombre_catego\";s:6:\"Laptop\";}s:11:\"\0*\0original\";a:2:{s:9:\"id_catego\";i:2;s:13:\"nombre_catego\";s:6:\"Laptop\";}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:0:{}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:0:{}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:0;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:1:{i:0;s:13:\"nombre_catego\";}s:10:\"\0*\0guarded\";a:1:{i:0;s:1:\"*\";}}s:5:\"marca\";O:16:\"App\\Models\\Marca\":30:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";s:6:\"marcas\";s:13:\"\0*\0primaryKey\";s:8:\"id_marca\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:0:{}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:2:{s:8:\"id_marca\";i:2;s:12:\"nombre_marca\";s:2:\"Hp\";}s:11:\"\0*\0original\";a:2:{s:8:\"id_marca\";i:2;s:12:\"nombre_marca\";s:2:\"Hp\";}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:0:{}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:0:{}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:0;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:1:{i:0;s:12:\"nombre_marca\";}s:10:\"\0*\0guarded\";a:1:{i:0;s:1:\"*\";}}s:6:\"modelo\";O:17:\"App\\Models\\Modelo\":30:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";s:7:\"modelos\";s:13:\"\0*\0primaryKey\";s:9:\"id_modelo\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:0:{}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:2:{s:9:\"id_modelo\";i:1;s:13:\"nombre_modelo\";s:9:\"Ideapad 3\";}s:11:\"\0*\0original\";a:2:{s:9:\"id_modelo\";i:1;s:13:\"nombre_modelo\";s:9:\"Ideapad 3\";}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:0:{}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:0:{}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:0;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:1:{i:0;s:13:\"nombre_modelo\";}s:10:\"\0*\0guarded\";a:1:{i:0;s:1:\"*\";}}s:16:\"sistemaOperativo\";O:13:\"App\\Models\\SO\":30:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";s:2:\"so\";s:13:\"\0*\0primaryKey\";s:5:\"id_so\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:0:{}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:2:{s:5:\"id_so\";i:1;s:9:\"nombre_so\";s:15:\"Windows 10 Home\";}s:11:\"\0*\0original\";a:2:{s:5:\"id_so\";i:1;s:9:\"nombre_so\";s:15:\"Windows 10 Home\";}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:0:{}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:0:{}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:0;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:1:{i:0;s:9:\"nombre_so\";}s:10:\"\0*\0guarded\";a:1:{i:0;s:1:\"*\";}}s:24:\"licenciaSistemaOperativo\";O:16:\"App\\Models\\LicSO\":30:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";s:5:\"licso\";s:13:\"\0*\0primaryKey\";s:8:\"id_licso\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:0:{}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:2:{s:8:\"id_licso\";i:1;s:12:\"nombre_licso\";s:2:\"Si\";}s:11:\"\0*\0original\";a:2:{s:8:\"id_licso\";i:1;s:12:\"nombre_licso\";s:2:\"Si\";}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:0:{}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:0:{}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:0;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:1:{i:0;s:12:\"nombre_licso\";}s:10:\"\0*\0guarded\";a:1:{i:0;s:1:\"*\";}}s:3:\"cpu\";O:21:\"App\\Models\\Procesador\":30:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";s:12:\"procesadores\";s:13:\"\0*\0primaryKey\";s:6:\"id_cpu\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:0:{}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:2:{s:6:\"id_cpu\";i:1;s:10:\"nombre_cpu\";s:12:\"Core i3 9100\";}s:11:\"\0*\0original\";a:2:{s:6:\"id_cpu\";i:1;s:10:\"nombre_cpu\";s:12:\"Core i3 9100\";}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:0:{}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:0:{}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:0;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:1:{i:0;s:10:\"nombre_cpu\";}s:10:\"\0*\0guarded\";a:1:{i:0;s:1:\"*\";}}s:9:\"discoDuro\";O:20:\"App\\Models\\DiscoDuro\":30:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";s:9:\"discoduro\";s:13:\"\0*\0primaryKey\";s:5:\"id_dd\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:0:{}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:2:{s:5:\"id_dd\";i:1;s:9:\"nombre_dd\";s:6:\"250 Gb\";}s:11:\"\0*\0original\";a:2:{s:5:\"id_dd\";i:1;s:9:\"nombre_dd\";s:6:\"250 Gb\";}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:0:{}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:0:{}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:0;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:1:{i:0;s:9:\"nombre_dd\";}s:10:\"\0*\0guarded\";a:1:{i:0;s:1:\"*\";}}s:13:\"tipoDiscoDuro\";O:24:\"App\\Models\\TipoDiscoDuro\":30:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";s:13:\"tipodiscoduro\";s:13:\"\0*\0primaryKey\";s:9:\"id_tipodd\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:0:{}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:2:{s:9:\"id_tipodd\";i:1;s:13:\"nombre_tipodd\";s:3:\"HDD\";}s:11:\"\0*\0original\";a:2:{s:9:\"id_tipodd\";i:1;s:13:\"nombre_tipodd\";s:3:\"HDD\";}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:0:{}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:0:{}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:0;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:1:{i:0;s:13:\"nombre_tipodd\";}s:10:\"\0*\0guarded\";a:1:{i:0;s:1:\"*\";}}s:10:\"memoriaRam\";O:14:\"App\\Models\\Ram\":30:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";s:3:\"ram\";s:13:\"\0*\0primaryKey\";s:6:\"id_ram\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:0:{}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:2:{s:6:\"id_ram\";i:1;s:10:\"nombre_ram\";s:4:\"8 Gb\";}s:11:\"\0*\0original\";a:2:{s:6:\"id_ram\";i:1;s:10:\"nombre_ram\";s:4:\"8 Gb\";}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:0:{}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:0:{}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:0;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:1:{i:0;s:10:\"nombre_ram\";}s:10:\"\0*\0guarded\";a:1:{i:0;s:1:\"*\";}}s:9:\"antivirus\";O:20:\"App\\Models\\Antivirus\":30:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";s:9:\"antivirus\";s:13:\"\0*\0primaryKey\";s:12:\"id_antivirus\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:0:{}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:2:{s:12:\"id_antivirus\";i:1;s:16:\"nombre_antivirus\";s:5:\"Avira\";}s:11:\"\0*\0original\";a:2:{s:12:\"id_antivirus\";i:1;s:16:\"nombre_antivirus\";s:5:\"Avira\";}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:0:{}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:0:{}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:0;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:1:{i:0;s:16:\"nombre_antivirus\";}s:10:\"\0*\0guarded\";a:1:{i:0;s:1:\"*\";}}s:6:\"office\";O:17:\"App\\Models\\Office\":30:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";s:6:\"office\";s:13:\"\0*\0primaryKey\";s:9:\"id_office\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:0:{}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:2:{s:9:\"id_office\";i:1;s:13:\"nombre_office\";s:4:\"2016\";}s:11:\"\0*\0original\";a:2:{s:9:\"id_office\";i:1;s:13:\"nombre_office\";s:4:\"2016\";}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:0:{}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:0:{}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:0;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:1:{i:0;s:13:\"nombre_office\";}s:10:\"\0*\0guarded\";a:1:{i:0;s:1:\"*\";}}s:14:\"licenciaOffice\";O:20:\"App\\Models\\LicOffice\":30:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";s:9:\"licoffice\";s:13:\"\0*\0primaryKey\";s:12:\"id_licoffice\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:0:{}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:2:{s:12:\"id_licoffice\";i:1;s:16:\"nombre_licoffice\";s:2:\"Si\";}s:11:\"\0*\0original\";a:2:{s:12:\"id_licoffice\";i:1;s:16:\"nombre_licoffice\";s:2:\"Si\";}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:0:{}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:0:{}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:0;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:1:{i:0;s:16:\"nombre_licoffice\";}s:10:\"\0*\0guarded\";a:1:{i:0;s:1:\"*\";}}}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:15:{i:0;s:9:\"id_catego\";i:1;s:8:\"id_marca\";i:2;s:9:\"id_modelo\";i:3;s:12:\"numero_serie\";i:4;s:5:\"id_so\";i:5;s:8:\"id_licso\";i:6;s:6:\"id_cpu\";i:7;s:5:\"id_dd\";i:8;s:9:\"id_tipodd\";i:9;s:6:\"id_ram\";i:10;s:12:\"id_antivirus\";i:11;s:9:\"id_office\";i:12;s:12:\"id_licoffice\";i:13;s:12:\"fecha_compra\";i:14;s:5:\"costo\";}s:10:\"\0*\0guarded\";a:1:{i:0;s:1:\"*\";}}i:1;O:34:\"App\\Models\\ModuloComputadoraEquipo\":30:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";s:26:\"modulo_computadora_equipos\";s:13:\"\0*\0primaryKey\";s:9:\"id_equipo\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:0:{}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:18:{s:9:\"id_equipo\";i:2;s:9:\"id_catego\";i:1;s:8:\"id_marca\";i:1;s:9:\"id_modelo\";i:1;s:12:\"numero_serie\";s:12:\"ASDBOAS123AS\";s:5:\"id_so\";i:2;s:8:\"id_licso\";i:2;s:6:\"id_cpu\";i:2;s:5:\"id_dd\";i:2;s:9:\"id_tipodd\";i:2;s:6:\"id_ram\";i:2;s:12:\"id_antivirus\";i:2;s:9:\"id_office\";i:2;s:12:\"id_licoffice\";i:2;s:12:\"fecha_compra\";s:10:\"2024-11-15\";s:5:\"costo\";s:6:\"$10500\";s:10:\"created_at\";N;s:10:\"updated_at\";N;}s:11:\"\0*\0original\";a:18:{s:9:\"id_equipo\";i:2;s:9:\"id_catego\";i:1;s:8:\"id_marca\";i:1;s:9:\"id_modelo\";i:1;s:12:\"numero_serie\";s:12:\"ASDBOAS123AS\";s:5:\"id_so\";i:2;s:8:\"id_licso\";i:2;s:6:\"id_cpu\";i:2;s:5:\"id_dd\";i:2;s:9:\"id_tipodd\";i:2;s:6:\"id_ram\";i:2;s:12:\"id_antivirus\";i:2;s:9:\"id_office\";i:2;s:12:\"id_licoffice\";i:2;s:12:\"fecha_compra\";s:10:\"2024-11-15\";s:5:\"costo\";s:6:\"$10500\";s:10:\"created_at\";N;s:10:\"updated_at\";N;}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:0:{}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:12:{s:9:\"categoria\";O:20:\"App\\Models\\Categoria\":30:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";s:10:\"categorias\";s:13:\"\0*\0primaryKey\";s:9:\"id_catego\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:0:{}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:2:{s:9:\"id_catego\";i:1;s:13:\"nombre_catego\";s:2:\"PC\";}s:11:\"\0*\0original\";a:2:{s:9:\"id_catego\";i:1;s:13:\"nombre_catego\";s:2:\"PC\";}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:0:{}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:0:{}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:0;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:1:{i:0;s:13:\"nombre_catego\";}s:10:\"\0*\0guarded\";a:1:{i:0;s:1:\"*\";}}s:5:\"marca\";O:16:\"App\\Models\\Marca\":30:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";s:6:\"marcas\";s:13:\"\0*\0primaryKey\";s:8:\"id_marca\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:0:{}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:2:{s:8:\"id_marca\";i:1;s:12:\"nombre_marca\";s:8:\"Ensamble\";}s:11:\"\0*\0original\";a:2:{s:8:\"id_marca\";i:1;s:12:\"nombre_marca\";s:8:\"Ensamble\";}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:0:{}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:0:{}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:0;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:1:{i:0;s:12:\"nombre_marca\";}s:10:\"\0*\0guarded\";a:1:{i:0;s:1:\"*\";}}s:6:\"modelo\";r:138;s:16:\"sistemaOperativo\";O:13:\"App\\Models\\SO\":30:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";s:2:\"so\";s:13:\"\0*\0primaryKey\";s:5:\"id_so\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:0:{}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:2:{s:5:\"id_so\";i:2;s:9:\"nombre_so\";s:9:\"Windows 8\";}s:11:\"\0*\0original\";a:2:{s:5:\"id_so\";i:2;s:9:\"nombre_so\";s:9:\"Windows 8\";}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:0:{}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:0:{}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:0;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:1:{i:0;s:9:\"nombre_so\";}s:10:\"\0*\0guarded\";a:1:{i:0;s:1:\"*\";}}s:24:\"licenciaSistemaOperativo\";O:16:\"App\\Models\\LicSO\":30:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";s:5:\"licso\";s:13:\"\0*\0primaryKey\";s:8:\"id_licso\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:0:{}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:2:{s:8:\"id_licso\";i:2;s:12:\"nombre_licso\";s:2:\"No\";}s:11:\"\0*\0original\";a:2:{s:8:\"id_licso\";i:2;s:12:\"nombre_licso\";s:2:\"No\";}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:0:{}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:0:{}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:0;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:1:{i:0;s:12:\"nombre_licso\";}s:10:\"\0*\0guarded\";a:1:{i:0;s:1:\"*\";}}s:3:\"cpu\";O:21:\"App\\Models\\Procesador\":30:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";s:12:\"procesadores\";s:13:\"\0*\0primaryKey\";s:6:\"id_cpu\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:0:{}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:2:{s:6:\"id_cpu\";i:2;s:10:\"nombre_cpu\";s:12:\"Ryzen 3 3500\";}s:11:\"\0*\0original\";a:2:{s:6:\"id_cpu\";i:2;s:10:\"nombre_cpu\";s:12:\"Ryzen 3 3500\";}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:0:{}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:0:{}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:0;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:1:{i:0;s:10:\"nombre_cpu\";}s:10:\"\0*\0guarded\";a:1:{i:0;s:1:\"*\";}}s:9:\"discoDuro\";O:20:\"App\\Models\\DiscoDuro\":30:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";s:9:\"discoduro\";s:13:\"\0*\0primaryKey\";s:5:\"id_dd\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:0:{}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:2:{s:5:\"id_dd\";i:2;s:9:\"nombre_dd\";s:6:\"128 Gb\";}s:11:\"\0*\0original\";a:2:{s:5:\"id_dd\";i:2;s:9:\"nombre_dd\";s:6:\"128 Gb\";}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:0:{}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:0:{}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:0;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:1:{i:0;s:9:\"nombre_dd\";}s:10:\"\0*\0guarded\";a:1:{i:0;s:1:\"*\";}}s:13:\"tipoDiscoDuro\";O:24:\"App\\Models\\TipoDiscoDuro\":30:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";s:13:\"tipodiscoduro\";s:13:\"\0*\0primaryKey\";s:9:\"id_tipodd\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:0:{}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:2:{s:9:\"id_tipodd\";i:2;s:13:\"nombre_tipodd\";s:3:\"SSD\";}s:11:\"\0*\0original\";a:2:{s:9:\"id_tipodd\";i:2;s:13:\"nombre_tipodd\";s:3:\"SSD\";}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:0:{}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:0:{}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:0;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:1:{i:0;s:13:\"nombre_tipodd\";}s:10:\"\0*\0guarded\";a:1:{i:0;s:1:\"*\";}}s:10:\"memoriaRam\";O:14:\"App\\Models\\Ram\":30:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";s:3:\"ram\";s:13:\"\0*\0primaryKey\";s:6:\"id_ram\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:0:{}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:2:{s:6:\"id_ram\";i:2;s:10:\"nombre_ram\";s:4:\"4 Gb\";}s:11:\"\0*\0original\";a:2:{s:6:\"id_ram\";i:2;s:10:\"nombre_ram\";s:4:\"4 Gb\";}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:0:{}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:0:{}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:0;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:1:{i:0;s:10:\"nombre_ram\";}s:10:\"\0*\0guarded\";a:1:{i:0;s:1:\"*\";}}s:9:\"antivirus\";O:20:\"App\\Models\\Antivirus\":30:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";s:9:\"antivirus\";s:13:\"\0*\0primaryKey\";s:12:\"id_antivirus\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:0:{}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:2:{s:12:\"id_antivirus\";i:2;s:16:\"nombre_antivirus\";s:5:\"Avast\";}s:11:\"\0*\0original\";a:2:{s:12:\"id_antivirus\";i:2;s:16:\"nombre_antivirus\";s:5:\"Avast\";}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:0:{}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:0:{}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:0;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:1:{i:0;s:16:\"nombre_antivirus\";}s:10:\"\0*\0guarded\";a:1:{i:0;s:1:\"*\";}}s:6:\"office\";O:17:\"App\\Models\\Office\":30:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";s:6:\"office\";s:13:\"\0*\0primaryKey\";s:9:\"id_office\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:0:{}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:2:{s:9:\"id_office\";i:2;s:13:\"nombre_office\";s:4:\"2018\";}s:11:\"\0*\0original\";a:2:{s:9:\"id_office\";i:2;s:13:\"nombre_office\";s:4:\"2018\";}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:0:{}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:0:{}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:0;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:1:{i:0;s:13:\"nombre_office\";}s:10:\"\0*\0guarded\";a:1:{i:0;s:1:\"*\";}}s:14:\"licenciaOffice\";O:20:\"App\\Models\\LicOffice\":30:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";s:9:\"licoffice\";s:13:\"\0*\0primaryKey\";s:12:\"id_licoffice\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:0:{}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:2:{s:12:\"id_licoffice\";i:2;s:16:\"nombre_licoffice\";s:2:\"No\";}s:11:\"\0*\0original\";a:2:{s:12:\"id_licoffice\";i:2;s:16:\"nombre_licoffice\";s:2:\"No\";}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:0:{}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:0:{}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:0;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:1:{i:0;s:16:\"nombre_licoffice\";}s:10:\"\0*\0guarded\";a:1:{i:0;s:1:\"*\";}}}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:15:{i:0;s:9:\"id_catego\";i:1;s:8:\"id_marca\";i:2;s:9:\"id_modelo\";i:3;s:12:\"numero_serie\";i:4;s:5:\"id_so\";i:5;s:8:\"id_licso\";i:6;s:6:\"id_cpu\";i:7;s:5:\"id_dd\";i:8;s:9:\"id_tipodd\";i:9;s:6:\"id_ram\";i:10;s:12:\"id_antivirus\";i:11;s:9:\"id_office\";i:12;s:12:\"id_licoffice\";i:13;s:12:\"fecha_compra\";i:14;s:5:\"costo\";}s:10:\"\0*\0guarded\";a:1:{i:0;s:1:\"*\";}}i:2;O:34:\"App\\Models\\ModuloComputadoraEquipo\":30:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";s:26:\"modulo_computadora_equipos\";s:13:\"\0*\0primaryKey\";s:9:\"id_equipo\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:0:{}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:18:{s:9:\"id_equipo\";i:3;s:9:\"id_catego\";i:3;s:8:\"id_marca\";i:3;s:9:\"id_modelo\";i:3;s:12:\"numero_serie\";s:12:\"OPASD234CA12\";s:5:\"id_so\";i:3;s:8:\"id_licso\";i:2;s:6:\"id_cpu\";i:3;s:5:\"id_dd\";i:3;s:9:\"id_tipodd\";i:2;s:6:\"id_ram\";i:3;s:12:\"id_antivirus\";i:3;s:9:\"id_office\";i:3;s:12:\"id_licoffice\";i:2;s:12:\"fecha_compra\";s:10:\"2024-11-13\";s:5:\"costo\";s:5:\"$7850\";s:10:\"created_at\";N;s:10:\"updated_at\";N;}s:11:\"\0*\0original\";a:18:{s:9:\"id_equipo\";i:3;s:9:\"id_catego\";i:3;s:8:\"id_marca\";i:3;s:9:\"id_modelo\";i:3;s:12:\"numero_serie\";s:12:\"OPASD234CA12\";s:5:\"id_so\";i:3;s:8:\"id_licso\";i:2;s:6:\"id_cpu\";i:3;s:5:\"id_dd\";i:3;s:9:\"id_tipodd\";i:2;s:6:\"id_ram\";i:3;s:12:\"id_antivirus\";i:3;s:9:\"id_office\";i:3;s:12:\"id_licoffice\";i:2;s:12:\"fecha_compra\";s:10:\"2024-11-13\";s:5:\"costo\";s:5:\"$7850\";s:10:\"created_at\";N;s:10:\"updated_at\";N;}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:0:{}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:12:{s:9:\"categoria\";O:20:\"App\\Models\\Categoria\":30:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";s:10:\"categorias\";s:13:\"\0*\0primaryKey\";s:9:\"id_catego\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:0:{}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:2:{s:9:\"id_catego\";i:3;s:13:\"nombre_catego\";s:7:\"Bocinas\";}s:11:\"\0*\0original\";a:2:{s:9:\"id_catego\";i:3;s:13:\"nombre_catego\";s:7:\"Bocinas\";}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:0:{}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:0:{}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:0;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:1:{i:0;s:13:\"nombre_catego\";}s:10:\"\0*\0guarded\";a:1:{i:0;s:1:\"*\";}}s:5:\"marca\";O:16:\"App\\Models\\Marca\":30:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";s:6:\"marcas\";s:13:\"\0*\0primaryKey\";s:8:\"id_marca\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:0:{}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:2:{s:8:\"id_marca\";i:3;s:12:\"nombre_marca\";s:7:\"Samsung\";}s:11:\"\0*\0original\";a:2:{s:8:\"id_marca\";i:3;s:12:\"nombre_marca\";s:7:\"Samsung\";}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:0:{}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:0:{}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:0;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:1:{i:0;s:12:\"nombre_marca\";}s:10:\"\0*\0guarded\";a:1:{i:0;s:1:\"*\";}}s:6:\"modelo\";O:17:\"App\\Models\\Modelo\":30:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";s:7:\"modelos\";s:13:\"\0*\0primaryKey\";s:9:\"id_modelo\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:0:{}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:2:{s:9:\"id_modelo\";i:3;s:13:\"nombre_modelo\";s:7:\"Mac Air\";}s:11:\"\0*\0original\";a:2:{s:9:\"id_modelo\";i:3;s:13:\"nombre_modelo\";s:7:\"Mac Air\";}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:0:{}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:0:{}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:0;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:1:{i:0;s:13:\"nombre_modelo\";}s:10:\"\0*\0guarded\";a:1:{i:0;s:1:\"*\";}}s:16:\"sistemaOperativo\";O:13:\"App\\Models\\SO\":30:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";s:2:\"so\";s:13:\"\0*\0primaryKey\";s:5:\"id_so\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:0:{}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:2:{s:5:\"id_so\";i:3;s:9:\"nombre_so\";s:14:\"Windows 10 Pro\";}s:11:\"\0*\0original\";a:2:{s:5:\"id_so\";i:3;s:9:\"nombre_so\";s:14:\"Windows 10 Pro\";}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:0:{}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:0:{}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:0;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:1:{i:0;s:9:\"nombre_so\";}s:10:\"\0*\0guarded\";a:1:{i:0;s:1:\"*\";}}s:24:\"licenciaSistemaOperativo\";r:703;s:3:\"cpu\";O:21:\"App\\Models\\Procesador\":30:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";s:12:\"procesadores\";s:13:\"\0*\0primaryKey\";s:6:\"id_cpu\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:0:{}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:2:{s:6:\"id_cpu\";i:3;s:10:\"nombre_cpu\";s:13:\"Core i5 11500\";}s:11:\"\0*\0original\";a:2:{s:6:\"id_cpu\";i:3;s:10:\"nombre_cpu\";s:13:\"Core i5 11500\";}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:0:{}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:0:{}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:0;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:1:{i:0;s:10:\"nombre_cpu\";}s:10:\"\0*\0guarded\";a:1:{i:0;s:1:\"*\";}}s:9:\"discoDuro\";O:20:\"App\\Models\\DiscoDuro\":30:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";s:9:\"discoduro\";s:13:\"\0*\0primaryKey\";s:5:\"id_dd\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:0:{}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:2:{s:5:\"id_dd\";i:3;s:9:\"nombre_dd\";s:6:\"512 Gb\";}s:11:\"\0*\0original\";a:2:{s:5:\"id_dd\";i:3;s:9:\"nombre_dd\";s:6:\"512 Gb\";}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:0:{}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:0:{}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:0;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:1:{i:0;s:9:\"nombre_dd\";}s:10:\"\0*\0guarded\";a:1:{i:0;s:1:\"*\";}}s:13:\"tipoDiscoDuro\";r:814;s:10:\"memoriaRam\";O:14:\"App\\Models\\Ram\":30:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";s:3:\"ram\";s:13:\"\0*\0primaryKey\";s:6:\"id_ram\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:0:{}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:2:{s:6:\"id_ram\";i:3;s:10:\"nombre_ram\";s:5:\"12 Gb\";}s:11:\"\0*\0original\";a:2:{s:6:\"id_ram\";i:3;s:10:\"nombre_ram\";s:5:\"12 Gb\";}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:0:{}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:0:{}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:0;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:1:{i:0;s:10:\"nombre_ram\";}s:10:\"\0*\0guarded\";a:1:{i:0;s:1:\"*\";}}s:9:\"antivirus\";O:20:\"App\\Models\\Antivirus\":30:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";s:9:\"antivirus\";s:13:\"\0*\0primaryKey\";s:12:\"id_antivirus\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:0:{}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:2:{s:12:\"id_antivirus\";i:3;s:16:\"nombre_antivirus\";s:8:\"No tiene\";}s:11:\"\0*\0original\";a:2:{s:12:\"id_antivirus\";i:3;s:16:\"nombre_antivirus\";s:8:\"No tiene\";}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:0:{}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:0:{}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:0;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:1:{i:0;s:16:\"nombre_antivirus\";}s:10:\"\0*\0guarded\";a:1:{i:0;s:1:\"*\";}}s:6:\"office\";O:17:\"App\\Models\\Office\":30:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";s:6:\"office\";s:13:\"\0*\0primaryKey\";s:9:\"id_office\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:0:{}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:2:{s:9:\"id_office\";i:3;s:13:\"nombre_office\";s:4:\"2012\";}s:11:\"\0*\0original\";a:2:{s:9:\"id_office\";i:3;s:13:\"nombre_office\";s:4:\"2012\";}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:0:{}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:0:{}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:0;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:1:{i:0;s:13:\"nombre_office\";}s:10:\"\0*\0guarded\";a:1:{i:0;s:1:\"*\";}}s:14:\"licenciaOffice\";r:962;}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:15:{i:0;s:9:\"id_catego\";i:1;s:8:\"id_marca\";i:2;s:9:\"id_modelo\";i:3;s:12:\"numero_serie\";i:4;s:5:\"id_so\";i:5;s:8:\"id_licso\";i:6;s:6:\"id_cpu\";i:7;s:5:\"id_dd\";i:8;s:9:\"id_tipodd\";i:9;s:6:\"id_ram\";i:10;s:12:\"id_antivirus\";i:11;s:9:\"id_office\";i:12;s:12:\"id_licoffice\";i:13;s:12:\"fecha_compra\";i:14;s:5:\"costo\";}s:10:\"\0*\0guarded\";a:1:{i:0;s:1:\"*\";}}i:3;O:34:\"App\\Models\\ModuloComputadoraEquipo\":30:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";s:26:\"modulo_computadora_equipos\";s:13:\"\0*\0primaryKey\";s:9:\"id_equipo\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:0:{}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:18:{s:9:\"id_equipo\";i:4;s:9:\"id_catego\";i:2;s:8:\"id_marca\";i:2;s:9:\"id_modelo\";i:2;s:12:\"numero_serie\";s:12:\"ASVWSASD6545\";s:5:\"id_so\";i:2;s:8:\"id_licso\";i:1;s:6:\"id_cpu\";i:3;s:5:\"id_dd\";i:3;s:9:\"id_tipodd\";i:1;s:6:\"id_ram\";i:2;s:12:\"id_antivirus\";i:3;s:9:\"id_office\";i:3;s:12:\"id_licoffice\";i:1;s:12:\"fecha_compra\";s:10:\"2024-11-15\";s:5:\"costo\";s:6:\"$11300\";s:10:\"created_at\";N;s:10:\"updated_at\";N;}s:11:\"\0*\0original\";a:18:{s:9:\"id_equipo\";i:4;s:9:\"id_catego\";i:2;s:8:\"id_marca\";i:2;s:9:\"id_modelo\";i:2;s:12:\"numero_serie\";s:12:\"ASVWSASD6545\";s:5:\"id_so\";i:2;s:8:\"id_licso\";i:1;s:6:\"id_cpu\";i:3;s:5:\"id_dd\";i:3;s:9:\"id_tipodd\";i:1;s:6:\"id_ram\";i:2;s:12:\"id_antivirus\";i:3;s:9:\"id_office\";i:3;s:12:\"id_licoffice\";i:1;s:12:\"fecha_compra\";s:10:\"2024-11-15\";s:5:\"costo\";s:6:\"$11300\";s:10:\"created_at\";N;s:10:\"updated_at\";N;}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:0:{}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:12:{s:9:\"categoria\";r:64;s:5:\"marca\";r:101;s:6:\"modelo\";O:17:\"App\\Models\\Modelo\":30:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";s:7:\"modelos\";s:13:\"\0*\0primaryKey\";s:9:\"id_modelo\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:0:{}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:2:{s:9:\"id_modelo\";i:2;s:13:\"nombre_modelo\";s:8:\"Ensamble\";}s:11:\"\0*\0original\";a:2:{s:9:\"id_modelo\";i:2;s:13:\"nombre_modelo\";s:8:\"Ensamble\";}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:0:{}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:0:{}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:0;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:1:{i:0;s:13:\"nombre_modelo\";}s:10:\"\0*\0guarded\";a:1:{i:0;s:1:\"*\";}}s:16:\"sistemaOperativo\";r:666;s:24:\"licenciaSistemaOperativo\";r:212;s:3:\"cpu\";r:1231;s:9:\"discoDuro\";r:1268;s:13:\"tipoDiscoDuro\";r:323;s:10:\"memoriaRam\";r:851;s:9:\"antivirus\";r:1343;s:6:\"office\";r:1380;s:14:\"licenciaOffice\";r:471;}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:15:{i:0;s:9:\"id_catego\";i:1;s:8:\"id_marca\";i:2;s:9:\"id_modelo\";i:3;s:12:\"numero_serie\";i:4;s:5:\"id_so\";i:5;s:8:\"id_licso\";i:6;s:6:\"id_cpu\";i:7;s:5:\"id_dd\";i:8;s:9:\"id_tipodd\";i:9;s:6:\"id_ram\";i:10;s:12:\"id_antivirus\";i:11;s:9:\"id_office\";i:12;s:12:\"id_licoffice\";i:13;s:12:\"fecha_compra\";i:14;s:5:\"costo\";}s:10:\"\0*\0guarded\";a:1:{i:0;s:1:\"*\";}}i:4;O:34:\"App\\Models\\ModuloComputadoraEquipo\":30:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";s:26:\"modulo_computadora_equipos\";s:13:\"\0*\0primaryKey\";s:9:\"id_equipo\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:0:{}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:18:{s:9:\"id_equipo\";i:6;s:9:\"id_catego\";i:1;s:8:\"id_marca\";i:1;s:9:\"id_modelo\";i:1;s:12:\"numero_serie\";s:14:\"PXCCCCCCCCCCCC\";s:5:\"id_so\";i:1;s:8:\"id_licso\";i:1;s:6:\"id_cpu\";i:1;s:5:\"id_dd\";i:1;s:9:\"id_tipodd\";i:1;s:6:\"id_ram\";i:1;s:12:\"id_antivirus\";i:1;s:9:\"id_office\";i:1;s:12:\"id_licoffice\";i:1;s:12:\"fecha_compra\";s:10:\"2024-11-22\";s:5:\"costo\";s:3:\"777\";s:10:\"created_at\";s:19:\"2024-12-01 05:40:18\";s:10:\"updated_at\";s:19:\"2024-12-01 05:40:18\";}s:11:\"\0*\0original\";a:18:{s:9:\"id_equipo\";i:6;s:9:\"id_catego\";i:1;s:8:\"id_marca\";i:1;s:9:\"id_modelo\";i:1;s:12:\"numero_serie\";s:14:\"PXCCCCCCCCCCCC\";s:5:\"id_so\";i:1;s:8:\"id_licso\";i:1;s:6:\"id_cpu\";i:1;s:5:\"id_dd\";i:1;s:9:\"id_tipodd\";i:1;s:6:\"id_ram\";i:1;s:12:\"id_antivirus\";i:1;s:9:\"id_office\";i:1;s:12:\"id_licoffice\";i:1;s:12:\"fecha_compra\";s:10:\"2024-11-22\";s:5:\"costo\";s:3:\"777\";s:10:\"created_at\";s:19:\"2024-12-01 05:40:18\";s:10:\"updated_at\";s:19:\"2024-12-01 05:40:18\";}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:0:{}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:12:{s:9:\"categoria\";r:591;s:5:\"marca\";r:628;s:6:\"modelo\";r:138;s:16:\"sistemaOperativo\";r:175;s:24:\"licenciaSistemaOperativo\";r:212;s:3:\"cpu\";r:249;s:9:\"discoDuro\";r:286;s:13:\"tipoDiscoDuro\";r:323;s:10:\"memoriaRam\";r:360;s:9:\"antivirus\";r:397;s:6:\"office\";r:434;s:14:\"licenciaOffice\";r:471;}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:15:{i:0;s:9:\"id_catego\";i:1;s:8:\"id_marca\";i:2;s:9:\"id_modelo\";i:3;s:12:\"numero_serie\";i:4;s:5:\"id_so\";i:5;s:8:\"id_licso\";i:6;s:6:\"id_cpu\";i:7;s:5:\"id_dd\";i:8;s:9:\"id_tipodd\";i:9;s:6:\"id_ram\";i:10;s:12:\"id_antivirus\";i:11;s:9:\"id_office\";i:12;s:12:\"id_licoffice\";i:13;s:12:\"fecha_compra\";i:14;s:5:\"costo\";}s:10:\"\0*\0guarded\";a:1:{i:0;s:1:\"*\";}}i:5;O:34:\"App\\Models\\ModuloComputadoraEquipo\":30:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";s:26:\"modulo_computadora_equipos\";s:13:\"\0*\0primaryKey\";s:9:\"id_equipo\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:0:{}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:18:{s:9:\"id_equipo\";i:7;s:9:\"id_catego\";i:1;s:8:\"id_marca\";i:3;s:9:\"id_modelo\";i:2;s:12:\"numero_serie\";s:10:\"123456789a\";s:5:\"id_so\";i:1;s:8:\"id_licso\";i:2;s:6:\"id_cpu\";i:2;s:5:\"id_dd\";i:2;s:9:\"id_tipodd\";i:2;s:6:\"id_ram\";i:2;s:12:\"id_antivirus\";i:1;s:9:\"id_office\";i:1;s:12:\"id_licoffice\";i:1;s:12:\"fecha_compra\";N;s:5:\"costo\";N;s:10:\"created_at\";s:19:\"2024-12-01 09:10:26\";s:10:\"updated_at\";s:19:\"2024-12-01 23:58:44\";}s:11:\"\0*\0original\";a:18:{s:9:\"id_equipo\";i:7;s:9:\"id_catego\";i:1;s:8:\"id_marca\";i:3;s:9:\"id_modelo\";i:2;s:12:\"numero_serie\";s:10:\"123456789a\";s:5:\"id_so\";i:1;s:8:\"id_licso\";i:2;s:6:\"id_cpu\";i:2;s:5:\"id_dd\";i:2;s:9:\"id_tipodd\";i:2;s:6:\"id_ram\";i:2;s:12:\"id_antivirus\";i:1;s:9:\"id_office\";i:1;s:12:\"id_licoffice\";i:1;s:12:\"fecha_compra\";N;s:5:\"costo\";N;s:10:\"created_at\";s:19:\"2024-12-01 09:10:26\";s:10:\"updated_at\";s:19:\"2024-12-01 23:58:44\";}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:0:{}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:12:{s:9:\"categoria\";r:591;s:5:\"marca\";r:1119;s:6:\"modelo\";r:1503;s:16:\"sistemaOperativo\";r:175;s:24:\"licenciaSistemaOperativo\";r:703;s:3:\"cpu\";r:740;s:9:\"discoDuro\";r:777;s:13:\"tipoDiscoDuro\";r:814;s:10:\"memoriaRam\";r:851;s:9:\"antivirus\";r:397;s:6:\"office\";r:434;s:14:\"licenciaOffice\";r:471;}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:15:{i:0;s:9:\"id_catego\";i:1;s:8:\"id_marca\";i:2;s:9:\"id_modelo\";i:3;s:12:\"numero_serie\";i:4;s:5:\"id_so\";i:5;s:8:\"id_licso\";i:6;s:6:\"id_cpu\";i:7;s:5:\"id_dd\";i:8;s:9:\"id_tipodd\";i:9;s:6:\"id_ram\";i:10;s:12:\"id_antivirus\";i:11;s:9:\"id_office\";i:12;s:12:\"id_licoffice\";i:13;s:12:\"fecha_compra\";i:14;s:5:\"costo\";}s:10:\"\0*\0guarded\";a:1:{i:0;s:1:\"*\";}}}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}s:10:\"\0*\0perPage\";i:20;s:14:\"\0*\0currentPage\";i:1;s:7:\"\0*\0path\";s:68:\"http://147e-189-164-39-38.ngrok-free.app/api/modulocomputadoraequipo\";s:8:\"\0*\0query\";a:0:{}s:11:\"\0*\0fragment\";N;s:11:\"\0*\0pageName\";s:4:\"page\";s:10:\"onEachSide\";i:3;s:10:\"\0*\0options\";a:2:{s:4:\"path\";s:68:\"http://147e-189-164-39-38.ngrok-free.app/api/modulocomputadoraequipo\";s:8:\"pageName\";s:4:\"page\";}s:8:\"\0*\0total\";i:6;s:11:\"\0*\0lastPage\";i:1;}',1733099684);

/*Table structure for table `cache_locks` */

DROP TABLE IF EXISTS `cache_locks`;

CREATE TABLE `cache_locks` (
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `owner` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `cache_locks` */

/*Table structure for table `categorias` */

DROP TABLE IF EXISTS `categorias`;

CREATE TABLE `categorias` (
  `id_catego` int NOT NULL AUTO_INCREMENT,
  `nombre_catego` varchar(255) COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`id_catego`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

/*Data for the table `categorias` */

insert  into `categorias`(`id_catego`,`nombre_catego`) values 
(1,'PC'),
(2,'Laptop'),
(3,'Celular'),
(4,'Router'),
(8,'Impresora');

/*Table structure for table `departamento_area` */

DROP TABLE IF EXISTS `departamento_area`;

CREATE TABLE `departamento_area` (
  `id_dep_area` int NOT NULL AUTO_INCREMENT,
  `id_depto` int DEFAULT NULL,
  `id_area` int DEFAULT NULL,
  PRIMARY KEY (`id_dep_area`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

/*Data for the table `departamento_area` */

insert  into `departamento_area`(`id_dep_area`,`id_depto`,`id_area`) values 
(1,1,7),
(2,9,6),
(3,5,6),
(15,10,8),
(16,9,8),
(17,9,9),
(18,5,9),
(19,1,10),
(20,3,8);

/*Table structure for table `departamentos` */

DROP TABLE IF EXISTS `departamentos`;

CREATE TABLE `departamentos` (
  `id_depto` int NOT NULL AUTO_INCREMENT,
  `nombre_depto` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`id_depto`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

/*Data for the table `departamentos` */

insert  into `departamentos`(`id_depto`,`nombre_depto`) values 
(1,'Administracion'),
(2,'Contabilidad'),
(3,'Auditores'),
(4,'Ventas'),
(5,'Refacciones Ventas'),
(9,'Taller'),
(10,'Depto1'),
(11,'Depto2');

/*Table structure for table `discoduro` */

DROP TABLE IF EXISTS `discoduro`;

CREATE TABLE `discoduro` (
  `id_dd` int NOT NULL AUTO_INCREMENT,
  `nombre_dd` varchar(255) COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`id_dd`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

/*Data for the table `discoduro` */

insert  into `discoduro`(`id_dd`,`nombre_dd`) values 
(1,'250 Gb'),
(2,'128 Gb'),
(3,'512 Gb'),
(4,'1 Tera');

/*Table structure for table `eje_manteni` */

DROP TABLE IF EXISTS `eje_manteni`;

CREATE TABLE `eje_manteni` (
  `id_mod_mant` int NOT NULL AUTO_INCREMENT,
  `tipo_mant` varchar(255) COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `id_admin` int DEFAULT NULL,
  `id_mod_general` int DEFAULT NULL,
  PRIMARY KEY (`id_mod_mant`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

/*Data for the table `eje_manteni` */

/*Table structure for table `ejemplo_mant` */

DROP TABLE IF EXISTS `ejemplo_mant`;

CREATE TABLE `ejemplo_mant` (
  `id_mantenimiento` int NOT NULL AUTO_INCREMENT,
  `tipo_mant` varchar(255) COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `id_admin` int DEFAULT NULL,
  `id_equipo` int DEFAULT NULL,
  `puerto_ip` varchar(255) COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `id_monitor` int DEFAULT NULL,
  `correo_equipo` varchar(255) COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `password_equipo` varchar(255) COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `accesorios` varchar(255) COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `condicion` varchar(255) COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `comentario` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `fecha_mant` date DEFAULT NULL,
  PRIMARY KEY (`id_mantenimiento`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

/*Data for the table `ejemplo_mant` */

insert  into `ejemplo_mant`(`id_mantenimiento`,`tipo_mant`,`id_admin`,`id_equipo`,`puerto_ip`,`id_monitor`,`correo_equipo`,`password_equipo`,`accesorios`,`condicion`,`comentario`,`fecha_mant`) values 
(1,'Correctivo',1,1,NULL,NULL,NULL,NULL,NULL,NULL,'Nada',NULL),
(2,'Preventivo',2,2,NULL,NULL,NULL,NULL,NULL,NULL,'Todo good',NULL),
(3,'Correctivo',2,3,NULL,NULL,NULL,NULL,NULL,NULL,'Cero',NULL);

/*Table structure for table `empleados` */

DROP TABLE IF EXISTS `empleados`;

CREATE TABLE `empleados` (
  `id_emp` int NOT NULL AUTO_INCREMENT,
  `nombre_emp` varchar(255) COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`id_emp`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

/*Data for the table `empleados` */

insert  into `empleados`(`id_emp`,`nombre_emp`) values 
(1,'Rosa Diana Garcia'),
(2,'Enrique Amador'),
(3,'Lizeth Lucero');

/*Table structure for table `failed_jobs` */

DROP TABLE IF EXISTS `failed_jobs`;

CREATE TABLE `failed_jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `failed_jobs` */

/*Table structure for table `job_batches` */

DROP TABLE IF EXISTS `job_batches`;

CREATE TABLE `job_batches` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_jobs` int NOT NULL,
  `pending_jobs` int NOT NULL,
  `failed_jobs` int NOT NULL,
  `failed_job_ids` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `options` mediumtext COLLATE utf8mb4_unicode_ci,
  `cancelled_at` int DEFAULT NULL,
  `created_at` int NOT NULL,
  `finished_at` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `job_batches` */

/*Table structure for table `jobs` */

DROP TABLE IF EXISTS `jobs`;

CREATE TABLE `jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `queue` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint unsigned NOT NULL,
  `reserved_at` int unsigned DEFAULT NULL,
  `available_at` int unsigned NOT NULL,
  `created_at` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `jobs_queue_index` (`queue`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `jobs` */

/*Table structure for table `licoffice` */

DROP TABLE IF EXISTS `licoffice`;

CREATE TABLE `licoffice` (
  `id_licoffice` int NOT NULL AUTO_INCREMENT,
  `nombre_licoffice` varchar(255) COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`id_licoffice`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

/*Data for the table `licoffice` */

insert  into `licoffice`(`id_licoffice`,`nombre_licoffice`) values 
(1,'Si'),
(2,'No'),
(4,'Desconocido');

/*Table structure for table `licso` */

DROP TABLE IF EXISTS `licso`;

CREATE TABLE `licso` (
  `id_licso` int NOT NULL AUTO_INCREMENT,
  `nombre_licso` varchar(255) COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`id_licso`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

/*Data for the table `licso` */

insert  into `licso`(`id_licso`,`nombre_licso`) values 
(1,'Si'),
(2,'No'),
(4,'Desconocido');

/*Table structure for table `marcas` */

DROP TABLE IF EXISTS `marcas`;

CREATE TABLE `marcas` (
  `id_marca` int NOT NULL AUTO_INCREMENT,
  `nombre_marca` varchar(255) COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`id_marca`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

/*Data for the table `marcas` */

insert  into `marcas`(`id_marca`,`nombre_marca`) values 
(1,'Ensamble'),
(2,'Hp'),
(3,'Samsung'),
(5,'Lenovo');

/*Table structure for table `migrations` */

DROP TABLE IF EXISTS `migrations`;

CREATE TABLE `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `migrations` */

insert  into `migrations`(`id`,`migration`,`batch`) values 
(1,'0001_01_01_000000_create_users_table',1),
(2,'0001_01_01_000001_create_cache_table',1),
(3,'0001_01_01_000002_create_jobs_table',1),
(4,'2024_11_22_201235_create_personal_access_tokens_table',2);

/*Table structure for table `modelos` */

DROP TABLE IF EXISTS `modelos`;

CREATE TABLE `modelos` (
  `id_modelo` int NOT NULL AUTO_INCREMENT,
  `nombre_modelo` varchar(255) COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`id_modelo`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

/*Data for the table `modelos` */

insert  into `modelos`(`id_modelo`,`nombre_modelo`) values 
(1,'Ideapad 3'),
(2,'Ensamble'),
(3,'Mac Air'),
(5,'All in One'),
(7,'D15');

/*Table structure for table `modulo_computadora_equipos` */

DROP TABLE IF EXISTS `modulo_computadora_equipos`;

CREATE TABLE `modulo_computadora_equipos` (
  `id_equipo` int NOT NULL AUTO_INCREMENT,
  `id_catego` int DEFAULT NULL,
  `id_marca` int DEFAULT NULL,
  `id_modelo` int DEFAULT NULL,
  `numero_serie` varchar(255) COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `id_so` int DEFAULT NULL,
  `id_licso` int DEFAULT NULL,
  `id_cpu` int DEFAULT NULL,
  `id_dd` int DEFAULT NULL,
  `id_tipodd` int DEFAULT NULL,
  `id_ram` int DEFAULT NULL,
  `id_antivirus` int DEFAULT NULL,
  `id_office` int DEFAULT NULL,
  `id_licoffice` int DEFAULT NULL,
  `fecha_compra` date DEFAULT NULL,
  `costo` varchar(255) COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `id_agencia` int DEFAULT NULL,
  `id_depto` int DEFAULT NULL,
  `id_area` int DEFAULT NULL,
  `empleado` varchar(255) COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id_equipo`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

/*Data for the table `modulo_computadora_equipos` */

insert  into `modulo_computadora_equipos`(`id_equipo`,`id_catego`,`id_marca`,`id_modelo`,`numero_serie`,`id_so`,`id_licso`,`id_cpu`,`id_dd`,`id_tipodd`,`id_ram`,`id_antivirus`,`id_office`,`id_licoffice`,`fecha_compra`,`costo`,`id_agencia`,`id_depto`,`id_area`,`empleado`,`created_at`,`updated_at`) values 
(1,2,2,1,'5CGBX5634NAQ',1,1,1,1,1,1,1,3,2,'2024-11-15','10500',2,1,20,'Alma',NULL,'2024-12-06 03:30:44'),
(2,1,1,2,'ASDBOAS123AS',4,1,2,2,2,2,2,1,2,'2024-11-15','15000',4,2,20,'Carlos',NULL,'2024-12-06 03:30:53'),
(3,1,3,5,'OPASD234CA12',1,2,3,3,2,3,1,1,2,'2024-11-13','25000',4,1,3,'Alma',NULL,'2024-12-06 03:31:06'),
(4,2,2,7,'ASVWSASD6545',4,2,3,3,1,2,1,2,1,'2024-11-15','11300',4,3,1,'Juana',NULL,'2024-12-04 04:24:45'),
(11,2,3,5,'TEam0@lm4651',1,2,2,2,1,2,3,3,1,NULL,'13500',4,11,1,'Emmanuel','2024-12-02 06:06:09','2024-12-04 18:36:25'),
(12,2,3,1,'TEam0@lm4651',1,2,1,1,1,1,2,2,2,NULL,'11500',55,4,3,'Carlos','2024-12-02 09:20:27','2024-12-06 01:46:04'),
(13,2,3,1,'TEam0@lm4651aaaaa',2,1,1,1,3,2,1,6,1,NULL,'12800',55,1,3,'aaaaaaaaa','2024-12-02 09:34:30','2024-12-06 01:45:55'),
(14,2,3,5,'0000000000',2,1,1,2,3,3,3,2,2,NULL,'9700',4,2,3,'Emmanuel','2024-12-02 10:01:48','2024-12-06 01:45:47'),
(20,1,1,1,'PXCCCCCCCCCCCC',1,1,1,1,1,1,1,1,1,'2024-11-22','777',54,2,3,'Alma','2024-12-05 21:11:17','2024-12-06 01:45:34');

/*Table structure for table `modulo_control_general` */

DROP TABLE IF EXISTS `modulo_control_general`;

CREATE TABLE `modulo_control_general` (
  `id_mod_general` int NOT NULL AUTO_INCREMENT,
  `id_equipo` int DEFAULT NULL,
  `id_agencia` int DEFAULT NULL,
  `id_depto` int DEFAULT NULL,
  `id_area` int DEFAULT NULL,
  `empleado` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `id_catego` int DEFAULT NULL,
  `numero_serie` varchar(255) COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id_mod_general`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

/*Data for the table `modulo_control_general` */

insert  into `modulo_control_general`(`id_mod_general`,`id_equipo`,`id_agencia`,`id_depto`,`id_area`,`empleado`,`id_catego`,`numero_serie`,`created_at`,`updated_at`) values 
(1,1,2,2,2,'aaaaaaaaaaaa',3,'3',NULL,'2024-12-02 05:25:51'),
(2,3,2,2,2,'Ing Juan Teomitzil',3,'OPASD234CA12',NULL,NULL),
(3,4,3,3,3,'Daniel Juarez',2,'ASVWSASD6545',NULL,NULL),
(4,4,3,3,3,'eeeeeeeeeeeeeee',3,'3','2024-11-23 01:51:47','2024-12-02 05:27:22');

/*Table structure for table `modulo_mantenimientos` */

DROP TABLE IF EXISTS `modulo_mantenimientos`;

CREATE TABLE `modulo_mantenimientos` (
  `id_mod_mant` int NOT NULL AUTO_INCREMENT,
  `tipo_mant` varchar(255) COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `id_admin` int DEFAULT NULL,
  `id_equipo` int DEFAULT NULL,
  `id_agencia` int DEFAULT NULL,
  `id_depto` int DEFAULT NULL,
  `id_area` int DEFAULT NULL,
  `empleado` varchar(255) COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `id_catego` int DEFAULT NULL,
  `numero_serie` varchar(255) COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `puerto_ip` varchar(255) COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `id_monitor` int DEFAULT NULL,
  `correo_equipo` varchar(255) COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `password_equipo` varchar(255) COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `accesorios` varchar(255) COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `condicion` varchar(255) COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `comentario` varchar(255) COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `fecha_mant` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id_mod_mant`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

/*Data for the table `modulo_mantenimientos` */

insert  into `modulo_mantenimientos`(`id_mod_mant`,`tipo_mant`,`id_admin`,`id_equipo`,`id_agencia`,`id_depto`,`id_area`,`empleado`,`id_catego`,`numero_serie`,`puerto_ip`,`id_monitor`,`correo_equipo`,`password_equipo`,`accesorios`,`condicion`,`comentario`,`fecha_mant`,`created_at`,`updated_at`) values 
(5,'Preventivo',7,1,1,1,1,'165015460564',1,'156a4654654651','11.1.1.1.1',1,'aa@aa.com','654321','nada','goog','zzz','2024-12-05',NULL,'2024-12-05 23:40:11'),
(8,'Preventivo',4,2,4,2,2,NULL,1,'ASDBOAS123AS','10.10.10.1',2,NULL,NULL,NULL,NULL,NULL,NULL,'2024-12-05 08:16:09','2024-12-05 23:40:08'),
(12,'Preventivo',2,3,4,1,6,'Alma',1,'OPASD234CA12',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2024-12-05 09:30:44','2024-12-05 09:30:44'),
(13,'Preventivo',1,4,4,3,1,'Ejemplos',2,'ASVWSASD6545',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2024-12-05 09:36:30','2024-12-05 23:40:02'),
(16,'Correctivo',4,20,54,2,2,'Alma',1,'PXCCCCCCCCCCCC',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2024-12-05 23:00:12','2024-12-05 23:40:23');

/*Table structure for table `monitores` */

DROP TABLE IF EXISTS `monitores`;

CREATE TABLE `monitores` (
  `id_monitor` int NOT NULL AUTO_INCREMENT,
  `nombre_monitor` varchar(255) COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`id_monitor`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

/*Data for the table `monitores` */

insert  into `monitores`(`id_monitor`,`nombre_monitor`) values 
(1,'HP 17\"'),
(2,'Samsung 15\"'),
(3,'Dell 15\"');

/*Table structure for table `office` */

DROP TABLE IF EXISTS `office`;

CREATE TABLE `office` (
  `id_office` int NOT NULL AUTO_INCREMENT,
  `nombre_office` varchar(255) COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`id_office`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

/*Data for the table `office` */

insert  into `office`(`id_office`,`nombre_office`) values 
(1,'Office 2016'),
(2,'Office 2018'),
(3,'Office 2012'),
(6,'Office 2009');

/*Table structure for table `password_reset_tokens` */

DROP TABLE IF EXISTS `password_reset_tokens`;

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `password_reset_tokens` */

/*Table structure for table `personal_access_tokens` */

DROP TABLE IF EXISTS `personal_access_tokens`;

CREATE TABLE `personal_access_tokens` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `personal_access_tokens` */

insert  into `personal_access_tokens`(`id`,`tokenable_type`,`tokenable_id`,`name`,`token`,`abilities`,`last_used_at`,`expires_at`,`created_at`,`updated_at`) values 
(2,'App\\Models\\User',1,'auth_token','f69c8dc9df6b40d6067fadc4e6dc153651d83b21c8f6d90060efa1542fddc5a2','[\"*\"]',NULL,NULL,'2024-12-06 08:22:43','2024-12-06 08:22:43'),
(3,'App\\Models\\User',1,'auth_token','d4fd51c2650eddeb93f3a64c430a20f92ccb00b23a17a4695261dead692ea880','[\"*\"]',NULL,NULL,'2024-12-06 08:28:15','2024-12-06 08:28:15'),
(5,'App\\Models\\User',1,'auth_token','9da9e73a13bec2e834e0b958111dfd629a3781d0951e79f94417cab2881ed4d4','[\"*\"]',NULL,NULL,'2024-12-06 09:11:52','2024-12-06 09:11:52'),
(6,'App\\Models\\Administrador',7,'auth_token','4f080f8b1e45c87657d6238854acc0b466b333300560378778c6ad40c36f833b','[\"*\"]',NULL,NULL,'2024-12-06 09:20:04','2024-12-06 09:20:04'),
(8,'App\\Models\\Administrador',7,'token-name','ed755abcad12975ff74da6c184e6e535a3e1cfafff768cb96b217d328fbd19cd','[\"*\"]',NULL,NULL,'2024-12-06 09:55:27','2024-12-06 09:55:27'),
(9,'App\\Models\\Administrador',7,'token-name','0efd6b82e4d86a55d03decb05031f1462b4f2a16d0e6b33f5025691d9598e318','[\"*\"]',NULL,NULL,'2024-12-06 10:04:14','2024-12-06 10:04:14'),
(10,'App\\Models\\Administrador',4,'token-name','1ea3ea8ef2df607d972b9f34781906ed14cf2fa16cd4dfcc5e30f8aaaca7931d','[\"*\"]','2024-12-06 10:47:44',NULL,'2024-12-06 10:09:14','2024-12-06 10:47:44'),
(11,'App\\Models\\Administrador',7,'token-name','f288290de599535dc9a8babd9419eacbbf8bb38bbde86ef5a1458bc09624516f','[\"*\"]',NULL,NULL,'2024-12-06 10:13:19','2024-12-06 10:13:19'),
(12,'App\\Models\\Administrador',7,'token-name','ba95b1cf9cb289ff13d6dc744ed1378acff49942a1c65f71b2abb5e8597feebb','[\"*\"]',NULL,NULL,'2024-12-06 10:22:43','2024-12-06 10:22:43'),
(13,'App\\Models\\Administrador',7,'token-name','d1d2a8f3d3faa83308419caab18c4fcf79dca40e0099847c84fdbce68fdd1e9f','[\"*\"]',NULL,NULL,'2024-12-06 10:31:43','2024-12-06 10:31:43'),
(14,'App\\Models\\Administrador',7,'token-name','60bd1bc60cc895b1d939662d7c8080f606fc3e7e9ab6297d96565e200df64738','[\"*\"]','2024-12-06 10:47:35',NULL,'2024-12-06 10:34:18','2024-12-06 10:47:35'),
(16,'App\\Models\\Administrador',7,'token-name','542231e3f5c9e284c91cf893ff0ab51757f29beb2d67d680d2149955a3b96f52','[\"*\"]','2024-12-06 10:58:17',NULL,'2024-12-06 10:50:09','2024-12-06 10:58:17'),
(17,'App\\Models\\Administrador',7,'token-name','060bf2e986f180f398237f4e38d6aeb2987829f1c027bc4a59e95c2b5b66b869','[\"*\"]',NULL,NULL,'2024-12-06 11:02:12','2024-12-06 11:02:12'),
(18,'App\\Models\\Administrador',7,'token-name','77ef46d951ac9d5f5ced63cc0f85178c7087cdf5780121401269fe761da434f1','[\"*\"]',NULL,NULL,'2024-12-06 11:12:31','2024-12-06 11:12:31'),
(22,'App\\Models\\Administrador',7,'token-name','026275a851433181b4916ef7477859680f52ab17902bc98e14086a00aa71ce6b','[\"*\"]',NULL,NULL,'2024-12-06 11:58:17','2024-12-06 11:58:17'),
(26,'App\\Models\\Administrador',7,'token-name','884c2297845a74872fc0eeff35ca93744b9c8d827a340ab3b91632c38e352c47','[\"*\"]','2024-12-06 12:46:17',NULL,'2024-12-06 12:45:00','2024-12-06 12:46:17');

/*Table structure for table `procesadores` */

DROP TABLE IF EXISTS `procesadores`;

CREATE TABLE `procesadores` (
  `id_cpu` int NOT NULL AUTO_INCREMENT,
  `nombre_cpu` varchar(255) COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`id_cpu`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

/*Data for the table `procesadores` */

insert  into `procesadores`(`id_cpu`,`nombre_cpu`) values 
(1,'Core i3 9100'),
(2,'Ryzen 3 3500'),
(3,'Core i5 11500'),
(4,'Ryzen 7 5700U');

/*Table structure for table `ram` */

DROP TABLE IF EXISTS `ram`;

CREATE TABLE `ram` (
  `id_ram` int NOT NULL AUTO_INCREMENT,
  `nombre_ram` varchar(255) COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`id_ram`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

/*Data for the table `ram` */

insert  into `ram`(`id_ram`,`nombre_ram`) values 
(1,'8 Gb'),
(2,'4 Gb'),
(3,'12 Gb'),
(4,'2 Gb'),
(5,'1 GB');

/*Table structure for table `sessions` */

DROP TABLE IF EXISTS `sessions`;

CREATE TABLE `sessions` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint unsigned DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sessions_user_id_index` (`user_id`),
  KEY `sessions_last_activity_index` (`last_activity`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `sessions` */

/*Table structure for table `so` */

DROP TABLE IF EXISTS `so`;

CREATE TABLE `so` (
  `id_so` int NOT NULL AUTO_INCREMENT,
  `nombre_so` varchar(255) COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`id_so`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

/*Data for the table `so` */

insert  into `so`(`id_so`,`nombre_so`) values 
(1,'Windows 10 Home'),
(2,'Windows 8'),
(3,'Windows 10 Pro'),
(4,'Windows 11'),
(5,'Kali Linux');

/*Table structure for table `tipodiscoduro` */

DROP TABLE IF EXISTS `tipodiscoduro`;

CREATE TABLE `tipodiscoduro` (
  `id_tipodd` int NOT NULL AUTO_INCREMENT,
  `nombre_tipodd` varchar(255) COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`id_tipodd`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

/*Data for the table `tipodiscoduro` */

insert  into `tipodiscoduro`(`id_tipodd`,`nombre_tipodd`) values 
(1,'HDD'),
(2,'SSD'),
(3,'Externo'),
(5,'Nvme');

/*Table structure for table `users` */

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `users` */

insert  into `users`(`id`,`name`,`email`,`email_verified_at`,`password`,`remember_token`,`created_at`,`updated_at`) values 
(1,'TuNombre','email@example.com',NULL,'$2y$12$aTcqH.KCZ6pBYhoGbwMaDOnHG7VaYI/zr8Z6ilixOCNhYvYFBTeIG',NULL,'2024-12-06 08:06:01','2024-12-06 08:06:01');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
