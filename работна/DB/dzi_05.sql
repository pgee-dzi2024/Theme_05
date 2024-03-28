-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1
-- Време на генериране: 28 март 2024 в 14:05
-- Версия на сървъра: 10.4.32-MariaDB
-- Версия на PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данни: `dzi_05`
--

-- --------------------------------------------------------

--
-- Структура на таблица `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Структура на таблица `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
CREATE TABLE `auth_group_permissions` (
  `id` bigint(20) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Структура на таблица `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Схема на данните от таблица `auth_permission`
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
(25, 'Can add Потребител', 7, 'add_appuser'),
(26, 'Can change Потребител', 7, 'change_appuser'),
(27, 'Can delete Потребител', 7, 'delete_appuser'),
(28, 'Can view Потребител', 7, 'view_appuser'),
(29, 'Can add Обява', 8, 'add_userpost'),
(30, 'Can change Обява', 8, 'change_userpost'),
(31, 'Can delete Обява', 8, 'delete_userpost'),
(32, 'Can view Обява', 8, 'view_userpost'),
(33, 'Can add Категория', 9, 'add_category'),
(34, 'Can change Категория', 9, 'change_category'),
(35, 'Can delete Категория', 9, 'delete_category'),
(36, 'Can view Категория', 9, 'view_category'),
(37, 'Can add Размер', 10, 'add_size'),
(38, 'Can change Размер', 10, 'change_size'),
(39, 'Can delete Размер', 10, 'delete_size'),
(40, 'Can view Размер', 10, 'view_size'),
(41, 'Can add Зпитване', 11, 'add_comment'),
(42, 'Can change Зпитване', 11, 'change_comment'),
(43, 'Can delete Зпитване', 11, 'delete_comment'),
(44, 'Can view Зпитване', 11, 'view_comment'),
(45, 'Can add stock', 12, 'add_stock'),
(46, 'Can change stock', 12, 'change_stock'),
(47, 'Can delete stock', 12, 'delete_stock'),
(48, 'Can view stock', 12, 'view_stock'),
(49, 'Can add purchase bill details', 13, 'add_purchasebilldetails'),
(50, 'Can change purchase bill details', 13, 'change_purchasebilldetails'),
(51, 'Can delete purchase bill details', 13, 'delete_purchasebilldetails'),
(52, 'Can view purchase bill details', 13, 'view_purchasebilldetails'),
(53, 'Can add supplier', 14, 'add_supplier'),
(54, 'Can change supplier', 14, 'change_supplier'),
(55, 'Can delete supplier', 14, 'delete_supplier'),
(56, 'Can view supplier', 14, 'view_supplier'),
(57, 'Can add purchase bill', 15, 'add_purchasebill'),
(58, 'Can change purchase bill', 15, 'change_purchasebill'),
(59, 'Can delete purchase bill', 15, 'delete_purchasebill'),
(60, 'Can view purchase bill', 15, 'view_purchasebill'),
(61, 'Can add sale item', 16, 'add_saleitem'),
(62, 'Can change sale item', 16, 'change_saleitem'),
(63, 'Can delete sale item', 16, 'delete_saleitem'),
(64, 'Can view sale item', 16, 'view_saleitem'),
(65, 'Can add sale bill details', 17, 'add_salebilldetails'),
(66, 'Can change sale bill details', 17, 'change_salebilldetails'),
(67, 'Can delete sale bill details', 17, 'delete_salebilldetails'),
(68, 'Can view sale bill details', 17, 'view_salebilldetails'),
(69, 'Can add purchase item', 18, 'add_purchaseitem'),
(70, 'Can change purchase item', 18, 'change_purchaseitem'),
(71, 'Can delete purchase item', 18, 'delete_purchaseitem'),
(72, 'Can view purchase item', 18, 'view_purchaseitem'),
(73, 'Can add sale bill', 19, 'add_salebill'),
(74, 'Can change sale bill', 19, 'change_salebill'),
(75, 'Can delete sale bill', 19, 'delete_salebill'),
(76, 'Can view sale bill', 19, 'view_salebill');

-- --------------------------------------------------------

--
-- Структура на таблица `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
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
-- Схема на данните от таблица `auth_user`
--

INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`) VALUES
(1, 'pbkdf2_sha256$600000$qhlPnrWMKey1dJ5HdGYeqd$tioXekdpAGnzoWeORNcBe4aokJkP6RgBK/VP6Q9uFSI=', '2024-03-28 13:01:27.956776', 1, 'admin', '', '', '', 1, 1, '2024-03-10 22:31:20.528022');

-- --------------------------------------------------------

--
-- Структура на таблица `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
CREATE TABLE `auth_user_groups` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Структура на таблица `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
CREATE TABLE `auth_user_user_permissions` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Структура на таблица `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
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
-- Схема на данните от таблица `django_admin_log`
--

INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES
(1, '2024-03-11 16:55:50.241091', '1', 'Детски', 1, '[{\"added\": {}}]', 9, 1),
(2, '2024-03-11 16:56:04.597849', '2', 'Дамски', 1, '[{\"added\": {}}]', 9, 1),
(3, '2024-03-11 16:56:28.303078', '3', 'Мъжки', 1, '[{\"added\": {}}]', 9, 1),
(4, '2024-03-11 16:57:02.673799', '1', 'S', 1, '[{\"added\": {}}]', 10, 1),
(5, '2024-03-11 16:57:25.998098', '2', 'M', 1, '[{\"added\": {}}]', 10, 1),
(6, '2024-03-11 16:57:39.497179', '3', 'L', 1, '[{\"added\": {}}]', 10, 1),
(7, '2024-03-11 16:57:50.240884', '4', 'XL', 1, '[{\"added\": {}}]', 10, 1),
(8, '2024-03-11 17:00:42.663449', '2', 'user1(Иван Иванов)', 1, '[{\"added\": {}}]', 7, 1),
(9, '2024-03-11 17:02:22.089064', '1', 'Мъжка риза', 1, '[{\"added\": {}}]', 8, 1),
(10, '2024-03-11 17:03:12.784364', '1', 'Мъжка риза', 2, '[{\"changed\": {\"fields\": [\"\\u0421\\u043d\\u0438\\u043c\\u043a\\u0430\"]}}]', 8, 1),
(11, '2024-03-11 17:11:06.920096', '1', 'Мъжка риза', 2, '[{\"changed\": {\"fields\": [\"\\u0421\\u043d\\u0438\\u043c\\u043a\\u0430\"]}}]', 8, 1),
(12, '2024-03-11 17:13:15.199025', '1', 'Мъжка риза', 2, '[{\"changed\": {\"fields\": [\"\\u0421\\u043d\\u0438\\u043c\\u043a\\u0430\"]}}]', 8, 1),
(13, '2024-03-11 17:13:53.084703', '1', 'Мъжка риза', 2, '[{\"changed\": {\"fields\": [\"\\u0421\\u043d\\u0438\\u043c\\u043a\\u0430\"]}}]', 8, 1),
(14, '2024-03-11 17:14:03.570150', '1', 'Мъжка риза', 2, '[{\"changed\": {\"fields\": [\"\\u0421\\u043d\\u0438\\u043c\\u043a\\u0430\"]}}]', 8, 1),
(15, '2024-03-11 17:16:16.830780', '1', 'Мъжка риза', 2, '[{\"changed\": {\"fields\": [\"\\u0421\\u043d\\u0438\\u043c\\u043a\\u0430\"]}}]', 8, 1),
(16, '2024-03-11 17:19:07.306127', '1', '1: Димитър Димитров', 1, '[{\"added\": {}}]', 11, 1),
(17, '2024-03-11 17:20:54.602280', '2', '2: Петър Петров', 1, '[{\"added\": {}}]', 11, 1),
(18, '2024-03-11 17:22:50.703779', '3', '3: Георги Георгиев', 1, '[{\"added\": {}}]', 11, 1),
(19, '2024-03-13 12:08:45.853665', '4', 'ghjghkjgkjgk', 1, '[{\"added\": {}}]', 9, 1),
(20, '2024-03-16 02:10:21.061442', '2', 'Мъжка риза', 1, '[{\"added\": {}}]', 8, 1),
(21, '2024-03-16 02:50:01.419378', '3', 'Рокля', 1, '[{\"added\": {}}]', 8, 1),
(22, '2024-03-16 02:50:34.223960', '3', 'Рокля', 2, '[{\"changed\": {\"fields\": [\"\\u0421\\u043d\\u0438\\u043c\\u043a\\u0430\"]}}]', 8, 1),
(23, '2024-03-16 12:50:17.045725', '2', 'Мъжка риза', 2, '[{\"changed\": {\"fields\": [\"\\u041f\\u043e\\u0442\\u0440\\u0435\\u0431\\u0438\\u0442\\u0435\\u043b\"]}}]', 8, 1),
(24, '2024-03-16 12:50:30.362636', '3', 'Рокля', 2, '[{\"changed\": {\"fields\": [\"\\u041f\\u043e\\u0442\\u0440\\u0435\\u0431\\u0438\\u0442\\u0435\\u043b\"]}}]', 8, 1),
(25, '2024-03-16 12:50:38.915687', '1', 'Мъжка риза', 2, '[{\"changed\": {\"fields\": [\"\\u041f\\u043e\\u0442\\u0440\\u0435\\u0431\\u0438\\u0442\\u0435\\u043b\"]}}]', 8, 1),
(26, '2024-03-16 15:30:46.157092', '8', 'y(y)', 3, '', 7, 1),
(27, '2024-03-16 15:30:46.169450', '7', 'f(f)', 3, '', 7, 1),
(28, '2024-03-16 15:30:46.174509', '6', 'q(q)', 3, '', 7, 1),
(29, '2024-03-16 15:30:46.181592', '5', 'c(a)', 3, '', 7, 1),
(30, '2024-03-16 15:31:32.966182', '4', 'ghjghkjgkjgk', 3, '', 9, 1),
(31, '2024-03-16 17:01:48.603686', '6', '6: Дад дсдсд', 3, '', 11, 1),
(32, '2024-03-16 17:01:48.609590', '5', '5: Дад дсдсд', 3, '', 11, 1),
(33, '2024-03-16 17:01:48.614694', '4', '4: Дад дсдсд', 3, '', 11, 1),
(34, '2024-03-18 02:22:34.034976', '8', 'a', 3, '', 8, 1),
(35, '2024-03-18 02:22:34.037946', '7', '', 3, '', 8, 1),
(36, '2024-03-18 02:22:34.039945', '6', '', 3, '', 8, 1),
(37, '2024-03-18 02:22:34.040944', '5', '', 3, '', 8, 1),
(38, '2024-03-18 02:22:34.042945', '4', '', 3, '', 8, 1),
(39, '2024-03-18 02:22:47.138204', '9', 'рокля', 2, '[{\"changed\": {\"fields\": [\"\\u041f\\u043e\\u0442\\u0440\\u0435\\u0431\\u0438\\u0442\\u0435\\u043b\"]}}]', 8, 1);

-- --------------------------------------------------------

--
-- Структура на таблица `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Схема на данните от таблица `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(4, 'auth', 'user'),
(5, 'contenttypes', 'contenttype'),
(12, 'inventory', 'stock'),
(7, 'main', 'appuser'),
(9, 'main', 'category'),
(11, 'main', 'comment'),
(10, 'main', 'size'),
(8, 'main', 'userpost'),
(6, 'sessions', 'session'),
(15, 'transactions', 'purchasebill'),
(13, 'transactions', 'purchasebilldetails'),
(18, 'transactions', 'purchaseitem'),
(19, 'transactions', 'salebill'),
(17, 'transactions', 'salebilldetails'),
(16, 'transactions', 'saleitem'),
(14, 'transactions', 'supplier');

-- --------------------------------------------------------

--
-- Структура на таблица `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
CREATE TABLE `django_migrations` (
  `id` bigint(20) NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Схема на данните от таблица `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2024-03-10 22:26:05.022239'),
(2, 'auth', '0001_initial', '2024-03-10 22:26:05.734096'),
(3, 'admin', '0001_initial', '2024-03-10 22:26:05.877931'),
(4, 'admin', '0002_logentry_remove_auto_add', '2024-03-10 22:26:05.884926'),
(5, 'admin', '0003_logentry_add_action_flag_choices', '2024-03-10 22:26:05.892943'),
(6, 'contenttypes', '0002_remove_content_type_name', '2024-03-10 22:26:06.000230'),
(7, 'auth', '0002_alter_permission_name_max_length', '2024-03-10 22:26:06.090406'),
(8, 'auth', '0003_alter_user_email_max_length', '2024-03-10 22:26:06.110403'),
(9, 'auth', '0004_alter_user_username_opts', '2024-03-10 22:26:06.120406'),
(10, 'auth', '0005_alter_user_last_login_null', '2024-03-10 22:26:06.194406'),
(11, 'auth', '0006_require_contenttypes_0002', '2024-03-10 22:26:06.199383'),
(12, 'auth', '0007_alter_validators_add_error_messages', '2024-03-10 22:26:06.207399'),
(13, 'auth', '0008_alter_user_username_max_length', '2024-03-10 22:26:06.228384'),
(14, 'auth', '0009_alter_user_last_name_max_length', '2024-03-10 22:26:06.246411'),
(15, 'auth', '0010_alter_group_name_max_length', '2024-03-10 22:26:06.265554'),
(16, 'auth', '0011_update_proxy_permissions', '2024-03-10 22:26:06.277573'),
(17, 'auth', '0012_alter_user_first_name_max_length', '2024-03-10 22:26:06.296572'),
(18, 'sessions', '0001_initial', '2024-03-10 22:26:06.357860'),
(19, 'main', '0001_initial', '2024-03-11 00:35:36.403550'),
(20, 'main', '0002_userpost_picture', '2024-03-11 16:52:16.511000'),
(21, 'main', '0003_userpost_useer_alter_userpost_picture', '2024-03-16 12:45:15.831297'),
(22, 'main', '0004_alter_userpost_category_alter_userpost_size_and_more', '2024-03-16 12:49:57.210716'),
(23, 'main', '0005_alter_comment_post_id', '2024-03-16 15:49:33.598554'),
(24, 'main', '0006_rename_useer_userpost_user', '2024-03-16 20:00:41.207337'),
(25, 'inventory', '0001_initial', '2024-03-19 23:35:16.165317'),
(26, 'transactions', '0001_initial', '2024-03-19 23:35:16.590022'),
(27, 'main', '0007_alter_userpost_price', '2024-03-19 23:50:04.742062'),
(28, 'main', '0008_alter_comment_phone', '2024-03-20 13:47:44.897232');

-- --------------------------------------------------------

--
-- Структура на таблица `django_session`
--

DROP TABLE IF EXISTS `django_session`;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Схема на данните от таблица `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('cedbum56uw3byzdyo6oxlb4438mnaezs', '.eJxVjEEOwiAQRe_C2hBgADsu3fcMZIahUjVtUtqV8e7apAvd_vfef6lE21rT1sqSRlEXZdXpd2PKjzLtQO403Wad52ldRta7og_adD9LeV4P9--gUqvfGtB36GLxQwAoTkjQYCb0cLbgjHPBRyTO0gVEigWCsADzYJHRGFLvD8JWN3k:1rppNn:YyoQPxxi5UhzsxFlCdO1bgcL9aL2H2rPesSZq89E0Ic', '2024-04-11 13:01:27.962364'),
('ebxlah5nvg4ijlavc1v6qnkuhl081rmh', '.eJxVjEEOwiAQRe_C2hBgADsu3fcMZIahUjVtUtqV8e7apAvd_vfef6lE21rT1sqSRlEXZdXpd2PKjzLtQO403Wad52ldRta7og_adD9LeV4P9--gUqvfGtB36GLxQwAoTkjQYCb0cLbgjHPBRyTO0gVEigWCsADzYJHRGFLvD8JWN3k:1rlHAa:kw6-4c8_TyZdjPRuuYr4dDOcBHaw8ns3W4h7IdNRWyA', '2024-03-29 23:41:00.782960'),
('g3ybpu9tcx9onexgwfggphiv31a1wafy', '.eJxVjEEOwiAQRe_C2hBgADsu3fcMZIahUjVtUtqV8e7apAvd_vfef6lE21rT1sqSRlEXZdXpd2PKjzLtQO403Wad52ldRta7og_adD9LeV4P9--gUqvfGtB36GLxQwAoTkjQYCb0cLbgjHPBRyTO0gVEigWCsADzYJHRGFLvD8JWN3k:1rjRhs:HmJgGB_ZugwemCLxEPXd578AMOvZZaEJaWsSV-XD9Pw', '2024-03-24 22:31:48.150813'),
('srm22ewikq12isz0byxw75kzccyh76z0', '.eJxVjEEOwiAQRe_C2hBgADsu3fcMZIahUjVtUtqV8e7apAvd_vfef6lE21rT1sqSRlEXZdXpd2PKjzLtQO403Wad52ldRta7og_adD9LeV4P9--gUqvfGtB36GLxQwAoTkjQYCb0cLbgjHPBRyTO0gVEigWCsADzYJHRGFLvD8JWN3k:1rkNPF:w3AGpVhbyqN-JOASJYD0yzZ305ZF9OpQ3HsdYjgAHns', '2024-03-27 12:08:25.493117');

-- --------------------------------------------------------

--
-- Структура на таблица `inventory_stock`
--

DROP TABLE IF EXISTS `inventory_stock`;
CREATE TABLE `inventory_stock` (
  `id` int(11) NOT NULL,
  `name` varchar(30) NOT NULL,
  `quantity` int(11) NOT NULL,
  `is_deleted` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Структура на таблица `main_appuser`
--

DROP TABLE IF EXISTS `main_appuser`;
CREATE TABLE `main_appuser` (
  `id` bigint(20) NOT NULL,
  `name` varchar(50) NOT NULL,
  `mail` varchar(30) NOT NULL,
  `username` varchar(30) NOT NULL,
  `password` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Схема на данните от таблица `main_appuser`
--

INSERT INTO `main_appuser` (`id`, `name`, `mail`, `username`, `password`) VALUES
(2, 'Иван Иванов', 'mail@site.com', 'user1', '123'),
(3, 'Митко', 'Митков', 'user2', '321'),
(4, 'Петър Иванов', 'mail@site.com', 'user3', '333');

-- --------------------------------------------------------

--
-- Структура на таблица `main_category`
--

DROP TABLE IF EXISTS `main_category`;
CREATE TABLE `main_category` (
  `id` bigint(20) NOT NULL,
  `order` smallint(5) UNSIGNED NOT NULL CHECK (`order` >= 0),
  `name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Схема на данните от таблица `main_category`
--

INSERT INTO `main_category` (`id`, `order`, `name`) VALUES
(1, 3, 'Детски'),
(2, 1, 'Дамски'),
(3, 2, 'Мъжки');

-- --------------------------------------------------------

--
-- Структура на таблица `main_comment`
--

DROP TABLE IF EXISTS `main_comment`;
CREATE TABLE `main_comment` (
  `id` bigint(20) NOT NULL,
  `name` varchar(50) NOT NULL,
  `mail` varchar(30) NOT NULL,
  `phone` varchar(25) NOT NULL,
  `message` longtext NOT NULL,
  `post_id_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Схема на данните от таблица `main_comment`
--

INSERT INTO `main_comment` (`id`, `name`, `mail`, `phone`, `message`, `post_id_id`) VALUES
(1, 'Димитър Димитров', 'abc@cbs.com', '0123456789', 'Харесва ми и се интересувам, но цената ми изглежда висока.', 1),
(2, 'Петър Петров', '', '0999991111', 'Склонен съм да я купя. Обадете ми се след 17:00.', 1),
(3, 'Георги Георгиев', 'xyz@abv.com', '', 'Изпратете ми я с наложен платеж на адрес \r\nБанско, ул. \"Искър\" №333', 1);

-- --------------------------------------------------------

--
-- Структура на таблица `main_size`
--

DROP TABLE IF EXISTS `main_size`;
CREATE TABLE `main_size` (
  `id` bigint(20) NOT NULL,
  `order` smallint(5) UNSIGNED NOT NULL CHECK (`order` >= 0),
  `value` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Схема на данните от таблица `main_size`
--

INSERT INTO `main_size` (`id`, `order`, `value`) VALUES
(1, 0, 'S'),
(2, 1, 'M'),
(3, 2, 'L'),
(4, 3, 'XL');

-- --------------------------------------------------------

--
-- Структура на таблица `main_userpost`
--

DROP TABLE IF EXISTS `main_userpost`;
CREATE TABLE `main_userpost` (
  `id` bigint(20) NOT NULL,
  `title` varchar(50) NOT NULL,
  `price` decimal(6,2) NOT NULL,
  `description` longtext NOT NULL,
  `remark` longtext NOT NULL,
  `category_id` bigint(20) DEFAULT NULL,
  `size_id` bigint(20) DEFAULT NULL,
  `picture` varchar(100) NOT NULL,
  `user_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Схема на данните от таблица `main_userpost`
--

INSERT INTO `main_userpost` (`id`, `title`, `price`, `description`, `remark`, `category_id`, `size_id`, `picture`, `user_id`) VALUES
(1, 'Мъжка риза', 12.50, 'Лятна мъжка риза от чист памук', 'Няма забележки', 3, 4, 'post_pics/p11.png', 2),
(2, 'Мъжка риза', 30.00, 'описание', 'забележки', 3, 2, 'post_pics/p2.png', 2),
(10, '', 0.00, '', '', 2, 2, '', 2),
(12, 'рокля', 88.00, 'р', 'р', 2, 1, '', 2),
(13, '', 0.00, '', '', 2, 3, '', 2),
(14, 'две рокли', 99.00, 'асас', 'дфгд', 2, 3, '', 2),
(15, 'Детско яке', 13.00, 'хгфд', 'кйхглгхй', 1, 2, '', 2),
(16, 'рокля', 0.00, 'р', 'р', 2, 1, '', 2),
(17, 'рокля', 0.00, 'р', 'р', 2, 1, '', 2),
(18, 'рокля', 33.00, 'р', 'р', 2, 1, '', 2),
(19, 'Детско яке', 999.00, 'хгфд', 'кйхглгхй', 1, 2, '', 2),
(20, 'Детско яке', 1123.00, 'хгфд', 'кйхглгхй', 1, 2, '', 2);

-- --------------------------------------------------------

--
-- Структура на таблица `transactions_purchasebill`
--

DROP TABLE IF EXISTS `transactions_purchasebill`;
CREATE TABLE `transactions_purchasebill` (
  `billno` int(11) NOT NULL,
  `time` datetime(6) NOT NULL,
  `supplier_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Структура на таблица `transactions_purchasebilldetails`
--

DROP TABLE IF EXISTS `transactions_purchasebilldetails`;
CREATE TABLE `transactions_purchasebilldetails` (
  `id` int(11) NOT NULL,
  `eway` varchar(50) DEFAULT NULL,
  `veh` varchar(50) DEFAULT NULL,
  `destination` varchar(50) DEFAULT NULL,
  `po` varchar(50) DEFAULT NULL,
  `cgst` varchar(50) DEFAULT NULL,
  `sgst` varchar(50) DEFAULT NULL,
  `igst` varchar(50) DEFAULT NULL,
  `cess` varchar(50) DEFAULT NULL,
  `tcs` varchar(50) DEFAULT NULL,
  `total` varchar(50) DEFAULT NULL,
  `billno_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Структура на таблица `transactions_purchaseitem`
--

DROP TABLE IF EXISTS `transactions_purchaseitem`;
CREATE TABLE `transactions_purchaseitem` (
  `id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `perprice` int(11) NOT NULL,
  `totalprice` int(11) NOT NULL,
  `billno_id` int(11) NOT NULL,
  `stock_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Структура на таблица `transactions_salebill`
--

DROP TABLE IF EXISTS `transactions_salebill`;
CREATE TABLE `transactions_salebill` (
  `billno` int(11) NOT NULL,
  `time` datetime(6) NOT NULL,
  `name` varchar(150) NOT NULL,
  `phone` varchar(12) NOT NULL,
  `address` varchar(200) NOT NULL,
  `email` varchar(254) NOT NULL,
  `gstin` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Структура на таблица `transactions_salebilldetails`
--

DROP TABLE IF EXISTS `transactions_salebilldetails`;
CREATE TABLE `transactions_salebilldetails` (
  `id` int(11) NOT NULL,
  `eway` varchar(50) DEFAULT NULL,
  `veh` varchar(50) DEFAULT NULL,
  `destination` varchar(50) DEFAULT NULL,
  `po` varchar(50) DEFAULT NULL,
  `cgst` varchar(50) DEFAULT NULL,
  `sgst` varchar(50) DEFAULT NULL,
  `igst` varchar(50) DEFAULT NULL,
  `cess` varchar(50) DEFAULT NULL,
  `tcs` varchar(50) DEFAULT NULL,
  `total` varchar(50) DEFAULT NULL,
  `billno_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Структура на таблица `transactions_saleitem`
--

DROP TABLE IF EXISTS `transactions_saleitem`;
CREATE TABLE `transactions_saleitem` (
  `id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `perprice` int(11) NOT NULL,
  `totalprice` int(11) NOT NULL,
  `billno_id` int(11) NOT NULL,
  `stock_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Структура на таблица `transactions_supplier`
--

DROP TABLE IF EXISTS `transactions_supplier`;
CREATE TABLE `transactions_supplier` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL,
  `phone` varchar(12) NOT NULL,
  `address` varchar(200) NOT NULL,
  `email` varchar(254) NOT NULL,
  `gstin` varchar(15) NOT NULL,
  `is_deleted` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Индекси за таблица `auth_group`
--
ALTER TABLE `auth_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Индекси за таблица `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  ADD KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`);

--
-- Индекси за таблица `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`);

--
-- Индекси за таблица `auth_user`
--
ALTER TABLE `auth_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Индекси за таблица `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  ADD KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`);

--
-- Индекси за таблица `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  ADD KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`);

--
-- Индекси за таблица `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`);

--
-- Индекси за таблица `django_content_type`
--
ALTER TABLE `django_content_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`);

--
-- Индекси за таблица `django_migrations`
--
ALTER TABLE `django_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Индекси за таблица `django_session`
--
ALTER TABLE `django_session`
  ADD PRIMARY KEY (`session_key`),
  ADD KEY `django_session_expire_date_a5c62663` (`expire_date`);

--
-- Индекси за таблица `inventory_stock`
--
ALTER TABLE `inventory_stock`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Индекси за таблица `main_appuser`
--
ALTER TABLE `main_appuser`
  ADD PRIMARY KEY (`id`);

--
-- Индекси за таблица `main_category`
--
ALTER TABLE `main_category`
  ADD PRIMARY KEY (`id`);

--
-- Индекси за таблица `main_comment`
--
ALTER TABLE `main_comment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `main_comment_post_id_id_e01d7b13_fk_main_userpost_id` (`post_id_id`);

--
-- Индекси за таблица `main_size`
--
ALTER TABLE `main_size`
  ADD PRIMARY KEY (`id`);

--
-- Индекси за таблица `main_userpost`
--
ALTER TABLE `main_userpost`
  ADD PRIMARY KEY (`id`),
  ADD KEY `main_userpost_category_id_c0332ee4_fk_main_category_id` (`category_id`),
  ADD KEY `main_userpost_size_id_9f3dab99_fk_main_size_id` (`size_id`),
  ADD KEY `main_userpost_user_id_b9540760_fk_main_appuser_id` (`user_id`);

--
-- Индекси за таблица `transactions_purchasebill`
--
ALTER TABLE `transactions_purchasebill`
  ADD PRIMARY KEY (`billno`),
  ADD KEY `transactions_purchas_supplier_id_ab6d7429_fk_transacti` (`supplier_id`);

--
-- Индекси за таблица `transactions_purchasebilldetails`
--
ALTER TABLE `transactions_purchasebilldetails`
  ADD PRIMARY KEY (`id`),
  ADD KEY `transactions_purchas_billno_id_68bce76e_fk_transacti` (`billno_id`);

--
-- Индекси за таблица `transactions_purchaseitem`
--
ALTER TABLE `transactions_purchaseitem`
  ADD PRIMARY KEY (`id`),
  ADD KEY `transactions_purchas_billno_id_1c37095c_fk_transacti` (`billno_id`),
  ADD KEY `transactions_purchas_stock_id_7cdd5bf7_fk_inventory` (`stock_id`);

--
-- Индекси за таблица `transactions_salebill`
--
ALTER TABLE `transactions_salebill`
  ADD PRIMARY KEY (`billno`);

--
-- Индекси за таблица `transactions_salebilldetails`
--
ALTER TABLE `transactions_salebilldetails`
  ADD PRIMARY KEY (`id`),
  ADD KEY `transactions_salebil_billno_id_29bdca68_fk_transacti` (`billno_id`);

--
-- Индекси за таблица `transactions_saleitem`
--
ALTER TABLE `transactions_saleitem`
  ADD PRIMARY KEY (`id`),
  ADD KEY `transactions_saleite_billno_id_eb219925_fk_transacti` (`billno_id`),
  ADD KEY `transactions_saleitem_stock_id_4b17b3fd_fk_inventory_stock_id` (`stock_id`);

--
-- Индекси за таблица `transactions_supplier`
--
ALTER TABLE `transactions_supplier`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `phone` (`phone`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `gstin` (`gstin`);

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=77;

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
-- AUTO_INCREMENT for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT for table `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `inventory_stock`
--
ALTER TABLE `inventory_stock`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `main_appuser`
--
ALTER TABLE `main_appuser`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `main_category`
--
ALTER TABLE `main_category`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `main_comment`
--
ALTER TABLE `main_comment`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `main_size`
--
ALTER TABLE `main_size`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `main_userpost`
--
ALTER TABLE `main_userpost`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `transactions_purchasebill`
--
ALTER TABLE `transactions_purchasebill`
  MODIFY `billno` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `transactions_purchasebilldetails`
--
ALTER TABLE `transactions_purchasebilldetails`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `transactions_purchaseitem`
--
ALTER TABLE `transactions_purchaseitem`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `transactions_salebill`
--
ALTER TABLE `transactions_salebill`
  MODIFY `billno` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `transactions_salebilldetails`
--
ALTER TABLE `transactions_salebilldetails`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `transactions_saleitem`
--
ALTER TABLE `transactions_saleitem`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `transactions_supplier`
--
ALTER TABLE `transactions_supplier`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Ограничения за дъмпнати таблици
--

--
-- Ограничения за таблица `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Ограничения за таблица `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Ограничения за таблица `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Ограничения за таблица `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Ограничения за таблица `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Ограничения за таблица `main_comment`
--
ALTER TABLE `main_comment`
  ADD CONSTRAINT `main_comment_post_id_id_e01d7b13_fk_main_userpost_id` FOREIGN KEY (`post_id_id`) REFERENCES `main_userpost` (`id`);

--
-- Ограничения за таблица `main_userpost`
--
ALTER TABLE `main_userpost`
  ADD CONSTRAINT `main_userpost_category_id_c0332ee4_fk_main_category_id` FOREIGN KEY (`category_id`) REFERENCES `main_category` (`id`),
  ADD CONSTRAINT `main_userpost_size_id_9f3dab99_fk_main_size_id` FOREIGN KEY (`size_id`) REFERENCES `main_size` (`id`),
  ADD CONSTRAINT `main_userpost_user_id_b9540760_fk_main_appuser_id` FOREIGN KEY (`user_id`) REFERENCES `main_appuser` (`id`);

--
-- Ограничения за таблица `transactions_purchasebill`
--
ALTER TABLE `transactions_purchasebill`
  ADD CONSTRAINT `transactions_purchas_supplier_id_ab6d7429_fk_transacti` FOREIGN KEY (`supplier_id`) REFERENCES `transactions_supplier` (`id`);

--
-- Ограничения за таблица `transactions_purchasebilldetails`
--
ALTER TABLE `transactions_purchasebilldetails`
  ADD CONSTRAINT `transactions_purchas_billno_id_68bce76e_fk_transacti` FOREIGN KEY (`billno_id`) REFERENCES `transactions_purchasebill` (`billno`);

--
-- Ограничения за таблица `transactions_purchaseitem`
--
ALTER TABLE `transactions_purchaseitem`
  ADD CONSTRAINT `transactions_purchas_billno_id_1c37095c_fk_transacti` FOREIGN KEY (`billno_id`) REFERENCES `transactions_purchasebill` (`billno`),
  ADD CONSTRAINT `transactions_purchas_stock_id_7cdd5bf7_fk_inventory` FOREIGN KEY (`stock_id`) REFERENCES `inventory_stock` (`id`);

--
-- Ограничения за таблица `transactions_salebilldetails`
--
ALTER TABLE `transactions_salebilldetails`
  ADD CONSTRAINT `transactions_salebil_billno_id_29bdca68_fk_transacti` FOREIGN KEY (`billno_id`) REFERENCES `transactions_salebill` (`billno`);

--
-- Ограничения за таблица `transactions_saleitem`
--
ALTER TABLE `transactions_saleitem`
  ADD CONSTRAINT `transactions_saleite_billno_id_eb219925_fk_transacti` FOREIGN KEY (`billno_id`) REFERENCES `transactions_salebill` (`billno`),
  ADD CONSTRAINT `transactions_saleitem_stock_id_4b17b3fd_fk_inventory_stock_id` FOREIGN KEY (`stock_id`) REFERENCES `inventory_stock` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
