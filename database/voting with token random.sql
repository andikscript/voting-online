-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 11, 2021 at 05:54 PM
-- Server version: 10.4.19-MariaDB
-- PHP Version: 8.0.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `voting`
--

-- --------------------------------------------------------

--
-- Table structure for table `kandidat`
--

CREATE TABLE `kandidat` (
  `idKandidat` varchar(1) NOT NULL,
  `kandidat` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `kandidat`
--

INSERT INTO `kandidat` (`idKandidat`, `kandidat`) VALUES
('a', 'Dr. dr. Muhammad Eko Irawanto, Sp.KK(K), FINSDV, FAADV'),
('b', 'DR. Dr. Istar Yuliadi, M.Si'),
('c', 'DR. Dr. Senyum Indrakila, Sp.M'),
('d', 'Dr. Wahyu Indianto, MH');

-- --------------------------------------------------------

--
-- Table structure for table `pemilih`
--

CREATE TABLE `pemilih` (
  `idPemilih` int(11) NOT NULL,
  `idToken` varchar(4) NOT NULL,
  `idKandidat` varchar(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `token`
--

CREATE TABLE `token` (
  `idToken` varchar(4) NOT NULL,
  `token` varchar(255) NOT NULL,
  `used` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `token`
--

INSERT INTO `token` (`idToken`, `token`, `used`) VALUES
('T01', 'flMuWJ', 1),
('T02', 'AO6pih', 1),
('T03', 'gP9MjP', 1),
('T04', 'Wq30ZY', 1),
('T05', 'ckOcP4', 1),
('T06', 'hBUc80', 1),
('T07', 'BlqFqC', 1),
('T08', 'ksOcMM', 1),
('T09', 'cSMXZb', 1),
('T10', 'zoLyRv', 1),
('T11', '5i8CIg', 1),
('T12', 'NDQIL8', 1),
('T13', 'jR91Qr', 1),
('T14', 'JAYCA7', 1),
('T15', 'rKm2nU', 1),
('T16', 'pNU4JI', 1),
('T17', 'DijrPI', 1),
('T18', '5THOxH', 1),
('T19', 'c8YdoR', 1),
('T20', 'X3hBU8', 1),
('T21', '4Ua6c8', 1),
('T22', 'npH0ys', 1),
('T23', 'HbuQGq', 1),
('T24', 'zcWeap', 1),
('T25', '6MiDgQ', 1),
('T26', 'kCNlx5', 1),
('T27', 'r90IkI', 1),
('T28', 'AlJpVM', 1),
('T29', 'gHx0L1', 1),
('T30', 'lZ3v9Q', 1),
('T31', 'ZkI1Qv', 1),
('T32', 'egoziG', 1),
('T33', 'zr2Odz', 1),
('T34', 'fQ0VgZ', 1),
('T35', 'dT0W9Y', 1),
('T36', 'B5AksA', 1),
('T37', '9JVXLz', 1),
('T38', 'iriqBe', 1),
('T39', '9X5EQs', 1),
('T40', 'aEETXg', 1),
('T41', '5HgPym', 1),
('T42', 'GP81OU', 1),
('T43', 'eHEBwz', 1),
('T44', '0wsWWm', 1),
('T45', 'c6pRKo', 1),
('T46', '5QvycD', 1),
('T47', 'SS25jv', 1),
('T48', 'gHJlkJ', 1),
('T49', 'oZRO2k', 1),
('T50', 'xiv4x1', 1),
('T51', '7zFT67', 1),
('T52', 'jpoAse', 1),
('T53', '64M70O', 1),
('T54', 'c1Wgnu', 1),
('T55', 'XqYKB4', 1),
('T56', 'SYfA8u', 1),
('T57', 'pMLLC4', 1),
('T58', 'fnrxS7', 1),
('T59', 'Y0sgb6', 1),
('T60', 'fbMU6P', 1),
('T61', 'jYnTsT', 1),
('T62', '966cRn', 1),
('T63', 'DRzcB9', 1),
('T64', 'DkYawL', 1),
('T65', 'Mv7jfh', 1),
('T66', 'iVQ5mn', 1),
('T67', 'Qv4XyV', 1),
('T68', 'B6iEcK', 1),
('T69', 'GDaMQW', 1),
('T70', '0Imch6', 1),
('T71', 'WaaY35', 1),
('T72', 'XHoLLP', 1),
('T73', 'FqwCY0', 1),
('T74', 'mITxcb', 1),
('T75', 'GWE4Ed', 1),
('T76', 'ByN7AX', 1),
('T77', '4nCmrU', 1),
('T78', 'f51KHk', 1),
('T79', 'jyuvzZ', 1),
('T80', 'nj78Rh', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `kandidat`
--
ALTER TABLE `kandidat`
  ADD PRIMARY KEY (`idKandidat`),
  ADD KEY `idKandidat` (`idKandidat`);

--
-- Indexes for table `pemilih`
--
ALTER TABLE `pemilih`
  ADD PRIMARY KEY (`idPemilih`),
  ADD KEY `idPemilih` (`idPemilih`),
  ADD KEY `idToken` (`idToken`,`idKandidat`),
  ADD KEY `idKandidat` (`idKandidat`);

--
-- Indexes for table `token`
--
ALTER TABLE `token`
  ADD PRIMARY KEY (`idToken`),
  ADD KEY `idToken` (`idToken`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `pemilih`
--
ALTER TABLE `pemilih`
  MODIFY `idPemilih` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `pemilih`
--
ALTER TABLE `pemilih`
  ADD CONSTRAINT `pemilih_ibfk_1` FOREIGN KEY (`idToken`) REFERENCES `token` (`idToken`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `pemilih_ibfk_2` FOREIGN KEY (`idKandidat`) REFERENCES `kandidat` (`idKandidat`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
