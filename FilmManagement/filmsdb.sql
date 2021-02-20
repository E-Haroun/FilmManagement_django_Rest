-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : sam. 20 fév. 2021 à 22:25
-- Version du serveur :  8.0.21
-- Version de PHP : 7.4.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `filmsdb`
--

-- --------------------------------------------------------

--
-- Structure de la table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
CREATE TABLE IF NOT EXISTS `auth_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Structure de la table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
CREATE TABLE IF NOT EXISTS `auth_group_permissions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissions_group_id_b120cbf9` (`group_id`),
  KEY `auth_group_permissions_permission_id_84c5c92e` (`permission_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Structure de la table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
CREATE TABLE IF NOT EXISTS `auth_permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  KEY `auth_permission_content_type_id_2f476e4b` (`content_type_id`)
) ENGINE=MyISAM AUTO_INCREMENT=37 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `auth_permission`
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
(25, 'Can add genre', 7, 'add_genre'),
(26, 'Can change genre', 7, 'change_genre'),
(27, 'Can delete genre', 7, 'delete_genre'),
(28, 'Can view genre', 7, 'view_genre'),
(29, 'Can add film', 8, 'add_film'),
(30, 'Can change film', 8, 'change_film'),
(31, 'Can delete film', 8, 'delete_film'),
(32, 'Can view film', 8, 'view_film'),
(33, 'Can add cinema', 9, 'add_cinema'),
(34, 'Can change cinema', 9, 'change_cinema'),
(35, 'Can delete cinema', 9, 'delete_cinema'),
(36, 'Can view cinema', 9, 'view_cinema');

-- --------------------------------------------------------

--
-- Structure de la table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
CREATE TABLE IF NOT EXISTS `auth_user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `auth_user`
--

INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`) VALUES
(1, 'pbkdf2_sha256$150000$NB9mnv9qWiEo$lVL4NAkYYco4QFVqbbO0WdtxLWCrMTZCNsXP0QeKMz8=', '2021-02-19 13:58:03.526012', 1, 'admin', '', '', 'admin@dm.com', 1, 1, '2021-02-19 00:15:51.894085');

-- --------------------------------------------------------

--
-- Structure de la table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
CREATE TABLE IF NOT EXISTS `auth_user_groups` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_user_id_6a12ed8b` (`user_id`),
  KEY `auth_user_groups_group_id_97559544` (`group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Structure de la table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
CREATE TABLE IF NOT EXISTS `auth_user_user_permissions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permissions_user_id_a95ead1b` (`user_id`),
  KEY `auth_user_user_permissions_permission_id_1fbb5f2c` (`permission_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Structure de la table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
CREATE TABLE IF NOT EXISTS `django_admin_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint UNSIGNED NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6` (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `django_admin_log`
--

INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES
(1, '2021-02-19 00:27:26.198170', '1', 'Comedy', 1, '[{\"added\": {}}]', 7, 1),
(2, '2021-02-19 00:27:32.579129', '1', 'Comedy', 3, '', 7, 1),
(3, '2021-02-19 00:28:19.718989', '2', 'Comedy', 1, '[{\"added\": {}}]', 7, 1),
(4, '2021-02-19 00:30:11.880402', '1', 'Friends : 1994', 1, '[{\"added\": {}}]', 8, 1),
(5, '2021-02-19 00:31:04.054529', '1', 'ATLAS : CASABLANCA', 1, '[{\"added\": {}}]', 9, 1),
(6, '2021-02-19 00:31:10.502277', '1', 'ATLAS : CASABLANCA', 3, '', 9, 1),
(7, '2021-02-19 01:26:55.315228', '2', 'ATLAS : CASABLANCA', 1, '[{\"added\": {}}]', 9, 1),
(8, '2021-02-19 01:55:59.075205', '3', 'Love', 1, '[{\"added\": {}}]', 7, 1),
(9, '2021-02-19 01:56:07.967410', '4', 'action', 1, '[{\"added\": {}}]', 7, 1),
(10, '2021-02-19 01:56:32.289332', '5', 'science', 1, '[{\"added\": {}}]', 7, 1),
(11, '2021-02-19 02:13:42.260131', '2', 'Catch Me If You Can : 2012', 1, '[{\"added\": {}}]', 8, 1),
(12, '2021-02-19 02:14:22.307293', '3', 'STARTS : MEKNAS', 1, '[{\"added\": {}}]', 9, 1),
(13, '2021-02-19 02:14:53.233544', '3', 'Dragons : 1999', 1, '[{\"added\": {}}]', 8, 1),
(14, '2021-02-19 02:15:12.797441', '3', 'STARTS : MEKNAS', 2, '[{\"changed\": {\"fields\": [\"films\"]}}]', 9, 1),
(17, '2021-02-19 14:11:01.659102', '2', 'ATLAS : CASABLANCA', 2, '[{\"changed\": {\"fields\": [\"films\"]}}]', 9, 1),
(18, '2021-02-19 14:11:05.883797', '3', 'STARTS : MEKNAS', 2, '[{\"changed\": {\"fields\": [\"films\"]}}]', 9, 1),
(19, '2021-02-19 14:12:54.698635', '4', 'Infenity : 2018', 2, '[{\"changed\": {\"fields\": [\"owner\"]}}]', 8, 1);

-- --------------------------------------------------------

--
-- Structure de la table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
CREATE TABLE IF NOT EXISTS `django_content_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(2, 'auth', 'permission'),
(3, 'auth', 'group'),
(4, 'auth', 'user'),
(5, 'contenttypes', 'contenttype'),
(6, 'sessions', 'session'),
(7, 'filmscinema', 'genre'),
(8, 'filmscinema', 'film'),
(9, 'filmscinema', 'cinema');

-- --------------------------------------------------------

--
-- Structure de la table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
CREATE TABLE IF NOT EXISTS `django_migrations` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2021-02-19 00:06:03.021047'),
(2, 'auth', '0001_initial', '2021-02-19 00:06:04.414348'),
(3, 'admin', '0001_initial', '2021-02-19 00:06:11.897296'),
(4, 'admin', '0002_logentry_remove_auto_add', '2021-02-19 00:06:13.743356'),
(5, 'admin', '0003_logentry_add_action_flag_choices', '2021-02-19 00:06:13.752333'),
(6, 'contenttypes', '0002_remove_content_type_name', '2021-02-19 00:06:14.820513'),
(7, 'auth', '0002_alter_permission_name_max_length', '2021-02-19 00:06:15.275258'),
(8, 'auth', '0003_alter_user_email_max_length', '2021-02-19 00:06:15.686158'),
(9, 'auth', '0004_alter_user_username_opts', '2021-02-19 00:06:15.698137'),
(10, 'auth', '0005_alter_user_last_login_null', '2021-02-19 00:06:16.166875'),
(11, 'auth', '0006_require_contenttypes_0002', '2021-02-19 00:06:16.169910'),
(12, 'auth', '0007_alter_validators_add_error_messages', '2021-02-19 00:06:16.189854'),
(13, 'auth', '0008_alter_user_username_max_length', '2021-02-19 00:06:16.687519'),
(14, 'auth', '0009_alter_user_last_name_max_length', '2021-02-19 00:06:17.180159'),
(15, 'auth', '0010_alter_group_name_max_length', '2021-02-19 00:06:17.746646'),
(16, 'auth', '0011_update_proxy_permissions', '2021-02-19 00:06:17.766592'),
(17, 'filmscinema', '0001_initial', '2021-02-19 00:06:18.446800'),
(18, 'sessions', '0001_initial', '2021-02-19 00:06:24.901501');

-- --------------------------------------------------------

--
-- Structure de la table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
CREATE TABLE IF NOT EXISTS `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('tu0sr84ao9gg7z9vca549w1iog7jlfua', 'ODg0MDBmNmY4ZTVlNjkxYjZiMjg2NTY0NmJhMTZmYjc1ZDE1YzgyNzp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJiOWU4YjM1M2QxNzE3MDczZjZlNzZlOTc1MjBhZTljODVkNDg0OGIyIn0=', '2021-03-05 01:55:37.682446'),
('24ycvac73f0b3musyfn3764m3qfctow9', 'NzhkNGQzY2I0MDQxYzdlMjkyY2ZjZTNmYjY4Nzk5NmY2YjNhNDA0NDp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI5ZWY3ZjU4ZmVkNjYyNmUyY2Q4MThmNjU1NDY2ZTdkYjI0NTFmMTlkIn0=', '2021-03-05 02:16:35.771877'),
('yzb8nfhm0tf72vy9k3g9egttnz4mnlgi', 'ODg0MDBmNmY4ZTVlNjkxYjZiMjg2NTY0NmJhMTZmYjc1ZDE1YzgyNzp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJiOWU4YjM1M2QxNzE3MDczZjZlNzZlOTc1MjBhZTljODVkNDg0OGIyIn0=', '2021-03-05 13:58:03.529003');

-- --------------------------------------------------------

--
-- Structure de la table `filmscinema_cinema`
--

DROP TABLE IF EXISTS `filmscinema_cinema`;
CREATE TABLE IF NOT EXISTS `filmscinema_cinema` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL,
  `city` varchar(100) NOT NULL,
  `owner_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `filmscinema_cinema_owner_id_b1c99925` (`owner_id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `filmscinema_cinema`
--

INSERT INTO `filmscinema_cinema` (`id`, `name`, `city`, `owner_id`) VALUES
(3, 'AtlasVIP', 'CASABLANCA', 1),
(5, 'YourHome', 'CASABLANCA', 1);

-- --------------------------------------------------------

--
-- Structure de la table `filmscinema_cinema_films`
--

DROP TABLE IF EXISTS `filmscinema_cinema_films`;
CREATE TABLE IF NOT EXISTS `filmscinema_cinema_films` (
  `id` int NOT NULL AUTO_INCREMENT,
  `cinema_id` int NOT NULL,
  `film_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `filmscinema_cinema_films_cinema_id_film_id_caedf8c8_uniq` (`cinema_id`,`film_id`),
  KEY `filmscinema_cinema_films_cinema_id_b20d1dde` (`cinema_id`),
  KEY `filmscinema_cinema_films_film_id_ed58c8c9` (`film_id`)
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `filmscinema_cinema_films`
--

INSERT INTO `filmscinema_cinema_films` (`id`, `cinema_id`, `film_id`) VALUES
(11, 5, 4),
(10, 3, 4),
(9, 3, 5),
(12, 5, 5);

-- --------------------------------------------------------

--
-- Structure de la table `filmscinema_film`
--

DROP TABLE IF EXISTS `filmscinema_film`;
CREATE TABLE IF NOT EXISTS `filmscinema_film` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL,
  `year_prod` int NOT NULL,
  `presentation_date` datetime(6) NOT NULL,
  `genre_id` int NOT NULL,
  `owner_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `filmscinema_film_genre_id_ccfe1a99` (`genre_id`),
  KEY `filmscinema_film_owner_id_4aedd1be` (`owner_id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `filmscinema_film`
--

INSERT INTO `filmscinema_film` (`id`, `title`, `year_prod`, `presentation_date`, `genre_id`, `owner_id`) VALUES
(4, 'Infenity', 2018, '2021-02-15 02:17:22.000000', 5, 1),
(5, 'KIMINO', 2010, '2021-02-19 02:13:38.000000', 3, 1);

-- --------------------------------------------------------

--
-- Structure de la table `filmscinema_genre`
--

DROP TABLE IF EXISTS `filmscinema_genre`;
CREATE TABLE IF NOT EXISTS `filmscinema_genre` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `filmscinema_genre`
--

INSERT INTO `filmscinema_genre` (`id`, `name`) VALUES
(6, 'Art'),
(3, 'Love'),
(4, 'action'),
(5, 'science');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
