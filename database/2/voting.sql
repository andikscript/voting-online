-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 10 Nov 2021 pada 09.04
-- Versi server: 10.4.19-MariaDB
-- Versi PHP: 8.0.6

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
-- Struktur dari tabel `kandidat`
--

CREATE TABLE `kandidat` (
  `idKandidat` varchar(1) NOT NULL,
  `kandidat` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `kandidat`
--

INSERT INTO `kandidat` (`idKandidat`, `kandidat`) VALUES
('a', 'saiful'),
('b', 'rohmat'),
('c', 'Sumarni'),
('d', 'Sumarno');

-- --------------------------------------------------------

--
-- Struktur dari tabel `pemilih`
--

CREATE TABLE `pemilih` (
  `idPemilih` int(11) NOT NULL,
  `idToken` varchar(4) NOT NULL,
  `idKandidat` varchar(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `pemilih`
--

INSERT INTO `pemilih` (`idPemilih`, `idToken`, `idKandidat`) VALUES
(1, 'T01', 'a'),
(12, 'T01', 'a'),
(13, 'T01', 'a'),
(5, 'T01', 'b'),
(11, 'T01', 'd'),
(2, 'T02', 'a'),
(8, 'T02', 'b'),
(7, 'T02', 'c'),
(10, 'T02', 'c'),
(6, 'T02', 'd');

-- --------------------------------------------------------

--
-- Struktur dari tabel `token`
--

CREATE TABLE `token` (
  `idToken` varchar(4) NOT NULL,
  `token` varchar(255) NOT NULL,
  `used` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `token`
--

INSERT INTO `token` (`idToken`, `token`, `used`) VALUES
('T01', 'abcd', 0),
('T02', 'bcde', 0);

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `kandidat`
--
ALTER TABLE `kandidat`
  ADD PRIMARY KEY (`idKandidat`),
  ADD KEY `idKandidat` (`idKandidat`);

--
-- Indeks untuk tabel `pemilih`
--
ALTER TABLE `pemilih`
  ADD PRIMARY KEY (`idPemilih`),
  ADD KEY `idPemilih` (`idPemilih`),
  ADD KEY `idToken` (`idToken`,`idKandidat`),
  ADD KEY `idKandidat` (`idKandidat`);

--
-- Indeks untuk tabel `token`
--
ALTER TABLE `token`
  ADD PRIMARY KEY (`idToken`),
  ADD KEY `idToken` (`idToken`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `pemilih`
--
ALTER TABLE `pemilih`
  MODIFY `idPemilih` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `pemilih`
--
ALTER TABLE `pemilih`
  ADD CONSTRAINT `pemilih_ibfk_1` FOREIGN KEY (`idToken`) REFERENCES `token` (`idToken`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `pemilih_ibfk_2` FOREIGN KEY (`idKandidat`) REFERENCES `kandidat` (`idKandidat`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
