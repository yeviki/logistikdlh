-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Nov 07, 2021 at 05:48 PM
-- Server version: 10.1.25-MariaDB
-- PHP Version: 5.6.31

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `2021_app_logistik`
--

-- --------------------------------------------------------

--
-- Table structure for table `data_barang`
--

CREATE TABLE `data_barang` (
  `id_barang` int(11) NOT NULL,
  `nm_barang` varchar(255) NOT NULL,
  `id_satuan` int(11) NOT NULL,
  `id_kat_barang` int(11) NOT NULL,
  `create_by` varchar(255) NOT NULL,
  `create_date` datetime NOT NULL,
  `create_ip` varchar(20) NOT NULL,
  `mod_by` varchar(255) NOT NULL,
  `mod_date` datetime NOT NULL,
  `mod_ip` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `data_barang`
--

INSERT INTO `data_barang` (`id_barang`, `nm_barang`, `id_satuan`, `id_kat_barang`, `create_by`, `create_date`, `create_ip`, `mod_by`, `mod_date`, `mod_ip`) VALUES
(1, 'Mesin Cetak', 2, 1, 'yeviki', '2021-10-25 14:19:30', '127.0.0.1', 'yeviki', '2021-10-25 14:19:30', '127.0.0.1'),
(2, 'Catride', 2, 1, 'yeviki', '2021-10-25 14:20:04', '127.0.0.1', 'yeviki', '2021-10-25 14:20:04', '127.0.0.1'),
(3, 'Sepatu Bot', 5, 1, 'yeviki', '2021-10-25 14:20:22', '127.0.0.1', 'yeviki', '2021-10-25 14:20:22', '127.0.0.1'),
(4, 'Baju Rompi', 1, 1, 'yeviki', '2021-10-25 14:20:39', '127.0.0.1', 'yeviki', '2021-10-25 14:20:39', '127.0.0.1'),
(5, 'Cangkul', 2, 1, 'yeviki', '2021-10-25 14:20:59', '127.0.0.1', 'yeviki', '2021-10-25 14:20:59', '127.0.0.1'),
(6, 'Helm Proyek', 5, 1, 'yeviki', '2021-10-25 14:21:11', '127.0.0.1', 'yeviki', '2021-10-25 14:21:11', '127.0.0.1'),
(7, 'Sarung Tangan', 1, 2, 'yeviki', '2021-10-25 14:21:33', '127.0.0.1', 'yeviki', '2021-10-25 14:21:33', '127.0.0.1'),
(8, 'Gear Excavator', 5, 7, 'yeviki', '2021-10-25 14:21:49', '127.0.0.1', 'yeviki', '2021-10-25 14:21:49', '127.0.0.1'),
(9, 'Air Radiator Excavator', 8, 6, 'yeviki', '2021-10-25 14:22:09', '127.0.0.1', 'yeviki', '2021-10-25 14:22:09', '127.0.0.1'),
(10, 'Galon Air', 11, 1, 'yeviki', '2021-10-26 09:27:46', '127.0.0.1', 'yeviki', '2021-10-26 09:27:46', '127.0.0.1');

-- --------------------------------------------------------

--
-- Table structure for table `data_gudang`
--

CREATE TABLE `data_gudang` (
  `id_gudang` int(11) NOT NULL,
  `id_barang` int(11) NOT NULL,
  `qty_stok` int(11) NOT NULL,
  `id_level` int(11) NOT NULL,
  `create_by` varchar(255) NOT NULL,
  `create_date` datetime NOT NULL,
  `create_ip` varchar(20) NOT NULL,
  `mod_by` varchar(255) NOT NULL,
  `mod_date` datetime NOT NULL,
  `mod_ip` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `data_gudang`
--

INSERT INTO `data_gudang` (`id_gudang`, `id_barang`, `qty_stok`, `id_level`, `create_by`, `create_date`, `create_ip`, `mod_by`, `mod_date`, `mod_ip`) VALUES
(1, 1, 6, 0, 'yeviki', '2021-10-25 14:19:30', '127.0.0.1', 'yeviki', '2021-10-25 14:19:30', '127.0.0.1'),
(2, 2, 10, 0, 'yeviki', '2021-10-25 14:20:04', '127.0.0.1', 'yeviki', '2021-10-25 14:20:04', '127.0.0.1'),
(3, 3, 10, 0, 'yeviki', '2021-10-25 14:20:22', '127.0.0.1', 'yeviki', '2021-10-25 14:20:22', '127.0.0.1'),
(4, 4, 50, 0, 'yeviki', '2021-10-25 14:20:39', '127.0.0.1', 'yeviki', '2021-10-25 14:20:39', '127.0.0.1'),
(5, 5, 20, 0, 'yeviki', '2021-10-25 14:20:59', '127.0.0.1', 'yeviki', '2021-10-25 14:20:59', '127.0.0.1'),
(6, 6, 50, 0, 'yeviki', '2021-10-25 14:21:11', '127.0.0.1', 'yeviki', '2021-10-25 14:21:11', '127.0.0.1'),
(7, 7, 100, 0, 'yeviki', '2021-10-25 14:21:33', '127.0.0.1', 'yeviki', '2021-10-25 14:21:33', '127.0.0.1'),
(8, 8, 100, 0, 'yeviki', '2021-10-25 14:21:49', '127.0.0.1', 'yeviki', '2021-10-25 14:21:49', '127.0.0.1'),
(9, 9, 1, 0, 'yeviki', '2021-10-25 14:22:09', '127.0.0.1', 'yeviki', '2021-10-25 14:22:09', '127.0.0.1'),
(10, 10, 10, 0, 'yeviki', '2021-10-26 09:27:46', '127.0.0.1', 'yeviki', '2021-10-26 09:27:46', '127.0.0.1');

-- --------------------------------------------------------

--
-- Table structure for table `data_pembelian`
--

CREATE TABLE `data_pembelian` (
  `id_pembelian` int(11) NOT NULL,
  `no_faktur_buy` varchar(255) NOT NULL,
  `tgl_pembelian` date NOT NULL,
  `catatan` text NOT NULL,
  `create_by` varchar(255) NOT NULL,
  `create_date` datetime NOT NULL,
  `create_ip` varchar(20) NOT NULL,
  `mod_by` varchar(255) NOT NULL,
  `mod_date` datetime NOT NULL,
  `mod_ip` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `data_pembelian`
--

INSERT INTO `data_pembelian` (`id_pembelian`, `no_faktur_buy`, `tgl_pembelian`, `catatan`, `create_by`, `create_date`, `create_ip`, `mod_by`, `mod_date`, `mod_ip`) VALUES
(1, 'NO-20-2021', '2021-10-01', 'Test', 'yeviki', '2021-10-01 11:42:45', '127.0.0.1', 'yeviki', '2021-10-01 11:42:45', '127.0.0.1'),
(2, 'NO-21-2021', '2021-11-05', 'Testy', 'yeviki', '2021-11-05 10:02:18', '127.0.0.1', 'yeviki', '2021-11-05 10:02:18', '127.0.0.1');

-- --------------------------------------------------------

--
-- Table structure for table `data_permintaan`
--

CREATE TABLE `data_permintaan` (
  `id_permintaan` int(11) NOT NULL,
  `no_faktur_req` varchar(255) NOT NULL,
  `tanggal_req` date NOT NULL,
  `id_tpa` int(11) NOT NULL,
  `catatan` text NOT NULL,
  `status_req` int(11) NOT NULL,
  `create_by` varchar(255) NOT NULL,
  `create_date` datetime NOT NULL,
  `create_ip` varchar(20) NOT NULL,
  `mod_by` varchar(255) NOT NULL,
  `mod_date` datetime NOT NULL,
  `mod_ip` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `data_permintaan`
--

INSERT INTO `data_permintaan` (`id_permintaan`, `no_faktur_req`, `tanggal_req`, `id_tpa`, `catatan`, `status_req`, `create_by`, `create_date`, `create_ip`, `mod_by`, `mod_date`, `mod_ip`) VALUES
(1, '01-PYK', '2021-11-05', 1, 'Testing', 2, 'admin_pyk', '2021-11-05 16:51:30', '127.0.0.1', 'admin_pyk', '2021-11-05 16:51:30', '127.0.0.1'),
(2, '02-SLK-2021', '2021-11-07', 2, 'Pemesanan barang yang telah habis', 2, 'admin_solok', '2021-11-07 22:51:23', '127.0.0.1', 'admin_solok', '2021-11-07 22:51:23', '127.0.0.1');

-- --------------------------------------------------------

--
-- Table structure for table `detail_pembelian`
--

CREATE TABLE `detail_pembelian` (
  `id_detail_pembelian` int(11) NOT NULL,
  `id_pembelian` int(11) NOT NULL,
  `id_barang` int(11) NOT NULL,
  `qty_barang` int(11) NOT NULL,
  `harga_barang` bigint(11) NOT NULL,
  `total_harga` bigint(20) NOT NULL,
  `id_status_barang` int(11) NOT NULL,
  `create_by` varchar(255) NOT NULL,
  `create_date` datetime NOT NULL,
  `create_ip` varchar(20) NOT NULL,
  `mod_by` varchar(255) NOT NULL,
  `mod_date` datetime NOT NULL,
  `mod_ip` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `detail_pembelian`
--

INSERT INTO `detail_pembelian` (`id_detail_pembelian`, `id_pembelian`, `id_barang`, `qty_barang`, `harga_barang`, `total_harga`, `id_status_barang`, `create_by`, `create_date`, `create_ip`, `mod_by`, `mod_date`, `mod_ip`) VALUES
(1, 1, 1, 1, 10000, 10000, 1, 'yeviki', '2021-10-25 12:02:31', '127.0.0.1', 'yeviki', '2021-10-25 12:02:31', '127.0.0.1'),
(2, 1, 2, 10, 25000, 250000, 1, 'yeviki', '2021-10-25 12:02:50', '127.0.0.1', 'yeviki', '2021-10-25 12:02:50', '127.0.0.1'),
(3, 1, 3, 10, 50000, 500000, 1, 'yeviki', '2021-10-25 12:05:15', '127.0.0.1', 'yeviki', '2021-10-25 12:05:15', '127.0.0.1'),
(4, 1, 4, 50, 150000, 7500000, 1, 'yeviki', '2021-10-25 12:06:53', '127.0.0.1', 'yeviki', '2021-10-25 12:06:53', '127.0.0.1'),
(5, 1, 5, 20, 100000, 2000000, 1, 'yeviki', '2021-10-25 12:08:58', '127.0.0.1', 'yeviki', '2021-10-25 12:08:58', '127.0.0.1'),
(6, 1, 6, 50, 50000, 2500000, 1, 'yeviki', '2021-10-25 12:10:17', '127.0.0.1', 'yeviki', '2021-10-25 12:10:17', '127.0.0.1'),
(7, 1, 7, 100, 20000, 2000000, 1, 'yeviki', '2021-10-25 12:10:32', '127.0.0.1', 'yeviki', '2021-10-25 12:10:32', '127.0.0.1'),
(8, 1, 8, 100, 500000, 50000000, 1, 'yeviki', '2021-10-25 12:10:48', '127.0.0.1', 'yeviki', '2021-10-25 12:10:48', '127.0.0.1'),
(9, 1, 9, 1, 10000, 10000, 1, 'yeviki', '2021-10-25 15:06:12', '127.0.0.1', 'yeviki', '2021-10-25 15:06:12', '127.0.0.1'),
(10, 2, 1, 5, 600000, 3000000, 1, 'yeviki', '2021-11-05 10:12:21', '127.0.0.1', 'yeviki', '2021-11-05 10:12:21', '127.0.0.1'),
(11, 2, 10, 10, 50000, 500000, 1, 'yeviki', '2021-11-05 10:13:28', '127.0.0.1', 'yeviki', '2021-11-05 10:13:28', '127.0.0.1');

--
-- Triggers `detail_pembelian`
--
DELIMITER $$
CREATE TRIGGER `Update Stok` AFTER UPDATE ON `detail_pembelian` FOR EACH ROW BEGIN
	IF NEW.id_status_barang = 1 THEN
	UPDATE data_gudang SET qty_stok = qty_stok + NEW.qty_barang 	WHERE  id_barang = NEW.id_barang;
    END IF;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `detail_permintaan`
--

CREATE TABLE `detail_permintaan` (
  `id_detail_permintaan` int(11) NOT NULL,
  `id_permintaan` int(11) NOT NULL,
  `id_barang` int(11) NOT NULL,
  `qty_req` int(11) NOT NULL,
  `qty_acc` bigint(11) NOT NULL,
  `status_det_req` int(11) NOT NULL,
  `create_by` varchar(255) NOT NULL,
  `create_date` datetime NOT NULL,
  `create_ip` varchar(20) NOT NULL,
  `mod_by` varchar(255) NOT NULL,
  `mod_date` datetime NOT NULL,
  `mod_ip` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `detail_permintaan`
--

INSERT INTO `detail_permintaan` (`id_detail_permintaan`, `id_permintaan`, `id_barang`, `qty_req`, `qty_acc`, `status_det_req`, `create_by`, `create_date`, `create_ip`, `mod_by`, `mod_date`, `mod_ip`) VALUES
(1, 1, 1, 1, 0, 0, 'admin_pyk', '2021-11-07 21:27:52', '127.0.0.1', 'admin_pyk', '2021-11-07 21:27:52', '127.0.0.1'),
(2, 1, 2, 2, 0, 0, 'admin_pyk', '2021-11-07 21:28:00', '127.0.0.1', 'admin_pyk', '2021-11-07 21:28:00', '127.0.0.1'),
(3, 1, 7, 3, 0, 0, 'admin_pyk', '2021-11-07 21:28:08', '127.0.0.1', 'admin_pyk', '2021-11-07 21:28:08', '127.0.0.1'),
(4, 1, 4, 3, 0, 0, 'admin_pyk', '2021-11-07 21:28:18', '127.0.0.1', 'admin_pyk', '2021-11-07 21:28:18', '127.0.0.1'),
(5, 1, 8, 1, 0, 0, 'admin_pyk', '2021-11-07 21:28:29', '127.0.0.1', 'admin_pyk', '2021-11-07 21:28:29', '127.0.0.1'),
(6, 2, 7, 5, 0, 0, 'admin_solok', '2021-11-07 22:51:40', '127.0.0.1', 'admin_solok', '2021-11-07 22:51:40', '127.0.0.1'),
(7, 2, 3, 2, 0, 0, 'admin_solok', '2021-11-07 22:51:52', '127.0.0.1', 'admin_solok', '2021-11-07 22:51:52', '127.0.0.1'),
(8, 2, 5, 5, 0, 0, 'admin_solok', '2021-11-07 22:52:00', '127.0.0.1', 'admin_solok', '2021-11-07 22:52:00', '127.0.0.1');

-- --------------------------------------------------------

--
-- Table structure for table `ms_tpa`
--

CREATE TABLE `ms_tpa` (
  `id_tpa` int(11) NOT NULL,
  `nama_tpa` varchar(255) NOT NULL,
  `lokasi_tpa` text NOT NULL,
  `create_by` varchar(255) NOT NULL,
  `create_date` datetime NOT NULL,
  `create_ip` varchar(20) NOT NULL,
  `mod_by` varchar(255) NOT NULL,
  `mod_date` datetime NOT NULL,
  `mod_ip` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ms_tpa`
--

INSERT INTO `ms_tpa` (`id_tpa`, `nama_tpa`, `lokasi_tpa`, `create_by`, `create_date`, `create_ip`, `mod_by`, `mod_date`, `mod_ip`) VALUES
(1, 'TPA Sampah Regional Payakumbuh', 'Kelurahan Kapalo Koto dan Kelurahan Padang Karambia, Kecamatan Payakumbuh Selatan,Kota Payakumbuh', 'yeviki', '2020-11-24 09:47:05', '::1', 'yeviki', '2021-06-07 14:13:23', '127.0.0.1'),
(2, 'TPA Sampah Regional Solok', 'Ampang Kualo Kelurahan Kampung Jawa, Kecamatan Tanjung Harapan, Kota Solok', 'yeviki', '2020-11-24 09:47:57', '::1', 'izinmasuk', '2021-03-16 10:08:06', '182.253.91.124');

-- --------------------------------------------------------

--
-- Table structure for table `ref_kategori`
--

CREATE TABLE `ref_kategori` (
  `id_kat_barang` int(2) NOT NULL,
  `kategori` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ref_kategori`
--

INSERT INTO `ref_kategori` (`id_kat_barang`, `kategori`) VALUES
(1, 'Umum'),
(2, 'Bengkel'),
(3, 'Timbangan'),
(4, 'Land Fill/Laboratorium'),
(5, 'Pemilah / Kompos'),
(6, 'Kendaraan / Dump Truck'),
(7, 'Excavator (320 D)'),
(8, 'Excavator (313 D)');

-- --------------------------------------------------------

--
-- Table structure for table `ref_satuan`
--

CREATE TABLE `ref_satuan` (
  `id_satuan` int(2) NOT NULL,
  `satuan` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ref_satuan`
--

INSERT INTO `ref_satuan` (`id_satuan`, `satuan`) VALUES
(1, 'Stel'),
(2, 'Unit'),
(3, 'Buah'),
(4, 'Kotak'),
(5, 'Set'),
(6, 'M\''),
(7, 'Kardus'),
(8, 'Botol'),
(9, 'Helai'),
(10, 'Kodi'),
(11, 'Galon'),
(12, 'Liter'),
(13, 'Pc'),
(14, 'Pcs');

-- --------------------------------------------------------

--
-- Table structure for table `xi_sa_ci_captcha`
--

CREATE TABLE `xi_sa_ci_captcha` (
  `captcha_id` int(11) NOT NULL,
  `captcha_time` int(11) NOT NULL,
  `ip_address` varchar(16) NOT NULL,
  `word` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `xi_sa_ci_session`
--

CREATE TABLE `xi_sa_ci_session` (
  `id` varchar(128) NOT NULL,
  `ip_address` varchar(45) NOT NULL,
  `timestamp` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `data` blob NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `xi_sa_ci_session`
--

INSERT INTO `xi_sa_ci_session` (`id`, `ip_address`, `timestamp`, `data`) VALUES
('10jlvav7viq99te74hp7ihn6n8va7e3k', '::1', 1636104842, ''),
('a5ag1emp2kv4lqofd423no9dbac2egkt', '127.0.0.1', 1636106045, 0x6163636f756e745f6e616d657c733a31313a2261646d696e5f736f6c6f6b223b4170705470704f6e6c696e65403230323073657373696f6e7c733a3139323a223565356431353233326665333866393531313738373862396339323639663530626332653331633964353639333030343231613138303932666234616162653565613637333638333338626337643838666230303539316565363739656561653537313561356563636138393731303530646432336461353566323461646436383857634e6a364f6b6137443535396f6673486e4d2f50447242494a615151557945716c51576c7659433932624d44444b5139675159664c714d42714f674b74223b657870697265735f62797c693a313633363130393631353b66756c6c6e616d657c733a31313a2241646d696e20536f6c6f6b223b67726f75705f6163746976657c733a313a2236223b67726f75705f6e616d657c733a333a22545041223b6c6576656c5f616b7365737c733a333a22545041223b6e69636b5f6c6576656c7c733a333a22545050223b757365725f69647c733a33323a223038303633443438463245454538433536454137324232464635354239374637223b7470615f69647c733a313a2232223b),
('dfg24en8noe0dhdevlqov9k04vkgsfua', '127.0.0.1', 1636300327, 0x6163636f756e745f6e616d657c733a31313a2261646d696e5f736f6c6f6b223b4170705470704f6e6c696e65403230323073657373696f6e7c733a3139323a22623932336133663864633162646463333936643231643534393265383062363961353037663138633234353131383961303365623961653639643431303733303739393738626132303638326539376136343236353062356637376461383931313661313730633430653565373365623164663566643166313262633933306353363278436b32425a5064556274457a466f7736736136686c6439343633664e74424a48704b56546c412b7272366d6e34374b53727053465450414442365466223b657870697265735f62797c693a313633363239343930343b66756c6c6e616d657c733a31313a2241646d696e20536f6c6f6b223b67726f75705f6163746976657c733a313a2236223b67726f75705f6e616d657c733a333a22545041223b6c6576656c5f616b7365737c733a333a22545041223b6e69636b5f6c6576656c7c733a333a22545050223b757365725f69647c733a33323a223038303633443438463245454538433536454137324232464635354239374637223b7470615f69647c733a313a2232223b),
('h9k720j14m9lu286u1tiiu89n979qusd', '127.0.0.1', 1636107559, 0x6572726f725f73657373696f6e7c693a323b6163636f756e745f6e616d657c733a393a2261646d696e5f70796b223b4170705470704f6e6c696e65403230323073657373696f6e7c733a3139323a2236663739396333313536373065373530313233306133343637643262353634396134303432636162383565383166653038613463633762643131666133323734393864643438626536643661646161363630363339363566376262343234336537303064326138383738616232343930666432653565373134316135353035306d774536736541396d514652715a546f62486442476554366c3538502f65484373565a70502f53694a6c4f644d33317a62496273504c6d63346137495a483856223b657870697265735f62797c693a313633363130393236393b66756c6c6e616d657c733a393a2241646d696e2050594b223b67726f75705f6163746976657c733a313a2236223b67726f75705f6e616d657c733a333a22545041223b6c6576656c5f616b7365737c733a333a22545041223b6e69636b5f6c6576656c7c733a333a22545050223b757365725f69647c733a33323a223044453546443036314139373341334341453132463733443232373245314241223b7470615f69647c733a313a2231223b),
('jfvk74ms2ki09gcv3j1on1o93r6vkfca', '127.0.0.1', 1636291544, ''),
('tu424q670vdjg3sbcheahh2qfpuqua3k', '127.0.0.1', 1636295400, 0x6163636f756e745f6e616d657c733a393a2261646d696e5f70796b223b4170705470704f6e6c696e65403230323073657373696f6e7c733a3139323a2239623439333066353334316637316365616362316130656563666361336662376333353062623139306464623362303835383634346431393965353162353132336631633837303063356161306337363563346232336636636435613139336139663536313538666664393439626164313865666235306331646634653566316e703171716342574b3830756f71626c525545624f746e764d6e61314c5665526d312b567974696849592f6552557668345666767a6459614c6c306b6175362f223b657870697265735f62797c693a313633363239343836393b66756c6c6e616d657c733a393a2241646d696e2050594b223b67726f75705f6163746976657c733a313a2236223b67726f75705f6e616d657c733a333a22545041223b6c6576656c5f616b7365737c733a333a22545041223b6e69636b5f6c6576656c7c733a333a22545050223b757365725f69647c733a33323a223044453546443036314139373341334341453132463733443232373245314241223b7470615f69647c733a313a2231223b),
('u6p4o5cjb7mt2o6a55nfpti102smd7b7', '127.0.0.1', 1636107614, 0x6163636f756e745f6e616d657c733a363a22796576696b69223b4170705470704f6e6c696e65403230323073657373696f6e7c733a3139323a223264656233633063663536303235316231623438356266633230653663643038306533626463396433616133303634636361313365643132373834326432646638363565343430613333373063613764363737643835383031393131376632656235653236633962363563373866646631616364626636313965633333333664586a56595666646250457a5352364d5779633670714e593335555965513851347674423261646f395866436a53717664344c4e47337937537262343975394e64223b657870697265735f62797c693a313633363037393838383b66756c6c6e616d657c733a31333a2241646d696e6973747261746f72223b67726f75705f6163746976657c733a313a2231223b67726f75705f6e616d657c733a31313a2253757065722041646d696e223b6c6576656c5f616b7365737c733a31313a2253555045522041444d494e223b6e69636b5f6c6576656c7c733a333a22535550223b757365725f69647c733a33323a223233314536393645394332313831303533354530384646464537304630383638223b),
('v42tsv6gcbha4id6jncf7jm7n47du0ng', '127.0.0.1', 1636303647, 0x6163636f756e745f6e616d657c733a363a22796576696b69223b4170705470704f6e6c696e65403230323073657373696f6e7c733a3139323a226138613139653334313133643438646166613435396564323762626237663231366338613366626534313830333339643966623734353665316136643535336130613135313934636465303133656564303833346535656364316532386163636662656539383233343433353837613561363339306437663138316131656461566c4d365267542b52634d4776504e614845773079484f596a6d335956415732333464314c4f734f583171446d75687a65617333504679497144704763656679223b657870697265735f62797c693a313633363239343538353b66756c6c6e616d657c733a31333a2241646d696e6973747261746f72223b67726f75705f6163746976657c733a313a2231223b67726f75705f6e616d657c733a31313a2253757065722041646d696e223b6c6576656c5f616b7365737c733a31313a2253555045522041444d494e223b6e69636b5f6c6576656c7c733a333a22535550223b757365725f69647c733a33323a223233314536393645394332313831303533354530384646464537304630383638223b7470615f69647c733a313a2230223b);

-- --------------------------------------------------------

--
-- Table structure for table `xi_sa_fungsi`
--

CREATE TABLE `xi_sa_fungsi` (
  `id_fungsi` int(11) NOT NULL,
  `nama_fungsi` varchar(255) NOT NULL,
  `label_fungsi` varchar(255) NOT NULL,
  `url_fungsi` varchar(255) NOT NULL,
  `deskripsi_fungsi` varchar(255) NOT NULL,
  `id_jenis_fungsi` int(3) NOT NULL,
  `id_level_akses` int(3) NOT NULL,
  `create_by` varchar(255) NOT NULL,
  `create_date` datetime NOT NULL,
  `create_ip` varchar(20) NOT NULL,
  `mod_by` varchar(255) NOT NULL,
  `mod_date` datetime NOT NULL,
  `mod_ip` varchar(20) NOT NULL,
  `id_status` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `xi_sa_fungsi`
--

INSERT INTO `xi_sa_fungsi` (`id_fungsi`, `nama_fungsi`, `label_fungsi`, `url_fungsi`, `deskripsi_fungsi`, `id_jenis_fungsi`, `id_level_akses`, `create_by`, `create_date`, `create_ip`, `mod_by`, `mod_date`, `mod_ip`, `id_status`) VALUES
(1, 'index', 'Index', 'index', 'Fungsi untuk menampilkan data', 1, 0, 'yogisolop', '2017-06-04 19:30:40', '::1', 'administrator', '2021-02-16 07:34:20', '::1', 1),
(2, 'create', 'Create Data', 'create', 'Fungsi untuk menambahkan data', 2, 0, 'yogisolop', '2017-06-04 19:32:33', '::1', 'yogisolop', '2017-09-05 17:52:35', '::1', 1),
(3, 'update', 'Update Data', 'update', 'Fungsi untuk merubah data', 2, 0, 'yogisolop', '2017-06-04 19:33:01', '::1', 'yogisolop', '2017-09-05 17:52:44', '::1', 1),
(4, 'delete', 'Delete Data', 'delete', 'Fungsi untuk menghapus data', 2, 0, 'yogisolop', '2017-06-04 19:33:33', '::1', 'yogisolop', '2017-09-05 17:52:52', '::1', 1),
(5, 'listview', 'List View Data', 'listview', 'Fungsi untuk menampilkan list data', 2, 0, 'yogisolop', '2017-11-06 13:59:43', '::1', 'yogisolop', '2017-11-06 13:59:43', '::1', 1),
(6, 'review', 'Review Data', 'review', 'Fungsi untuk mereview data kembali', 2, 0, 'yogisolop', '2017-12-17 23:45:14', '::1', 'yogisolop', '2017-12-17 23:45:29', '::1', 1),
(7, 'details', 'Data Details', 'details', 'Fungsi untuk melihat rincian data', 2, 0, 'yogisolop', '2017-12-27 08:28:13', '::1', 'yogisolop', '2017-12-27 08:28:13', '::1', 1),
(8, 'searching', 'Searching', 'searching', 'Fungsi untuk mencari data', 2, 0, 'yogisolop', '2017-11-07 13:21:59', '::1', 'yogisolop', '2017-11-07 13:21:59', '::1', 1),
(9, 'rules', 'Rules Module', 'rules', 'Fungsi untuk setting rules module', 2, 0, 'yogisolop', '2017-06-05 10:51:09', '::1', 'yogisolop', '2020-04-07 22:38:12', '::1', 1),
(10, 'privileges', 'Group Privilege', 'privileges', 'Fungsi untuk setting group privilege', 2, 0, 'yogisolop', '2017-06-10 22:23:24', '::1', 'yogisolop', '2017-08-03 12:20:22', '::1', 1),
(11, 'regency', 'Data Regency', 'regency', 'Fungsi untuk mengambil data regency', 2, 0, 'yogisolop', '2020-04-11 22:38:38', '::1', 'yogisolop', '2020-04-11 22:38:38', '::1', 1),
(12, 'district', 'Data District', 'district', 'Fungsi untuk mengambil data district', 2, 0, 'yogisolop', '2020-04-11 22:39:48', '::1', 'yogisolop', '2020-04-11 22:39:48', '::1', 1),
(13, 'village', 'Data Village', 'village', 'Fungsi untuk mengambil data village', 2, 0, 'yogisolop', '2020-04-11 22:40:11', '::1', 'yogisolop', '2020-04-11 22:40:11', '::1', 1),
(14, 'approve', 'Data Approve', 'approve', 'Fungsi untuk menyetujui data', 2, 0, 'yogisolop', '2018-04-03 09:22:12', '36.67.167.61', 'yogisolop', '2018-04-03 09:22:12', '36.67.167.61', 1),
(15, 'reject', 'Data Reject', 'reject', 'Fungsi untuk menolak data', 2, 0, 'yogisolop', '2018-04-03 09:22:12', '36.67.167.61', 'yogisolop', '2018-04-03 09:22:12', '36.67.167.61', 1),
(16, 'upload', 'Upload Data', 'upload', 'Fungsi untuk mengupload file', 2, 0, 'yogisolop', '2018-07-24 22:20:18', '::1', 'yogisolop', '2018-08-03 15:09:33', '::1', 1),
(17, 'download', 'Download Data', 'download', 'Fungsi untuk mendownload file', 2, 0, 'yogisolop', '2018-07-24 22:21:04', '::1', 'yogisolop', '2018-08-03 15:09:42', '::1', 1),
(18, 'export_to_word', 'Download Word', 'export-to-word', 'Fungsi download laporan format word', 2, 0, 'yogisolop', '2020-05-02 07:16:39', '::1', 'yogisolop', '2020-05-22 08:03:33', '::1', 1),
(19, 'export_to_excel', 'Download Excel', 'export-to-excel', 'Fungsi download laporan format excel', 2, 0, 'yogisolop', '2020-05-11 08:27:30', '::1', 'yogisolop', '2020-05-11 08:27:30', '::1', 1),
(20, 'export_to_pdf', 'Download PDF', 'export-to-pdf', 'Fungsi download laporan format pdf', 2, 0, 'yogisolop', '2020-05-11 08:30:42', '::1', 'yogisolop', '2020-05-11 08:30:42', '::1', 1),
(21, 'rules_pembelian', 'Rules Pembelian', 'rules-pembelian', 'Fungsi untuk menambahkan detail data yang dibeli', 2, 0, 'yeviki', '2021-10-04 14:10:13', '127.0.0.1', 'yeviki', '2021-10-04 14:10:13', '127.0.0.1', 1),
(22, 'rules_permintaan', 'Rules Permintaan', 'rules-permintaan', 'Halaman untuk menambahkan detail permintaan barang', 2, 0, 'yeviki', '2021-11-01 14:09:49', '127.0.0.1', 'yeviki', '2021-11-01 14:09:49', '127.0.0.1', 1),
(23, 'rules_verifikasi', 'Rules Verifikasi', 'rules-verifikasi', 'Halaman menampilkan detail permintaan TPA dan proses verifikasi permintaan', 2, 0, 'yeviki', '2021-11-07 21:35:33', '127.0.0.1', 'yeviki', '2021-11-07 21:35:33', '127.0.0.1', 1);

-- --------------------------------------------------------

--
-- Table structure for table `xi_sa_group`
--

CREATE TABLE `xi_sa_group` (
  `id_group` int(11) NOT NULL,
  `nama_group` varchar(255) NOT NULL,
  `id_level_akses` int(3) NOT NULL,
  `id_upk` int(3) NOT NULL,
  `create_by` varchar(255) NOT NULL,
  `create_date` datetime NOT NULL,
  `create_ip` varchar(20) NOT NULL,
  `mod_by` varchar(255) NOT NULL,
  `mod_date` datetime NOT NULL,
  `mod_ip` varchar(20) NOT NULL,
  `id_status` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `xi_sa_group`
--

INSERT INTO `xi_sa_group` (`id_group`, `nama_group`, `id_level_akses`, `id_upk`, `create_by`, `create_date`, `create_ip`, `mod_by`, `mod_date`, `mod_ip`, `id_status`) VALUES
(1, 'Super Admin', 1, 0, 'yogisolop', '2020-04-07 00:00:00', '::1', 'yogisolop', '2020-04-07 00:00:00', '::1', 1),
(2, 'Administrator', 2, 0, 'yogisolop', '2020-09-20 12:36:48', '::1', 'yogisolop', '2021-01-28 12:52:42', '::1', 1),
(6, 'TPA', 3, 0, 'administrator', '2021-02-09 11:48:15', '::1', 'yeviki', '2021-11-03 15:13:36', '127.0.0.1', 1),
(7, 'Pimpinan', 4, 0, 'administrator', '2021-02-09 11:48:29', '::1', 'yeviki', '2021-11-05 16:02:28', '127.0.0.1', 0),
(8, 'Staf / Operator', 5, 0, 'administrator', '2021-02-09 11:48:37', '::1', 'yeviki', '2021-11-05 16:02:35', '127.0.0.1', 0);

-- --------------------------------------------------------

--
-- Table structure for table `xi_sa_group_privileges`
--

CREATE TABLE `xi_sa_group_privileges` (
  `id_group_privileges` int(11) NOT NULL,
  `id_group` int(11) NOT NULL DEFAULT '0',
  `id_rules` int(11) NOT NULL DEFAULT '0',
  `id_status` int(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `xi_sa_group_privileges`
--

INSERT INTO `xi_sa_group_privileges` (`id_group_privileges`, `id_group`, `id_rules`, `id_status`) VALUES
(1, 1, 1, 1),
(2, 1, 2, 1),
(3, 1, 3, 1),
(4, 1, 4, 1),
(5, 1, 5, 1),
(6, 1, 6, 1),
(7, 1, 7, 1),
(8, 1, 8, 1),
(9, 1, 9, 1),
(10, 1, 10, 1),
(11, 1, 11, 1),
(12, 1, 12, 1),
(13, 1, 13, 1),
(14, 1, 14, 1),
(15, 1, 15, 1),
(16, 1, 16, 1),
(17, 1, 17, 1),
(18, 1, 18, 1),
(19, 1, 19, 1),
(20, 1, 20, 1),
(21, 1, 21, 1),
(22, 1, 22, 1),
(23, 1, 23, 1),
(24, 1, 24, 1),
(25, 1, 25, 1),
(26, 1, 26, 1),
(27, 1, 27, 1),
(28, 1, 28, 1),
(29, 1, 29, 1),
(30, 1, 30, 1),
(31, 1, 31, 1),
(32, 1, 32, 1),
(33, 1, 33, 1),
(34, 1, 34, 1),
(35, 1, 35, 1),
(36, 1, 36, 1),
(37, 1, 37, 1),
(38, 1, 38, 1),
(39, 1, 39, 1),
(40, 1, 40, 1),
(71, 8, 1, 1),
(78, 7, 1, 1),
(98, 1, 85, 1),
(99, 1, 86, 1),
(100, 1, 87, 1),
(101, 1, 88, 1),
(102, 1, 89, 1),
(103, 1, 90, 1),
(104, 1, 91, 1),
(105, 1, 92, 1),
(106, 1, 93, 1),
(107, 1, 94, 1),
(108, 1, 95, 1),
(109, 1, 96, 1),
(110, 1, 97, 1),
(111, 1, 98, 1),
(112, 1, 99, 1),
(113, 1, 100, 1),
(114, 1, 101, 1),
(115, 1, 102, 1),
(116, 1, 103, 1),
(117, 1, 104, 1),
(118, 1, 105, 1),
(119, 1, 106, 1),
(120, 2, 1, 1),
(121, 2, 91, 1),
(122, 2, 92, 1),
(130, 6, 1, 1),
(131, 6, 91, 1),
(132, 6, 92, 1),
(133, 6, 100, 1),
(134, 6, 101, 1),
(135, 6, 102, 1),
(136, 6, 103, 1),
(137, 6, 104, 1),
(138, 6, 105, 1),
(139, 6, 106, 1),
(140, 1, 107, 1);

-- --------------------------------------------------------

--
-- Table structure for table `xi_sa_jenis_fungsi`
--

CREATE TABLE `xi_sa_jenis_fungsi` (
  `id_jenis_fungsi` int(3) NOT NULL,
  `jenis_fungsi` varchar(100) NOT NULL,
  `id_status` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `xi_sa_jenis_fungsi`
--

INSERT INTO `xi_sa_jenis_fungsi` (`id_jenis_fungsi`, `jenis_fungsi`, `id_status`) VALUES
(1, 'Fungsi Public', 1),
(2, 'Fungsi Pendukung', 1),
(3, 'Fungsi Private', 1),
(4, 'Fungsi Belum Ada', 1);

-- --------------------------------------------------------

--
-- Table structure for table `xi_sa_kontrol`
--

CREATE TABLE `xi_sa_kontrol` (
  `id_kontrol` int(11) NOT NULL,
  `nama_kontrol` varchar(255) NOT NULL,
  `label_kontrol` varchar(255) NOT NULL,
  `url_kontrol` varchar(255) NOT NULL,
  `deskripsi_kontrol` varchar(255) NOT NULL,
  `create_by` varchar(255) NOT NULL,
  `create_date` datetime NOT NULL,
  `create_ip` varchar(20) NOT NULL,
  `mod_by` varchar(255) NOT NULL,
  `mod_date` datetime NOT NULL,
  `mod_ip` varchar(20) NOT NULL,
  `id_status` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `xi_sa_kontrol`
--

INSERT INTO `xi_sa_kontrol` (`id_kontrol`, `nama_kontrol`, `label_kontrol`, `url_kontrol`, `deskripsi_kontrol`, `create_by`, `create_date`, `create_ip`, `mod_by`, `mod_date`, `mod_ip`, `id_status`) VALUES
(1, 'home', 'Home', 'home', 'Halaman dashboard', '', '2017-06-04 19:36:44', '::1', 'yogisolop', '2020-05-19 11:01:39', '::1', 1),
(2, 'fungsi', 'Fungsi', 'fungsi', 'Halaman manajamen fungsi', '', '2017-06-04 19:37:18', '::1', '', '2017-06-07 11:42:03', '::1', 1),
(3, 'kontrol', 'Kontrol', 'kontrol', 'Halaman manajemen kontrol', '', '2017-06-04 19:37:38', '::1', '', '2017-06-07 11:41:55', '::1', 1),
(4, 'module', 'Module', 'module', 'Halaman manajemen module', '', '2017-06-04 19:37:58', '::1', '', '2017-06-07 11:41:47', '::1', 1),
(5, 'menu', 'Menu', 'menu', 'Halaman majamen menu', '', '2017-06-07 11:41:18', '::1', '', '2017-06-07 11:41:18', '::1', 1),
(6, 'group', 'Group', 'group', 'Halaman manajemen group', '', '2017-06-10 22:23:53', '::1', '', '2017-06-10 22:24:15', '::1', 1),
(7, 'users', 'Users', 'users', 'Halaman manajemen users', '', '2017-06-14 19:18:54', '::1', '', '2017-06-14 19:19:06', '::1', 1),
(18, 'barang', 'Barang', 'barang', 'Halaman manajemen data barang', 'yeviki', '2021-07-29 11:58:40', '127.0.0.1', 'yeviki', '2021-07-29 11:58:40', '127.0.0.1', 1),
(19, 'account', 'Account', 'account', 'Halaman ubah password', 'yeviki', '2021-08-02 10:50:18', '127.0.0.1', 'yeviki', '2021-08-02 10:50:18', '127.0.0.1', 1),
(20, 'pembelian', 'Pembelian', 'pembelian', 'Halaman manajemen pembelian barang', 'yeviki', '2021-09-30 08:54:08', '127.0.0.1', 'yeviki', '2021-09-30 08:54:08', '127.0.0.1', 1),
(21, 'permintaan', 'Permintaan', 'permintaan', 'Halaman manajemen permintaan barang', 'yeviki', '2021-10-26 11:20:37', '127.0.0.1', 'yeviki', '2021-10-26 11:21:37', '127.0.0.1', 1);

-- --------------------------------------------------------

--
-- Table structure for table `xi_sa_level_akses`
--

CREATE TABLE `xi_sa_level_akses` (
  `id_level_akses` int(3) NOT NULL,
  `level_akses` varchar(100) NOT NULL,
  `nick_level` char(3) NOT NULL,
  `id_status` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `xi_sa_level_akses`
--

INSERT INTO `xi_sa_level_akses` (`id_level_akses`, `level_akses`, `nick_level`, `id_status`) VALUES
(1, 'SUPER ADMIN', 'SUP', 1),
(2, 'ADMINISTRATOR', 'ADM', 1),
(3, 'TPA', 'TPP', 1),
(4, 'PIMPINAN', 'PMP', 1),
(5, 'STAF', 'STF', 1);

-- --------------------------------------------------------

--
-- Table structure for table `xi_sa_log_akses`
--

CREATE TABLE `xi_sa_log_akses` (
  `id_log_akses` int(11) NOT NULL,
  `history_log` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `xi_sa_log_login`
--

CREATE TABLE `xi_sa_log_login` (
  `id_log` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `login_time` int(11) NOT NULL,
  `ip_address` varchar(20) NOT NULL,
  `user_agent` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `xi_sa_log_mobile`
--

CREATE TABLE `xi_sa_log_mobile` (
  `id_log` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `device_id` varchar(50) NOT NULL,
  `device_model` varchar(255) NOT NULL,
  `login_time` int(11) NOT NULL,
  `logout_time` int(11) NOT NULL,
  `status` char(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `xi_sa_log_session`
--

CREATE TABLE `xi_sa_log_session` (
  `id_log_session` int(11) NOT NULL,
  `id_users` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `login_time` int(11) NOT NULL,
  `ip_address` varchar(20) NOT NULL,
  `user_agent` varchar(255) NOT NULL,
  `id_status` int(1) NOT NULL,
  `session_id` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `xi_sa_log_session`
--

INSERT INTO `xi_sa_log_session` (`id_log_session`, `id_users`, `username`, `login_time`, `ip_address`, `user_agent`, `id_status`, `session_id`) VALUES
(1, 1, 'yogisolop', 1611800704, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 0, '3e82a4e72f5ac75e56352645afffdcf608a0cf02622578ed1f086d694f39f513877c33b9266194bca5ba71b3b8c4d3a2b28dab153a5fd84bc4f403a8d5ce78d8dR781oWFvS7Unvlu6mQiHS/WtXfzc+NaN1Zl+IlO/K619YgHQK68Qox3Cz/NB4dr'),
(2, 1, 'yogisolop', 1611813127, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36', 0, '3d60e500c457d5d0b1a72133c488dda380ddbbdcf79113d5b6166ee913b588aeee1539df2d66cb6b920bde003d2ad0424c42efe95798bcdc3dd46fcfe4e601fbmcGoF/abR3wiKfSH00pJzLZsVa3JPoaI/3cRgeUTCFv18kIvQAhC2AvmeNYWKh2j'),
(3, 1, 'yogisolop', 1611924931, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.104 Safari/537.36', 1, '03a82206bb93f7615f1a8d26d5187102a277ad9899ec9763916f320a556ef1581b03b22e15a12cf4719d4c8912a2b5557cc14b8bb8a491cb758fd6151fddf429yFgbRNjC+G4P+dSg+7g4tXtkPLGAcf8wdUXYutqEvpd28b5ePRZLdR042FfS9Lvx'),
(4, 1, 'yogisolop', 1612082832, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.104 Safari/537.36', 0, 'f116fa6ac4b3884a2be2fba4963922d8f63ba83607a79908e7e3f29c4b40f3fb3dd4bca55f39ee4265fec1ff05c96fc5443d226d49e5f372835589f28f854c87Nm57D1PqLG3LU1xZPxsyRl+HSSN+B39WybFqRKZ0PcCto6wmDG1AmhDNhW3A75fb'),
(5, 1, 'yogisolop', 1612404808, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.104 Safari/537.36', 0, '3b48c2d33275cd6afe5b2974e895e30079eec060d05466bcfe19f08b7e00d9b360f484072b38bc57db0603eed5769f1c41add3933362469183ed390375d55125gjuRQ2PocEHkIaktLuJPQfPfPtY/7pvM4CxV4BScJZP/Q8FfROxEtbaquv/X6zg7'),
(6, 1, 'yogisolop', 1612492624, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.146 Safari/537.36', 0, 'ccf94c7fe4e31143807a5437618f259d5a834c76fef15cc18c50caea802ec9ed25ebd2c9f5035de4f42c6bc9fcfd60d40fc07beac03d8741d01e9d0d3fcc19daJRG+gJXeCrDAo4ftfbn1DLQPhqbexb5NBFlgj9ziDDOFmh114hCabgMmYdZg3yek'),
(7, 1, 'yogisolop', 1612581095, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36', 0, '14801f86497c192417caf80ea8d493a2796976f772893c3314e930fe1eddcd8161cb8bebd468b8f697f5b8e45206788e62226007b6415330137439a246f21cc9elLTxA1MkIfTX3AhcHTnYl9R7IoeKRsLM+PH5U/fSZlUw+irbydlbyu3f7yg/zzi'),
(8, 1, 'yogisolop', 1612663350, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36', 0, 'fb265114da304473e3b255da1974524e94547ac5a0dbdec63575a793580662552d64075083eda2e024aefc7a4b8d3c49ef7ad472975e9cbfb2d4be9e4862d21b7dQab/s/z3XW4sCJEPlj3LD2of83Ig0GSn8Mcopx3TMpzLIxH7YpgYv41j65o1FS'),
(9, 1, 'yogisolop', 1612842883, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.146 Safari/537.36', 1, '6ccd5d352d11a5acacc662d3b6f26e7977e8fefca27370dedfa72df81a1f74a010b3b046d75200215da45082da2c48ff586b9560c6e2cbe61bd4c549b048327aIuNKEP/TRq8isqmTM/olIKZS5xRVsIWhO24oL6b23UbSUr373ed2q7VnqILcxmaT'),
(10, 1, 'yogisolop', 1612845183, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.146 Safari/537.36', 0, '66136a384691c1e3ea650c6a46b88d4498b0939b9371493b060e9f4a24d35664ff2bee91f0681f2ccfde2a95271e13e64a53568c6d30eb53276d1d8cae50f798ITgp3RJ6EI2g2AL5cfqIRXrGO2bqoEjlW7WnwiGKj6QOTH8ZJ+mZdN0yZ1Q/OTW+'),
(11, 1, 'administrator', 1612845240, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.146 Safari/537.36', 0, 'ce39d4a027602e8b06dc70de5a3ec175f323707f6df01c341d4d378545178f1dfbc0ff8b3388a149119eb26d64667847317144af1510a5e9b2f1de75da72fd0azJjJtfKmcmbfnewQYw2lbOlSDE92NSo3SV0w6WINq0b5V77vyOXR6xiAvTCZRH+J'),
(12, 1, 'administrator', 1612846188, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.146 Safari/537.36', 0, '93fe7d7fb3da76797d4554d62f6313ea0759382d0394f3648dff3e3f7253081d5992d0d113818fa40caf9ff65980b2edc2833d42f0844a40685652ed5d78512bQuLQ7XDQnhAm9zF8P429MCbwZwNu5aNs9JixFjBYvLTm4rM2Vejo7dwHv648AqSs'),
(13, 1, 'administrator', 1612846363, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.146 Safari/537.36', 0, '37c278df1c4edde7a42bdd6434947d424d0d4634103657f5cc63457ac893d13b51f60e4af70943e841c371e5ee78e78ac2bd747942eeabeba874b558586d0cb5B34UJmMaKGZzgJMkeHJhtONbRowvqEtghjnrkpKOWY5Y+X1CBsEXS6kkV7rrvUPj'),
(14, 1, 'administrator', 1612853482, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.146 Safari/537.36', 1, '18cb55f636ba7de68471dfda0ee4da2d1d313ca38798fa850dc13a55dc9542e534134bf5fc50418c309621f6635eb750c29d355b822cab3d71607c47d14d51769InQhYAANXPfdCGKaZltObgACiYWlhbaoh6pH5rXSSGDEliUfprxHY9yS+pVDnaV'),
(15, 1, 'administrator', 1612854353, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36', 1, '6600b8eff41621dd98f6469e970b05ec469b36f095472bc30473978dea4459fa5d3bc1b5ee7826988df49678beb13fae098d418ede9e36fe162150f7ac0e59c7POVuZTdpHPtDt7I2yfTZJnq89Pgx5BsyvgMqq7Wd+f9DT5JCsS8uWlOVB4gD3N9p'),
(16, 1, 'administrator', 1612854357, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36', 1, '480164225bff83a578e03a31fc533d701048b187bb55d0e157139a3686bc6bbcf1a5bbe6c80dd91f6a46ca21ef1ff7fd71bd7410587fea43198f128696817758dc/ZJN/Ngglh2wQRXAt7Oev7TlToudbFrAmy41zvWCN6HoTKaMfGyjTzZT3OYMfH'),
(17, 1, 'administrator', 1612885384, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36', 1, '5153f728999a7a38810cb7e29a0a982c5f74c4657860dc312e7f4072071d9b1fa2ffa661d6b704ff35659e46ff71da2126487315279038d0562d6eb4944d4192tYBUnvTBaGIoROD8FQnrSg9DKbwnjjtB85Mi/XiMsgK13gsfqjbdHXwIkXUduIZp'),
(18, 1, 'administrator', 1612885386, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36', 0, '47886ca35247fd6744b35b94a1015e8717bfd6c60778112d89239b9a1d31a7768c7560cdf4a629118cb7f17203a3daaded025f37bdfd9497694da558dd53a200RP59JTWgrQ+m+hF+Emg2mJPI6ui2AJH7JbB8lm+sDQ2I4eoH8b3fwDAd+mF2+zgu'),
(19, 1, 'administrator', 1612890924, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36', 1, 'eba5d6c4ac49f6563c90fa48d3234cd06bf6b0779fafa1562feab2e4eef2c472286afa611d8bcf1c64f89b6cf9a864348915fbe72bf505f7a5311b97d8e60555uQvcrLgFlWaokAqr9Egf3/Qjn6v14GuCGu6SNP9dwTS0dVL7KLn1da50+T4QSmvt'),
(20, 1, 'administrator', 1612890926, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36', 1, 'b48a2240844d57ff7d84866abce2aa70c5ad10c7bd3a90fd755e77fdd0d5ff741c7089f0d3e95e7c54a8993eb234ee33992babec3d61e8015ef5fa6f5df147769IW08sGX7m76XQ6ASSeUfZUzQfaxMw7x6pnVIyqv10VjDEIGddQdRuojxUNKyNLM'),
(21, 1, 'administrator', 1612918499, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36', 1, 'fdd88fa7d008589651ea0fef839be067c7ab263ef19cba81e22e314c0bc39ca7b287b7cb80fa3321971453e76f523b8e4b22058dbd6ea28eea4df13e522d653bK4RUnl5M/5euwW8mRp3LWjw1D034OjCtQuKhDSjfV5Ys8ilEyrNSnAkKva4ELgn+'),
(22, 1, 'administrator', 1612921029, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36', 1, '877269381bcee2de4e07f9705fb02f88a015426dd06501baaaaf8fdedfa5bb4c766de1aef5b0767c779af6cfe061f2c3e42ea7aeeca37d756e0a0ff881ed0fe2cc4EW3t6utSoRvQDiuXOZ6r4RzRhQzNsrhWUZarCbnWuVPZRu+3IFwN2pRWMvMMv'),
(23, 1, 'administrator', 1612921030, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36', 1, '407fd634527203ca95a2eaab27bb0e4b785133e04e2dec0d0b70d77177db22f4f1c075afe2deb013074e1c71fb0432d518c686c90f8843f22f4412087008207a8/t8Cns3lpXWnQYHq2YlEUDyMg5P95tWaBW9YvEycnqrSddshDJW1YFG39TF34wy'),
(24, 1, 'administrator', 1613005177, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36', 1, 'af4330c12a1b076df94138d63c3e2a4d477e91af2d6129a69b2c0892e74c2937c3f27a320fc5378e41d6d38d61bba6b909552b7d433b55db1e9b6e9d5a5782c3Qm3/uqQ/LV436iN6lbpLbzHfR1YK9l0mI37uQCShLYqXMBTdSjipB9XbuVm1xhSK'),
(25, 1, 'administrator', 1613005178, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36', 1, '7607518f4734a75d930d628ca037edc9b7c5e625a73961d89a556060fbe0861aa232304110f3cc1b60aa85f382b2128961859f88db9f9e3e249d926be2aaa3888iewYDQuPJIZfuSshVgXNP0JC7RePP6bBNY1ATMd6CscXxhCZqfP8lJGJ/OH7kkt'),
(26, 1, 'administrator', 1613005178, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36', 1, 'f390d9d0a09290a01ab762cbefb6c6b9c5db34afa0c2ab8a8fd2b62d8360f2be07128aaee5d533dc48ffd6702a0596bef4b62e0e086e7e85725f702fcb3bbc992iXkM8S6omrkOOANyWOdgAZaDEh+BIxvdeVgg9Ng53kphFLR8tPLrQ+X5rEtESuS'),
(27, 1, 'administrator', 1613360217, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36', 1, '20e120a2c386deee0c79ea56d87dd09d9e3eac1780234de4ccc00828fcabf08367285efaade6274639cbc4f1b79487d11acea03cd1d0411f58d48fba0976495cYMvMVBuFFC0qtOvbRoqnhKzr0kXxbzPk7K7ySOO0u6RS5pmcGDiP2zgNpMJTy74g'),
(28, 1, 'administrator', 1613360658, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36', 1, 'c9304ef55aba22390beae6dfddba7850ae166ed55a798d4c04c2ab953b4e74fbb2a5e8f497c9fd6b288afc1ae25d67d8412d00944fdf9e4e5ce9c8a98ba4b890laxuAKWrWzSBLj0nSPOlao9OvbbUn4Lhxfab3yGLO+QaeN25YaVO/RpzRFUyp7CP'),
(29, 1, 'administrator', 1613361423, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36', 1, '31c977d4bcb67df7a2b15395c739aecf9c39f39c3f03c9e9ba7e2265786ad3643c81c5224095ce076704bb358a2d47cdccc4c87ca0e10d828b2263ca325457b2ri/lb7J2AT8AYo/olqys6/fZWpUacUhLTvzS9laM/D2HzEqgOeGDJpbhPSvwCfWr'),
(30, 1, 'administrator', 1613435542, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36', 0, '66e0a3e97a9b98c336dc54814b9ca99c485e3bb25582b1e6c3a4fe454fe75027b45f38385ab390d8e23ac791d2c6fa0b74ab7cd244005ed23de750f2a8bc64fe329ovwvAgDmuspEduBTdFLCv7KSXuNdkQA+vUEpzik9OJOMztrAsyD/iX1XCoRK3'),
(31, 1, 'administrator', 1613439656, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36', 1, 'a103d1023a592788c7ce7ca6e47bec33cfe5fa354d1257932cc44418492b4b9fb7ba461e4499d643c2f5c79f67ee0c1b293db03ce2d8b74ca1038125936ec92dyfrdEmBuPUwssy21CvF3NVYvN6SdpWbYsrhpOeEGMeJWWXysUpZ/kbzRNT21FN8D'),
(32, 1, 'administrator', 1613440964, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36', 1, '50683331089f279be3abf93497de9c9a6329f4c5bc549ce287bfeadbb028bffb846930185ae1fa1edf8b4741018f5d000391d936c62337406bdd54b17c9b1101r6Tvs/aeSPZhcIxfGCbX2Kc6fEjYnqjPbLmwQyV0r6Y+FuS17FuOUjHYmd7DfnAd'),
(33, 10, 'tio_kominfo', 1613443739, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36', 1, 'e08b0e476f0d334351b911a72a223150e14fd0c7d88fecf696250752b23e3254cd660886231a5eb60011b21372c4a1d6f9f894a54fd163f1f336992722b3ac09nXSy3MJjBNM9kE4po09D7+TMstKwWPgq8pJVz74wS5D+LXuzDfdmYbJ8r4CB52Kk'),
(34, 1, 'administrator', 1613448471, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36', 1, 'aee6405a1391222da1b84cc04d8ebcf17027ee01dcf1189dbdcde29137949ced9a870dd3e042c45cd3b896794e95161ce01a89ce05a67decaaecfb3048db617fU6sk7P2muTw+ZRc3V1sukvjUWfR4oKcz5qzlx+NMPkshOXDC1D6A3GYWuxo/Qwk2'),
(35, 1, 'administrator', 1613610021, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36', 1, '331f1adbe490b3ad14399ffe2ef1cafa4eb4c086f4911eaf839490e168ee5e80c2152c09ccee0fcd238532e38a39ec490864fa429c0f09070f96f1a621374a49kwZID18HgBbv+9DGNPJcWBxydiFVxag66VuC885Jv6NtMn2jr47ScpYPOCoTJ0Rs'),
(36, 1, 'administrator', 1613610560, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36', 1, '06fe72dbd60187fc28d407d466f618eec0608a0063b6147589baf8f1df70094983df899f461c6a3e77373416a0a0995525e150c55909f692734a16c0e4c43cad3UpX2azCk2E9rtdi15T4d0mAeWDtgZV+XFkUzptH6D8y8zoelzv0V0DTOlyjMye7'),
(37, 1, 'administrator', 1613610560, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36', 0, '2ce7877eab0b2c5bd76a6e7c23e0bf55e17403b8fd7c14d9491aec46b748a4e1f94cb747f7a3341850df5bcd59c9a30d68d09c2d360a203e03ba77762038c7eczswi4HnZy38gsWLDrGmmSLXjlmN6usl77oT6dxVxNHnZ3FWF279CK547hTzt6i/4'),
(38, 1, 'administrator', 1613611767, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36', 0, 'c75ae7a471e02e1c7bd2c8bd0f0cde372325c26d67faa8f6e0a13c5a65895228e69a26ab5758b48d554b6ae356184a721047e74200cdad22d2ab42baee3b7599q+6N3F/8eKjBKuUsXU3+K44GdOCuuZtYV9p1hi+y8JSWG/nYC2PcQ1v6rTjdKS1c'),
(39, 11, 'pimpinan_contoh_1', 1613613306, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36', 1, 'e48d2bf0190fb7fd3bc0556002b73c324a834412f9f410539513ffc0514c82b675e32d4ea3b2f429ddd2af5dfb72e57559c55a5ec52e984595f71d3365422b80hLr3ss9Ozi7CtjXH8LeGjn4iEhO5UB8kKfgyE9rsVlV5a52eCZJ14J1SfE/uCjFC'),
(40, 1, 'administrator', 1613613311, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36', 0, 'c989bf18181a0a4bb166ac80b73e57b573a324d52c9c2adc0718331a7b6c85693cbff6e06cf08b0a1ab7074022e9f07117adc05c303fad814234c9c5217f53eepGi9E8sDrt6619jDXXFqI/CDqjppJwU75kMnbGe16EswPjSb3f7PgrU+nRgNlw6X'),
(41, 11, 'pimpinan_contoh_1', 1613613345, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36', 0, 'f55fa8dd585c9ac68354a963090e680b59edeb7e7eb58e2ed8c9a16abe3c605aad5bc9467ec654201b4df6f853fc5bae6a02f43739b927abd4e73fa80cc4dcc2q/wA6EXcAa/y+3PnTyJskh6HDeoA9fHwBTnXdmtr+VsMGXVhrtfYIC3J2m6VN/5h'),
(42, 1, 'administrator', 1613616234, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36', 0, '1906de791222d17c585be57af9048dfe1cda5dc49d1e5ecd48f41b98851c4be7c28a6460e55dec7bf9d68760aab3e7571fa352738aa6bef7412bb3fda8b334c7X53v2xON5zi0fILlylbnxAEchL6rmaMlyLf+cnl1XrMQ0vFyyN/upS5/3H7yDSp7'),
(43, 10, 'tio_kominfo', 1613616787, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36', 0, '95f07e4acb4e352829667151df998a264dd2a36d97253e9a925b80dacecd8653c45b5fea74a75070874c77962c83cddabf64cc77e57147018389e0e9125f25171ddUqEOUXvBeR94i5hhWK7/NSXBJxXvqNQd75mwLC6L3OpXoX2mdvyfoSHNfikgX'),
(44, 1, 'administrator', 1613617023, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36', 0, '13d09d56ea2297e7560818069237f312d7fc42ed825aef349079ae83539561246cf9fe0ae3c84d4204a64408fee035cdbaacdf1838977ff26b2fe8f676fee63bUfEhcozZy349OHgepcVFytsIGmH7sQottFAo+jbaH6xjheTEw9lk6rThJRzxM4HF'),
(45, 11, 'pimpinan_contoh_1', 1613617031, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36', 1, 'ce451ec5361c98476ce361595998cb8f53399ed87d98a5fda4df1c643802995c0d46d35bf21b47f46bced5b5d7337f9a1b23eec97de6be03d509030edff518c5Ef+ua5vn8/fQD/DbsO6qhpnWjh/b1ULOktdmmma/lXPxDKnznLO1UWtvcQ/gBT9K'),
(46, 1, 'administrator', 1613617093, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36', 1, 'b92c96fa981256616eb8b98c5b46a2c87b13c2b599182ce57c9061a27210c8b45130b9525264877ae66d1da398d26f478cc18634227af637735f09e00fe390d9QAybYi0Vb6WKpQ9+FOJC0SlOk6yWIFP/QIKJ4j3n7PP8wFX+lqY+FhOX221Zu8Og'),
(47, 1, 'administrator', 1613617093, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36', 1, 'ea1321c5e6eaad7c10b01edf2637fa4cb5c1e634ed4f2d798793a2e6ee403db6ac4221ed8fc974875036c9b65b88ba6d40886a56b16dc5cbe79388f3c18c92635mWbsjmRg9TvUZnPJgogrWWGmyhOSyoSPCZux2v+gHYKQaDIjgpt0XQ0uUvmRZnw'),
(48, 1, 'administrator', 1613617212, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36', 1, '226636d872eebda74f0ed2575734cde3798f75d95e94539db0d7e1b51b50d8b19660a9957a887c81cd7ead59536911cfbb91910642bc071e6f52c0c9afc97e05p0BZFHjPC9XK/8CM0JFJxH97EkMB6HSG4lWJmSv+Besqi/P6wZQ7mhrOdCjGVdTV'),
(49, 1, 'administrator', 1613617254, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36', 1, 'ebc7685d1db17c64aa2c3a6fc6935f2c85a65f63c3de6086d458c331cc608505f2e51c9cd0c526cf6464007ceda68f8749193ff9b743b0d87dd8a007cd44d39afnCFOIuXHvvDa8FtCl7W4MAk8BTvTFFXcAeSCWmIBgYbf0VjTsbINg5N8A0QZJaR'),
(50, 10, 'tio_kominfo', 1613617301, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36', 1, 'e94cbda6534c19c4bc1a1edfce0e96e7fd4820013f3faa5486f86049666257001357379eb2f425b5de6bdfd2ef56e73fa5ef522de4bbf8d6d5a85d1ab1246ecfodkT58YoHL8nxq5tYGCVuVblpFhT7QdLLKkidIsorx9sNdBd+LESO/cBf4GKilM4'),
(51, 1, 'administrator', 1613635527, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.182 Safari/537.36', 1, '076412a72784c6ea5ecab1600887e03c7567fbd781f63c91182197109f1dfb3289796b22c71c4e1b571172e42c74cf1d33b3611a7b788133d25d9d06009eec6459o6StMYRGOPypvniVUJHArsKrw7TzWfl1G3VBH44NAO0H0hBoFPNZoKedkFEnPD'),
(52, 10, 'tio_kominfo', 1613638616, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.182 Safari/537.36', 1, '1a69179a5df4b562419e23d9552c798acfd044ac348c022b71f72882cb82e3d3996c33272df563eef2dd32efdc7a988746634c45b9ec38bc2b72de4856e5076dZNRF7Pp77QXDXq2qQX0VMlnlezl18PYMLpIvUgtsIh5WgwZOVWaiKKdf/pxTStjJ'),
(53, 1, 'administrator', 1613696815, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.182 Safari/537.36', 1, 'b5e16672620627f360faad6911c2004ca2479c1de4dc6326b7ec9515a9dada829d55686549965b45bf2214ab056c5be6126bd74080a3717c138508490bff3021l8dfTK35rvyJRc5EPnZca0NeH99pEKgHCNFgBKiuaCfPs7wWUYNK71E67qvJcEEE'),
(54, 10, 'tio_kominfo', 1613697454, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.182 Safari/537.36', 1, '1fe2742e88d545c143a0f30934e5d44c2675eb7b8a2d5b62a89f4114666e241621e8b689c627b6e8f909b93c4206f94587313a611b5e9e28ff8e5a927ae001de1zZDQMty7VyU7v+ZL3c6WQmu5g8Eu6qwXOKNus9kG3jSutitew0LZqlVHBTVLtIS'),
(55, 10, 'tio_kominfo', 1613697484, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.182 Safari/537.36', 1, 'd2b37c2c9d6f57b08dfd77144aec79088eba404aab49c3652c0b7ee8a62e9d311168b99b4ff753bf87a9a7f65c1a6e9fab285e56a64fdecdad9dc12eeb86feedLmTmRs0BTkx6ZlVmxWJdcg2iM8LpC8J69XtfVmxknO2ZAAFd8lPO1dk3cwYZXCgr'),
(56, 1, 'administrator', 1613698394, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.182 Safari/537.36', 1, '1ad83b28658fb915f21356f3c31f0e8acd03930d2cd282d051f5c89c75e667b2a872b927ccfbc2a2fad75a550e5c6b031154a26a364c60e0f8058dd0990390b1gw5aaNsLbXrhmcTzMAyWLsJDQOaf6vh7JTlyBjnf1KZGCUixKvkNBLHBDA3YAnWY'),
(57, 1, 'administrator', 1613698395, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.182 Safari/537.36', 1, '906f9d2f671d4cea04c7bca1d92ae718312f11ad608a3c5d864e09f6c740007d4507e0a0187063ab6af352f19325ae8cf21927a7a79bf08f2f297a2430e92155wOx41/OwylxDA3aNafdWaia1sdnA+BXHsm6hEqU5tyTXb6+Dj1VOlhuZAVDxHkmm'),
(58, 1, 'administrator', 1613698397, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.182 Safari/537.36', 1, 'd71bfeff49d46ff5046632f889ab88729eb9131efae28831c23c0dde1ac20908a8537dd8f38795350ae7c7c3ac1cca5fd13c4fd2c1f0fea81238e987eda3973cDFFyCsE/EpZJU86wq6WqP+ymiRZAz2Pi2UJclm1dfXLlzj2xalTWBnt2YZgBObvM'),
(59, 1, 'administrator', 1613915472, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.182 Safari/537.36', 0, 'db99fe0c0ee51b621dab1d316c45efefbe071a59d39b7b497b889e2e21106fa820845d83c236fc0a42d5fc0b395bbc3ff49b790dd575dcd5127e4c75af98b742RqW1AmabbVGNuvxv3zmyolufwYkyzEqicWt5wsurJvp/XozrN8bfbPoLv5fz8lxS'),
(60, 10, 'tio_kominfo', 1613915621, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.182 Safari/537.36', 1, 'bc5340a2e53cb1a4ca5318d3a2d19b61998fcfe5028fbb9abac2f67daf07686136759c379a9643bb01428ae282caa8f5e38c8ef058fb47bc9cba90321a58172aL7CkbOa8hkk1EvuFBVWhQ5XKRikc1zDjq9ljFNmPrfsh0zR7lxOqhaQaSf1mLjIH'),
(61, 1, 'administrator', 1613915803, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.182 Safari/537.36', 1, '3c0a2ae3356dbced0c3a3d40ae85ba70a38734bbe8aa70cc4535f21def7a58c767cca57ad2bfed551e70d60875b5c5b468290196ccbd407758606788a78d3a10EdFLD0B7N5hNJlNg6MY6uSG3jPqVpIOz6+U7wDTXMkDC4aGqwX5ro/isPREKq3OK'),
(62, 10, 'tio_kominfo', 1613955003, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.182 Safari/537.36', 0, '1b537b78a2712d59683ec3892803d35b4aece09845172fcd4a579b59a0ffb3b9eefa7a852d3a8fc77a679d384b6e8dda4731c2b5444c3c8d3711a88e8fcedc70/85fdyUy7yWFiU76mHyYQ+EO9sJ8e9QeNGd6FcfcpHG7ja07aZElNF+YgANuyjW6'),
(63, 1, 'administrator', 1613955037, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.182 Safari/537.36', 0, '68bf6331dace1c65d7711a64b85632ae5f6232c5842a4c973c45bd819e1bd3beb73cb8681a93347cb9b32f8d85387f156e1d351f05260b3e520ee5a8122bedc5SGm7YvVhOabTjlb+CFN2nqGaaFamuIPGat3XP1OudGiWUY5Y6VAFrTCE67YFwzAx'),
(64, 10, 'tio_kominfo', 1613957944, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.182 Safari/537.36', 0, 'ffbd4f0f3e1ebd445682d03037203010d449408d97517dd052ac8263e341b428262d411b62ebcdd33e3c10e08f5af8e768f10165088160f6600ccd9a21d1eddewd0K6hThBaxso3DIU3psL+kqOHTuMWuwMAI3y9GnvVX+MAtwy9UrkTFNOKZHU+gt'),
(65, 10, 'tio_kominfo', 1613962080, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.182 Safari/537.36', 1, '88cf37b39e650a8a20bc1a206932d94a92d4de0bfca6a69efeb5e246589e71c5ab158935cf1f3b19acba62226d68c902e6f348595dc4ae4630d7f6ace66586717IqNsbka4omswR0mnhYGMm1uREYJCM7+Rc/zqmcu2D5RYQ4pHJOlUwroWbXo7HMf'),
(66, 10, 'tio_kominfo', 1613962387, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.182 Safari/537.36', 1, '3a4802b4cb4224343902f6850e261c3f53352405a8229aa80a3f9b36b369c6f6a58cf2ced6c8d7290cf09d7fcd8507a8b4b2720150b694082444550c4958a40eu/RbSFTVGlrhy9e8uCQYLw6AIgfM13zu77hyvp0nFikUlB++14yDrDZ4d8iDiqvN'),
(67, 10, 'tio_kominfo', 1613962409, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.182 Safari/537.36', 1, '7652a91c8452dd855e1e8b2da3d563907f28e8b911342552b05ac0a9c5ab41291627e64bc90b348ddeb9d43cb41d585da8bfcc8c71dd4eb8cfa1c17e147a0691qM2bAKpLNsst+4ZZ9Cbxg3WdAdI123VydfCm+rT8tkTZns9qus+QIxZW+QuL0aHO'),
(68, 10, 'tio_kominfo', 1613964375, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.182 Safari/537.36', 1, '34f81d88324a3086f2ede72af2f2cb9957789d8e13d1ae2875fcafcab1d9cc8c33af0d3257b48d3649c68549a4b6541e3c4bc1979075ad139a0f0027d9675c8dAcRJW3T1iUpeg73xMI9GSk7UPsPzS5zWjd7fKDp3PHvAT8bzfus97dIDR5krNLsO'),
(69, 10, 'tio_kominfo', 1613964394, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.182 Safari/537.36', 1, '622c83fb8849f300dd93f599f3ab200cfd1fab932af47d4f9b60f074441dbff124f4e888ea2925f0db2cf418027cb3fed10e5ab3bf5d6e0404fc13dbf9405269kdKpXNeUY/Cn06M2AljZmOv8c6WWzKiW+fUOzYwAv6eRvFX12tMB2KmNtOJoq74m'),
(70, 10, 'tio_kominfo', 1613964476, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.182 Safari/537.36', 1, 'b80ace3727b6463987e6be2b5c7f6f97c1d5894b3e20988bffb7491d96dbb2165ef9261f9edb5419226ac9731754767896946da5892ee05d5a72055d15e308e8zltRHwrrlIcedWlTCKjQsow1/k4nwRG8gZ9dALHkVthJ9UB1f7NXq7kNGrCAdx0e'),
(71, 10, 'tio_kominfo', 1613964555, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.182 Safari/537.36', 1, 'd2005fb474bb960ee5fb8a569f8adba159ea02d046d6cd51b04174c9b5ec4f596c4d3f6b71e213a37b82dc0451d3f5ab9998b45eee39898fe0476d3bf40ad00eMkAVp/KaSViB+4U/mFO4g+mN9vGofdwD2I4SEpX2yfblynwZ332yxZUEd6895SzK'),
(72, 10, 'tio_kominfo', 1613964578, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.182 Safari/537.36', 0, '642a4e7ef5f2cd16fdcc92ced41869cf0835604dd1936c65a4139577f2770a5ce3517c9b0544052c3685413312eaf5712f9ed789e0b5f5d975415e4b96be203dO0DPMr94F9rZz3X5oa5Z5hnW/5zKEQA//t8zWWVPsO9bZNVxEETeu2E4FfbL0Jk4'),
(73, 10, 'tio_kominfo', 1613965310, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.182 Safari/537.36', 0, 'c261e4b3cdc91233e87baf28349d615f8d72e3d4d67417df5a483d22671b93f0af638544976ab11c330bb76e72fc29275aec2737130e2831e23eb1faa13e465bY5k/VwB6STfLxRlczOTL5qM0WlaEQ4qxomu7nB60VEIpzt3T/uMTIbNvhcDBDCD6'),
(74, 10, 'tio_kominfo', 1613965671, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.182 Safari/537.36', 1, '5d6d16a24a72fecc320388237349b0b88c6b21295a2c3f75709731700d5859dfb98d4739cf02b6edde6f53640f9eee7754f5ff42f0a3aa7f3f3b045d4dbb0550+yGE46jF0uqSFfuWnnCNKIX5TdDJ1+PlfONPsM34m53Cn8WxRkWG6fLbUrWHeA2c'),
(75, 10, 'tio_kominfo', 1613966405, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.182 Safari/537.36', 1, '96f11be750d94fbd60f3aa5361290212ee69093b999ea2aa3a92a84ddd9a800e504add15691018bbfbdd0b2168ab46645cdb7ca55e78a241b05ec235de450dcf3NaYG04yFAaDHxMZH+8aHS9lkIHXdzWjXqgIFs/1VGSB93NMARBw9Bc3n05pn0PE'),
(76, 1, 'administrator', 1613967914, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.182 Safari/537.36', 1, '8504059e2bd10d3e1e1b8a02cdf0cc6ecfabe8baa3493fc5c70e46889a31e0f76df5bb243d61617b3da16b0b2e6a457ccaca6557c0d37e58a3316c4f461840d1Py5fUKm6HzjhSVnwRgrCdEgXke802S8DfV1gGsJtluTSOqfAgCpBwnCPayp0neHO'),
(77, 1, 'administrator', 1613967914, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.182 Safari/537.36', 1, '34542985e86aad1ed3f2e61ccc0467de2eb4177549e7b041908c007f4f8f9d6763d974102a6d4052a51b4953fe46df28cbe9c651dc4a73defbd751f0fa1d73b9nFvYwYnx9di8tc1aSDg+82NkceA61pguSp11GBwwcM2rjuWSLPtW7EDu/I5STHP9'),
(78, 10, 'tio_kominfo', 1613976647, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.182 Safari/537.36', 1, 'f44f4fecaabb41395c0ac7b53864d850ba42c009692ea8cf9501e9471612412686d79c2c6c25e94fc47bced762f5496f8f419387e827aab308ed397294cd0156SaHywHa0WE95u/Ryz/1DabQScb0YOZPoQ8lGVI6tTKDJHNmmRxRkJAl1+KORExXE'),
(79, 1, 'administrator', 1613978544, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.182 Safari/537.36', 1, 'cb850ef72b20633bfd0631fa1c09298a53c7809aa2d97ec408baab2d9bb21669085da09a85a7f47a4240da5cb293f569a79c23538c117f59a0aa1bdd1aa13efc/AL20gOw+8wMPa+NzlAlxx7N3rjaYa751uPle7JVJbUZlyinf6DFvd88VXk6h3Tj'),
(80, 10, 'tio_kominfo', 1614040915, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.182 Safari/537.36', 0, '9c10e1379d45583aa774ead82ff8712b09da04844ed74673433debcc743c97fe390d11bff682d500a6af39bdf0744923039d195b3cfa8cd4cc20c1aa1cef0a0ab16n2f8eRw73X+jbVLKl6+vSOWT+vK+hUhiZ3lIogG/4orDNKj+Lt2Seu+k8ziNI'),
(81, 1, 'administrator', 1614040988, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.182 Safari/537.36', 1, '0a6a787091a7e929a4d3da243883426a4f9ca641ceb4707ce08b06d7636876e071562450da85f82d23c238c3a3234f07ab6a92b7bc5afbdea91723952953efecvfPHmHSGUYJfYd3yPuD5SmYEhGe4NGti7fDtg2K7I7VGGd9YAWXJdZUw8DAL9CiS'),
(82, 1, 'administrator', 1614050539, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.182 Safari/537.36', 1, '576dbb473af7c6e821b85cdf4acaf9362ed70659ae86479f287890b05f47c29f6a663cb346e1e9d8720cc723556cc8708c2799a42de5bc82b07c9268af5f85f1J5Uv8GFzjdiG7O1Hnmg3gUP/5HPH5v0ZQ7lRNiHtJ6sG2h9OxuX9+3v07dhJPH83'),
(83, 1, 'administrator', 1614060213, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.182 Safari/537.36', 1, '1f7943af753905c3ad098eaa50a156c004e5f35a86a9b56dc7562d985f7580dac1f0e6e8675d56e193a07fb4349f80774ceb10e4355e5662a6203aaf9fff095domPWG3xL2xi/mv1bLu3PIDx0Nn4zu4ljC+uQt6SlCivdv9ZFj0QLZfju8s2Gk2DB'),
(84, 1, 'administrator', 1614158156, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36', 1, '613eee6246513f594acf5012b1ff25ef22222c43d40672218d059918d8f896684a9ca43048a3299207a6cbbd5e462f115ec6d930a3caac518221f4b6a1783b0bGyH7eWqtctZ6OeL4h2cCFU42DK2hvGjuUy4IVCmeJNAnlx6SlGuzCid1/tsat7rU'),
(85, 10, 'tio_kominfo', 1614158402, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36', 1, 'a0de5e2d09ca5ca5a52ea980f107d7d3f4c5d8230ed3953a8d9a522f801daddd25f4ad8ffdf1a98a4c057ebf3a0641ef1bb1af09626e892d45275b64bbf65d1eNI0L5y5mHkrfGQbpDf6ouFpAtCwEgEw7fc7HRJ/G/UwoBXt2F0qYJapvLYMW43RX'),
(86, 1, 'administrator', 1614161437, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36', 1, 'df60484aa27af837510132604eeebb7000a51a7bbd63efa9fbc6ad27f533f06f37df0351e4d38b0594d70d3317c597f6d9ead34657eb813f67da8dd35e69e263V4cJOb+rGYwjhdrkFfvmbqqqXvok3oUVkY03EL7J8VIyc0wMEow4RBTUhwjBzwCU'),
(87, 10, 'tio_kominfo', 1614175101, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36', 1, 'b2b8adc20e23bf85ceb97fadaaa035fe1203be83011066c2467a1743a4d3889df2d5ab049b0415242857c8f8d809ee65cc0601cdcff238b2c2232553af263d203J15Q89AT37w8P2uywV4y7otSWelILgs8q5MYLD3uyWAB4ETYXbZ+kkAiZPBTqHX'),
(88, 10, 'tio_kominfo', 1614153532, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.182 Safari/537.36', 1, 'b84191090afa119b92adff5c85830aabab068d902d35f1e385b334233a14a431ffc65d1c247ba47e0dda56215a966149f7c6fd08cf674d4cfeee0fb4a31ac520oGuR9qiMT5mxwd1Wp4QkTubV07uCQ8DeuQ9ewv0Vyisv5h3+rsQFk7//kocbe4Np'),
(89, 1, 'administrator', 1614235197, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36', 1, '541cfd4544bc1a32fd17fdb58b30d6256e121f6a1223b6b8acb3c7d80da0ede03c1504d842eefc16814e2e955893687b89bd91d36f6337bfd3fa2a39dac98729DleqAM/WxULc7kiWqpPE00vo7Qpp7gEVScdfkM2ogrMfHmIEL1KmMGgYVetOX41S'),
(90, 10, 'tio_kominfo', 1614235240, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36', 1, 'a1e2064078c7c0c1de4f26d584aec2b4af43b1b2a8ec14869f0cd024e8e698978fb0586645f4f4100fe2e272751554972b1b0ffe266781eea05ac3c9daca4260atRrbjmDGoy+2W2Joq5raR2/4BIg+qe4o49b2EW1TRKJIEsIBJ6JCJrfEo3csL6E'),
(91, 10, 'tio_kominfo', 1614215121, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.182 Safari/537.36', 1, '35ff5d7b5f39567f1a826b0b42aba3ebdc965646b446037d965e47b6acc0ef258fca3ba907eb5f20e05d846db5cfa5b386b87406aaaaabbee285c4a430818604lPKtg4aKvzFRe2O/XtU/Vporx8bAPu68i8Y9Pgx4dRqm/otG9V3stZsTsBYgEJIa'),
(92, 10, 'tio_kominfo', 1614222246, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.182 Safari/537.36', 1, 'de50a39645a0147c5f3c9253a98c4318d03816f9b007cb34e3d4e2eb0b597ebcd494a52b502974784c4bd9fffc9cf6a832e7a877843c3db9a37d7c41757ef983+2NVG49ukkAQ7uCe69kKmWwJKTQrlwmStxqPEuGDvdsMaI+JABC/d6+6uDOpG21D'),
(93, 10, 'tio_kominfo', 1614222256, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.182 Safari/537.36', 1, '0b5051e4864fb1fc1084f44772cb756d1ef0fa437cf81fcced55ea22e82ce8618d6830d6f5bbbfe39e981241541fe85f54e3a91f55e0f06ff54028832d0b0d1cJvBpfYhALH9hPpWj2cmc8ddgTz+GIF81qUUWCZclMLBbNCVDa4NdlB71RZIdZFKu'),
(94, 10, 'tio_kominfo', 1614303736, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36', 1, '5d4be35a54b4fd72999aadac1552e4261d179c3574abb24404a7d1af99bb7d1ebfe44472ec6279d262a3a8cf2a17c1ac49df471836f9867b7c375ae4d35658c7BV7uCmgEwITlNZRTs5XNg7sf6vrzg+nXoHph6bsmdrGxuLVhi4FHqYVNbrsF5Pwy'),
(95, 10, 'tio_kominfo', 1614303737, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36', 1, '39a9bcc32e5c21fc2a6ca42e165bc83fee55cf011fd78c2bea0a03a023972c3b6f95d4977cb276d306c7cb47b4fc8c3420014846ecdd19e3c50c5a62fdc263d0jNQlLQEZ5eBtPWQie1HFOZYprTgS+jvwGa5clVGoVoCwuYA74hn+GUbVuQWxu4mQ'),
(96, 10, 'tio_kominfo', 1614304302, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36', 1, 'e9637cfe09a669f0f1900389fc1539cd74043f78df832e7262e20645f5fae14679298c54046c30b9278abec1ddc8761fbd13d3576bdfcaae3fea71ea1536b5feOUegOKjZoQNxbaQl6KSAkbN+G60COvhVMYbr6Pt79vJxpf30sy34G9Ug3HS5B1I+'),
(97, 1, 'administrator', 1614312053, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36', 1, '156751c3dfb826988ab903ff41d35e4d2fcf51c3743006aa0dc598e64e4d1ff2f5adfba4365039824a3c3d86ea79346051c6f8049faeecb4e8c6f67687508f5b7dDJPO8+FtTVI0MTb/ecjfW9oM7QXvtlCOf2usZt4mfVbZfmhgX3xSWZ9c4B6T/i'),
(98, 10, 'tio_kominfo', 1614327395, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36', 1, 'f71df0ad90b3ea80b3bd17e97318246afb63db7ff8d883733f023acf1985be1e5cbda15e3e3b8d704b44936aeef63f79b8fc81d68ed239822e96362c22ca4148fvTbRmVf4OndFydd9omsd0gUj7qg/jXVP0+/Y2nYGN20l97mMbSOPGriUKj3CALQ'),
(99, 10, 'tio_kominfo', 1614330872, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36', 1, '3259173f24695262eddd899167178d2564321353d6ec61f070f6b0b9958a2623d373b14c11be0c919d66dffbfe225e6431e7348eb6e988b3563f658e2bc3ddfdtCoBKNMz8we0oNhKqz8ZInodHM5pFPK8ktrAOgsRZd3josjhXvoQtB7XPlnCVI2P'),
(100, 1, 'administrator', 1614560194, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36', 1, '323410eb7dd748100042c9543ff1dafa52c7931b99564c51dcfc1394107be079d1a1dcca5ce7e03246dd9579d73db5cd4fb2ccb2e8c342c34eb19a868b23c737iZsQegRi+4uK6yMoJoIGoI/FyA6P3sRsXXXrzMd6HlpbSKGI+FO9Xy/CK55K8js1'),
(101, 10, 'tio_kominfo', 1614560278, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36', 1, 'cb704904a52c11247e081bfa277e127242585a05aec67fca23918dabc6434fe9a7a22865873954f29fd81deaa31b1e45223ede36dbb3a13f970a9fcb510e567a3if/CZnzohrrhdgYuCBDzoRUapo7sNYTa2PHHhnNXme7Zvy9zXNEWqIM41p5sKxe'),
(102, 10, 'tio_kominfo', 1614560470, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36', 1, '6b8811417f637b73cc6725d09a17a240f7c2be88476c447878c0012160d964315f9bcf0dc8e1bc720a177374d29ee47424406c7db74e47d016224d63ebe400ddo0fYb/PmApvWJMTe0bjLGL+z4wGPQ4DVheI34qqCORKXJB4Mbdh+xqea3Oz3QLYe'),
(103, 11, 'pimpinan_contoh_1', 1614572697, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36', 1, '20debdc940a4a05a05967e4019b68991b7f0b5469d18d1529f0e92cec0663d4a6106e5bd4be90dfb0a33ca296a77476d6d123491155cfa83d1b2b72e70e17e87FPV3zv41YpmzZ1Ax6J9oqwuY9iKhqcdz5oX2n95gIWMhneAnZ9XPSi/J/Gm5PSq9'),
(104, 11, 'pimpinan_contoh_1', 1614574848, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36', 1, '412d7160a88f0f717850cad1e68e42d9c410824e0412c49227b34250fd837efe916525dc8c33e2e01abfc00ee56b02623e1eb94d62a77bbc187040d70efbded97RunJpN8o9xgwZhgJbKQgTHbADn5I5C+uCdHQXkr4hvLAzP7Vbn3E9CILDqC5Cmg'),
(105, 1, 'administrator', 1614574883, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36', 1, 'e90f73cf1a76828e76d7bd3c1c2a2b89e13ce9a4c6e9bd43bd00a9b8ddcb6c2af23bcfe4a7abb3bc4c5c97e8c98853f3441019408bf87b911a4ea70839c02e2fRXdIbyD69z0AKNtL29ZWTKseswKIAAarAvOvVHrpmY+eXxIqwJGi4b8lqjA3xsuf'),
(106, 1, 'administrator', 1614574883, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36', 1, '3d974e83abeb34b0e980ff8acab49c5fc8ba21161f3772aa9fbde9b7651db5cdcf948abbc76677f1ee9ef27d4b001cc7387de4c9fd5d683f1b5f14c627684cf88SkXfDy9sg4wACCvLHJ6l26zlepoKGloWGGZ6GsXo378n9ys+lrEV5rvJt2ambEW'),
(107, 1, 'administrator', 1614581859, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36', 1, '42c310defbd741a381e30f95a2e1a68848ae5318c52568128f0765056215013aa10a06e687cec4c117a0e45ec8df31e409923ecef239372df1cf86a94268d6dbIxFcwkDYuea9esn2ggM1P8CC4fQZj5ihwhfs6pQpCcNLlC524/KJZpHFIE5tkMD/'),
(108, 10, 'tio_kominfo', 1614585625, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36', 1, 'dd93add0907d51f4cddce89c552de092a21fcbb0064028840b724b5a13e5cc3b3cc5237490007018b1d37712dd4b3fec803f9b3abb493f8086a6521977a114c1aPdzGV59xtRNlVdf/n/JzoWeXI93cR/OOaaTauvZ3+YBLAOKEefEn5ieKx1Od+IF'),
(109, 11, 'pimpinan_contoh_1', 1614586086, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36', 1, 'ba49de9d5c117a6701d8ab538ed9f26177372db1526f7b4c805aaade1766ab13dc18fb521bfa85909be2d860f5b14d9cc429a92a06cd3d24175e079ec0fef788l/vqwnler4UIWEXv6ZZyprE6kiXyBQdRx99xNPwepg06U+CGaYtqXBr1cwPIo7KI'),
(110, 1, 'administrator', 1614586154, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36', 1, '4889f1746eda857e388ee34043d30afcb0b7c61d7c252433351ed9d8a5a034aa61ddb30df68e45b783d6c7bded0198865e54b1f78005339ffc0f660217d0ced7373fthaE/+1BC4+e2GjJIWEDSkGCSNw/a83KjFkEui946PpnOcz9Wvj1Sk2qTmMm'),
(111, 11, 'pimpinan_contoh_1', 1614645574, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36', 0, '86ec352698462a793c6c2d57c0bf12570f1b78a6d501ad47bfa64639c392ea8b31da1a6ffb5c95a85b7e581bbd01fc04363d288b3cd890b001a3373f8ea3fd78S5YR96XTxZmOUjYUP1P+jSlEfFd8KfiQqn695oNGPHP08k2UOR5D59ds6Lq1JsZ5'),
(112, 1, 'administrator', 1614646020, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36', 1, '4ed30ec924720186900dc960511c58b283a4363c5bf65b0680a05ba9dd66639cb200030e19d765c4cfd66e55ed4d108e042771213938aa4b2deb603e380189f28mNc03Y9cCOGCwR68Zm/Qr4hK8pPdxfr2jgycEpdyDEQl3HPTOpSMfHwQ4LI62kJ'),
(113, 10, 'tio_kominfo', 1614646054, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36', 1, '62f17335f56656a1cd1560e681e4ee3425346e3e385eafa4b11dfeae97c618dfc631aafcee76086bee417e1eecfe79ab86410771c5a62cb617f2db3a890ef741Bf9hAKLnajPRJbsZK6Z4MZrR4MDIJNMBdp++rFqmjxnhcphY6vhQ6lVf2CmKHz9i'),
(114, 1, 'administrator', 1614649188, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36', 1, '42bd23a7a3e8a37d994b6f3a2e1df7a4fefcab4469571f05db4c72edae8e2f9bfc61667bd9182211f076506c2dfca831ceef97278af6ec870951f0f46049a8c2g7vaV9rXBv4NT7pZT94/1OsosXSkW/xUhHF3/zTxqLKqumYLVGtz1EtipHUIgQCt'),
(115, 10, 'tio_kominfo', 1614651201, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36', 1, '1e634f8bf40e59b31f08c7747645308ddd0f63fd652e58f40a11bea482dbd283dac42b5579f88a1c7f180f5d8d8781d125616a0e6982b4ac441e51f14c362ce076xj1yEpcfF7lCpYLN7dEA4iptIZYc3xozq9/x17pSRjqmdpF9Dxu0FyozkgxaSJ'),
(116, 1, 'administrator', 1614732751, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36', 1, '5681259106e694d9e76cac836907e0497e0d92cc41b6bd4749b85acf1ceafad40ddc9f6461f94f1f78e664da207ae6d651aa7a72f1e1c4e862149f5967159339Ka5nOS/LfW/ew8tP4WqxjYkb4D6MiYEZsYZdXGy5SaqAbLJ1S5EEGhU9AUrc7A8Z'),
(117, 10, 'tio_kominfo', 1614734999, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36', 1, 'ccaaade4bf32faaf3a7bbf724840af40bb4b48eadd1341b659528c8460042db1429f0dafe9895401388ece7c91adac74c398a40224826dfa1e86beef176807d3wNKShdOf3c9XhF94xYikSx2tGydUqQl7AncmsqGKUYzkqkqtFYZNUc9RJBUUpzCr'),
(118, 10, 'tio_kominfo', 1614905139, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36', 1, '4f2a084c7399b201129ba8a357a54936d605cbf17046311beede684ac9d33b5eb3bf1837c19d42fda65354b37eaaa42262318124a073d944e8ba28b7e2d49c87d/c+VF3WbDtnn7KnpXQRg1in/BEjuY4ZU/vcnPnxfPHvNdp192bYP5rFkTyuREq+'),
(119, 10, 'tio_kominfo', 1615166540, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36', 1, '70ab5073a62db9261d37d098d720fcf0fba4f1e5c866fbf401df0284685219a56ddf0ee630296bbaab63de54ddb8929551b176cc700224bb9e89e019cd5a66a6esqSiWHRwJY+CkWvi6xtFzzhm0iJoDVWjLUSiBzEF8Kq54F7RQ+wQlkRUyIiTn+H'),
(120, 10, 'tio_kominfo', 1615168937, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36', 1, '06d868797cdf5099f9103fbe43829ea70ac6d0e9c341452ee069016a59e2dceb0f62ce749d27dde8a1c1e499498243dd0fb222eda480812827c97db6d9538d31UEVw9d3bVn2IT4yE2qUHeSZaxeh4cOPbjrh1gt0Y7gD+eVlTPJYl5OTEdzlUZcny'),
(121, 10, 'tio_kominfo', 1615170950, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.82 Safari/537.36', 1, '23eeea45e09de733cad8fa4b4bb1ac22c0517bfbf27b10570dc20ab2e9b7ac9ddc803b90f0a247c5827edacc80cc8e351c61d829e77f7def090db8d26f7d9d9fQP79ZSW5BVwS0DdxznBfsNpqgy9c4vg98Mq1QUh9hS3iF5Xftbip+ULgjnbGF37v'),
(122, 10, 'tio_kominfo', 1615171019, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36', 0, '861d006546de419708e0f302f3c4aa9d5c792cd71584de40b3bfd1e173a24243cfa5f8210fcd1e2094fd9280f7b06e7b5db6394484e84a8ad22926d528d3fc5d09QUfPeR+OS/hmOyqsLFD2Tc21DOm6e0XG3NnpxV1CX/ojE9gQUi6BDhOczF5TC5'),
(123, 1, 'administrator', 1615173735, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36', 1, 'a79c3e433beab5071c79a0ef751b6030430a177b425ead7513c52f9be5a848764f2b1ef4341ab0e1017f26d71309f37bb448a95fe7ab5b636b200f44c8ee4ae8gw0ix4QXok/n6p5rcRv083K1J3DDGOzqz8Y/P0XqibVvpFiR10/TLvFW7mHbbEMS'),
(124, 1, 'administrator', 1615252444, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36', 1, '07a4a58f0150e6a1f1eddf65f650407af2451cc53cb48e51e779e63157a94f54220137b1ea2c5e21dc00a4863594b3a78e922eb3968e6eb6ddd8c61d38429fbdfubW0zrCfvvhDe0niryF1gTVzMFB8UZ5LD9lq4pIA/eZxG6CFGXqEb1cCMkHxvMk'),
(125, 10, 'tio_kominfo', 1615253671, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36', 0, '6e847318e11c7599e3af909913090162f9cfe6e622b987b6645265056e6794ed389a0b5d5a0d72941b52ba338663d8a1a684257a41579923391d4c5dbd9f8108Bye0KFBMXOqE0usCJMmx0TUEjFK2KyWb7Njg6mAQPTDcRu+yezD+9d4Dq6jTmX4E'),
(126, 10, 'tio_kominfo', 1615253803, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.82 Safari/537.36', 1, '1e97599e8cb572ff3a37051577d919e833bbcf202f2b4c22ddac775ebf11f6ed2de96be858346d84774dd07ed2d34ba04ef22fb8022caca8b7367e59f5b81f7f8fhXLbqSTcupxMqHAdEX4PH4Ug+tRE5sBTATUQyrcCAmqNRjLGPOkD09isilwv9c'),
(127, 10, 'tio_kominfo', 1615254966, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.82 Safari/537.36', 1, '469b885ab623f702e52da77476a5166d2ae816dadb82f955e222e8f4abdfdba3816ead2817ed59e390cdbf14f6a42e0c77da54477ee85e4890c1252deee1644crqkWgDjC1KkvrNcEMmSQUirntbnb6GpcJkBFMq6vlLcw2ZtD8MRc5rh6zzrgXNJo'),
(128, 10, 'tio_kominfo', 1615255161, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.82 Safari/537.36', 0, 'b84748d40676a02eea0f90da4c553d241e11739aac8c1246976c88256ed7d191ff5fa48ac0079d47b2e66d3116a007de2ac2a95f646e53550ec8a0e7e3b9c6602x/3o4RH1Dt9lPb8ue5gt6tZ52Nxp8PsRrc9O7feaAlKMJwfHBxJOzD3EiBt/B1W'),
(129, 1, 'administrator', 1615255735, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.82 Safari/537.36', 1, 'a45dd1b900e754985e4ad23fa9ab77cabf15c13464b581a6abcf7507a8f92b3676ef697ffb8c48eaeb3b87e0333a7ef6e8bc573bd17959e4a513178306448d41PCFaPhncpANRej6B3hVGsN3Dt8wwmlanraehkqWGYD0Nnf6rqMMzPT3ui6JN7zwe'),
(130, 1, 'administrator', 1615255736, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.82 Safari/537.36', 1, '4efa90c07f10bcfe4539bb22b147e50813d307169c23a4603305e965042f9d30b5ebef2b2e5c06076b602182bc0ccd4d64a78711edf5e4aebc1e99730430e078a+ak+niW59HEnhox7MjNfiuqWyzT7q0DuH7MAcVcr9UFiRhkNNzZ6iQKqhcFZQWD'),
(131, 1, 'administrator', 1615255736, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.82 Safari/537.36', 1, 'dbbd87eb1b1276e22d0b7141dc53205ce7614d53dad6291c31f625e839d48ff7f1ac5d3520069a2b62c852b7b35a8416303841acc073b2c295d862ae4c1f7bf6yWzlrcMcgOyT2zMrebwm10jBIalG4W/e3r+YnO5+AfhDX+5TBvMRHRSvJiEM7EZo'),
(132, 1, 'administrator', 1615255736, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.82 Safari/537.36', 0, '902a5e54e2ba5a305ea5869ea1a89e46468f20a6327ffb9c5ca4850472c7054580c837469463233aab2f5a47df67f981624e1f9a5d10f65ba783fd16b35f865chkPC2pjqVIWHaEDnAvJsSgIywZ1t2f0nkswke26kyOJMjBt1jJXlTpXC5KLUep6x'),
(133, 10, 'tio_kominfo', 1615256307, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36', 1, '59d6892a68f06620b35702603bdf8ba48622b8cf54a866cc21bb260563be6819383234d6337bd52d614e7ba6c3961e2fd806eef3b5e126843870d13b127cdd1a5E5f46+b1cI6iYIsfeyjRoR7ifysErxwttoVET36n0DNynSEaMCQHBwdUM9O748/'),
(134, 10, 'tio_kominfo', 1615256600, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.82 Safari/537.36', 1, 'eae77b6fc4de6a2955caf7b2ba5e73bac3df593735e8f163036adb05c9ab02bd6fd682008a0a1c584a697b0e763b4031ba94536466d89a91d19e03bbb371a860KFCRjMU617q02tkyZimpvNHCIsTIMF4W48kVrQhmgEKq8pX1zzjbtdxXQiMeX3Jx'),
(135, 10, 'tio_kominfo', 1615275139, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.82 Safari/537.36', 0, '364c3df97abce228aa2432c6df9d573029d3cfbea8d94922b66efff6d73bfba9fb076f167410811c607c761a2a0b1afe03e09c0ca60f190ff61f67b9a989ce49TQXpTixJltnuk/Hh/7VQxKfdza8nQTB4UC0X6oKAbEi4vPEvh9cjhd9YbgQ9nCXb'),
(136, 1, 'administrator', 1615277153, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.82 Safari/537.36', 0, '4a5e57a0ef29c75fc192ac9af7245a10a2de46ab82836baa70f64bfd42a4412d13241ac6e32beb05e3a093cc4c64fe890c6a36d56560083c96004c7a5f49bd887LAktSFNJFZMoVsmgzY8TfqQ5fwcp0LgeouvvtJyLpKwJz0dAvDk0GQol73qairq'),
(137, 11, 'pimpinan_contoh_1', 1615277195, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.82 Safari/537.36', 1, '3e6fe508b99599b1a48b576f2b07ccb591e1b1f3fee64875266756a94754f03848726fdf609d69301876b6e529a29bfd75dad975e831a6837dd93a85c619af39bWXAz0zLz2/zXeVIAEIfZ92Db8Hk6WCWGfq1UYqeZWuMRJ622d9zid328b3RRiQ+'),
(138, 10, 'tio_kominfo', 1615277688, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.82 Safari/537.36', 1, 'bceed964b368c728612b8ff79546b173a12d976fd49cc3ce7d24a897d1228c312da53988ffff47ce16b94a1023f9ec8737fec4560225ddad53fa4f06f34cbef507eLRtU82304dXLCXjJGzWIvQGAhgtpoVMDmUXhXK1aKE8uPq3rLMkSGfOjD4Jet');
INSERT INTO `xi_sa_log_session` (`id_log_session`, `id_users`, `username`, `login_time`, `ip_address`, `user_agent`, `id_status`, `session_id`) VALUES
(139, 10, 'tio_kominfo', 1615277703, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.82 Safari/537.36', 1, '2cb3c801aede054c9f9655ace36437f6ae7f7b5d23a50e9b5771c1aaf974ea7f4158bfafb88cce6186247827af3663e0ae898d1aeb56315f1dd0aec0f5a5e165aVkz24+binghcg6Gq0ufUKXU9EjBxIV/NxCw4DDUnXZ8nUPyrEqa5UYE1Ni69ziD'),
(140, 10, 'tio_kominfo', 1615277859, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.82 Safari/537.36', 1, '47031bc23fb86e55cc391aebaff7db4ab4eaea0fdd09128601b2fc7b0a15111300551c7fba4812edd28568c42c48e1442e64cde73a1084cd6dbd02445b799a34xwmeMBJX5D6i+tNbI8SIB9Qs517bzyJL0I7yjo5Xm8FvATuA8r533ehW++yAk6W1'),
(141, 1, 'administrator', 1615338052, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36', 1, 'd88272c3b5a33dccb31522aa9bc27ca7f99ee6b105c477819fbdabfcbee98f4733e881e5cc67b13b1ef5d3f44bf47892499da4cd58a16b63b05635c987651e46F0ovmPiKQ0SMR0Ez5fewrxdh5P6B0TApJ63R0VaVpErp1wGTaeORrQvO546ry0V6'),
(142, 10, 'tio_kominfo', 1615339259, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36', 1, '80e9f08525704d7afeb21868788f383d97ee54db3b4427c8308bb959460d516f25b9f1208b4ee1d6a0215c1b6092e47432afe6fb32959e3e34cd22ba86906b73EYNI0zZAhljUlz43/RelFj1KOwLZxD09LvBaO4ICneSADG/op3YMXq9OpI6TECJb'),
(143, 10, 'tio_kominfo', 1615340525, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.82 Safari/537.36', 1, '62f93289003967f1fa94d269ef5d29ab962f8c56822f9658847de3ea18872576550550d7969d7699bce90b37f3aed675d7f3a7e76bf37e57bd12612c05c38b98NuEBLyfgL1kB/IkYmKRLa9KCup9tOOsrIPYXWvtOxFemnYHyAIJeHft1KUjz86Ct'),
(144, 10, 'tio_kominfo', 1615342575, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.82 Safari/537.36', 0, '83162af3c84606f9c8bfaa215532768f143b49269ac37b3eea1787cf7d2e1373b5dba63e5dc6acb3454f8625f11a562dafd1910acbb9e76b922c1e52fff946daqHaVeZpl17PWUgqj74+Ul9qCDFSxkMB1z8AXWDPMBPZew8fIB7NirvQXcH4YKQEV'),
(145, 1, 'administrator', 1615342695, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.82 Safari/537.36', 1, 'ff68bec72d9108dfd3db170718ce10f5872737d380b6037acac0b6297faf57321e40700ba137eeb49691628b53253e44c32fcc24d3a3f0061dae441fca853516EdRiaUGAMwjWkxF47DPZ79DNl9QE0pHWARLyOQ9wda4tF1k5g8HrdCyWjVQ4tq72'),
(146, 1, 'administrator', 1615342695, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.82 Safari/537.36', 1, '5ed4372bfe3a8e2acf5c2ab57ee8372c21bcae3b8123453e75b29400209b78837c4f50ccc73b86e7d172b3edc69d31089ac21a99939851a0afc1701129ef34323XiMotw+qsTdweSSbHjt556HKGkiLshkUbaPKmR2472PBQ84BcBOofVagIbADOmA'),
(147, 1, 'administrator', 1615365888, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36', 1, '302a24bd1b1648688102327216c2bc63186d5d512e362a2e2f29451c37a86be5d17e48111dc2f2b93bed18df908cc6cb35980dc92d4b1424ebb0f9578fce1955+cT0FczS/Fcy89pSYqdt/idGMr+oPmzR+FksgevSoPlZF6xxFsC2hHW20JUcWlQY'),
(148, 1, 'administrator', 1615511663, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36', 1, '2d730df0e7bdd0445b57ff7d838f35b49b68235041cb7bcb9b59d3a6e941d85fd9fd73ff25191c65bb481859be68fe514d83e89dce2d89267669a0806e659242oraNAMmLCyIJSFz/19e0paOdbCp/v3NtKA2CeXDe89efXtYS3/yrh4q7OoCbAzqK'),
(149, 1, 'administrator', 1615538748, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36', 1, '20b9fc5cb1a620c8ee5180b60154f49c534ea47952639dbd973dd821067720b5e8394c93d0df62ad6f9f81cd154e3f673240b4dac1ee21d3a140e92ddf7b4b8417vjqliEZNj642TnKwvWDebSEhB5vVuIhzZBOBIwtdyVaESdgFCtslFDFTG/1fJy'),
(150, 11, 'pimpinan_contoh_1', 1615726902, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.82 Safari/537.36', 0, '97280d6b9f74fcf0fa866a689bfaffdf229612189d4a33fddf26e6ea62da6f291fe027a47467fb5eb91bb903b1b74496b67163088335878164d0975eb70663f22FsxVE5xFNraUHyyRtqh8oJgwvBAuPZ5OEexHKGTksZrNcCCg/0+4am8LWiNk9Uu'),
(151, 11, 'pimpinan_contoh_1', 1615768011, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.82 Safari/537.36', 0, '543c7c6fdce0ada790ba22ec5a5c3e218e9b0887a8e9007ca3116eaa64690b51c1220f72e8f765e53ea161c291295abeaed33b7c717a56647bfd530580bb6a6bPQJPWbFz6J+12346sOkeb923RvQ4jdrkSYAXVkSKl0xXg08BchQZjeZv0oHOHgnh'),
(152, 10, 'tio_kominfo', 1615768738, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.82 Safari/537.36', 1, 'bd3e6d8544051d9c4df2cea0fa049ab6ed032c1771d750ff1e5e10858677c784ee9943f2a9ee847bf66f14a5a07984204a5c6fd2a1525f0a05b74e7056c89dc1Xmrc4EJmukhZdgCw6Ss+IE7UAGZfmETijh7igCwN1rtzgzoezahifqk/9d5pLwCD'),
(153, 1, 'administrator', 1615768854, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.82 Safari/537.36', 1, '6a2dff7d883e6b24601f1f7e9ad0a7e76b81acc8d7273a38a8473d6ff4156ecdff9093f7e923d7975ea9525d37bffe9a921646113fffb15f23b89218e1e4118cw3fMy1n1GUxICRyn0FlH7FRBvdVw11wIbzS2t540HjNRHNgS/kGI99tq7dTwljFt'),
(154, 10, 'tio_kominfo', 1615768890, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.82 Safari/537.36', 1, '7014b533027942a9a3229b490b8e17c70dd7b3be05622d371f1ab91ebaa5b084da8ac4ffdab42fc7dcad03b50c31add00d013ab22640524cde51301bc4aacbf9yjRmasRWm5gYctpK3P3hmHySblDOVkmSqVINvRX4Iza41PKVeSGZWnK8qxJeBYDo'),
(155, 10, 'tio_kominfo', 1615770906, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.82 Safari/537.36', 1, 'f38f00ef4a05a10fbb4111f161f5249f008e0548de0ae4f0e31a88ff0d103d1eb32e11985ba71bcbf449d01e90fd6fe4b876a88a94304883ac4026e00f9a02a2IQf+OtbBBmb+VGPkyzUTTw+9uuJi0dmln1S/qK5R2RlRTq6cM4uid3/QK1Q73miL'),
(156, 10, 'tio_kominfo', 1615863414, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.82 Safari/537.36', 1, '20f19da488a94851611e6ddd960b1751b862ae8f660372662fe9bae467101182b518b25e17d3cada19f5ac3d9e6a72a2c55fbea18e92b6c0f6c7f60298c8dafeKcV64Ku4JsVaBo7hs1KeC6gXO46r4oHsJZ1WTY5UTgqhcFLVNB+CJib8/s0bfeU8'),
(157, 10, 'tio_kominfo', 1615863414, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.82 Safari/537.36', 1, 'a8652823b179614c02f488a0176b727ff97687e51442a61e4108024218f50640803cb3af1a273cc2f371ed3190019faf85c345b2b7024f3340d8aa97c344818a0uJEltzlCs/tdawnoT2UdEZ0h1JAkJOmVX1t7ckhAAK/TFNO58JFuKdwARPA2zZo'),
(158, 10, 'tio_kominfo', 1615863414, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.82 Safari/537.36', 1, '25126aa7fbacf2f810331808c0b67c65e2f782013fb2e062b1e636bab172a17f0e86d0036852d02d847755101a8bed20102636ec87f8c78355c7f82c79885f09VSVRmIfIrsfWEAUdMHESP2e85+350OmBoOmlFLjJ2lH3CDTs+x22Td+OrN0PR3EO'),
(159, 10, 'tio_kominfo', 1615943196, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 0, '19a55cf00f4c1bad5097d7db93a6e4e92a2e82b4cba716f63cf0f2848bba5f8990caa2833abc817181e76ff9b99559c1b4b8e00f823abe7ea46cea107756f7b78Gqu4KySvl8tjoHU7JaGf8mu7FK+J1NO/U7CzP8naT/B47wKNtOgGiRiA6yNcRIn'),
(160, 10, 'tio_kominfo', 1615945899, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.82 Safari/537.36', 1, 'ee81e5312bb69a2ff4a9cdc3bbf07f36d2a2df6bb623a37c87db0c9d991a5555a6f8b5cc237c69ae9ef26336024b44c36904c1785aeed54e4f324ced67f7cef19N2GpgSp364u/9GrS9qAcX+LIefuBKblu3xVhoo4zncQgIakB1b6R/zwyvePejdF'),
(161, 11, 'pimpinan_contoh_1', 1615955160, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 1, '4b5cda281fc2aca838bb3a4055827f84c604d2d1a7758defc5f5ef8655efd42d7c4697690ec14c9218bd562dc5f86195ff181b0813a1f503d33c53cc57b0fc92v3g1Jh29t7VswOMFLtFCGqNyidZgxbdDXSxBVZD+zJDZgIprztQRndg1WnKPlYPA'),
(162, 11, 'pimpinan_contoh_1', 1615966321, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 1, 'df1a3a6f6d3b9a8ecba5fdc49b5dccaa24af1babce1ecbf342b052c27a08d68b1b62aed0d1f4b8995c19e5a2bda0a5ad1d18dc91b89728708131a737fcfc6f80NQb/4JXKvsNgr5YvqEHRCrnLPHdJLw9iLcom2GwOCDIJCaze1EGBRxP2jgq6apF8'),
(163, 1, 'administrator', 1615966525, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 0, '6041459621ecaf9db69f8a74bb80cfaa68b6ab0922c1f32d097a30891824383e51936778c0f29876b711e29f2a8c5bb3c6e8e5843550447c3b213f55195779e908zIO3hElf1CdUGjVIv2xxAX04tJv9aKRoUuxGczjEKwy6bTMdtYfNykIaLK9QOM'),
(164, 10, 'tio_kominfo', 1615967256, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 1, 'b5442daa632f756c70bd5418a358c330bd3d35f14eb9ee799a68a1e1f230d1fa564c532df56b7d507b5672c5194976e1393a3f4d906b58f04fc87e0f2d737a1fzwpnc0YXYYDpphbq5ZP6ktCDUXpW2Wd0G0V/XHFsxcZQXYspXMbez/pE7K9iEy2k'),
(165, 10, 'tio_kominfo', 1615971369, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 0, '89a8401af620f77a5a19e87e6c2b4541dd6c2e43fafb9a4d685c89f3c3b867cf41dda9fac9b6c019e2e71abc60afb01ef832074cf490a7a1e7275e10a4bf05a2HBJfaRNB2UAEfgdQuH1lsYmsHPhZUbPJnWW5lffPfuhuKAmf4589BfXG/sJCZc2C'),
(166, 1, 'administrator', 1615971657, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 1, 'fb304e67a94f08c28e1bf25da28872adc8fffc97f2dd2aa2a74c2dae20e566dd3fba228c6483f70059e9b243b2914d0b02708399879ca707131dbaa8825f6bbbC9zCCDGClE0KtjRGb4pQmsMqefWElVjsq3CuSs0gSAtX+deJ+q36Q+MRpqLFlERU'),
(167, 1, 'administrator', 1615971657, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 1, 'f3df610295d3b017395698cd4db14a9ee187a45cf37083e9e9ef3bf8f925361048f8b87feabfbde653f097d05c369ce343c6892d234597c2b830dd170b46af6eFzi4RzvICtUsk6wEsAF0M1rNaic/ajcTTBhwUIY+spkjgrTQrK+6Qr3d77B8YblO'),
(168, 1, 'administrator', 1615971658, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 1, 'bf028c5661158ff9c15d61ee0a10cd7ac4debe9bf76a7a194708cc5b660b97f4854fe85e6221e61e33796d8f657534722d7bd63bdcf5ec2c31197340cae1bcdaBHo5SshUXupXMRL+C0TaL3nZwIPsCRQEtgLrLCaRYQ5rkLCF8ChLc7b889pda0Fj'),
(169, 11, 'pimpinan_contoh_1', 1616031128, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 1, 'f813e560ffe71a15f3ec51837e27e3e089f9df0b5de7ccb52d3b6b9ea64938420f41b60ad7168df1e2915e20cd746882397e9d62fdd274c4d059aa08ce350a70jYTF7k59Y0mWHB91Ajgw5BDEE9ooFRG1BcbZwdX5r9iJ5YatGJJdTNcNyRWMSJTe'),
(170, 10, 'tio_kominfo', 1616031235, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 1, '9119371edfdda1dcbabf5920816e740b46f4d765edc106975f5886a0772f765c016910959aa2dba84aa1bee170fa5dcb79d12698fb129e3e9f775a66286a4f0e/B74sy4OIjftv5UhBr6aysPrS+P6rPynvc3+PUcTU3ydwCNeZ244y2afqefO/JSV'),
(171, 10, 'tio_kominfo', 1616032011, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 1, '447c1372d854001c15cd4a7fb4880bee822a04c8cce37981743f810decb897486834affefb1a2cead0ed68a80077628878552781d7be2682a3f573ef156f817cPIGvUM0d0dAs0FkChGuxnppJuZyCtAcNlcBEeT3WwccCtubulmkcaw/ETp5tm01k'),
(172, 10, 'tio_kominfo', 1616042179, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 1, '429a7f66caff313884a1478e160cfcac8d67147e47bf8c083ee7a67299b556cf4997fc47693cfd066ae55e27bd2b1c2b8a20bafaf0b57e1b4e56ed949dd67150P15FJXvKP7TEhOItdaMEIvSRpytucdhKxDxt5OcjWRhNF2pxgg1QlGSuEYiKCBst'),
(173, 10, 'tio_kominfo', 1616052510, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 1, '5fe2861dc7a130eb2c7984e63fe71c8eeb87b1ac4d998d05ddf9185b606f6d84c83303163d76d10ceff564a6a3ade1567682a04eef5bce8f23f4719044b207d5Hrg4blfEB+lYGv9/1CgX/OKtAi924r2n7ctggLCE1ZMEL16Ac9QdP63+E+wAZa1J'),
(174, 1, 'administrator', 1616058028, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 1, '0440119d4797f447f646a8217ec15205edcabc2b7e63ee0f693d2abb6c76f46ae02136071f2a4a264f02a0aa13def81cdc79942a26120a8b647f346682caeb4fTWxcXJrXk20pf349eNJwe9AlL3HVt9FIo1kDgE7fp2nGvV5Alf4/G7tCfLA9SMSw'),
(175, 1, 'administrator', 1616058029, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 1, 'deaef5aa974aed106479186f119fabcf8ef43a56c421aa2ec7d39eeb5ffdc6796ac61295e31335418cbcb2781b5a48ef9e6671c322ca1d58aed9adde466c99daqqdlPi24DbKY/FeDJ+C74vdHNuVDKtgRmx3oAM/lwV7o0yQnEOtlCKpFMntJAf4Z'),
(176, 1, 'administrator', 1616058030, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 1, '49f2a510196a04535d27960b3cb745812a2ae7d54cbc9ec1239f90aef1a88c9875ee6208d1ab0f9f0b084f56d55a78a4137d47138dd002ec57f3ccd429951f90iwodI1EnxXmKS0kECCDZKbxIT6iyquh91DxkyOYRCyqtyLcPbS+V5Rr23M7Js1h+'),
(177, 11, 'pimpinan_contoh_1', 1616114582, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 1, '6a9f9c9127d89741ba61466f92668ad1230f3fa1a61d43047e1d039b797a3413affd38f46724623730047cdb3540f8602263adfce31c7821e959588fe0e081e6JgV5ysJhyKCjsC8nx/7wN+dfGzZhjFzqznJHOCU1OsLSj0sa+4wUxqKp/JORg/71'),
(178, 11, 'pimpinan_contoh_1', 1616114582, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 1, 'f03b4aeb3b3b75cce94a39124276237413894ad6e27b6b824ed6f2d4889f7558d148783d2c4c8b532a34dfdb99fb8c230022a1ec3467f423f2b054c7be8a1de2mjIzJptkxXlA/j8DyFAmCrh/ZGP7nCFK9zzfUoimOry0Hs4r66740AU/kcTkH7zy'),
(179, 11, 'pimpinan_contoh_1', 1616114583, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 1, '5b8e7018620f0c88526bebc5d93a700ea3852a5b33e7d141c840ecc4690c46552d04899a5be67c92f4001b92040ecafd636ec8c3c93b63ec6fcedc7acb75646dHDQthHAP3Yr+io7Rms1uIy2aUUeK1A04oq7RpmT5uJUV9BX6vE2Qy5ePNHBAjgzF'),
(180, 10, 'tio_kominfo', 1616115714, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 1, '01a2a5d11045ca5b32ca273a36b0ca3adcbf0bb63d69f84872d5842453f3c89244cd6c3d89dd2090c7b4f44cf523a67c45bc7130c3831df0e793191348f03c37K2UzUTBJr/AkGbvxlnMb0BHkNvmos/h3f0FNHaYAYVSzmHKRPIhog4RXeCo97NuC'),
(181, 10, 'tio_kominfo', 1616125880, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 1, '89cb6607425bd449b2a40efa5648216b758aca37b0968d5441615ca5bc9e605724200fe2c22635c8f19c65e29e93c6d369ad44a7074c603b6975c9a4d510854fMa7PQYCnZgRxZnqcMnzBwaL9AMeG784gW4qLJOwfxhLyI4OKa00RdzxEsyPaLyyE'),
(182, 11, 'pimpinan_contoh_1', 1616129281, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 1, 'ee920a139a9127a9e8ffbbc066db2c32e052d5ba49de0388be060e76a66c9969185b73189880093dd24231c74513f2405b5bbce052bc23de4a47a90dc4cee36bQPSRfYcLxS1wJOd5gOFNoo5gkeoGe9gK1lcF9kaP4id32pKMriBlPm3GEGkJUb4C'),
(183, 10, 'tio_kominfo', 1616129320, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 1, '8242a3f6d5ac127f13ac60a7029c9dee8fb799ed0f810fa9ef645fefbbb985ce1a694adc2e3aec63d62f09d23531bb3a9ea201d51732e797cf92e179431c194ai+hRTPwr23001HV8Vr3tW79YWqQDvPu3skLPsj4/b+Vc+uTLkXVEptkGCzYd5Las'),
(184, 11, 'pimpinan_contoh_1', 1616136906, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 1, '247b7749da421c51e2bfab49c0e05e2f35a68ff95fd210c7604d330ef44a5e1eb087ab0857b32948e703e4b6b451c82011c66a85e3620578590ec0c423eb64d4uIqQjyR9LSZA4eKPo+RIs+WzCI16JDoZxtbUYj1uaBcqVL/5JIxDXT+Wx617SMPi'),
(185, 11, 'pimpinan_contoh_1', 1616136906, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 1, '5cb77be6136c1f4a5c6122e266101a23db50ce73939b6629beb4880739d383575703c800bb2b314b894ad0b69494f48943827a2cc1cd9253d6fff5f34ca7a4d7lER+uApAMDdCpK3aji3dp4er7VFvBfeiIcXjgaRCQ2uLOTpOafhFHFFT4Ck8T057'),
(186, 1, 'administrator', 1616137056, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 0, '58d23287fcf612be1ad3a3d178787e2668890e5272e815555ea9037ad259ad68ed847fc26863b497a486db8ba1642054450423aa8310d51b9843aa92d6822215RgrPqTpYUGUIu1Lj2F6yeB5l9hN8Y+7aF+i/v/iT5NbXt3Bcgj2+BQgv/uQPQd1v'),
(187, 10, 'tio_kominfo', 1616138417, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 1, '97794a3dbb8b2fc5a8b23ac078afdad95f62188e7a8dbe8ee15b35327e1a78ac23102b7469e0b55b365c8649dc9ada690b2e9affbdad223645c65cabdaac5d5aZFUwzHf85g7WMytkfa79GcWZS85e27PBBeKcEAfoX6vPiOoFvOPWBkRv5xIQOs7G'),
(188, 11, 'pimpinan_contoh_1', 1616140099, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 1, '6c8fcebf1b88d9ec557d2dbe9c569d1fc8a5ec88774308c012271d6881bfac0809b0ed15dd196f4d7a02324e46a830b0dce80147603677a3ca94efe8af0d7f1dHXSJR09pyGaNXtu12cePjRdMh+ipBFFkU69g2rSoqyo25LWFpUHOTNiCSIyFsQSt'),
(189, 10, 'tio_kominfo', 1616143542, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 1, 'bc794dc42619d8ee411105d5cacd2c6327e419cb5dd902d05be45ec2fed3f9eba799eb25411249d4c777a22a38e78c6d6cf353d8d2cfd6532e529568aa37a7ecRqYm8vQBYpvbyubRo9wirH992p59omSJiPS7tUp1+9GTOn0hKJDd5hx7N2Rb0QIZ'),
(190, 11, 'pimpinan_contoh_1', 1616373993, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 1, '18f1f0697f0e56b9f74cef5949eea5d6e25ce00cd93843e5869cb6be0711f15e85aab72bcf8160cdb6922a1acc83a8ec25d5686f371dadeb9cc2832a0deb006aR/WkuEloNWrIuSk9mYNuhqfWXAn+gFIwuibUXiX9NFCuam1ApT52o9QWqSWjOFOr'),
(191, 1, 'administrator', 1616377250, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 1, '0627e5173e36cd418e84f1e9f0c3add0ed8e4c1a8b45f14aeae6a50d48bd7b6ee565f9b96abd0c9a9cdab882322f29d92bac07c7cf4a767811e9b10105e1c24e+gmAmTRe5Khpp9Cf/nPwNoFimZCOFCYfbfZ8cJrMF5ZUCe9SGWC9uxclkifKsgix'),
(192, 10, 'tio_kominfo', 1616377581, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 1, 'cf515ea79337141e2337187770e27006ba3f8fd58167e33cddf0b5a72eea2f18dbf60ce33c462a0b5517365286003b8f5d82c6b75be1a937416b7270f7f17926/8ipqqc191RIJQiMypyIhS+nKf+jy0iHhB5lwNlb3gp4Zu1X9tmYHx4vctmYlQFt'),
(193, 10, 'tio_kominfo', 1616380560, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 0, 'b26f8152bc3ee19076ed6a2eadd006961f071feff91c96062cea0141da666ed59bf26c414e6fb785243b9ecbf1a583e2888c81ead65f6ae8dfc6e233f5463b27epXzHFBFCnN01pRM8UADQ0491pDNNvwmpuWFRFwIam2W19ecx5+5I0vEo8jWUt/g'),
(194, 1, 'administrator', 1616381636, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 1, '3fad6c4e52782dcd504948764253b7afc13b55ab1389b7e9c36787136d0a9d1cacdb47927975d4af19a5f247c3a60f2159360bfb2d52116a390fc29d89831a28OlVvwWGAxHwJlAiYFlNMzESVqYe82dMSBGu3povASQMIRKNCDvGMtNA9sfchzpUB'),
(195, 10, 'tio_kominfo', 1616381692, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 1, '2773aa1074214d9fb6e0da332e8efa9c9501c4f654544cad8340a77ed6060975825c6be5ee496e2a0faacd06d460dcc23eb763a3656789a98cd332b6920b5cd2BDfJ0AB4eY5MdgQJ2BworN1F1BUXhPpkwjdTKSiskrFyuSfbbu9f4C+dijaYZA9q'),
(196, 11, 'pimpinan_contoh_1', 1616382074, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 1, '0d67af66eb79714d495de0c54f33068a4278b2a75f3fe714ef4707a712384fbbb428dc6e4c4503199709773aab3be2cf5d1126e52f71a779dbce27180f01d95bsM4jYiJYwedsie0ShIR3S0DnP2WcuDlRNyNAffktsJLh6TGZxGNE9DNUYQ80rRel'),
(197, 10, 'tio_kominfo', 1616385974, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 1, 'd4444ceb3a22de95a3f0cf7cb0b6376f111bffe0bbd4dbaad65ab08a907e612f71956660dd6c861ad6a5dbbeedc9a71d605952438459bfee437a6a6de31d58aaqsqLK5mjT+h126MBXqPFTzRaRuX1iWlUEJGj1KmDus/9ELKnZFvsa89iBeIZJlfA'),
(198, 10, 'tio_kominfo', 1616396107, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 1, '153f08171af5932298aa67b6fce1344e6afa6a4f171db78f095a009b96b8a89fa00cd5a364f1e357e9346ae098a81b377c3a3ec6242aca7892c6d43171f05f7av8xsyywgp4/kt5mZvaLvqEszC3g7W/CtZEh9n2HYtxHaJgGmRuhqisvGSFtcywmF'),
(199, 10, 'tio_kominfo', 1616397822, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 1, '9b29d88fdf28619ab9a0d6b76b8202cfad4ecff77edbdb1ea20cb855b5b8c4a4325f7f01505711e380b5295b5e75b8803fcaf9392825625f52d8555b68e034a68fYfB8qnqzuzWrVmd0qxOpLUNVrXeeMHO8xCyIIeYyjycjCxrSR0TTkRHbaVfYmj'),
(200, 1, 'administrator', 1616399675, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 1, '3226c6650ac5f5f06d7db2acd6cade165489af0e47c5b783d821dfafba9a091c9664be2a31e21c9531f3dffa6be42add12dd52820d41675054a6e9d6dd29a858ZYLpt/4zpKyUPzRCxJBpHKbO3M14ZpmEMGNYXoEQW+PlItRsCKj28KPI0rCz8LUT'),
(201, 1, 'administrator', 1616399676, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 1, '23862ed06241e0dcdc2d9fd7ac0357fa0f8e2a00050a9ca842f867e57adcd127808a2bb52426ab4f9d894be8a56839c096dba3a4f28791ea9aaf72dc25b53b4bHNYFC+lgtRRQtMN9v0IPOLCfqzkXGYt4+dPN4RkCyXcy3Xls/BbRb+jLfM002wtZ'),
(202, 11, 'pimpinan_contoh_1', 1616401567, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 1, '156d53bf00c244aa161ed8c7e2b611f7a3b34133221c0d738baf643e9a23420d9cf28d3048fff7ddf942e52ec35d5e5492ed855c8f6039a0bb6c6b6df1f742457JBdn5o1w4eoOxKMVXJLk3uw2YpIwebKXuvdUt9s7b8SVhpkiHJRymbZ0PSuE+t4'),
(203, 11, 'pimpinan_contoh_1', 1616463262, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 1, 'f5afc2045ccface9661a342068e18aeaafec4a9331d12097200c53b02cb3c2a89846d096211a2d000ccaa743d3e7c5243000b8dcc81e600cc722fd1051b12bd2s1QfLBCj/aMkzgZz/XBm4FQdv6gciIOXHPCHhOzbbeUtL4gnxaBfAPlMvaHHBp7F'),
(204, 1, 'yeviki', 1616475097, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:86.0) Gecko/20100101 Firefox/86.0', 1, '2f12efa7d3e0eb971f6ed612e7ab8c9be8e57d4edf28c5653c06ccad1f0000ec4606063dbd13fa501a22c82ce54038da3dfd37e1fd3e150106c4238c648a507ecZgM7oFZZuAEMZTvjzRmKwz1zXJ4gn+N2G18FaOoi71zKX7K0q8Vm+Sth3e5jZ6W'),
(205, 1, 'yeviki', 1627528252, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:90.0) Gecko/20100101 Firefox/90.0', 1, '6575e683d47405c8bed1fa7801827a9ac446c1ce142ade00af5ea7b9ad0b096caf81207af2b2f6d53c106735aec75cb682c1f78170297e492a5ea1a2c634e9f9aDPw2C+iAC8H6x+FNpOO96AhDZuO+nbmoBEESmjjT7TfppVu9fxoauUnRBLrsSIy'),
(206, 1, 'yeviki', 1627874897, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:90.0) Gecko/20100101 Firefox/90.0', 0, '28036d4998f2ac21b3357fc0be5ab3566855058c1734b87abb07c7bda1b01c2c8a928a1148c1b8ab341578eecda06bb39c29cdefc582d3d8df7c8393e2b0f486kDOPop/aaj3rjOG1wFiy6UHGfB3XgAKF7lXf7Sbrbsl6lqeBJRiF09nZmT8AV4bG'),
(207, 1, 'yeviki', 1627875746, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:90.0) Gecko/20100101 Firefox/90.0', 1, '3686bd063f649f675c7f57a893540d3b4a53d9db547656b95e083ab069305e3c74bdaafef98ec90aee6639777586f09c46d0f9b574f2b880c95af5bfbe0f19d1mPksKBD0O96mwG8nyjijKAw7vI2BC4PJ8cJJijS/+zyTE6po7jNfqd+gd7pXfbDc'),
(208, 1, 'yeviki', 1627887848, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:90.0) Gecko/20100101 Firefox/90.0', 1, 'fdaea51063c3192ce12413c21465df4577f03d6fdca4b223e7b2f6ef1ccdc331a7e9caa15164669984e49cdb1408e4a3739648decd2726bd8cee05c1400c7a4aolXdVbhlB2JzpxAEIZ83wnJi17btzsyHUiGQJpMpauoCZVv2XWL/TmOuwUX47Kp3'),
(209, 1, 'yeviki', 1627968361, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:90.0) Gecko/20100101 Firefox/90.0', 1, 'e2b47fbe14425661ba8814e9d984ce68058e2e6ee004d36bcd353ea6f5d40024708dc6b197e94e83cde6e438460ee38f2af3564634592490f4af1ee403fcc852QKbf31TuKRk+InQ9ZlH4/mqOTeATxf8fswUBx++i9x3mgMYAgWoUkQODcTin7Grk'),
(210, 1, 'yeviki', 1628047582, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:90.0) Gecko/20100101 Firefox/90.0', 1, '2e178d776e0c29e69099023668dad35237c5991d66b7fc89bff82f918c75850b825f588eaced80fe0587a36d33092a2c3f5ef54656a38520dedd27d09b9b8b4bmfUx9ucIPs1X87bnfOqz8vLG7O71PXX2Bl4Vki8mmepRFYUuY2v9qUukivVen7j1'),
(211, 1, 'yeviki', 1632359113, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:92.0) Gecko/20100101 Firefox/92.0', 1, 'f4704dd1f409c639b8e50cba971671e6060d3513f20c68484c5bfc1bd776463d15ba3daa20c324d633e076afac2a319da316434780ed5137c42ef78aed8e76e8mIQ5mHDUCchoL/oSCIPzx12HWmCg4IZNqGYvAS05hrs2XuwJqG2xATtSfiibXaGm'),
(212, 1, 'yeviki', 1632790938, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:92.0) Gecko/20100101 Firefox/92.0', 1, '38074d34e1a634d7c68a49b0852828f446b5e473c1a5528aadc3a56652904c99ecfe4197ef0f01323d8a25b164051a56421a3844e70ff0cdf7999d0455a649af/pkILqesTWuwRjQYebFwgtwRSWX6bX3K6vAU7zHLBpFHr9p6AByd08fd33PMhn8z'),
(213, 1, 'yeviki', 1632878659, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:92.0) Gecko/20100101 Firefox/92.0', 1, '5e2ccae048da100d420b7422a486776301f34f25057395a74d3eedfe77fee9fcaca3aa305c4e314426784ede79e5e36f1606f4e7718076755db24d1182c5ff45aGtltJGa8OO3YXJ3xdxqpiyFcxZIe67ZXw1EHJRBtne7nE67DrENiMz3VdJzMLpg'),
(214, 1, 'yeviki', 1632965143, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:92.0) Gecko/20100101 Firefox/92.0', 1, '21d79505bc4668a5a249e8d6dc27445ed4f5a0e779b7027682b5d93b6f5085cffe2481c5438b797a1b67f5ca7907b2663ce940a27fce39be35632e5d33236ba2zio17esM/wBLmTsDBOeDf4OQ6CAifgIk9mUUa6MxVbZoYwuqndwNXZxO8LCpjTBP'),
(215, 1, 'yeviki', 1633050371, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:92.0) Gecko/20100101 Firefox/92.0', 1, 'd73a943e0b8c000f01f92b0127367a57aa64d9c329a199dedb3f430c1d3b6b682f48a9998d8643e0ceaa977b55c3bd08bcbf6143032e59c2089bb6f870530488Cpplc49/WjqCpU7+gZL2EIwcWLEjAjgCnn65p7FB5fxbXsAyUDIx4QpVSpOWDA2Q'),
(216, 1, 'yeviki', 1633052919, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/94.0.4606.61 Safari/537.36', 1, 'e740ac26eb5330a16442a07c1e1d21515c772aefc1011bbc35c09cddfe34b022ec364bfa7746cc027c32f3a68dd87e4ae857d0b1dde710a2aa680c31fb3df404OftX7u7eTGBtrwF+VJt3vC6kvdAubun+LpBN+GCJsrBpCR5boQHzfsqFTygERrpu'),
(217, 1, 'yeviki', 1633052949, '::1', 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/94.0.4606.61 Mobile Safari/537.36', 1, '52cd3527163114f7a7fe9b532688fcd957d956f8b06ca3add8eff1fface995a5c129f3e06a6e23df53038b38a02474c58281b82fe386fd901197d4092d734f9epXCHa6DQRRyra4YSn8aGOWtSZdCHlzsCU6uH/yHu2ZiGp6S3oPdZBOGSsqQ4302D'),
(218, 1, 'yeviki', 1633052979, '::1', 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/94.0.4606.61 Mobile Safari/537.36', 1, '02998ec55f612022abbdcd87c201f2ece93a8cdb39fc2aca5ec6b741d7bfd83ca6394d55444121e2fb1acfb0663ef362594754eaad2558890e4e25dd50ce700f1lZ8JdQqHn5RWpbi7tau8pZNu8X7w20RztJF0mIOsmcv+n3incw9xvUtRWLJcKzV'),
(219, 1, 'yeviki', 1633060420, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:92.0) Gecko/20100101 Firefox/92.0', 1, '7fd87e0f1b398212ca99dba14977b63e75953fcdd8c34813becb0a6844c502b02965bcda8c05f44da384bcef67255d3444cb3959c9845c193fd468e413592ec7+hGMz3KXtyPJR/QezDT6meJKHJY4plawwpjJmYgIVEdiUumOWLN8HcvT87/yw+UC'),
(220, 1, 'yeviki', 1633322996, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:92.0) Gecko/20100101 Firefox/92.0', 1, '0d938882999cf83b174f09cb703bf51315ce531323836296e4169ebe5575874072ef77f6ee8f348cc07c0bd802772eb12aa4a8ddbb422c9ae5a4051af7deaa628vK3gn+uexWv2axMtfZKYLlK8l+VgoLNbRAem3Bo3Zz7La6vffmfvqTgljM90bqU'),
(221, 1, 'yeviki', 1633329690, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:92.0) Gecko/20100101 Firefox/92.0', 1, 'd98f28ecb771361d5ab3ba6d3e273f6dfcdc6b4df0de173b937f59e287821c055b69058674d844b0c188f7747bdfa05e1ed4ed3bede30b0af355015e0a8a327f9TB5JTVDiw5uqtr42/LC+Ybl1HG3P9X3oW+lW5JEX4UHhScdc461rPMqAbfpIMpv'),
(222, 1, 'yeviki', 1633396998, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:92.0) Gecko/20100101 Firefox/92.0', 1, '9a460ba6e92308d8c38e9de0131e0752b5b517806b6d8ddea72a6118b77ddb29affb3f4eba239399e7a54e748cf1cd3257512d3ce172029b319ce497ca198a346tM+cxM8SPkVatVUVODnYE1mbKg0GBoqarOQ859Sh+ZRnrLG0tXeReA+zX5iW9rP'),
(223, 1, 'yeviki', 1633415846, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:92.0) Gecko/20100101 Firefox/92.0', 1, '1e8055f19364327dfdb02d91e030132115b3034beb732579144bbae73de73ca5cc0d832721557305164c5d13edb778d753a01b296ee3feabc4e4c929bba73a26TtJ6ma4+XrzQltOOXl5X6AuVNQRYUZsJgoCNT6gAL6sYep5hoabenD9XUybB2UTO'),
(224, 1, 'yeviki', 1634627873, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:93.0) Gecko/20100101 Firefox/93.0', 0, '95e9b5b420454f056efc5bb1a790eb3dc441c769a0b917659c83ca197204af79d4288e792fa2d6ad50c001ccc923f5c15d0a5b17d2ce405945ac28f7fcee7f52pL4rshUHMT11MIXjslfd0A19BU+uEtprxdZMVPgp5k5yrDGeglpEz4Rvt55q0oNt'),
(225, 1, 'yeviki', 1634628766, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:93.0) Gecko/20100101 Firefox/93.0', 1, '8a7e0af509562daa2c874e5545cf8d332578dee7e5ef09576c914b365fedafbf05c48db37c954035964ccda9af291eeb16445be9718aa6d6dc37f6e126e15433ePHtgUSL5yIF3by7KO56RehvE6wTmic7hEIgrYlGWah+17m3IEqw+M58mWExkMRZ'),
(226, 1, 'yeviki', 1634777601, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:93.0) Gecko/20100101 Firefox/93.0', 1, 'ccd67f2d82a560c329b61e61352254bb43154cc2d514f928eae2c551cd2e7d6f23a2117d273d803f39449632495d5b19f27bf357df139da5bbb2d23bc48f01f5JYlLDOzUBQv2NeCWKKWASQR5yvEILJqIhAkTMDw0YMHj4ToOJ2tYMwCGEl6/QRLa'),
(227, 1, 'yeviki', 1634864609, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:93.0) Gecko/20100101 Firefox/93.0', 1, '2b74931a86bee95d0bf2a876ae204c634653e12ffb9bd3f7f419e1457dffbc0f60a9af1c53d6567e6fa8fc2baf78db2b288c2e831cfacc1a477c3942d031eeaft+N6kFrBHFd8N69gF409aJ3JXQWylJy49sBZvlo8i8xQkWZz9hynEFJSAlcmXX73'),
(228, 1, 'yeviki', 1635123560, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:93.0) Gecko/20100101 Firefox/93.0', 1, 'ac276a942cb387d2a8d0559cae4d8a84bcec1102181b593d2b05bfc6ebc5d99e4b0528dc9049464213b7695eb426b9929be5c7ba7a5880915e29a514cad7ee82o5lNPkeHKcHG/jz7dnJxkyg7nGHYftYJ2B7JiUD5yoE6zS8KG6keICtw0FCh3zvx'),
(229, 1, 'yeviki', 1635151057, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:93.0) Gecko/20100101 Firefox/93.0', 1, 'cdbe9da1a0d19d12ec2123f2a136b60245d17c280b58b60b0fac786b78bdecfe281360faef9f96078a82eeb70b289d95c54f77d778ea0db3a52fff6e2bf5c03dhr0n1IRI8HKECGCQoGjm911xP/vCj5vVAPfsL63Y7eMlM3GMmFTjgAfORt4K3Mtr'),
(230, 1, 'yeviki', 1635211146, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:93.0) Gecko/20100101 Firefox/93.0', 1, 'b99c6a98a52c6c5bc43d3b2c53fb593d06742668c92af449d3da4b3ff282f88a8cb963e2c614a6229c1dbc58090fabf67698b0739be08c1d2a1890684638d012uzwA+keVrnPiMY9IJ0zNwNKZfc8LBC8ewKS67s3ucqr0UiIK3kmJ8/B5JGX6xXIS'),
(231, 1, 'yeviki', 1635302298, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:93.0) Gecko/20100101 Firefox/93.0', 1, '6d30898f109753e598af6bbeaf284c697f9c44e830eed4953c0cb8347c1c182271b27df9271eed8cff0074c50fb1cf64f6328d4d7b85e0f0f3dadbc7fe3d9d587G9QItCU3V6uqRsroOGwc2aj2zAs07O8Mdpw91PEjWItFiXHLUbJ2FQxPWCzEd/4'),
(232, 1, 'yeviki', 1635382071, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:93.0) Gecko/20100101 Firefox/93.0', 1, '4ebd6d2ab70a65f53d66572ba8bebb35151a28c4e65a8e8d3f6ca31181d77eef142f9220343007a19b2eaa4be9e712827b9d4541255342a3cb45b9364fab39b4U+0ZSyK95zwZ2neUMJG55CuOmOZIbePnlqNWh1iZuRWXAFEKLfTZR+IAKl9hganN'),
(233, 1, 'yeviki', 1635468422, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:93.0) Gecko/20100101 Firefox/93.0', 1, 'f51640d842f59742876bbd372220ddff8491ede3e15a13e048cdd2c484e2e9a5e01ce523291d20b5be45148a56e1efdeb25ba8df4f27be3e45fdba9dbe7b18bdR8eH7Tnl2ZrodrK1udVVaggoTqtRKFfna+DTRERiMdfwvA2e7DiKjh7R1R49ZX5u'),
(234, 1, 'yeviki', 1635729883, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:93.0) Gecko/20100101 Firefox/93.0', 1, 'bbc09d1eaecb45ed419c3d859c4de9e38b89b64009fc206f2730d23c4b667b7a9904b953cdbea0c8c6c7f90069ed7f510a2a59a2146d3c861d59ce2e433c5e5c4wLhl4PsqGIp6i1ejnxHUdEEHVm6OOCGeL2d2LVGdpgfum/D4DFGOvJqyl+dYKwW'),
(235, 1, 'yeviki', 1635813728, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:93.0) Gecko/20100101 Firefox/93.0', 0, 'f079a4545978f760881986ff3c866ebcb9fb5724a57025dd4f50d83c5e0ecd4f6717e6de5c9b568e899ac079bdf755c5b772ebf26f3df15cb50443f5b0b0ac81/5mZ5KfiJ6wL5Oer8UlnqtPE9SU27ZUu2iGV9BkwWN4ifHpMIC6jMXbiVnNft3F7'),
(236, 1, 'yeviki', 1635842452, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.54 Safari/537.36', 1, 'ebd4fc4bf351acbbe2790687a8f5be9cdec320bd7e9abc29a94d2233624468e1340d627285c289562157bf62fc782761faa9a9dc331d373c120f99ada71a01944PeAT247qQfrXQMyhBiwtYVsv9PnukCj84mypLyt6O7klTzujRkT2vByszvE5rpc'),
(237, 1, 'yeviki', 1635842497, '::1', 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.54 Mobile Safari/537.36', 1, 'c3ee4f27b766c1677efa96268579273654a26b464668f4a184a5ea0d98ff6f6168b75ed021993bfd6da7a0ee9211320137c2dab5805f36392e13e80f7766e579tZ9HLK9ZKwjOX8YysTE49PearUcsMC6XyDDmRMlr5hnPpYF7qTwHFH9mC+qGbhK4'),
(238, 1, 'yeviki', 1635842507, '::1', 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.54 Mobile Safari/537.36', 1, '056edd45d942250a690d994e4df402e9e321b12b17cbbc8b0da1b772611624c397bf6bcc55756d762cd4d2a46c2a70deb69df3b10d74ca22cb28d788c1cd1826YoLrErq2CVZZCo/quTMvAcz1JcMdlPmvzVSP3rFy3/bTXx4UrypKq38FwftV+pUp'),
(239, 1, 'yeviki', 1635842519, '::1', 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.54 Mobile Safari/537.36', 1, '571d314ffdd926a0102e87f38e40d8268f61e2f812a737dc7b2ac7cdc03d4e2099d6a1511bc376461981693a9bf46d175d896ffd84e79beb8486cd89350614b44uRQhz6FmnaEOTZns4Jw8TALCCtv3/6xhIjh2OFr7xgwI+IZLrXQ9qUKDqOF1fF2'),
(240, 1, 'yeviki', 1635842532, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.54 Safari/537.36', 1, '29582a6fe4eb79cf2052bc38696594378eaac47a15b2ebcd4ae66ad6b82b0802b278a9396a398fc70956cb7282c2af9f92184bd49a5ed63e39dc0c8aef1d73bfTHjKTaqnnyW8VHQTjRtudFn8vIqlH/WafMMzYTUIDtIJvIsRznZakDRolI679FEF'),
(241, 1, 'yeviki', 1635842548, '::1', 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.54 Mobile Safari/537.36', 1, '5533efea722c48074789a31706fe81e993d24eab089e89f7e7fd834b2f81c6698a7870862b69a69248db42d7053498795c11e6da0933df1386d94e965e3b0716IZwf6R5BvkCkXdvm81nb8QKsP/kyngrEP0okJHAAvT1GJdLL2xEpQsp67NWYMKg1'),
(242, 1, 'yeviki', 1635842561, '::1', 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.54 Mobile Safari/537.36', 1, 'e79f6ebfc76e29fb115faf538fa768c31e4c92cfd88dc929a7061c1e77c3976bcbb7b91c28c828ebf866a92d78be03240fa049cff93ada3dc78a58f4f47c969fxAOeUc/wibMOnCoUv/67XLRRxJmz307Q2HloYoa9KunBn4938RibMj5I1UVm73+s'),
(243, 1, 'yeviki', 1635842577, '::1', 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.54 Mobile Safari/537.36', 1, 'f671499a6cacaedd8b212385fd5c21c071f2f6ce85e37789a1ce4c3825c97f4918602eddc53bfc4b41c60a0cc58f2bdf906e0ea7c98d25146e0ada755f1bba37HF7+Vqg7+IVUNsV0r9IaIIYSc6KXp6torDHo5AqjOyXh8RcRstcIL2/CAKsAnj+f'),
(244, 1, 'yeviki', 1635842601, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:93.0) Gecko/20100101 Firefox/93.0', 1, '935724e8134bf5377a965b63ab3a5f804f25e2d90390de7e9fc9b778947675f69fb5f60576649109e9ba2de0e0b72b2abf3cb64fb9859efa55793747f079160d2ZQ5lAg6M/swwPSKcIEpT4YhjgASHKyht5AUSDhmKiWZWWTE86BArLcLtwx3Mn4W'),
(245, 1, 'yeviki', 1635924703, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:93.0) Gecko/20100101 Firefox/93.0', 1, '7a40d4dc7b2bd73a3dec630ec2dc79fc7ec89635a5df8c84c2f392c23022a8f4e00735a91c157d0c74567510d43ce74ce4f19e48c017c30fe6d7cebcf48765cbndCurTafp4Ek+Xt4G+dSGynOaXk0zt0/1oW89HXsvjUafxQXgI7CoxfBuTyg2gWl'),
(246, 1, 'yeviki', 1636076288, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:93.0) Gecko/20100101 Firefox/93.0', 1, '2deb3c0cf560251b1b485bfc20e6cd080e3bdc9d3aa3064cca13ed127842d2df865e440a3370ca7d677d858019117f2eb5e26c9b65c78fdf1acdbf619ec3336dXjVYVfdbPEzSR6MWyc6pqNY35UYeQ8Q4vtB2ado9XfCjSqvd4LNG3y7Srb49u9Nd'),
(247, 1, 'yeviki', 1636104767, '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.69 Safari/537.36', 1, 'a68ff2157adda43ef76babc9d8519d1125a853f84ba8b037480c625ae6cdf01bce85d5e5db1bac8460a3fc21144689ed2c292028a5019226f95ac4331d02db243d0nfqX5gkAZl5w1o69RZbAPB0JALfMuhj751H33nEc9dPb6FZLIYDDZBMWSCTM2'),
(248, 1, 'yeviki', 1636104799, '::1', 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.69 Mobile Safari/537.36', 1, '596c74c2aecba146f39ce0259cdf03a7819e5c536114690290b65ce8c40ef50a9b52fe33da39161f0c891053152925a69edd1d4b90c7efab2064faa62750e1906esa2QGggTnJeCP7Gexad7WAG4JcEymCqmu7i5cxM1+n3Gp0uwovTqQ8mQq9SU3H'),
(249, 1, 'yeviki', 1636104811, '::1', 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.69 Mobile Safari/537.36', 1, 'cdf6f87b25e58d8410319ca846169363880f52f8fbbfc073c5a1d7226b7a1d9e6c7cd817558d8af0ab06697245850b8ebaa0ae1fbc19347a516fcf89c697ac7bjigojElXExpuPlqsMwB3CZ0ncv4Mc45xX/IROZvHzXGbb1FGLeL92fq834emmdyT'),
(250, 1, 'yeviki', 1636104829, '::1', 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.69 Mobile Safari/537.36', 1, '655bfb425612f0ee9444b24c5edb541ad650f5998e6abfd8046fd7bc4de845b1a982b35ff6c717b1cfca859995207c90ae01a1a126e0d53a9b3ed13f4948f81cWVUOrTxGMMyv3CXQYo/zvkQvS6NmtPRIcWGXmh3hOZf3nIqUN7QnE0/4PEsXaknH'),
(251, 1, 'yeviki', 1636104841, '::1', 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.69 Mobile Safari/537.36', 1, '7bf393c93103dd9325fb5c4efe8f61525bd7c3505fe746242480a826b3817934c0b61580e646cb37917bc8dc41328fbcf3b4fc20ddf0497fdd3e879135a25ab3m+05nL0t2OdzGpofuDsI2DIOz6xYTh0AVMVJaQL3KltpL5fioliIgWqsnSSsMAMT'),
(252, 2, 'admin_pyk', 1636105669, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:93.0) Gecko/20100101 Firefox/93.0', 1, '6f799c315670e7501230a3467d2b5649a4042cab85e81fe08a4cc7bd11fa327498dd48be6d6adaa66063965f7bb4243e700d2a8878ab2490fd2e5e7141a55050mwE6seA9mQFRqZTobHdBGeT6l58P/eHCsVZpP/SiJlOdM31zbIbsPLmc4a7IZH8V'),
(253, 3, 'admin_solok', 1636106015, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:93.0) Gecko/20100101 Firefox/93.0', 1, '5e5d15232fe38f95117878b9c9269f50bc2e31c9d569300421a18092fb4aabe5ea67368338bc7d88fb00591ee679eeae5715a5ecca8971050dd23da55f24add688WcNj6Oka7D559ofsHnM/PDrBIJaQQUyEqlQWlvYC92bMDDKQ9gQYfLqMBqOgKt'),
(254, 1, 'yeviki', 1636290985, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:93.0) Gecko/20100101 Firefox/93.0', 1, 'a8a19e34113d48dafa459ed27bbb7f216c8a3fbe4180339d9fb7456e1a6d553a0a15194cde013eed0834e5ecd1e28accfbee9823443587a5a6390d7f181a1edaVlM6RgT+RcMGvPNaHEw0yHOYjm3YVAW234d1LOsOX1qDmuhzeas3PFyIqDpGcefy'),
(255, 2, 'admin_pyk', 1636291269, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:93.0) Gecko/20100101 Firefox/93.0', 1, '9b4930f5341f71ceacb1a0eecfca3fb7c350bb190ddb3b0858644d199e51b5123f1c8700c5aa0c765c4b23f6cd5a193a9f56158ffd949bad18efb50c1df4e5f1np1qqcBWK80uoqblRUEbOtnvMna1LVeRm1+VytihIY/eRUvh4VfvzdYaLl0kau6/'),
(256, 3, 'admin_solok', 1636291304, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:93.0) Gecko/20100101 Firefox/93.0', 1, 'b923a3f8dc1bddc396d21d5492e80b69a507f18c2451189a03eb9ae69d41073079978ba20682e97a642650b5f77da89116a170c40e5e73eb1df5fd1f12bc930cS62xCk2BZPdUbtEzFow6sa6hld9463fNtBJHpKVTlA+rr6mn47KSrpSFTPADB6Tf');

-- --------------------------------------------------------

--
-- Table structure for table `xi_sa_menu`
--

CREATE TABLE `xi_sa_menu` (
  `id_menu` int(11) NOT NULL,
  `title_menu` varchar(255) NOT NULL,
  `url_menu` varchar(255) NOT NULL,
  `icon_menu` varchar(100) NOT NULL,
  `order_menu` int(3) NOT NULL,
  `id_rules` int(11) NOT NULL,
  `parent_id` int(11) NOT NULL,
  `is_parent` enum('Y','N') NOT NULL,
  `create_by` varchar(255) NOT NULL,
  `create_date` datetime NOT NULL,
  `create_ip` varchar(20) NOT NULL,
  `mod_by` varchar(255) NOT NULL,
  `mod_date` datetime NOT NULL,
  `mod_ip` varchar(20) NOT NULL,
  `id_status` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `xi_sa_menu`
--

INSERT INTO `xi_sa_menu` (`id_menu`, `title_menu`, `url_menu`, `icon_menu`, `order_menu`, `id_rules`, `parent_id`, `is_parent`, `create_by`, `create_date`, `create_ip`, `mod_by`, `mod_date`, `mod_ip`, `id_status`) VALUES
(1, 'Home', '', 'fas fa-home', 1, 1, 0, 'N', '', '2017-06-07 12:09:31', '::1', 'yogisolop', '2020-09-17 20:00:32', '::1', 1),
(2, 'Manajemen', '#', 'fas fa-user-cog', 2, 0, 0, 'Y', '', '2017-06-07 12:09:47', '::1', 'yogisolop', '2019-04-23 14:32:10', '36.67.76.99', 1),
(3, 'Fungsi', '', '', 1, 2, 2, 'N', '', '2017-06-07 12:10:03', '::1', 'yogisolop', '2019-04-23 14:32:04', '36.67.76.99', 1),
(4, 'Kontrol', '', '', 2, 8, 2, 'N', '', '2017-06-07 12:10:26', '::1', 'yogisolop', '2019-04-23 14:32:20', '36.67.76.99', 1),
(5, 'Module', '', '', 3, 14, 2, 'N', '', '2017-06-07 12:10:48', '::1', 'yogisolop', '2019-04-23 14:32:26', '36.67.76.99', 1),
(6, 'Menu', '', '', 4, 21, 2, 'N', '', '2017-06-07 12:11:06', '::1', 'yogisolop', '2019-04-23 14:32:32', '36.67.76.99', 1),
(7, 'Group', '', '', 5, 27, 2, 'N', '', '2017-06-10 22:25:19', '::1', 'yogisolop', '2019-04-23 14:32:37', '36.67.76.99', 1),
(8, 'Users', '', '', 6, 34, 2, 'N', '', '2017-06-14 19:20:01', '::1', 'yogisolop', '2019-04-23 14:32:44', '36.67.76.99', 1),
(13, 'Data', '#', 'fas fa-clipboard-list', 3, 0, 0, 'Y', 'administrator', '2021-02-16 08:59:28', '::1', 'yeviki', '2021-07-29 12:07:34', '127.0.0.1', 1),
(14, 'Barang', '', '', 1, 85, 13, 'N', 'administrator', '2021-02-16 09:39:55', '::1', 'yeviki', '2021-08-03 13:52:26', '127.0.0.1', 1),
(15, 'Pembelian', '', '', 2, 93, 13, 'N', 'administrator', '2021-02-18 09:56:34', '::1', 'yeviki', '2021-09-30 09:04:10', '127.0.0.1', 1),
(16, 'Buku Beser', '#', 'fas fa-envelope', 4, 0, 0, 'Y', 'administrator', '2021-02-18 10:18:22', '::1', 'yeviki', '2021-10-26 11:23:44', '127.0.0.1', 1),
(17, 'Disposisi Masuk', '', '', 1, 74, 16, 'N', 'administrator', '2021-02-18 10:18:49', '::1', 'administrator', '2021-02-18 10:18:49', '::1', 1),
(18, 'Permintaan', '', '', 3, 100, 13, 'N', 'administrator', '2021-03-01 15:12:22', '::1', 'yeviki', '2021-10-26 11:28:31', '127.0.0.1', 1),
(19, 'Master', '#', 'fa fa-list', 5, 0, 0, 'Y', 'administrator', '2021-03-09 10:45:06', '::1', 'administrator', '2021-03-09 10:45:06', '::1', 1);

-- --------------------------------------------------------

--
-- Table structure for table `xi_sa_module`
--

CREATE TABLE `xi_sa_module` (
  `id_module` int(11) NOT NULL,
  `nama_module` varchar(255) NOT NULL,
  `label_module` varchar(255) NOT NULL,
  `url_module` varchar(255) NOT NULL,
  `deskripsi_module` varchar(255) NOT NULL,
  `create_by` varchar(255) NOT NULL,
  `create_date` datetime NOT NULL,
  `create_ip` varchar(20) NOT NULL,
  `mod_by` varchar(255) NOT NULL,
  `mod_date` datetime NOT NULL,
  `mod_ip` varchar(20) NOT NULL,
  `id_status` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `xi_sa_module`
--

INSERT INTO `xi_sa_module` (`id_module`, `nama_module`, `label_module`, `url_module`, `deskripsi_module`, `create_by`, `create_date`, `create_ip`, `mod_by`, `mod_date`, `mod_ip`, `id_status`) VALUES
(1, 'home', 'Home', 'home', 'Module home', 'yogisolop', '2017-06-04 19:39:22', '::1', 'yogisolop', '2020-05-19 11:06:41', '::1', 1),
(2, 'manajemen', 'Manajemen', 'manajemen', 'Module konfigurasi system khusus untuk superadmin', 'yogisolop', '2017-06-04 19:40:50', '::1', 'yogisolop', '2017-08-03 16:00:08', '::1', 1),
(11, 'data', 'Data', 'data', 'Module data barang dan logistik', 'yeviki', '2021-07-29 11:59:39', '127.0.0.1', 'yeviki', '2021-08-03 13:52:41', '127.0.0.1', 1);

-- --------------------------------------------------------

--
-- Table structure for table `xi_sa_rules`
--

CREATE TABLE `xi_sa_rules` (
  `id_rules` int(11) NOT NULL,
  `id_module` int(11) NOT NULL,
  `id_kontrol` int(11) NOT NULL,
  `id_fungsi` int(11) NOT NULL,
  `id_status` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `xi_sa_rules`
--

INSERT INTO `xi_sa_rules` (`id_rules`, `id_module`, `id_kontrol`, `id_fungsi`, `id_status`) VALUES
(1, 1, 1, 1, 1),
(2, 2, 2, 1, 1),
(3, 2, 2, 2, 1),
(4, 2, 2, 3, 1),
(5, 2, 2, 4, 1),
(6, 2, 2, 5, 1),
(7, 2, 2, 7, 1),
(8, 2, 3, 1, 1),
(9, 2, 3, 2, 1),
(10, 2, 3, 3, 1),
(11, 2, 3, 4, 1),
(12, 2, 3, 5, 1),
(13, 2, 3, 7, 1),
(14, 2, 4, 1, 1),
(15, 2, 4, 2, 1),
(16, 2, 4, 3, 1),
(17, 2, 4, 4, 1),
(18, 2, 4, 5, 1),
(19, 2, 4, 7, 1),
(20, 2, 4, 9, 1),
(21, 2, 5, 1, 1),
(22, 2, 5, 2, 1),
(23, 2, 5, 3, 1),
(24, 2, 5, 4, 1),
(25, 2, 5, 5, 1),
(26, 2, 5, 7, 1),
(27, 2, 6, 1, 1),
(28, 2, 6, 2, 1),
(29, 2, 6, 3, 1),
(30, 2, 6, 4, 1),
(31, 2, 6, 5, 1),
(32, 2, 6, 7, 1),
(33, 2, 6, 10, 1),
(34, 2, 7, 1, 1),
(35, 2, 7, 2, 1),
(36, 2, 7, 3, 1),
(37, 2, 7, 4, 1),
(38, 2, 7, 5, 1),
(39, 2, 7, 7, 1),
(40, 2, 7, 8, 1),
(85, 11, 18, 1, 1),
(86, 11, 18, 2, 1),
(87, 11, 18, 3, 1),
(88, 11, 18, 4, 1),
(89, 11, 18, 5, 1),
(90, 11, 18, 7, 1),
(91, 1, 19, 1, 1),
(92, 1, 19, 3, 1),
(93, 11, 20, 1, 1),
(94, 11, 20, 2, 1),
(95, 11, 20, 3, 1),
(96, 11, 20, 4, 1),
(97, 11, 20, 5, 1),
(98, 11, 20, 7, 1),
(99, 11, 20, 21, 1),
(100, 11, 21, 1, 1),
(101, 11, 21, 2, 1),
(102, 11, 21, 3, 1),
(103, 11, 21, 4, 1),
(104, 11, 21, 5, 1),
(105, 11, 21, 7, 1),
(106, 11, 21, 22, 1),
(107, 11, 21, 23, 1);

-- --------------------------------------------------------

--
-- Table structure for table `xi_sa_setting`
--

CREATE TABLE `xi_sa_setting` (
  `id` int(11) NOT NULL,
  `app_name` varchar(255) NOT NULL COMMENT 'tgl mulai running aplikasi',
  `app_author` varchar(255) NOT NULL COMMENT 'lama sosialisasi',
  `app_description` text NOT NULL COMMENT 'biaya denda adm',
  `app_year` char(4) NOT NULL,
  `app_icon` varchar(200) NOT NULL,
  `app_favicon` varchar(200) NOT NULL,
  `app_keywords` text NOT NULL,
  `app_versi` char(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `xi_sa_setting`
--

INSERT INTO `xi_sa_setting` (`id`, `app_name`, `app_author`, `app_description`, `app_year`, `app_icon`, `app_favicon`, `app_keywords`, `app_versi`) VALUES
(1, 'LOGISTIK - DLH', 'Dinas Lingkungan Hidup Provinsi Sumatera Barat', 'Sistem Logistik', '2021', 'logo_sumbar.png', 'favicon.ico', 'Logistik', '1.0.0');

-- --------------------------------------------------------

--
-- Table structure for table `xi_sa_status`
--

CREATE TABLE `xi_sa_status` (
  `id_status` int(2) NOT NULL,
  `nm_status` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `xi_sa_status`
--

INSERT INTO `xi_sa_status` (`id_status`, `nm_status`) VALUES
(0, 'Tidak Aktif'),
(1, 'Aktif');

-- --------------------------------------------------------

--
-- Table structure for table `xi_sa_users`
--

CREATE TABLE `xi_sa_users` (
  `id_users` int(11) NOT NULL,
  `token` varchar(32) NOT NULL,
  `nip` varchar(20) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(250) NOT NULL,
  `email` varchar(100) NOT NULL,
  `fullname` varchar(255) NOT NULL,
  `foto_profile` varchar(50) NOT NULL COMMENT 'Foto Profile',
  `id_tpa` int(11) NOT NULL,
  `blokir` int(1) NOT NULL COMMENT '0=diblokir, 1=tidak diblokir',
  `id_status` int(1) NOT NULL COMMENT '0=Tidak Aktif, 1=Aktif',
  `validate_email_code` varchar(100) NOT NULL,
  `validate_email_status` int(1) NOT NULL,
  `reset_password_code` varchar(100) NOT NULL,
  `reset_password_status` int(1) NOT NULL,
  `reset_password_expired` int(11) NOT NULL,
  `create_by` varchar(255) NOT NULL,
  `create_date` datetime NOT NULL,
  `create_ip` varchar(20) NOT NULL,
  `mod_by` varchar(255) NOT NULL,
  `mod_date` datetime NOT NULL,
  `mod_ip` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `xi_sa_users`
--

INSERT INTO `xi_sa_users` (`id_users`, `token`, `nip`, `username`, `password`, `email`, `fullname`, `foto_profile`, `id_tpa`, `blokir`, `id_status`, `validate_email_code`, `validate_email_status`, `reset_password_code`, `reset_password_status`, `reset_password_expired`, `create_by`, `create_date`, `create_ip`, `mod_by`, `mod_date`, `mod_ip`) VALUES
(1, '231E696E9C21810535E08FFFE70F0868', '', 'yeviki', '$2a$12$kWKgXR2dClTGjsmINwvBG.L4PnlPCL6nhOcvI/QLk7g5YG/LP97wO', '', 'Administrator', 'default-user-icon.jpg', 0, 0, 1, '', 0, '', 0, 0, '', '0000-00-00 00:00:00', '::1', 'administrator', '2021-02-09 13:55:08', '::1'),
(2, '0DE5FD061A973A3CAE12F73D2272E1BA', '', 'admin_pyk', '$2a$12$z2QyzDF96NITZz0eAVGqp.8tiRXladYQM2Y8h4SugUfTZZMfxxUde', '', 'Admin PYK', 'default-user-icon.jpg', 1, 0, 1, '', 0, '', 0, 0, 'yeviki', '2021-11-05 16:09:16', '127.0.0.1', 'yeviki', '2021-11-05 16:09:16', '127.0.0.1'),
(3, '08063D48F2EEE8C56EA72B2FF55B97F7', '', 'admin_solok', '$2a$12$aeP1Uu2JeRWvcfLN8Na6f.LUgxW/Z0nnV6PuZpE0nGhgw8MJi5cTW', '', 'Admin Solok', 'default-user-icon.jpg', 2, 0, 1, '', 0, '', 0, 0, 'yeviki', '2021-11-05 16:09:53', '127.0.0.1', 'yeviki', '2021-11-05 16:09:53', '127.0.0.1');

--
-- Triggers `xi_sa_users`
--
DELIMITER $$
CREATE TRIGGER `tgr_users_delete` AFTER DELETE ON `xi_sa_users` FOR EACH ROW BEGIN
	DELETE FROM xi_sa_users_default_pass WHERE id_users = OLD.id_users;
    DELETE FROM xi_sa_users_privileges WHERE id_users = OLD.id_users;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `xi_sa_users_default_pass`
--

CREATE TABLE `xi_sa_users_default_pass` (
  `id_default_pass` int(11) NOT NULL,
  `id_users` int(11) NOT NULL,
  `pass_plain` char(100) NOT NULL,
  `updated` enum('Y','N') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `xi_sa_users_default_pass`
--

INSERT INTO `xi_sa_users_default_pass` (`id_default_pass`, `id_users`, `pass_plain`, `updated`) VALUES
(1, 2, 'Asdf@1234', 'N'),
(2, 3, 'Asdf@1234', 'N');

-- --------------------------------------------------------

--
-- Table structure for table `xi_sa_users_privileges`
--

CREATE TABLE `xi_sa_users_privileges` (
  `id_users_privileges` int(11) NOT NULL,
  `id_users` int(11) NOT NULL,
  `id_group` int(11) NOT NULL,
  `id_status` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `xi_sa_users_privileges`
--

INSERT INTO `xi_sa_users_privileges` (`id_users_privileges`, `id_users`, `id_group`, `id_status`) VALUES
(1, 1, 1, 1),
(2, 2, 6, 1),
(3, 3, 6, 1);

-- --------------------------------------------------------

--
-- Table structure for table `xi_sa_white_list`
--

CREATE TABLE `xi_sa_white_list` (
  `id_white_list` int(11) NOT NULL,
  `module_name` varchar(100) NOT NULL,
  `class_name` varchar(100) NOT NULL,
  `method_name` varchar(100) NOT NULL,
  `id_status` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `xi_sa_white_list`
--

INSERT INTO `xi_sa_white_list` (`id_white_list`, `module_name`, `class_name`, `method_name`, `id_status`) VALUES
(1, 'auth', 'signin', 'login', 1),
(2, 'auth', 'signin', 'logout', 1),
(3, 'auth', 'signin', 'switch_group', 1),
(4, 'auth', 'signin', 'timeout', 1),
(5, 'auth', 'signin', 'account', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `data_barang`
--
ALTER TABLE `data_barang`
  ADD PRIMARY KEY (`id_barang`);

--
-- Indexes for table `data_gudang`
--
ALTER TABLE `data_gudang`
  ADD PRIMARY KEY (`id_gudang`);

--
-- Indexes for table `data_pembelian`
--
ALTER TABLE `data_pembelian`
  ADD PRIMARY KEY (`id_pembelian`);

--
-- Indexes for table `data_permintaan`
--
ALTER TABLE `data_permintaan`
  ADD PRIMARY KEY (`id_permintaan`);

--
-- Indexes for table `detail_pembelian`
--
ALTER TABLE `detail_pembelian`
  ADD PRIMARY KEY (`id_detail_pembelian`);

--
-- Indexes for table `detail_permintaan`
--
ALTER TABLE `detail_permintaan`
  ADD PRIMARY KEY (`id_detail_permintaan`);

--
-- Indexes for table `ms_tpa`
--
ALTER TABLE `ms_tpa`
  ADD PRIMARY KEY (`id_tpa`);

--
-- Indexes for table `ref_kategori`
--
ALTER TABLE `ref_kategori`
  ADD PRIMARY KEY (`id_kat_barang`);

--
-- Indexes for table `ref_satuan`
--
ALTER TABLE `ref_satuan`
  ADD PRIMARY KEY (`id_satuan`);

--
-- Indexes for table `xi_sa_ci_captcha`
--
ALTER TABLE `xi_sa_ci_captcha`
  ADD PRIMARY KEY (`captcha_id`);

--
-- Indexes for table `xi_sa_ci_session`
--
ALTER TABLE `xi_sa_ci_session`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `xi_sa_fungsi`
--
ALTER TABLE `xi_sa_fungsi`
  ADD PRIMARY KEY (`id_fungsi`);

--
-- Indexes for table `xi_sa_group`
--
ALTER TABLE `xi_sa_group`
  ADD PRIMARY KEY (`id_group`);

--
-- Indexes for table `xi_sa_group_privileges`
--
ALTER TABLE `xi_sa_group_privileges`
  ADD PRIMARY KEY (`id_group_privileges`);

--
-- Indexes for table `xi_sa_jenis_fungsi`
--
ALTER TABLE `xi_sa_jenis_fungsi`
  ADD PRIMARY KEY (`id_jenis_fungsi`);

--
-- Indexes for table `xi_sa_kontrol`
--
ALTER TABLE `xi_sa_kontrol`
  ADD PRIMARY KEY (`id_kontrol`);

--
-- Indexes for table `xi_sa_level_akses`
--
ALTER TABLE `xi_sa_level_akses`
  ADD PRIMARY KEY (`id_level_akses`);

--
-- Indexes for table `xi_sa_log_akses`
--
ALTER TABLE `xi_sa_log_akses`
  ADD PRIMARY KEY (`id_log_akses`);

--
-- Indexes for table `xi_sa_log_login`
--
ALTER TABLE `xi_sa_log_login`
  ADD PRIMARY KEY (`id_log`);

--
-- Indexes for table `xi_sa_log_mobile`
--
ALTER TABLE `xi_sa_log_mobile`
  ADD PRIMARY KEY (`id_log`);

--
-- Indexes for table `xi_sa_log_session`
--
ALTER TABLE `xi_sa_log_session`
  ADD PRIMARY KEY (`id_log_session`);

--
-- Indexes for table `xi_sa_menu`
--
ALTER TABLE `xi_sa_menu`
  ADD PRIMARY KEY (`id_menu`);

--
-- Indexes for table `xi_sa_module`
--
ALTER TABLE `xi_sa_module`
  ADD PRIMARY KEY (`id_module`);

--
-- Indexes for table `xi_sa_rules`
--
ALTER TABLE `xi_sa_rules`
  ADD PRIMARY KEY (`id_rules`);

--
-- Indexes for table `xi_sa_setting`
--
ALTER TABLE `xi_sa_setting`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `xi_sa_status`
--
ALTER TABLE `xi_sa_status`
  ADD PRIMARY KEY (`id_status`);

--
-- Indexes for table `xi_sa_users`
--
ALTER TABLE `xi_sa_users`
  ADD PRIMARY KEY (`id_users`);

--
-- Indexes for table `xi_sa_users_default_pass`
--
ALTER TABLE `xi_sa_users_default_pass`
  ADD PRIMARY KEY (`id_default_pass`);

--
-- Indexes for table `xi_sa_users_privileges`
--
ALTER TABLE `xi_sa_users_privileges`
  ADD PRIMARY KEY (`id_users_privileges`),
  ADD KEY `id_users` (`id_users`),
  ADD KEY `id_status` (`id_status`),
  ADD KEY `id_group` (`id_group`);

--
-- Indexes for table `xi_sa_white_list`
--
ALTER TABLE `xi_sa_white_list`
  ADD PRIMARY KEY (`id_white_list`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `data_barang`
--
ALTER TABLE `data_barang`
  MODIFY `id_barang` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `data_gudang`
--
ALTER TABLE `data_gudang`
  MODIFY `id_gudang` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `data_pembelian`
--
ALTER TABLE `data_pembelian`
  MODIFY `id_pembelian` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `data_permintaan`
--
ALTER TABLE `data_permintaan`
  MODIFY `id_permintaan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `detail_pembelian`
--
ALTER TABLE `detail_pembelian`
  MODIFY `id_detail_pembelian` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT for table `detail_permintaan`
--
ALTER TABLE `detail_permintaan`
  MODIFY `id_detail_permintaan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `ms_tpa`
--
ALTER TABLE `ms_tpa`
  MODIFY `id_tpa` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `ref_kategori`
--
ALTER TABLE `ref_kategori`
  MODIFY `id_kat_barang` int(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `ref_satuan`
--
ALTER TABLE `ref_satuan`
  MODIFY `id_satuan` int(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
--
-- AUTO_INCREMENT for table `xi_sa_ci_captcha`
--
ALTER TABLE `xi_sa_ci_captcha`
  MODIFY `captcha_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `xi_sa_fungsi`
--
ALTER TABLE `xi_sa_fungsi`
  MODIFY `id_fungsi` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;
--
-- AUTO_INCREMENT for table `xi_sa_group`
--
ALTER TABLE `xi_sa_group`
  MODIFY `id_group` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `xi_sa_group_privileges`
--
ALTER TABLE `xi_sa_group_privileges`
  MODIFY `id_group_privileges` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=141;
--
-- AUTO_INCREMENT for table `xi_sa_jenis_fungsi`
--
ALTER TABLE `xi_sa_jenis_fungsi`
  MODIFY `id_jenis_fungsi` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `xi_sa_kontrol`
--
ALTER TABLE `xi_sa_kontrol`
  MODIFY `id_kontrol` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;
--
-- AUTO_INCREMENT for table `xi_sa_level_akses`
--
ALTER TABLE `xi_sa_level_akses`
  MODIFY `id_level_akses` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `xi_sa_log_akses`
--
ALTER TABLE `xi_sa_log_akses`
  MODIFY `id_log_akses` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `xi_sa_log_login`
--
ALTER TABLE `xi_sa_log_login`
  MODIFY `id_log` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `xi_sa_log_mobile`
--
ALTER TABLE `xi_sa_log_mobile`
  MODIFY `id_log` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `xi_sa_log_session`
--
ALTER TABLE `xi_sa_log_session`
  MODIFY `id_log_session` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=257;
--
-- AUTO_INCREMENT for table `xi_sa_menu`
--
ALTER TABLE `xi_sa_menu`
  MODIFY `id_menu` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;
--
-- AUTO_INCREMENT for table `xi_sa_module`
--
ALTER TABLE `xi_sa_module`
  MODIFY `id_module` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT for table `xi_sa_rules`
--
ALTER TABLE `xi_sa_rules`
  MODIFY `id_rules` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=108;
--
-- AUTO_INCREMENT for table `xi_sa_setting`
--
ALTER TABLE `xi_sa_setting`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `xi_sa_users`
--
ALTER TABLE `xi_sa_users`
  MODIFY `id_users` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `xi_sa_users_default_pass`
--
ALTER TABLE `xi_sa_users_default_pass`
  MODIFY `id_default_pass` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `xi_sa_users_privileges`
--
ALTER TABLE `xi_sa_users_privileges`
  MODIFY `id_users_privileges` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `xi_sa_white_list`
--
ALTER TABLE `xi_sa_white_list`
  MODIFY `id_white_list` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `xi_sa_users_privileges`
--
ALTER TABLE `xi_sa_users_privileges`
  ADD CONSTRAINT `xi_sa_users_privileges_ibfk_1` FOREIGN KEY (`id_users`) REFERENCES `xi_sa_users` (`id_users`),
  ADD CONSTRAINT `xi_sa_users_privileges_ibfk_2` FOREIGN KEY (`id_status`) REFERENCES `xi_sa_status` (`id_status`),
  ADD CONSTRAINT `xi_sa_users_privileges_ibfk_3` FOREIGN KEY (`id_group`) REFERENCES `xi_sa_group` (`id_group`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
