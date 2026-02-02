-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 26, 2026 at 02:43 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_salsa_rawat_inap`
--

-- --------------------------------------------------------

--
-- Table structure for table `kamar_salsa`
--

CREATE TABLE `kamar_salsa` (
  `id_kamar` varchar(5) NOT NULL,
  `no_kamar` int(3) NOT NULL,
  `kelas` varchar(20) NOT NULL,
  `status_kamar` tinyint(1) NOT NULL,
  `harga` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `kamar_salsa`
--

INSERT INTO `kamar_salsa` (`id_kamar`, `no_kamar`, `kelas`, `status_kamar`, `harga`) VALUES
('K-001', 1, 'Standar', 0, 200000),
('K-002', 2, 'Reguler', 0, 400000),
('K-003', 3, 'VIP', 0, 600000);

-- --------------------------------------------------------

--
-- Table structure for table `pasien_salsa`
--

CREATE TABLE `pasien_salsa` (
  `id_pasien` varchar(5) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `alamat` varchar(100) NOT NULL,
  `kontak` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `pasien_salsa`
--

INSERT INTO `pasien_salsa` (`id_pasien`, `nama`, `alamat`, `kontak`) VALUES
('P-001', 'Salsa', 'Jl.Cimahi', '083322227777'),
('P-002', 'Anggi', 'Jl.Cipageran', '082244442222'),
('P-003', 'Anjani', 'Jl.Cipageran', '085855553333'),
('P-004', 'Syahnaz', 'Jl.Cisarua', '089077771111'),
('P-005', 'Zivana ', 'Jl.Ciawitali', '085188886666'),
('P-006', 'Alex', 'Jl. Kopo', '090849328848'),
('P-007', 'Andree', 'Jaksel', '08976326436'),
('P-008', 'Tristan', 'Citereup', '0897288376763');

-- --------------------------------------------------------

--
-- Table structure for table `rawat_inap_salsa`
--

CREATE TABLE `rawat_inap_salsa` (
  `id_rawat` int(11) NOT NULL,
  `id_pasien` varchar(5) NOT NULL,
  `id_kamar` varchar(5) NOT NULL,
  `tgl_masuk` date NOT NULL,
  `tgl_keluar` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `rawat_inap_salsa`
--

INSERT INTO `rawat_inap_salsa` (`id_rawat`, `id_pasien`, `id_kamar`, `tgl_masuk`, `tgl_keluar`) VALUES
(1, 'P-002', 'K-002', '2026-01-26', '2026-01-28'),
(2, 'P-001', 'K-001', '2026-01-26', '2026-01-27'),
(3, 'P-006', 'K-001', '2026-01-26', '2026-01-30'),
(4, 'P-005', 'K-003', '2026-01-26', '2026-01-29'),
(5, 'P-007', 'K-001', '2026-01-26', '2026-01-31'),
(6, 'P-008', 'K-001', '2026-01-26', '2026-01-27'),
(7, 'P-001', 'K-002', '2026-01-14', '2026-01-15');

-- --------------------------------------------------------

--
-- Table structure for table `transaksi_salsa`
--

CREATE TABLE `transaksi_salsa` (
  `id_transaksi` int(11) NOT NULL,
  `id_pasien` varchar(5) NOT NULL,
  `total_biaya` int(11) NOT NULL,
  `status_pembayaran` tinyint(1) NOT NULL,
  `tgl` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `transaksi_salsa`
--

INSERT INTO `transaksi_salsa` (`id_transaksi`, `id_pasien`, `total_biaya`, `status_pembayaran`, `tgl`) VALUES
(11, 'P-002', 800000, 1, '2026-01-26');

-- --------------------------------------------------------

--
-- Table structure for table `user_salsa`
--

CREATE TABLE `user_salsa` (
  `id_user` varchar(5) NOT NULL,
  `username` varchar(20) NOT NULL,
  `password` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user_salsa`
--

INSERT INTO `user_salsa` (`id_user`, `username`, `password`) VALUES
('U-001', 'Anggi', 'Anggi123'),
('U-002', 'Annisa', 'Annisa123'),
('U-003', 'Aditya', 'Aditya123'),
('U-004', 'Zivana', 'Zivana123'),
('U-005', 'Syahnaz', 'Syahnaz123');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `kamar_salsa`
--
ALTER TABLE `kamar_salsa`
  ADD PRIMARY KEY (`id_kamar`);

--
-- Indexes for table `pasien_salsa`
--
ALTER TABLE `pasien_salsa`
  ADD PRIMARY KEY (`id_pasien`);

--
-- Indexes for table `rawat_inap_salsa`
--
ALTER TABLE `rawat_inap_salsa`
  ADD PRIMARY KEY (`id_rawat`),
  ADD KEY `id_pasien` (`id_pasien`),
  ADD KEY `id_kamar` (`id_kamar`);

--
-- Indexes for table `transaksi_salsa`
--
ALTER TABLE `transaksi_salsa`
  ADD PRIMARY KEY (`id_transaksi`),
  ADD KEY `id_pasien` (`id_pasien`);

--
-- Indexes for table `user_salsa`
--
ALTER TABLE `user_salsa`
  ADD PRIMARY KEY (`id_user`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `rawat_inap_salsa`
--
ALTER TABLE `rawat_inap_salsa`
  MODIFY `id_rawat` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `transaksi_salsa`
--
ALTER TABLE `transaksi_salsa`
  MODIFY `id_transaksi` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `rawat_inap_salsa`
--
ALTER TABLE `rawat_inap_salsa`
  ADD CONSTRAINT `rawat_inap_salsa_ibfk_1` FOREIGN KEY (`id_kamar`) REFERENCES `kamar_salsa` (`id_kamar`),
  ADD CONSTRAINT `rawat_inap_salsa_ibfk_2` FOREIGN KEY (`id_pasien`) REFERENCES `pasien_salsa` (`id_pasien`);

--
-- Constraints for table `transaksi_salsa`
--
ALTER TABLE `transaksi_salsa`
  ADD CONSTRAINT `transaksi_salsa_ibfk_1` FOREIGN KEY (`id_pasien`) REFERENCES `pasien_salsa` (`id_pasien`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
