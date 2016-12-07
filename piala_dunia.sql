-- phpMyAdmin SQL Dump
-- version 4.5.2
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Dec 04, 2016 at 10:17 AM
-- Server version: 10.1.13-MariaDB
-- PHP Version: 5.6.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `piala_dunia`
--

-- --------------------------------------------------------

--
-- Table structure for table `negara`
--

CREATE TABLE `negara` (
  `id_negara` int(12) NOT NULL,
  `nama_negara` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `negara`
--

INSERT INTO `negara` (`id_negara`, `nama_negara`) VALUES
(1, 'Spanyol'),
(2, 'Italia'),
(3, 'Jerman'),
(4, 'Inggris'),
(5, 'Belanda'),
(6, 'Perancis'),
(7, 'Portugal'),
(8, 'Brasil'),
(9, 'Argentina'),
(10, 'Swedia');

-- --------------------------------------------------------

--
-- Table structure for table `pemain`
--

CREATE TABLE `pemain` (
  `id_pemain` int(12) NOT NULL,
  `nama_pemain` varchar(50) NOT NULL,
  `tgl_lahir` date DEFAULT NULL,
  `tinggi_badan` int(12) DEFAULT NULL,
  `id_status` int(12) DEFAULT NULL,
  `id_negara` int(12) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pemain`
--

INSERT INTO `pemain` (`id_pemain`, `nama_pemain`, `tgl_lahir`, `tinggi_badan`, `id_status`, `id_negara`) VALUES
(1, 'Julio Caesar', '1880-12-01', 178, 1, 8),
(2, 'David Luiz', '1990-05-23', 178, 2, 8),
(3, 'Hernanes', '1992-11-25', 175, 2, 8),
(4, 'Paulinho', '1987-03-04', 171, 3, 8),
(5, 'Fernandinho', '1989-03-23', 169, 3, 8),
(6, 'Neymar', '1992-09-11', 177, 3, 8),
(7, 'Rafinha', '1991-12-18', 168, 4, 8),
(8, 'Filipe Luis', '1992-01-25', 170, 4, 8),
(9, 'Bernard', '1993-04-04', 172, 3, 8),
(10, 'Ramires', '1990-01-01', 174, 2, 8),
(11, 'Iker Casillas', '1980-02-22', 190, 1, 1),
(12, 'Sergio Ramos', '1987-03-06', 189, 2, 1),
(13, 'Raul Albiol', '1984-11-13', 187, 2, 1),
(14, 'Gerard Pique', '1985-12-12', 185, 2, 1),
(15, 'Xavi', '1990-04-04', 187, 3, 1),
(16, 'Xabi Alonso', '1989-05-11', 188, 3, 1),
(17, 'David Silva', '1986-07-30', 190, 4, 1),
(18, 'David Villa', '1987-06-30', 184, 4, 1),
(19, 'Diego Costa', '1980-07-07', 178, 5, 1),
(20, 'Fernando Torres', '1988-01-31', 191, 4, 1),
(21, 'Gianluigi Buffon', '1976-05-05', 193, 1, 2),
(22, 'Andrea Barzagli', '1980-08-08', 188, 2, 2),
(23, 'Andrea Pirlo', '1979-12-05', 188, 3, 2),
(24, 'Mario Balotelli', '1985-11-11', 190, 4, 2),
(25, 'Thiago Motta', '1988-04-23', 177, 3, 2),
(26, 'Giorgio Chiellini', '1986-02-17', 188, 2, 2),
(27, 'Antonio Cassano', '1989-10-18', 186, 4, 2),
(28, 'Daniele De Rossi', '1986-09-27', 179, 3, 2),
(29, 'Lorenzo Insigne', '1978-12-12', 189, 5, 2),
(30, 'Leonardo Bonucci', '1988-07-30', 180, 5, 2);

-- --------------------------------------------------------

--
-- Table structure for table `pertandingan`
--

CREATE TABLE `pertandingan` (
  `id_pertandingan` int(12) NOT NULL,
  `id_stadion` int(12) DEFAULT NULL,
  `negara1` int(12) DEFAULT NULL,
  `negara2` int(12) DEFAULT NULL,
  `wasit` int(12) NOT NULL,
  `jadwal` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pertandingan`
--

INSERT INTO `pertandingan` (`id_pertandingan`, `id_stadion`, `negara1`, `negara2`, `wasit`, `jadwal`) VALUES
(1, 1, 1, 2, 1, '2016-12-03'),
(2, 2, 3, 4, 2, '2017-02-12'),
(3, 3, 5, 6, 3, '2017-04-01'),
(4, 4, 7, 8, 4, '2017-04-25'),
(5, 5, 9, 10, 5, '2017-05-05'),
(6, 6, 1, 3, 6, '2017-05-10'),
(7, 7, 2, 4, 7, '2017-05-28'),
(8, 8, 3, 5, 8, '2017-06-15'),
(9, 9, 4, 6, 9, '2017-06-20'),
(10, 10, 5, 7, 10, '2017-07-04');

-- --------------------------------------------------------

--
-- Table structure for table `stadion`
--

CREATE TABLE `stadion` (
  `id_stadion` int(12) NOT NULL,
  `nama_stadion` varchar(50) NOT NULL,
  `negara_stadion` int(12) DEFAULT NULL,
  `kapasitas` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `stadion`
--

INSERT INTO `stadion` (`id_stadion`, `nama_stadion`, `negara_stadion`, `kapasitas`) VALUES
(1, 'Estadio do Maracana', 8, 76935),
(2, 'Estadio Nacional Mane Garrincha', 8, 70042),
(3, 'Camp Nou', 1, 105000),
(4, 'Wembley Stadium', 4, 98276),
(5, 'Estadio Municipal De Aveiro', 7, 23004),
(6, 'Estadio Monumental Antonio Vespucio', 9, 102303),
(7, 'Saint Denis', 6, 78303),
(8, 'Lyon', 6, 56093),
(9, 'Amsterdam Arena', 5, 94372),
(10, 'De Kuip', 5, 35302);

-- --------------------------------------------------------

--
-- Table structure for table `status`
--

CREATE TABLE `status` (
  `id_status` int(12) NOT NULL,
  `nama_status` varchar(25) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `status`
--

INSERT INTO `status` (`id_status`, `nama_status`) VALUES
(1, 'Kiper'),
(2, 'Bek'),
(3, 'Gelandang'),
(4, 'Striker'),
(5, 'Cadangan');

-- --------------------------------------------------------

--
-- Table structure for table `wasit`
--

CREATE TABLE `wasit` (
  `id_wasit` int(12) NOT NULL,
  `nama_wasit` varchar(50) NOT NULL,
  `asal_negara` int(12) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `wasit`
--

INSERT INTO `wasit` (`id_wasit`, `nama_wasit`, `asal_negara`) VALUES
(1, 'Benito Archundia', 8),
(2, 'Carlos Simon', 8),
(3, 'Wolfgang Stark', 3),
(4, 'Roberto Rosetti', 2),
(5, 'Stephane Lannoy', 6),
(6, 'Martin Hansson', 10),
(7, 'Hector Beldassi', 9),
(8, 'Carlos Batres', 4),
(9, 'Frank De Bleeckere', 5),
(10, 'Olegario Benquerenca', 7);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `negara`
--
ALTER TABLE `negara`
  ADD PRIMARY KEY (`id_negara`);

--
-- Indexes for table `pemain`
--
ALTER TABLE `pemain`
  ADD PRIMARY KEY (`id_pemain`),
  ADD KEY `fk_negara` (`id_negara`),
  ADD KEY `fk_status` (`id_status`);

--
-- Indexes for table `pertandingan`
--
ALTER TABLE `pertandingan`
  ADD PRIMARY KEY (`id_pertandingan`),
  ADD KEY `fk_stadion` (`id_stadion`),
  ADD KEY `fk_negara1` (`negara1`),
  ADD KEY `fk_negara2` (`negara2`),
  ADD KEY `fk_wasit` (`wasit`);

--
-- Indexes for table `stadion`
--
ALTER TABLE `stadion`
  ADD PRIMARY KEY (`id_stadion`),
  ADD KEY `fk_negara_stadion` (`negara_stadion`);

--
-- Indexes for table `status`
--
ALTER TABLE `status`
  ADD PRIMARY KEY (`id_status`),
  ADD KEY `id_status` (`id_status`);

--
-- Indexes for table `wasit`
--
ALTER TABLE `wasit`
  ADD PRIMARY KEY (`id_wasit`),
  ADD KEY `fk_asal_negara` (`asal_negara`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `negara`
--
ALTER TABLE `negara`
  MODIFY `id_negara` int(12) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `pemain`
--
ALTER TABLE `pemain`
  MODIFY `id_pemain` int(12) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;
--
-- AUTO_INCREMENT for table `pertandingan`
--
ALTER TABLE `pertandingan`
  MODIFY `id_pertandingan` int(12) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `pemain`
--
ALTER TABLE `pemain`
  ADD CONSTRAINT `fk_negara` FOREIGN KEY (`id_negara`) REFERENCES `negara` (`id_negara`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_status` FOREIGN KEY (`id_status`) REFERENCES `status` (`id_status`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `pertandingan`
--
ALTER TABLE `pertandingan`
  ADD CONSTRAINT `fk_negara1` FOREIGN KEY (`negara1`) REFERENCES `negara` (`id_negara`),
  ADD CONSTRAINT `fk_negara2` FOREIGN KEY (`negara2`) REFERENCES `negara` (`id_negara`),
  ADD CONSTRAINT `fk_stadion` FOREIGN KEY (`id_stadion`) REFERENCES `stadion` (`id_stadion`),
  ADD CONSTRAINT `fk_wasit` FOREIGN KEY (`wasit`) REFERENCES `wasit` (`id_wasit`);

--
-- Constraints for table `stadion`
--
ALTER TABLE `stadion`
  ADD CONSTRAINT `fk_negara_stadion` FOREIGN KEY (`negara_stadion`) REFERENCES `negara` (`id_negara`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `wasit`
--
ALTER TABLE `wasit`
  ADD CONSTRAINT `fk_asal_negara` FOREIGN KEY (`asal_negara`) REFERENCES `negara` (`id_negara`) ON DELETE NO ACTION ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
