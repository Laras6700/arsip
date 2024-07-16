-- phpMyAdmin SQL Dump
-- version 4.8.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 16, 2024 at 01:07 PM
-- Server version: 10.1.31-MariaDB
-- PHP Version: 7.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `e_arsip`
--

-- --------------------------------------------------------

--
-- Table structure for table `disposisi`
--

CREATE TABLE `disposisi` (
  `id_disposisi` int(11) NOT NULL,
  `pengisi` varchar(50) NOT NULL,
  `tujuan` varchar(250) NOT NULL,
  `instruksi` varchar(300) NOT NULL,
  `catatan` varchar(200) NOT NULL,
  `id_suratmasuk` int(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `disposisi`
--

INSERT INTO `disposisi` (`id_disposisi`, `pengisi`, `tujuan`, `instruksi`, `catatan`, `id_suratmasuk`) VALUES
(9, 'Kepsek', 'Keuangan', '', 'Penting', 2),
(10, 'Kepsek', 'Uuu', '', 'sdfd', 2),
(11, 'Kepala Sekolah', 'Keuangan', '', '', 4),
(12, 'Kepala Sekolah', 'Keamanan', '', '', 2),
(16, 'Wakil Kurikulum', 'Keuangan', '', 'Mohon ditindak lanjuti', 26);

-- --------------------------------------------------------

--
-- Table structure for table `dokumentasi`
--

CREATE TABLE `dokumentasi` (
  `id_dokumentasi` int(11) NOT NULL,
  `nama_kegiatan` varchar(255) NOT NULL,
  `tanggal_kegiatan` varchar(255) NOT NULL,
  `deskripsi_kegiatan` varchar(255) NOT NULL,
  `gambar` varchar(255) NOT NULL,
  `pdf` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `dokumentasi`
--

INSERT INTO `dokumentasi` (`id_dokumentasi`, `nama_kegiatan`, `tanggal_kegiatan`, `deskripsi_kegiatan`, `gambar`, `pdf`) VALUES
(3, 'Sosialisasi BKR', '2024-06-19', 'sosialisasi terkait edukasi pernikahan dini', 'Screenshot_11.png', 'Invoice-1396106.pdf'),
(4, 'Sosialisasi BKR dan kantor desa', '2024-06-19', 'memberikan edukasi terkait pernikahan dini', 'Class_Diagram_drawio.png', 'Foto_Bukti_Acc_Ayunda.pdf');

-- --------------------------------------------------------

--
-- Table structure for table `indeks`
--

CREATE TABLE `indeks` (
  `id_indeks` int(3) NOT NULL,
  `kode_indeks` varchar(5) NOT NULL,
  `judul_indeks` varchar(50) NOT NULL,
  `detail` varchar(512) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `indeks`
--

INSERT INTO `indeks` (`id_indeks`, `kode_indeks`, `judul_indeks`, `detail`) VALUES
(10, 'Srna', 'Sarana dan Prasarana', 'Sarana dan Prasarana yang diberikan organisasi BKR kepada warga desa grobogan dan lingkungan sekitar'),
(11, 'Pnylh', 'Penyuluhan BKR', 'Penyuluhan terkait memberikan pengetahuan kepada orangtua yang memiliki anak remaja'),
(19, 'Sslss', 'Sosialisasi BKR', 'Terkait memberikan edukasi melewati sosialisasi yang diberikan organisasi Bina Keluarga Remaja di Desa Grobogan');

-- --------------------------------------------------------

--
-- Table structure for table `jadwal`
--

CREATE TABLE `jadwal` (
  `id_jadwal` int(11) NOT NULL,
  `tanggal` date NOT NULL,
  `kegiatan` varchar(255) NOT NULL,
  `tempat` varchar(255) NOT NULL,
  `sasaran` varchar(255) NOT NULL,
  `waktu` varchar(255) NOT NULL,
  `keterangan` text NOT NULL,
  `penanggung_jawab` varchar(255) NOT NULL,
  `no_hp` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `jadwal`
--

INSERT INTO `jadwal` (`id_jadwal`, `tanggal`, `kegiatan`, `tempat`, `sasaran`, `waktu`, `keterangan`, `penanggung_jawab`, `no_hp`) VALUES
(10, '2024-06-19', 'penyuluhan bersama posyandu ', 'Posyandu ds.grobogan', 'Posyandu ds.grobogan', '9:00', 'penyuluhan bersama kader posyandu terkait konsumsi zat besi untuk remaja pranikah', 'wanda kader BKR', '082332732669');

-- --------------------------------------------------------

--
-- Table structure for table `laporan`
--

CREATE TABLE `laporan` (
  `id_laporan` int(11) NOT NULL,
  `tanggal` varchar(255) NOT NULL,
  `kegiatan` varchar(255) NOT NULL,
  `tempat` varchar(255) NOT NULL,
  `penanggung_jawab` varchar(255) NOT NULL,
  `gambar` varchar(255) NOT NULL,
  `status` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `laporan`
--

INSERT INTO `laporan` (`id_laporan`, `tanggal`, `kegiatan`, `tempat`, `penanggung_jawab`, `gambar`, `status`) VALUES
(4, '2024-06-29', 'Rapat', 'grobogan', 'Pemerintah', 'metode_SUS2.png', 'Kegiatan Telah Dilaksanakan'),
(5, '2024-06-27', 'edukasi BKKBN', 'balai desa', 'Bu Endah', 'WhatsApp_Image_2024-01-26_at_20_53_31.jpeg', 'Kegiatan Telah Dilaksanakan');

-- --------------------------------------------------------

--
-- Table structure for table `program`
--

CREATE TABLE `program` (
  `id_program` int(11) NOT NULL,
  `tanggal` date NOT NULL,
  `program_kerja` varchar(255) NOT NULL,
  `tujuan` varchar(255) NOT NULL,
  `indikator` varchar(500) NOT NULL,
  `tempat` varchar(500) NOT NULL,
  `waktu` varchar(255) NOT NULL,
  `sasaran` varchar(255) NOT NULL,
  `penanggung_jawab` varchar(255) NOT NULL,
  `gambar` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `program`
--

INSERT INTO `program` (`id_program`, `tanggal`, `program_kerja`, `tujuan`, `indikator`, `tempat`, `waktu`, `sasaran`, `penanggung_jawab`, `gambar`) VALUES
(6, '2024-05-15', 'Penaganan Stunting', 'Menangani Stunting', 'Stunting', 'Balai Kota', '', 'Anak Anak', 'Pemerintah', 'Screenshot_5.png');

-- --------------------------------------------------------

--
-- Table structure for table `suratkeluar`
--

CREATE TABLE `suratkeluar` (
  `id_suratkeluar` int(5) NOT NULL,
  `id_suratmasuk` int(11) NOT NULL,
  `no_suratkeluar` varchar(60) NOT NULL,
  `judul_suratkeluar` varchar(100) NOT NULL,
  `id_indeks` int(3) NOT NULL,
  `tujuan` varchar(60) NOT NULL,
  `tanggal_keluar` date NOT NULL,
  `keterangan` mediumtext NOT NULL,
  `dokumen_persetujuan` varchar(100) NOT NULL,
  `berkas_suratkeluar` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `suratkeluar`
--

INSERT INTO `suratkeluar` (`id_suratkeluar`, `id_suratmasuk`, `no_suratkeluar`, `judul_suratkeluar`, `id_indeks`, `tujuan`, `tanggal_keluar`, `keterangan`, `dokumen_persetujuan`, `berkas_suratkeluar`) VALUES
(12, 32, '12345678', 'sosialisasi remaja', 0, 'memberikan edukasi', '2024-06-21', 'sosialisasi akan dilaksanakan', 'Dokumen Disetujui', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `suratmasuk`
--

CREATE TABLE `suratmasuk` (
  `id_suratmasuk` int(3) NOT NULL,
  `no_suratmasuk` varchar(60) NOT NULL,
  `judul_suratmasuk` varchar(100) NOT NULL,
  `asal_surat` varchar(60) NOT NULL,
  `tanggal_masuk` date NOT NULL,
  `tanggal_diterima` date NOT NULL,
  `id_indeks` int(3) NOT NULL,
  `keterangan` mediumtext NOT NULL,
  `dokumen_persutujuan` varchar(100) NOT NULL,
  `berkas_suratmasuk` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `suratmasuk`
--

INSERT INTO `suratmasuk` (`id_suratmasuk`, `no_suratmasuk`, `judul_suratmasuk`, `asal_surat`, `tanggal_masuk`, `tanggal_diterima`, `id_indeks`, `keterangan`, `dokumen_persutujuan`, `berkas_suratmasuk`) VALUES
(31, 'jopolesi', 'comunij', 'dyqor', '2023-02-27', '2005-04-27', 24, 'Quia at tempore cor', '', '64a2ddea54950.jpg'),
(32, '123456789', 'Sosialisasi Remaja', 'Kantor desa', '2024-06-21', '2024-06-21', 19, 'sosialisasi bersifat penting ', '', '667505669e70f.pdf');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id_user` int(1) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `nama_lengkap` varchar(100) NOT NULL,
  `image` varchar(250) NOT NULL,
  `bio` varchar(512) NOT NULL,
  `facebook` varchar(64) NOT NULL,
  `email` varchar(32) NOT NULL,
  `level` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id_user`, `username`, `password`, `nama_lengkap`, `image`, `bio`, `facebook`, `email`, `level`) VALUES
(8, 'Admin Ketua', 'cbf49f137cf3a3fe17d48dcf7a04a318652f3f4c', 'Bina Keluarga Remaja', '667235a8df6e6.png', 'Bina Keluarga Remaja sering disebut juga dengan BKR merupakan program strategis dalam upaya menyiapkan sumber daya manusia (SDM) yang berkualitas dalam lingkungan masyarakat. Program Bina Keluarga Remaja merupakan salah satu program yang dikembangkan oleh Badan Kependudukan Keluarga Berencana Nasional (BKKBN).\r\n\r\nAlamat : Jl.Ahmad Yhani no.19, Desa Grobogan, RT.005/003, Kec.Jiwan, Kab.Madiun', 'https://web.facebook.com/profile.php?id=100024783969809', 'user@email.com', 1),
(9, 'masyarakat', '12ecbdc192c678a410bcf7f3b48b168f3640287a', 'masyarakat', '', '', '', '', 4),
(10, 'admin', 'd033e22ae348aeb5660fc2140aec35850c4da997', 'Sekretaris', '', '', '', '', 2),
(11, 'member', '6467baa3b187373e3931422e2a8ef22f3e447d77', 'Kader', '', '', '', '', 3);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `disposisi`
--
ALTER TABLE `disposisi`
  ADD PRIMARY KEY (`id_disposisi`),
  ADD KEY `id_suratmasuk` (`id_suratmasuk`);

--
-- Indexes for table `dokumentasi`
--
ALTER TABLE `dokumentasi`
  ADD PRIMARY KEY (`id_dokumentasi`);

--
-- Indexes for table `indeks`
--
ALTER TABLE `indeks`
  ADD PRIMARY KEY (`id_indeks`);

--
-- Indexes for table `jadwal`
--
ALTER TABLE `jadwal`
  ADD PRIMARY KEY (`id_jadwal`);

--
-- Indexes for table `laporan`
--
ALTER TABLE `laporan`
  ADD PRIMARY KEY (`id_laporan`);

--
-- Indexes for table `program`
--
ALTER TABLE `program`
  ADD PRIMARY KEY (`id_program`);

--
-- Indexes for table `suratkeluar`
--
ALTER TABLE `suratkeluar`
  ADD PRIMARY KEY (`id_suratkeluar`),
  ADD KEY `id_subindeks` (`id_indeks`);

--
-- Indexes for table `suratmasuk`
--
ALTER TABLE `suratmasuk`
  ADD PRIMARY KEY (`id_suratmasuk`),
  ADD KEY `id_subindeks` (`id_indeks`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id_user`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `disposisi`
--
ALTER TABLE `disposisi`
  MODIFY `id_disposisi` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `dokumentasi`
--
ALTER TABLE `dokumentasi`
  MODIFY `id_dokumentasi` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `indeks`
--
ALTER TABLE `indeks`
  MODIFY `id_indeks` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `jadwal`
--
ALTER TABLE `jadwal`
  MODIFY `id_jadwal` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `laporan`
--
ALTER TABLE `laporan`
  MODIFY `id_laporan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `program`
--
ALTER TABLE `program`
  MODIFY `id_program` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `suratkeluar`
--
ALTER TABLE `suratkeluar`
  MODIFY `id_suratkeluar` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `suratmasuk`
--
ALTER TABLE `suratmasuk`
  MODIFY `id_suratmasuk` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id_user` int(1) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
