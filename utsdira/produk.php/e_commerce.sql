-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 04, 2023 at 04:14 PM
-- Server version: 10.4.21-MariaDB
-- PHP Version: 8.0.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `e_commerce`
--

-- --------------------------------------------------------

--
-- Table structure for table `kategori_produk`
--

CREATE TABLE `kategori_produk` (
  `id` int(11) NOT NULL,
  `nama` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `kategori_produk`
--

INSERT INTO `kategori_produk` (`id`, `nama`) VALUES
(291274, 'Wardah'),
(528089, 'Purbasari');

-- --------------------------------------------------------

--
-- Table structure for table `pesanan`
--

CREATE TABLE `pesanan` (
  `id` int(11) NOT NULL,
  `tanggal` date NOT NULL,
  `nama_pemesan` varchar(45) NOT NULL,
  `alamat_pemesan` varchar(45) NOT NULL,
  `no_hp` varchar(20) NOT NULL,
  `email` varchar(45) NOT NULL,
  `jumlah_pesanan` int(11) NOT NULL,
  `deskripsi` text NOT NULL,
  `produk_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `pesanan`
--

INSERT INTO `pesanan` (`id`, `tanggal`, `nama_pemesan`, `alamat_pemesan`, `no_hp`, `email`, `jumlah_pesanan`, `deskripsi`, `produk_id`) VALUES
(781, '2023-05-02', 'yasmina', 'House', '089775522716', 'yasmin@gmail.com', 3, 'Kirim Express 1 hour', 752413);

-- --------------------------------------------------------

--
-- Table structure for table `produk`
--

CREATE TABLE `produk` (
  `id` int(11) NOT NULL,
  `kode` varchar(10) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `harga_jual` double NOT NULL,
  `harga_beli` double NOT NULL,
  `stok` int(11) NOT NULL,
  `min_stok` int(11) NOT NULL,
  `deskripsi` text NOT NULL,
  `kategori_produk_id` int(11) NOT NULL,
  `gambar` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `produk`
--

INSERT INTO `produk` (`id`, `kode`, `nama`, `harga_jual`, `harga_beli`, `stok`, `min_stok`, `deskripsi`, `kategori_produk_id`, `gambar`) VALUES
(321569, 'bfg', 'wardah1', 30000, 8000, 203, 10, 'Bahan lembut | kualitas terbaik | harga terjangkau', 528089, 'Spons Make up.png'),
(531569, 'abc', 'wardah2', 24000, 190000, 99, 10, 'Bahan alami | kualitas terbaik | harga terjangkau', 528089, 'eyeshadow.png'),
(532869, 'zxc', 'wardah3', 20000, 290000, 100, 10, 'Bahan alami | kualitas terbaik | harga terjangkau', 528089, 'conclear.png'),
(743534, 'def', 'Lipstik', 85000, 50000, 87, 5, 'Kualitas bagus | Warna limited edition ', 291274, 'lipstik.png'),
(749234, 'wer', 'Maskara', 75000, 50000, 80, 5, 'Kualitas bagus | Warna limited edition ', 291274, 'mascara.png'),
(752413, 'ghi', 'Eyebrow Brush', 38000, 20000, 80, 6, 'Kualitas terjamin | Tahan lama', 291274, 'eyebrow brush.png'),
(776234, 'qlk', 'Contouring Stick', 85000, 70000, 100, 5, 'Kualitas bagus | Warna limited edition ', 291274, 'contouringstick.png'),
(893964, 'bnm', 'Blushon', 35000, 28000, 100, 6, 'Warna yang menarik | Tahan lama', 291274, 'blushon.png'),
(893982, 'jkl', 'Eyeliner', 43000, 30000, 200, 39, 'Water proff | Kualitas No 1', 528089, 'eyeliner.png'),
(893983, 'yiu', 'Foundation', 62000, 50000, 88, 6, 'Tidak mudah luntur | Kualitas No 1', 528089, 'foundation.png');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `kategori_produk`
--
ALTER TABLE `kategori_produk`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pesanan`
--
ALTER TABLE `pesanan`
  ADD PRIMARY KEY (`id`),
  ADD KEY `produk_id` (`produk_id`);

--
-- Indexes for table `produk`
--
ALTER TABLE `produk`
  ADD PRIMARY KEY (`id`),
  ADD KEY `kategori_produk_id` (`kategori_produk_id`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `pesanan`
--
ALTER TABLE `pesanan`
  ADD CONSTRAINT `pesanan_ibfk_1` FOREIGN KEY (`produk_id`) REFERENCES `produk` (`id`);

--
-- Constraints for table `produk`
--
ALTER TABLE `produk`
  ADD CONSTRAINT `produk_ibfk_1` FOREIGN KEY (`kategori_produk_id`) REFERENCES `kategori_produk` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
