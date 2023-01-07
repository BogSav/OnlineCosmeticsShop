-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 07, 2023 at 03:20 PM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `cosmetics`
--

-- --------------------------------------------------------

--
-- Table structure for table `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` bigint(20) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can view log entry', 1, 'view_logentry'),
(5, 'Can add permission', 2, 'add_permission'),
(6, 'Can change permission', 2, 'change_permission'),
(7, 'Can delete permission', 2, 'delete_permission'),
(8, 'Can view permission', 2, 'view_permission'),
(9, 'Can add group', 3, 'add_group'),
(10, 'Can change group', 3, 'change_group'),
(11, 'Can delete group', 3, 'delete_group'),
(12, 'Can view group', 3, 'view_group'),
(13, 'Can add user', 4, 'add_user'),
(14, 'Can change user', 4, 'change_user'),
(15, 'Can delete user', 4, 'delete_user'),
(16, 'Can view user', 4, 'view_user'),
(17, 'Can add content type', 5, 'add_contenttype'),
(18, 'Can change content type', 5, 'change_contenttype'),
(19, 'Can delete content type', 5, 'delete_contenttype'),
(20, 'Can view content type', 5, 'view_contenttype'),
(21, 'Can add session', 6, 'add_session'),
(22, 'Can change session', 6, 'change_session'),
(23, 'Can delete session', 6, 'delete_session'),
(24, 'Can view session', 6, 'view_session'),
(25, 'Can add clienti', 7, 'add_clienti'),
(26, 'Can change clienti', 7, 'change_clienti'),
(27, 'Can delete clienti', 7, 'delete_clienti'),
(28, 'Can view clienti', 7, 'view_clienti'),
(29, 'Can add adrese', 8, 'add_adrese'),
(30, 'Can change adrese', 8, 'change_adrese'),
(31, 'Can delete adrese', 8, 'delete_adrese'),
(32, 'Can view adrese', 8, 'view_adrese'),
(33, 'Can add comenzi', 9, 'add_comenzi'),
(34, 'Can change comenzi', 9, 'change_comenzi'),
(35, 'Can delete comenzi', 9, 'delete_comenzi'),
(36, 'Can view comenzi', 9, 'view_comenzi'),
(37, 'Can add poze produse', 10, 'add_pozeproduse'),
(38, 'Can change poze produse', 10, 'change_pozeproduse'),
(39, 'Can delete poze produse', 10, 'delete_pozeproduse'),
(40, 'Can view poze produse', 10, 'view_pozeproduse'),
(41, 'Can add produse', 11, 'add_produse'),
(42, 'Can change produse', 11, 'change_produse'),
(43, 'Can delete produse', 11, 'delete_produse'),
(44, 'Can view produse', 11, 'view_produse'),
(45, 'Can add produse comandate', 12, 'add_produsecomandate'),
(46, 'Can change produse comandate', 12, 'change_produsecomandate'),
(47, 'Can delete produse comandate', 12, 'delete_produsecomandate'),
(48, 'Can view produse comandate', 12, 'view_produsecomandate'),
(49, 'Can add reviews', 13, 'add_reviews'),
(50, 'Can change reviews', 13, 'change_reviews'),
(51, 'Can delete reviews', 13, 'delete_reviews'),
(52, 'Can view reviews', 13, 'view_reviews'),
(53, 'Can add produse in cos', 14, 'add_produseincos'),
(54, 'Can change produse in cos', 14, 'change_produseincos'),
(55, 'Can delete produse in cos', 14, 'delete_produseincos'),
(56, 'Can view produse in cos', 14, 'view_produseincos');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user`
--

CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `auth_user`
--

INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`) VALUES
(1, 'pbkdf2_sha256$390000$48QIAbaF8h3deuKDWGRIus$EGcr0E9v1l0CF0AtVoOu87dZd3mM2twSU4J32WuoARA=', '2023-01-06 09:03:03.747352', 1, 'bogdan', '', '', 'bogdansava59@yahoo.com', 1, 1, '2022-11-08 20:52:17.415609');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_groups`
--

CREATE TABLE `auth_user_groups` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_user_permissions`
--

CREATE TABLE `auth_user_user_permissions` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cosmetics_adrese`
--

CREATE TABLE `cosmetics_adrese` (
  `AdresaID` int(11) NOT NULL,
  `Judet` varchar(30) NOT NULL,
  `Localitate` varchar(30) NOT NULL,
  `Adresa` varchar(70) NOT NULL,
  `CodPostal` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `cosmetics_adrese`
--

INSERT INTO `cosmetics_adrese` (`AdresaID`, `Judet`, `Localitate`, `Adresa`, `CodPostal`) VALUES
(14, 'Calarasi', 'Calarasi', 'B-dul. Nicolae TYitulescu', '910094');

-- --------------------------------------------------------

--
-- Table structure for table `cosmetics_clienti`
--

CREATE TABLE `cosmetics_clienti` (
  `ClientID` int(11) NOT NULL,
  `Nume` varchar(45) NOT NULL,
  `Prenume` varchar(45) NOT NULL,
  `Email` varchar(50) NOT NULL,
  `StatusCont` varchar(30) NOT NULL,
  `DataNastere` date DEFAULT NULL,
  `DataCreareCont` date NOT NULL,
  `Gender` smallint(6) DEFAULT NULL,
  `AdresaID` int(11) DEFAULT NULL,
  `Password` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `cosmetics_clienti`
--

INSERT INTO `cosmetics_clienti` (`ClientID`, `Nume`, `Prenume`, `Email`, `StatusCont`, `DataNastere`, `DataCreareCont`, `Gender`, `AdresaID`, `Password`) VALUES
(21, 'Sava', 'Bogdan', 'bogdansava59@yahoo.com', 'Activ', '2022-12-14', '2022-12-28', 0, 14, 'root');

-- --------------------------------------------------------

--
-- Table structure for table `cosmetics_comenzi`
--

CREATE TABLE `cosmetics_comenzi` (
  `ComandaID` int(11) NOT NULL,
  `Pret` int(11) NOT NULL,
  `DataCreare` date NOT NULL,
  `Status` varchar(30) NOT NULL,
  `AdresaID` int(11) DEFAULT NULL,
  `ClientID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `cosmetics_comenzi`
--

INSERT INTO `cosmetics_comenzi` (`ComandaID`, `Pret`, `DataCreare`, `Status`, `AdresaID`, `ClientID`) VALUES
(1, 78, '2023-01-06', 'In curs de procesare', 14, 21),
(2, 155, '2023-01-06', 'In curs de procesare', 14, 21),
(3, 97, '2023-01-06', 'In curs de procesare', 14, 21),
(4, 119, '2023-01-07', 'In curs de procesare', 14, 21);

-- --------------------------------------------------------

--
-- Table structure for table `cosmetics_pozeproduse`
--

CREATE TABLE `cosmetics_pozeproduse` (
  `PozaProdusID` int(11) NOT NULL,
  `Path` varchar(160) NOT NULL,
  `ProdusID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `cosmetics_pozeproduse`
--

INSERT INTO `cosmetics_pozeproduse` (`PozaProdusID`, `Path`, `ProdusID`) VALUES
(1, 'https://cdn.notinoimg.com/detail_zoom/schwarzkopf-professional/scw3dmm_kstl10-02/schwarzkopf-professional-[3d]-men-lut-modelator-fixare-puternica___19.jpg', 1),
(2, 'https://cdn.notinoimg.com/detail_zoom/schwarzkopf-professional/4045787265040_01-o/schwarzkopf-professional-[3d]-men-lut-modelator-fixare-puternica___19.jpg', 1),
(3, 'https://s13emagst.akamaized.net/products/16094/16093060/images/res_bcca89c108ebb16fe27142f6f2529770.jpg?width=450&height=450&hash=FDB23C9D683DDDC22EB8DDDE5A0A0A', 2),
(7, 'https://lcdn.altex.ro/media/catalog/product/H/S/HSTHBG00021_9bd6c82d.jpg', 3),
(8, 'https://media.douglas.ro/media/image/bd/71/d5/9000101252125_1280x1280.jpg', 3),
(9, 'https://gomagcdn.ro/domains/lamimi.ro/files/product/large/pudra-pentru-par-lipsit-de-volum-taft-schwarzkopf-10g-copie-5542-5199.jpg', 4),
(10, 'https://s13emagst.akamaized.net/products/428/427505/images/res_71ae29c6a0a731f991c9009a666ddded.jpg?width=450&height=450&hash=7D878D4A6087FF7018B96C9E12CBD18E', 5),
(11, 'https://cdn.notinoimg.com/detail_thumb/nivea/4005808681396_01-o/nivea-care-hold-gel-de-par___13.jpg', 5),
(12, 'https://cdn.notinoimg.com/detail_thumb/syoss/9000101208542_01-o/syoss-matt-fiber-pasta-pentru-styling-mata-pentru-fixare-si-forma___5.jpg', 6),
(13, 'https://d1lqpgkqcok0l.cloudfront.net/medias/sys_master/h96/hf5/9133992935454.jpg', 7),
(14, 'https://cdn.notinoimg.com/detail_zoom/syoss/5410091753733_02/syoss-max-hold-fixativ-cu-fixare-foarte-puternica_.jpg', 7),
(15, 'https://cdn.notinoimg.com/detail_zoom/syoss/5410091753733_03/syoss-max-hold-fixativ-cu-fixare-foarte-puternica_.jpg', 7),
(16, 'https://cdn.notinoimg.com/detail_zoom/syoss/5410091753733_04/syoss-max-hold-fixativ-cu-fixare-foarte-puternica_.jpg', 7);

-- --------------------------------------------------------

--
-- Table structure for table `cosmetics_produse`
--

CREATE TABLE `cosmetics_produse` (
  `ProdusID` int(11) NOT NULL,
  `Denumire` varchar(50) NOT NULL,
  `Producator` varchar(45) NOT NULL,
  `DataAdaugarii` date NOT NULL,
  `Status` varchar(45) NOT NULL,
  `Pret` double DEFAULT NULL,
  `Cantitate` int(11) DEFAULT NULL,
  `Descriere` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `cosmetics_produse`
--

INSERT INTO `cosmetics_produse` (`ProdusID`, `Denumire`, `Producator`, `DataAdaugarii`, `Status`, `Pret`, `Cantitate`, `Descriere`) VALUES
(1, 'Ceara de par modelatoare [3D Men]', 'Schwarzkopf Professional', '2022-11-09', 'Disponibil', 23.75, 20, 'Domnilor, fixați-vă coafura pentru a rezista întreaga zi. Argila modelatoare pentru fixare puternică Schwarzkopf Professional [3D] MEN întărește coafura atât de bine, încât poate rezista chiar și vântului puternic sau condițiilor grele de lucru. Textura sa cremoasă este ușor de aplicat; în plus, hrănește și întărește cuticulele și protejează părul față de efectele adverse ale mediului extern.'),
(2, 'Ceara de par modelatoare', 'Taft', '2022-11-11', 'Disponibil', 19.98, 11, 'Inca de la primul fixativ pe care l-a creat in urma cu 60 de ani, Taft a devenit brand-ul de incredere care te ajuta sa obtii coafuri perfecte, actuale. Oferind volum fantastic, stralucire uimitoare, culoare radianta si faimoasa fixare puternica indiferent de vreme, fiecare produs Taft este creat special pentru nevoile individuale ale consumatorilor sai.'),
(3, 'Pudra pentru păr Got2b Volumizing Powder', 'Schwarzkopf Professional', '2022-11-11', 'Disponibil', 22.17, 17, 'Pudra pentru păr Schwarzkopf Got2b Volumizing Powder deține o formulă revoluționară ce contribuie la crearea unei coafuri fascinante! Produsul reprezintă o ocazie unică de a menține stilul coafurii fără a folosi un pieptene și un uscător de păr. Textura sa sub formă de pudră va conferi fiecărui podoabei capilare un volum impecabil și un aspect îngrijit. Produsul nu irită scalpul și nu provoacă apariția mătreții. Pudra poate fi ușor îndepărtată, prin spălarea părul cu un șampon.'),
(4, 'Pudra par Instant True Volume', 'Taft', '2022-11-11', 'Disponibil', 26, 30, 'Părul dvs. vă expune la provocări? Nicio astfel de provocare nu este imposibilă pentru pudra de volum Schwarzkopf Taft Instant True Volume. Indiferent dacă părul dvs. este subțire, gras, fin sau foarte moale, pudra asigură volum instantaneu de la rădăcină, oferind un aspect îngrijit. Cu o formulă ușoară, nelipicioasă, pudra oferă textură fiecărei șuvițe și vă asigură că veți avea o coafură reușită, cu volum extrem, care va rezista toată ziua.'),
(5, 'Gel de par Creme pentru fixare medie', 'Nivea', '2022-11-11', 'Disponibil', 25.79, 9, 'NIVEA este cea mai de incredere marca de ingrijire a pielii, la nivel mondial*. Cu o istorie de peste 100 de ani, NIVEA reprezinta expresia inovatiei si calitatii superioare in sfera produselor destinate ingrijirii pielii, fiind unul dintre cele mai mari si mai importante branduri globale. Manifestand mereu grija pentru oameni, NIVEA a ajuns sa fie, de-a lungul timpului, mai mult decat o marca de ingrijire personala, devenind parte din familie.'),
(6, 'Pasta de par modelatoare Matt Fiber', 'Syoss', '2022-11-11', 'Disponibil', 7, 6, 'Pasta modelatoare Syoss Matt Fiber devine un ajutor indispensabil, la fiecare coafare a părului dvs. Facilitează modelarea părului și fixează perfect coafura.'),
(7, 'Fixativ Max Hold', 'Syoss', '2022-11-11', 'Disponibil', 13, 8, 'Deveniți încrezătoare în coafura dvs., timp de până la 48 de ore. Fixativul pentru păr, cu fixare foarte puternică, Syoss Max Hold, nu îngreunează părul și nu îl lipește, dar, totuși, acesta va sta neclintit așa cum doriți. Asigurați-vă că aveți coafura sub control, ca să vă puteți concentra asupra lucrurilor mai importante.');

-- --------------------------------------------------------

--
-- Table structure for table `cosmetics_produsecomandate`
--

CREATE TABLE `cosmetics_produsecomandate` (
  `ProdusComandatID` int(11) NOT NULL,
  `Cantitate` int(11) NOT NULL,
  `ComandaID` int(11) DEFAULT NULL,
  `ProdusID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `cosmetics_produsecomandate`
--

INSERT INTO `cosmetics_produsecomandate` (`ProdusComandatID`, `Cantitate`, `ComandaID`, `ProdusID`) VALUES
(1, 3, 1, 1),
(2, 1, 1, 6),
(4, 6, 2, 5),
(5, 1, 3, 1),
(6, 3, 3, 3),
(7, 1, 3, 6),
(8, 5, 4, 1);

-- --------------------------------------------------------

--
-- Table structure for table `cosmetics_produseincos`
--

CREATE TABLE `cosmetics_produseincos` (
  `ProdusInCosID` int(11) NOT NULL,
  `ClientID` int(11) DEFAULT NULL,
  `ProdusID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `cosmetics_produseincos`
--

INSERT INTO `cosmetics_produseincos` (`ProdusInCosID`, `ClientID`, `ProdusID`) VALUES
(32, 21, 2),
(33, 21, 2),
(34, 21, 2);

-- --------------------------------------------------------

--
-- Table structure for table `cosmetics_reviews`
--

CREATE TABLE `cosmetics_reviews` (
  `ReviewID` int(11) NOT NULL,
  `DataCrearii` date NOT NULL,
  `Titlu` varchar(45) NOT NULL,
  `Content` longtext NOT NULL,
  `Nota` smallint(6) NOT NULL,
  `ClientID` int(11) DEFAULT NULL,
  `ProdusID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `cosmetics_reviews`
--

INSERT INTO `cosmetics_reviews` (`ReviewID`, `DataCrearii`, `Titlu`, `Content`, `Nota`, `ClientID`, `ProdusID`) VALUES
(3, '2023-01-07', 'Test', 'E bun rau', 10, 21, 2),
(4, '2023-01-07', 'Ia sa vedem', 'Mda', 2, 21, 2),
(5, '2023-01-07', 'Dezamagitor', 'RTelativ foarte prost', 1, 21, 7),
(6, '2023-01-07', 'Ia sa vedem', 'asdf', 3, 21, 7),
(7, '2023-01-07', 'Dezamagitor', 'sadfasdfasdfsadfasdfasdfasdfasfd', 2, 21, 7),
(8, '2023-01-07', 'Se putea si mai bine', 'Nu am nimic de spus, titlu e suficient.', 9, 21, 3);

-- --------------------------------------------------------

--
-- Table structure for table `django_admin_log`
--

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext DEFAULT NULL,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL CHECK (`action_flag` >= 0),
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `django_admin_log`
--

INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES
(1, '2022-11-08 21:30:41.643997', '1', 'Clienti object (1)', 1, '[{\"added\": {}}]', 7, 1),
(2, '2022-11-08 22:07:29.380346', '1', 'Adrese object (1)', 1, '[{\"added\": {}}]', 8, 1),
(3, '2022-11-08 22:09:21.957177', '1', 'Adrese object (1)', 3, '', 8, 1),
(4, '2022-11-08 22:09:51.048291', '1', 'Comenzi object (1)', 1, '[{\"added\": {}}]', 9, 1),
(5, '2022-11-08 22:10:39.523966', '1', 'Clienti object (1)', 1, '[{\"added\": {}}]', 7, 1),
(6, '2022-11-08 22:11:24.259967', '1', 'Clienti object (1)', 3, '', 7, 1),
(7, '2022-11-08 22:11:35.059540', '1', 'Comenzi object (1)', 3, '', 9, 1),
(8, '2022-11-08 22:18:59.389241', '1', 'Adrese object (1)', 1, '[{\"added\": {}}]', 8, 1),
(9, '2022-11-08 22:19:20.069091', '1', 'Clienti object (1)', 1, '[{\"added\": {}}]', 7, 1),
(10, '2022-11-09 19:45:07.883561', '1', 'Clienti object (1)', 1, '[{\"added\": {}}]', 7, 1),
(11, '2022-11-09 19:45:18.745844', '2', 'Clienti object (2)', 1, '[{\"added\": {}}]', 7, 1),
(12, '2022-11-09 20:19:37.945679', '1', 'Produse object (1)', 1, '[{\"added\": {}}]', 11, 1),
(13, '2022-11-09 20:30:26.653532', '1', 'Produse object (1)', 2, '[{\"changed\": {\"fields\": [\"Descriere\"]}}]', 11, 1),
(14, '2022-11-09 20:53:46.015463', '1', 'PozeProduse object (1)', 1, '[{\"added\": {}}]', 10, 1),
(15, '2022-11-09 20:53:55.890492', '2', 'PozeProduse object (2)', 1, '[{\"added\": {}}]', 10, 1),
(16, '2022-11-09 21:00:44.042981', '1', 'Produse object (1)', 1, '[{\"added\": {}}]', 11, 1),
(17, '2022-11-09 21:00:57.176874', '1', 'PozeProduse object (1)', 1, '[{\"added\": {}}]', 10, 1),
(18, '2022-11-09 21:01:10.080105', '2', 'PozeProduse object (2)', 1, '[{\"added\": {}}]', 10, 1),
(19, '2022-11-11 15:20:56.724675', '2', 'Produse object (2)', 1, '[{\"added\": {}}]', 11, 1),
(20, '2022-11-11 15:21:18.159067', '3', 'PozeProduse object (3)', 1, '[{\"added\": {}}]', 10, 1),
(21, '2022-11-11 15:22:42.807864', '2', 'Produse object (2)', 2, '[{\"changed\": {\"fields\": [\"Denumire\"]}}]', 11, 1),
(22, '2022-11-11 15:22:53.510590', '1', 'Produse object (1)', 2, '[{\"changed\": {\"fields\": [\"Denumire\"]}}]', 11, 1),
(23, '2022-11-11 15:24:00.199993', '3', 'Produse object (3)', 1, '[{\"added\": {}}]', 11, 1),
(24, '2022-11-11 15:24:46.957196', '4', 'PozeProduse object (4)', 1, '[{\"added\": {}}]', 10, 1),
(25, '2022-11-11 15:25:05.652482', '5', 'PozeProduse object (5)', 1, '[{\"added\": {}}]', 10, 1),
(26, '2022-11-11 15:25:26.548342', '6', 'PozeProduse object (6)', 1, '[{\"added\": {}}]', 10, 1),
(27, '2022-11-11 15:32:50.262298', '6', 'PozeProduse object (6)', 3, '', 10, 1),
(28, '2022-11-11 15:32:50.269370', '5', 'PozeProduse object (5)', 3, '', 10, 1),
(29, '2022-11-11 15:32:50.270369', '4', 'PozeProduse object (4)', 3, '', 10, 1),
(30, '2022-11-11 15:33:25.186356', '7', 'PozeProduse object (7)', 1, '[{\"added\": {}}]', 10, 1),
(31, '2022-11-11 15:33:57.083061', '8', 'PozeProduse object (8)', 1, '[{\"added\": {}}]', 10, 1),
(32, '2022-11-11 15:34:57.441538', '4', 'Produse object (4)', 1, '[{\"added\": {}}]', 11, 1),
(33, '2022-11-11 15:35:13.929547', '9', 'PozeProduse object (9)', 1, '[{\"added\": {}}]', 10, 1),
(34, '2022-11-11 15:35:42.739000', '9', 'PozeProduse object (9)', 2, '[{\"changed\": {\"fields\": [\"Path\"]}}]', 10, 1),
(35, '2022-11-11 15:36:37.870397', '4', 'Produse object (4)', 2, '[{\"changed\": {\"fields\": [\"Denumire\", \"Producator\"]}}]', 11, 1),
(36, '2022-11-11 15:38:12.896518', '5', 'Produse object (5)', 1, '[{\"added\": {}}]', 11, 1),
(37, '2022-11-11 15:38:33.137666', '10', 'PozeProduse object (10)', 1, '[{\"added\": {}}]', 10, 1),
(38, '2022-11-11 15:38:54.962444', '11', 'PozeProduse object (11)', 1, '[{\"added\": {}}]', 10, 1),
(39, '2022-11-11 15:40:05.483971', '6', 'Produse object (6)', 1, '[{\"added\": {}}]', 11, 1),
(40, '2022-11-11 15:40:17.867990', '12', 'PozeProduse object (12)', 1, '[{\"added\": {}}]', 10, 1),
(41, '2022-11-11 15:40:43.497895', '1', 'Produse object (1)', 2, '[{\"changed\": {\"fields\": [\"Denumire\"]}}]', 11, 1),
(42, '2022-11-11 15:53:39.105466', '5', 'Gel de par Creme pentru fixare medie', 2, '[{\"changed\": {\"fields\": [\"Denumire\"]}}]', 11, 1),
(43, '2022-11-11 17:56:15.101111', '4', 'Pudra par Instant True Volume', 2, '[{\"changed\": {\"fields\": [\"Status\"]}}]', 11, 1),
(44, '2022-11-11 17:56:26.643362', '4', 'Pudra par Instant True Volume', 2, '[{\"changed\": {\"fields\": [\"Status\"]}}]', 11, 1),
(45, '2022-11-11 19:48:35.679978', '12', 'Poza pasta de par modelatoare matt fiber', 2, '[]', 10, 1),
(46, '2022-11-11 19:49:33.268734', '7', 'Max Hold', 1, '[{\"added\": {}}]', 11, 1),
(47, '2022-11-11 19:49:55.304847', '13', 'Poza max hold', 1, '[{\"added\": {}}]', 10, 1),
(48, '2022-11-11 19:50:03.827437', '7', 'Fixativ Max Hold', 2, '[{\"changed\": {\"fields\": [\"Denumire\"]}}]', 11, 1),
(49, '2022-11-11 19:50:16.434521', '14', 'Poza fixativ max hold', 1, '[{\"added\": {}}]', 10, 1),
(50, '2022-11-11 19:50:24.301461', '15', 'Poza fixativ max hold', 1, '[{\"added\": {}}]', 10, 1),
(51, '2022-11-11 19:50:32.721094', '16', 'Poza fixativ max hold', 1, '[{\"added\": {}}]', 10, 1),
(52, '2022-11-11 19:51:17.876996', '13', 'Poza fixativ max hold', 2, '[{\"changed\": {\"fields\": [\"Path\"]}}]', 10, 1),
(53, '2022-11-12 20:03:20.340569', '1', 'Clienti object (1)', 1, '[{\"added\": {}}]', 7, 1),
(54, '2022-11-12 20:08:18.478603', '1', 'Clienti object (1)', 2, '[]', 7, 1),
(55, '2022-11-12 20:10:38.737935', '1', 'Clienti object (1)', 2, '[{\"changed\": {\"fields\": [\"Password\"]}}]', 7, 1),
(56, '2022-11-12 20:13:33.089620', '1', 'Clienti object (1)', 2, '[]', 7, 1),
(57, '2022-11-12 21:29:53.277074', '2', 'Clienti object (2)', 3, '', 7, 1),
(58, '2022-11-12 21:44:40.491072', '5', 'Clienti object (5)', 3, '', 7, 1),
(59, '2022-11-12 21:44:40.498132', '4', 'Clienti object (4)', 3, '', 7, 1),
(60, '2022-11-12 21:44:40.498732', '3', 'Clienti object (3)', 3, '', 7, 1),
(61, '2022-11-12 21:45:31.660151', '1', 'Adrese object (1)', 3, '', 8, 1),
(62, '2022-11-12 21:45:36.358922', '6', 'Clienti object (6)', 3, '', 7, 1),
(63, '2022-11-12 22:00:22.789257', '9', 'Clienti object (9)', 3, '', 7, 1),
(64, '2022-11-12 22:00:22.796077', '8', 'Clienti object (8)', 3, '', 7, 1),
(65, '2022-11-12 22:00:22.798330', '7', 'Clienti object (7)', 3, '', 7, 1),
(66, '2022-11-12 22:00:29.684992', '1', 'Clienti object (1)', 3, '', 7, 1),
(67, '2022-11-12 22:08:30.561017', '5', 'Adrese object (5)', 3, '', 8, 1),
(68, '2022-11-12 22:08:30.563276', '4', 'Adrese object (4)', 3, '', 8, 1),
(69, '2022-11-12 22:08:30.566280', '3', 'Adrese object (3)', 3, '', 8, 1),
(70, '2022-11-12 22:08:30.567909', '2', 'Adrese object (2)', 3, '', 8, 1),
(71, '2022-11-12 22:08:34.597264', '10', 'Clienti object (10)', 3, '', 7, 1),
(72, '2022-11-12 22:10:12.658164', '11', 'Clienti object (11)', 3, '', 7, 1),
(73, '2022-11-12 22:10:16.328973', '6', 'Adrese object (6)', 3, '', 8, 1),
(74, '2022-11-12 22:13:37.260134', '12', 'Clienti object (12)', 3, '', 7, 1),
(75, '2022-11-12 22:13:40.553394', '7', 'Adrese object (7)', 3, '', 8, 1),
(76, '2022-11-12 22:22:00.631027', '14', 'Clienti object (14)', 3, '', 7, 1),
(77, '2022-11-12 22:22:00.632809', '13', 'Clienti object (13)', 3, '', 7, 1),
(78, '2022-11-12 22:22:06.132906', '11', 'Adrese object (11)', 3, '', 8, 1),
(79, '2022-11-12 22:22:06.133885', '10', 'Adrese object (10)', 3, '', 8, 1),
(80, '2022-11-12 22:22:06.134902', '9', 'Adrese object (9)', 3, '', 8, 1),
(81, '2022-11-12 22:22:06.136880', '8', 'Adrese object (8)', 3, '', 8, 1),
(82, '2022-11-12 22:24:58.592929', '18', 'Clienti object (18)', 3, '', 7, 1),
(83, '2022-11-12 22:25:06.956185', '13', 'Adrese object (13)', 3, '', 8, 1),
(84, '2022-11-12 22:25:06.958180', '12', 'Adrese object (12)', 3, '', 8, 1),
(85, '2022-11-12 22:26:56.544177', '19', 'Clienti object (19)', 2, '[{\"changed\": {\"fields\": [\"Password\"]}}]', 7, 1),
(86, '2022-11-16 09:36:27.183538', '2', 'Ceara de par modelatoare', 2, '[]', 11, 1),
(87, '2022-12-28 13:50:58.345638', '20', 'Sava Boigdan', 3, '', 7, 1),
(88, '2022-12-28 13:50:58.350639', '19', 'Sava Bogdan', 3, '', 7, 1),
(89, '2022-12-28 13:50:58.353175', '17', 'Sava Bogdan', 3, '', 7, 1),
(90, '2022-12-28 13:50:58.354176', '16', 'Sava Bogdan', 3, '', 7, 1),
(91, '2022-12-28 13:50:58.355175', '15', 'Sava Bogdan', 3, '', 7, 1),
(92, '2023-01-06 09:03:13.036249', '21', 'Sava Bogdan', 2, '[{\"changed\": {\"fields\": [\"AdresaID\"]}}]', 7, 1);

-- --------------------------------------------------------

--
-- Table structure for table `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(4, 'auth', 'user'),
(5, 'contenttypes', 'contenttype'),
(8, 'Cosmetics', 'adrese'),
(7, 'Cosmetics', 'clienti'),
(9, 'Cosmetics', 'comenzi'),
(10, 'Cosmetics', 'pozeproduse'),
(11, 'Cosmetics', 'produse'),
(12, 'Cosmetics', 'produsecomandate'),
(14, 'Cosmetics', 'produseincos'),
(13, 'Cosmetics', 'reviews'),
(6, 'sessions', 'session');

-- --------------------------------------------------------

--
-- Table structure for table `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` bigint(20) NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2022-11-08 20:49:43.133478'),
(2, 'auth', '0001_initial', '2022-11-08 20:49:43.408328'),
(3, 'admin', '0001_initial', '2022-11-08 20:49:43.476862'),
(4, 'admin', '0002_logentry_remove_auto_add', '2022-11-08 20:49:43.482250'),
(5, 'admin', '0003_logentry_add_action_flag_choices', '2022-11-08 20:49:43.487515'),
(6, 'contenttypes', '0002_remove_content_type_name', '2022-11-08 20:49:43.519023'),
(7, 'auth', '0002_alter_permission_name_max_length', '2022-11-08 20:49:43.547323'),
(8, 'auth', '0003_alter_user_email_max_length', '2022-11-08 20:49:43.558317'),
(9, 'auth', '0004_alter_user_username_opts', '2022-11-08 20:49:43.564307'),
(10, 'auth', '0005_alter_user_last_login_null', '2022-11-08 20:49:43.587332'),
(11, 'auth', '0006_require_contenttypes_0002', '2022-11-08 20:49:43.589550'),
(12, 'auth', '0007_alter_validators_add_error_messages', '2022-11-08 20:49:43.594536'),
(13, 'auth', '0008_alter_user_username_max_length', '2022-11-08 20:49:43.604522'),
(14, 'auth', '0009_alter_user_last_name_max_length', '2022-11-08 20:49:43.614372'),
(15, 'auth', '0010_alter_group_name_max_length', '2022-11-08 20:49:43.624474'),
(16, 'auth', '0011_update_proxy_permissions', '2022-11-08 20:49:43.630349'),
(17, 'auth', '0012_alter_user_first_name_max_length', '2022-11-08 20:49:43.639315'),
(18, 'sessions', '0001_initial', '2022-11-08 20:49:43.664596'),
(37, 'Cosmetics', '0001_initial', '2022-11-09 20:59:53.633086'),
(38, 'Cosmetics', '0002_clienti_password', '2022-11-12 20:10:02.955423'),
(39, 'Cosmetics', '0003_alter_clienti_password', '2022-11-12 20:10:02.959436'),
(40, 'Cosmetics', '0004_produseincos', '2022-12-28 14:01:24.707509');

-- --------------------------------------------------------

--
-- Table structure for table `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('8kykncccf2ur7mwbmafrifsoz1f83jqp', '.eJxVjMsOgjAURP-la9KALbeFJbpxoTHxA8htewsoloSHG-O_WyIbVpOcMzMfduw7CvP5xMpDlrDr8iJWsju-kSXsNlL4g2poHIaIalzmtl4mGuvORZHtmUH7pLAK98DQDNwOYR47w9cK3-zEL4Ojvtq6u4MWpzauvRVKamXAe6dkEVM4klI6i1Ib0EA6tTIFgyA8pN7Y3BZgwUgnUOXAvj_CWkaY:1pDicx:YNu8DWYTRm143J5DScMkEmPJjEAx0ewdd5_8bHUlTfk', '2023-01-20 09:03:03.748349'),
('l2poi2b7ls90coqcgo0cl9v77nasico1', '.eJxVjMsOgjAQRf-la0LoCyhLdeNCY-IHkGmnAyi2CQ83xn8XIgvdnnPvebEa5qmt59EPdYesYpwlv8yCu_uwCrxBaGLqYpiGzqbrJN3smJ4i-n63bf8CLYzt-hZCKhQakLIyE1ZZWeSZgdJpIjIkPQJCQYrnqBF1DkCOUGpZmsJytUT3fefDdDywipuEneeHX7pXeMLiLoMPX7CLDUJg7w-nrEbn:1otz0i:VVfOJoweogHzovW-W6N_VaJqRn09DzqrpfS87OSaeuo', '2022-11-26 22:30:00.857072'),
('vg7jcvwuy6o1tsegjuq3stp9q12gwja4', '.eJxVjDsOwjAQBe_iGln-fyjpOYPltXdxADlSnFSIu0OkFNC-mXkvlvK2trQNXNJU2ZlJdvrdIJcH9h3Ue-63mZe5r8sEfFf4QQe_zhWfl8P9O2h5tG8tQEqNxVarYnbkQQUhonemRq8wSIE6aGcIfQEStihFULMlQdpbpwx7fwDOZTdy:1oy7FV:yLQP4qSVUYbtvVKqZ1VcR9IHLiY7FHtsHAVZCwDFNwo', '2022-12-08 08:06:21.462952'),
('x6djgr4q114yo9zza4cl1rj12d0bkxls', '.eJxVjL0OwiAURt-FuSFAC7Qd1cVBY-IDNBe4tNUKSX9cjO8ujR10Pef7zos0sMxds0w4Nr0jNeEk-2UG7B3DKtwNQhupjWEee0PXCd3sRE_R4bDbtn-BDqYuvZnhPEcrnRQVKK-NKBmrtCpcpQWWnGFe5qrwqK3xTFohvHEgPfO5lkoUKbofegzz8UBqwTNyXh6Yuld4QnKXEcMX7GLrIJD3BzzFRY4:1pAX0b:SalcQNoi7Zmbo6wmIlltUfyRu17gDBipY4fYLpY-Y1s', '2023-01-11 14:02:17.538939');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `auth_group`
--
ALTER TABLE `auth_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  ADD KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`);

--
-- Indexes for table `auth_user`
--
ALTER TABLE `auth_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  ADD KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`);

--
-- Indexes for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  ADD KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `cosmetics_adrese`
--
ALTER TABLE `cosmetics_adrese`
  ADD PRIMARY KEY (`AdresaID`);

--
-- Indexes for table `cosmetics_clienti`
--
ALTER TABLE `cosmetics_clienti`
  ADD PRIMARY KEY (`ClientID`),
  ADD KEY `Cosmetics_clienti_AdresaID_ed46eb59_fk_Cosmetics_adrese_AdresaID` (`AdresaID`);

--
-- Indexes for table `cosmetics_comenzi`
--
ALTER TABLE `cosmetics_comenzi`
  ADD PRIMARY KEY (`ComandaID`),
  ADD KEY `Cosmetics_comenzi_AdresaID_916b640e_fk_Cosmetics_adrese_AdresaID` (`AdresaID`),
  ADD KEY `Cosmetics_comenzi_ClientID_ecda348a_fk_Cosmetics` (`ClientID`);

--
-- Indexes for table `cosmetics_pozeproduse`
--
ALTER TABLE `cosmetics_pozeproduse`
  ADD PRIMARY KEY (`PozaProdusID`),
  ADD KEY `Cosmetics_pozeprodus_ProdusID_1b4ca369_fk_Cosmetics` (`ProdusID`);

--
-- Indexes for table `cosmetics_produse`
--
ALTER TABLE `cosmetics_produse`
  ADD PRIMARY KEY (`ProdusID`);

--
-- Indexes for table `cosmetics_produsecomandate`
--
ALTER TABLE `cosmetics_produsecomandate`
  ADD PRIMARY KEY (`ProdusComandatID`),
  ADD KEY `Cosmetics_produsecom_ComandaID_04b55de8_fk_Cosmetics` (`ComandaID`),
  ADD KEY `Cosmetics_produsecom_ProdusID_62642d49_fk_Cosmetics` (`ProdusID`);

--
-- Indexes for table `cosmetics_produseincos`
--
ALTER TABLE `cosmetics_produseincos`
  ADD PRIMARY KEY (`ProdusInCosID`),
  ADD KEY `Cosmetics_produseinc_ClientID_720ce8f4_fk_Cosmetics` (`ClientID`),
  ADD KEY `Cosmetics_produseinc_ProdusID_6d7c34b4_fk_Cosmetics` (`ProdusID`);

--
-- Indexes for table `cosmetics_reviews`
--
ALTER TABLE `cosmetics_reviews`
  ADD PRIMARY KEY (`ReviewID`),
  ADD KEY `Cosmetics_reviews_ClientID_4c6883e8_fk_Cosmetics` (`ClientID`),
  ADD KEY `Cosmetics_reviews_ProdusID_c4c3fae7_fk_Cosmetics` (`ProdusID`);

--
-- Indexes for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`);

--
-- Indexes for table `django_content_type`
--
ALTER TABLE `django_content_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`);

--
-- Indexes for table `django_migrations`
--
ALTER TABLE `django_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `django_session`
--
ALTER TABLE `django_session`
  ADD PRIMARY KEY (`session_key`),
  ADD KEY `django_session_expire_date_a5c62663` (`expire_date`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=57;

--
-- AUTO_INCREMENT for table `auth_user`
--
ALTER TABLE `auth_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cosmetics_adrese`
--
ALTER TABLE `cosmetics_adrese`
  MODIFY `AdresaID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `cosmetics_clienti`
--
ALTER TABLE `cosmetics_clienti`
  MODIFY `ClientID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `cosmetics_comenzi`
--
ALTER TABLE `cosmetics_comenzi`
  MODIFY `ComandaID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `cosmetics_pozeproduse`
--
ALTER TABLE `cosmetics_pozeproduse`
  MODIFY `PozaProdusID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `cosmetics_produse`
--
ALTER TABLE `cosmetics_produse`
  MODIFY `ProdusID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `cosmetics_produsecomandate`
--
ALTER TABLE `cosmetics_produsecomandate`
  MODIFY `ProdusComandatID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `cosmetics_produseincos`
--
ALTER TABLE `cosmetics_produseincos`
  MODIFY `ProdusInCosID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT for table `cosmetics_reviews`
--
ALTER TABLE `cosmetics_reviews`
  MODIFY `ReviewID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=93;

--
-- AUTO_INCREMENT for table `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Constraints for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Constraints for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `cosmetics_clienti`
--
ALTER TABLE `cosmetics_clienti`
  ADD CONSTRAINT `Cosmetics_clienti_AdresaID_ed46eb59_fk_Cosmetics_adrese_AdresaID` FOREIGN KEY (`AdresaID`) REFERENCES `cosmetics_adrese` (`AdresaID`);

--
-- Constraints for table `cosmetics_comenzi`
--
ALTER TABLE `cosmetics_comenzi`
  ADD CONSTRAINT `Cosmetics_comenzi_AdresaID_916b640e_fk_Cosmetics_adrese_AdresaID` FOREIGN KEY (`AdresaID`) REFERENCES `cosmetics_adrese` (`AdresaID`),
  ADD CONSTRAINT `Cosmetics_comenzi_ClientID_ecda348a_fk_Cosmetics` FOREIGN KEY (`ClientID`) REFERENCES `cosmetics_clienti` (`ClientID`);

--
-- Constraints for table `cosmetics_pozeproduse`
--
ALTER TABLE `cosmetics_pozeproduse`
  ADD CONSTRAINT `Cosmetics_pozeprodus_ProdusID_1b4ca369_fk_Cosmetics` FOREIGN KEY (`ProdusID`) REFERENCES `cosmetics_produse` (`ProdusID`);

--
-- Constraints for table `cosmetics_produsecomandate`
--
ALTER TABLE `cosmetics_produsecomandate`
  ADD CONSTRAINT `Cosmetics_produsecom_ComandaID_04b55de8_fk_Cosmetics` FOREIGN KEY (`ComandaID`) REFERENCES `cosmetics_comenzi` (`ComandaID`),
  ADD CONSTRAINT `Cosmetics_produsecom_ProdusID_62642d49_fk_Cosmetics` FOREIGN KEY (`ProdusID`) REFERENCES `cosmetics_produse` (`ProdusID`);

--
-- Constraints for table `cosmetics_produseincos`
--
ALTER TABLE `cosmetics_produseincos`
  ADD CONSTRAINT `Cosmetics_produseinc_ClientID_720ce8f4_fk_Cosmetics` FOREIGN KEY (`ClientID`) REFERENCES `cosmetics_clienti` (`ClientID`),
  ADD CONSTRAINT `Cosmetics_produseinc_ProdusID_6d7c34b4_fk_Cosmetics` FOREIGN KEY (`ProdusID`) REFERENCES `cosmetics_produse` (`ProdusID`);

--
-- Constraints for table `cosmetics_reviews`
--
ALTER TABLE `cosmetics_reviews`
  ADD CONSTRAINT `Cosmetics_reviews_ClientID_4c6883e8_fk_Cosmetics` FOREIGN KEY (`ClientID`) REFERENCES `cosmetics_clienti` (`ClientID`),
  ADD CONSTRAINT `Cosmetics_reviews_ProdusID_c4c3fae7_fk_Cosmetics` FOREIGN KEY (`ProdusID`) REFERENCES `cosmetics_produse` (`ProdusID`);

--
-- Constraints for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
