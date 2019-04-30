-- --------------------------------------------------------
-- Anfitrião:                    127.0.0.1
-- Versão do servidor:           5.7.10-log - MySQL Community Server (GPL)
-- Server OS:                    Win64
-- HeidiSQL Versão:              9.5.0.5277
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Dumping database structure for school_reports
CREATE DATABASE IF NOT EXISTS `school_reports` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `school_reports`;

-- Dumping structure for table school_reports.groups
CREATE TABLE IF NOT EXISTS `groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(30) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- Dumping data for table school_reports.groups: ~4 rows (approximately)
/*!40000 ALTER TABLE `groups` DISABLE KEYS */;
INSERT INTO `groups` (`id`, `nome`) VALUES
	(1, 'Tigres'),
	(2, 'Crocodilos'),
	(3, 'Patos'),
	(4, 'Borboletas');
/*!40000 ALTER TABLE `groups` ENABLE KEYS */;

-- Dumping structure for table school_reports.idkid_filename
CREATE TABLE IF NOT EXISTS `idkid_filename` (
  `idkid` int(11) NOT NULL,
  `fileName` varchar(1000) NOT NULL,
  KEY `FK_idKid_photoPath_kids` (`idkid`),
  CONSTRAINT `idkid_filename_ibfk_1` FOREIGN KEY (`idkid`) REFERENCES `kids` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- Dumping data for table school_reports.idkid_filename: ~7 rows (approximately)
/*!40000 ALTER TABLE `idkid_filename` DISABLE KEYS */;
INSERT INTO `idkid_filename` (`idkid`, `fileName`) VALUES
	(33, '1.jpg'),
	(34, '3.jpg'),
	(35, '2.jpg'),
	(36, '5.jpg'),
	(37, '6.jpg'),
	(38, '4.jpg'),
	(39, '7.jpg');
/*!40000 ALTER TABLE `idkid_filename` ENABLE KEYS */;

-- Dumping structure for table school_reports.kids
CREATE TABLE IF NOT EXISTS `kids` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(50) NOT NULL,
  `morada` varchar(50) NOT NULL,
  `telefone` varchar(9) NOT NULL,
  `email` varchar(50) NOT NULL,
  `idade` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8;

-- Dumping data for table school_reports.kids: ~7 rows (approximately)
/*!40000 ALTER TABLE `kids` DISABLE KEYS */;
INSERT INTO `kids` (`id`, `nome`, `morada`, `telefone`, `email`, `idade`) VALUES
	(33, 'Ana Coelho', 'Sintra, rua cidade Rio de Janeiro 24', '934512658', 'ana@gmail.com', 2),
	(34, 'Sonia Couto', 'Sintra rua cidade de Lagos 78', '934587985', 'sonia@gmail.com', 3),
	(35, 'Miguel Costa', 'Sintra rua Jose Afonso 36', '935687459', 'miguel@gmail.com', 4),
	(36, 'Jose Cunha', 'Sintra rua Maria Lalande 56', '935469874', 'jose@gmail.com', 5),
	(37, 'Ines Fontes', 'Sintra rua Maria Olguim 14', '934512698', 'ines@gmail.com', 3),
	(38, 'Alexandre Dias', 'Sintra rua Alma Flora 1', '934512698', 'alexandre@gmail.com', 2),
	(39, 'Luisa Farinha', 'Sintra rua do Moinho 5', '934526987', 'luisa@gmail.com', 5);
/*!40000 ALTER TABLE `kids` ENABLE KEYS */;

-- Dumping structure for table school_reports.kid_group
CREATE TABLE IF NOT EXISTS `kid_group` (
  `idKid` int(11) NOT NULL,
  `idGroup` int(11) NOT NULL,
  KEY `FK_kid_group_kids` (`idKid`),
  KEY `FK_kid_group_groups` (`idGroup`),
  CONSTRAINT `FK_kid_group_groups` FOREIGN KEY (`idGroup`) REFERENCES `groups` (`id`),
  CONSTRAINT `FK_kid_group_kids` FOREIGN KEY (`idKid`) REFERENCES `kids` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table school_reports.kid_group: ~7 rows (approximately)
/*!40000 ALTER TABLE `kid_group` DISABLE KEYS */;
INSERT INTO `kid_group` (`idKid`, `idGroup`) VALUES
	(33, 1),
	(34, 2),
	(35, 3),
	(36, 4),
	(37, 2),
	(38, 1),
	(39, 4);
/*!40000 ALTER TABLE `kid_group` ENABLE KEYS */;

-- Dumping structure for table school_reports.report
CREATE TABLE IF NOT EXISTS `report` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idKid` int(11) NOT NULL,
  `data` date NOT NULL,
  `meal` text COLLATE utf8_bin NOT NULL,
  `nap` text COLLATE utf8_bin NOT NULL,
  `activity` text COLLATE utf8_bin NOT NULL,
  `notes` text COLLATE utf8_bin,
  PRIMARY KEY (`id`),
  KEY `FK_Report_kids` (`idKid`),
  CONSTRAINT `FK_Report_kids` FOREIGN KEY (`idKid`) REFERENCES `kids` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- Dumping data for table school_reports.report: ~8 rows (approximately)
/*!40000 ALTER TABLE `report` DISABLE KEYS */;
INSERT INTO `report` (`id`, `idKid`, `data`, `meal`, `nap`, `activity`, `notes`) VALUES
	(25, 33, '2019-04-28', 'Almoço: todo \r\nLanche: só leite', '12.45-13.50', 'Jogamos com a bola,\r\nCantamos canção de borboletas,\r\nRepetimos os números', 'Ficou contente \r\napanhar a bola,\r\nFalou e sorriu muito.\r\n'),
	(26, 33, '2019-04-29', 'Almoço: comeu sopa e o segundo prato\r\nLanche: leite com chocolate', '13.00-13.50', 'Jogamos com os cubos,\r\nCantamos canções do Natal', 'Chorou o dia todo,\r\ntive expectoração'),
	(27, 33, '2019-04-30', 'Almoço: comeu só o segundo prato\r\nLanche: iogurte', '13.00-13.50', 'Jogamos com escorrega,\r\nFalamos sobre os animais', 'Afirmou que ia ser \r\no presidente da Republica'),
	(28, 34, '2019-04-30', 'Almoço: comeu só o segundo prato\r\nLanche: iogurte', '13.00-13.50', 'Jogamos com escorrega,\r\nFalamos sobre os animais', 'Chorou o dia todo,\r\ntive expectoração'),
	(29, 35, '2019-04-30', 'Almoço: comeu só o segundo prato\r\nLanche: iogurte', '13.00-13.50', 'Jogamos com escorrega,\r\nFalamos sobre os animais', 'Não queria dormir hoje'),
	(30, 36, '2019-04-30', 'Almoço: comeu só o segundo prato\r\nLanche: iogurte', '13.00-13.50', 'Jogamos com escorrega,\r\nFalamos sobre os animais', 'Deixou cair o copo no pé'),
	(31, 37, '2019-04-30', 'Almoço: comeu só o segundo prato\r\nLanche: iogurte\r\n', '13.00-13.50', 'Jogamos com escorrega,\r\nFalamos sobre os animais', 'Descobriu que gosta muito brincar com os livros'),
	(32, 38, '2019-04-30', 'Almoço: todo \r\nLanche: só leite', '12.45-13.50', 'Jogamos com os cubos,\r\nCantamos canções do Natal', 'Conseguiu sentar sozinho');
/*!40000 ALTER TABLE `report` ENABLE KEYS */;

-- Dumping structure for table school_reports.teachers
CREATE TABLE IF NOT EXISTS `teachers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(50) NOT NULL,
  `morada` varchar(50) NOT NULL,
  `telefone` varchar(9) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- Dumping data for table school_reports.teachers: ~4 rows (approximately)
/*!40000 ALTER TABLE `teachers` DISABLE KEYS */;
INSERT INTO `teachers` (`id`, `nome`, `morada`, `telefone`) VALUES
	(5, 'Isabel Silva', 'Sintra Travessa do Vale 34', '934512369'),
	(6, 'Sara Antunes', 'Sintra rua Jose Afonso 78', '934526987'),
	(7, 'Marsia Chaves', 'Sintra rua Maria Lalande 45', '934587985'),
	(8, 'Mariana Barbosa', 'Sintra rua cidade de Lagos 7', '937845269');
/*!40000 ALTER TABLE `teachers` ENABLE KEYS */;

-- Dumping structure for table school_reports.teacher_group
CREATE TABLE IF NOT EXISTS `teacher_group` (
  `idTeacher` int(11) NOT NULL,
  `idGroup` int(11) NOT NULL,
  KEY `FK_teacher_group_teachers` (`idTeacher`),
  KEY `FK_teacher_group_groups` (`idGroup`),
  CONSTRAINT `FK_teacher_group_groups` FOREIGN KEY (`idGroup`) REFERENCES `groups` (`id`),
  CONSTRAINT `FK_teacher_group_teachers` FOREIGN KEY (`idTeacher`) REFERENCES `teachers` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table school_reports.teacher_group: ~4 rows (approximately)
/*!40000 ALTER TABLE `teacher_group` DISABLE KEYS */;
INSERT INTO `teacher_group` (`idTeacher`, `idGroup`) VALUES
	(5, 1),
	(6, 2),
	(7, 3),
	(8, 4);
/*!40000 ALTER TABLE `teacher_group` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
