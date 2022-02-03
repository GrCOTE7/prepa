-- --------------------------------------------------------
-- Hôte:                         192.168.10.10
-- Version du serveur:           8.0.27-0ubuntu0.20.04.1 - (Ubuntu)
-- SE du serveur:                Linux
-- HeidiSQL Version:             11.2.0.6213
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Listage de la structure de la base pour prepa
DROP DATABASE IF EXISTS `prepa`;
CREATE DATABASE IF NOT EXISTS `prepa` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `prepa`;

-- Listage de la structure de la table prepa. backend_access_log
DROP TABLE IF EXISTS `backend_access_log`;
CREATE TABLE IF NOT EXISTS `backend_access_log` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int unsigned NOT NULL,
  `ip_address` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table prepa.backend_access_log : ~2 rows (environ)
/*!40000 ALTER TABLE `backend_access_log` DISABLE KEYS */;
INSERT INTO `backend_access_log` (`id`, `user_id`, `ip_address`, `created_at`, `updated_at`) VALUES
	(1, 1, '192.168.10.1', '2022-01-21 15:21:20', '2022-01-21 15:21:20'),
	(2, 1, '192.168.10.1', '2022-01-21 15:23:05', '2022-01-21 15:23:05'),
	(3, 1, '192.168.10.1', '2022-01-31 13:02:11', '2022-01-31 13:02:11'),
	(4, 1, '192.168.10.1', '2022-01-31 19:30:54', '2022-01-31 19:30:54');
/*!40000 ALTER TABLE `backend_access_log` ENABLE KEYS */;

-- Listage de la structure de la table prepa. backend_users
DROP TABLE IF EXISTS `backend_users`;
CREATE TABLE IF NOT EXISTS `backend_users` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `first_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `login` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `activation_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `persist_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `reset_password_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `permissions` text COLLATE utf8mb4_unicode_ci,
  `is_activated` tinyint(1) NOT NULL DEFAULT '0',
  `role_id` int unsigned DEFAULT NULL,
  `activated_at` timestamp NULL DEFAULT NULL,
  `last_login` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `login_unique` (`login`),
  UNIQUE KEY `email_unique` (`email`),
  KEY `act_code_index` (`activation_code`),
  KEY `reset_code_index` (`reset_password_code`),
  KEY `admin_role_index` (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table prepa.backend_users : ~1 rows (environ)
/*!40000 ALTER TABLE `backend_users` DISABLE KEYS */;
INSERT INTO `backend_users` (`id`, `first_name`, `last_name`, `login`, `email`, `password`, `activation_code`, `persist_code`, `reset_password_code`, `permissions`, `is_activated`, `role_id`, `activated_at`, `last_login`, `created_at`, `updated_at`, `deleted_at`, `is_superuser`) VALUES
	(1, 'Lionel', 'COTE', 'GrCOTE7', 'grcote7@gmail.com', '$2y$10$Vz9Y2l919D0NjHyI5OeQ2.rqIVu8oFuvHWpaPLy6jTNRDS0158SCm', NULL, '$2y$10$6kIzyrfK7JA6zQk.nSRmuO6tA9cbbczoXqbcauSfUl2gHQuQbnaoW', NULL, '', 1, 2, NULL, '2022-01-31 19:30:54', '2022-01-21 15:20:51', '2022-01-31 19:30:54', NULL, 1);
/*!40000 ALTER TABLE `backend_users` ENABLE KEYS */;

-- Listage de la structure de la table prepa. backend_users_groups
DROP TABLE IF EXISTS `backend_users_groups`;
CREATE TABLE IF NOT EXISTS `backend_users_groups` (
  `user_id` int unsigned NOT NULL,
  `user_group_id` int unsigned NOT NULL,
  PRIMARY KEY (`user_id`,`user_group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table prepa.backend_users_groups : ~0 rows (environ)
/*!40000 ALTER TABLE `backend_users_groups` DISABLE KEYS */;
INSERT INTO `backend_users_groups` (`user_id`, `user_group_id`) VALUES
	(1, 1);
/*!40000 ALTER TABLE `backend_users_groups` ENABLE KEYS */;

-- Listage de la structure de la table prepa. backend_user_groups
DROP TABLE IF EXISTS `backend_user_groups`;
CREATE TABLE IF NOT EXISTS `backend_user_groups` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `is_new_user_default` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_unique` (`name`),
  KEY `code_index` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table prepa.backend_user_groups : ~0 rows (environ)
/*!40000 ALTER TABLE `backend_user_groups` DISABLE KEYS */;
INSERT INTO `backend_user_groups` (`id`, `name`, `created_at`, `updated_at`, `code`, `description`, `is_new_user_default`) VALUES
	(1, 'Owners', '2022-01-21 15:20:51', '2022-01-21 15:20:51', 'owners', 'Default group for website owners.', 0);
/*!40000 ALTER TABLE `backend_user_groups` ENABLE KEYS */;

-- Listage de la structure de la table prepa. backend_user_preferences
DROP TABLE IF EXISTS `backend_user_preferences`;
CREATE TABLE IF NOT EXISTS `backend_user_preferences` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int unsigned NOT NULL,
  `namespace` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `group` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `item` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `user_item_index` (`user_id`,`namespace`,`group`,`item`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table prepa.backend_user_preferences : ~3 rows (environ)
/*!40000 ALTER TABLE `backend_user_preferences` DISABLE KEYS */;
INSERT INTO `backend_user_preferences` (`id`, `user_id`, `namespace`, `group`, `item`, `value`) VALUES
	(1, 1, 'backend', 'backend', 'preferences', '{"locale":"fr","fallback_locale":"en","timezone":"Europe\\/Paris","editor_font_size":"12","editor_word_wrap":"fluid","editor_code_folding":"manual","editor_tab_size":"4","editor_theme":"twilight","editor_show_invisibles":"0","editor_highlight_active_line":"1","editor_use_hard_tabs":"0","editor_show_gutter":"1","editor_auto_closing":"0","editor_autocompletion":"manual","editor_enable_snippets":"0","editor_display_indent_guides":"0","editor_show_print_margin":"0","user_id":1}'),
	(2, 1, 'backend', 'users', 'lists', '{"visible":["login","last_login","first_name","last_name","email","groups","role","is_superuser","is_activated","created_at","deleted_at"],"order":["full_name","login","last_login","first_name","last_name","email","groups","role","is_superuser","is_activated","created_at","deleted_at","updated_at"],"per_page":"100"}'),
	(3, 1, 'backend', 'reportwidgets', 'dashboard', '{"welcome":{"class":"Backend\\\\ReportWidgets\\\\Welcome","sortOrder":50,"configuration":{"title":"Bienvenue","ocWidgetWidth":7,"ocWidgetNewRow":0}},"systemStatus":{"class":"System\\\\ReportWidgets\\\\Status","sortOrder":60,"configuration":{"title":"\\u00c9tat du syst\\u00e8me","ocWidgetWidth":7,"ocWidgetNewRow":null}},"activeTheme":{"class":"Cms\\\\ReportWidgets\\\\ActiveTheme","sortOrder":70,"configuration":{"title":"Site Web","ocWidgetWidth":5,"ocWidgetNewRow":null}}}'),
	(4, 1, 'backend', 'accesslogs', 'lists', '{"visible":["id","created_at","ip_address","login","first_name","last_name","email"],"order":["id","created_at","type","ip_address","login","first_name","last_name","email"],"per_page":"30"}');
/*!40000 ALTER TABLE `backend_user_preferences` ENABLE KEYS */;

-- Listage de la structure de la table prepa. backend_user_roles
DROP TABLE IF EXISTS `backend_user_roles`;
CREATE TABLE IF NOT EXISTS `backend_user_roles` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `permissions` text COLLATE utf8mb4_unicode_ci,
  `is_system` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `role_unique` (`name`),
  KEY `role_code_index` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table prepa.backend_user_roles : ~2 rows (environ)
/*!40000 ALTER TABLE `backend_user_roles` DISABLE KEYS */;
INSERT INTO `backend_user_roles` (`id`, `name`, `code`, `description`, `permissions`, `is_system`, `created_at`, `updated_at`) VALUES
	(1, 'Publisher', 'publisher', 'Site editor with access to publishing tools.', '', 1, '2022-01-21 15:20:51', '2022-01-21 15:20:51'),
	(2, 'Developer', 'developer', 'Site administrator with access to developer tools.', '', 1, '2022-01-21 15:20:51', '2022-01-21 15:20:51');
/*!40000 ALTER TABLE `backend_user_roles` ENABLE KEYS */;

-- Listage de la structure de la table prepa. backend_user_throttle
DROP TABLE IF EXISTS `backend_user_throttle`;
CREATE TABLE IF NOT EXISTS `backend_user_throttle` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int unsigned DEFAULT NULL,
  `ip_address` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `attempts` int NOT NULL DEFAULT '0',
  `last_attempt_at` timestamp NULL DEFAULT NULL,
  `is_suspended` tinyint(1) NOT NULL DEFAULT '0',
  `suspended_at` timestamp NULL DEFAULT NULL,
  `is_banned` tinyint(1) NOT NULL DEFAULT '0',
  `banned_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `backend_user_throttle_user_id_index` (`user_id`),
  KEY `backend_user_throttle_ip_address_index` (`ip_address`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table prepa.backend_user_throttle : ~0 rows (environ)
/*!40000 ALTER TABLE `backend_user_throttle` DISABLE KEYS */;
INSERT INTO `backend_user_throttle` (`id`, `user_id`, `ip_address`, `attempts`, `last_attempt_at`, `is_suspended`, `suspended_at`, `is_banned`, `banned_at`) VALUES
	(1, 1, '192.168.10.1', 0, NULL, 0, NULL, 0, NULL);
/*!40000 ALTER TABLE `backend_user_throttle` ENABLE KEYS */;

-- Listage de la structure de la table prepa. cache
DROP TABLE IF EXISTS `cache`;
CREATE TABLE IF NOT EXISTS `cache` (
  `key` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL,
  UNIQUE KEY `cache_key_unique` (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table prepa.cache : ~0 rows (environ)
/*!40000 ALTER TABLE `cache` DISABLE KEYS */;
/*!40000 ALTER TABLE `cache` ENABLE KEYS */;

-- Listage de la structure de la table prepa. cms_theme_data
DROP TABLE IF EXISTS `cms_theme_data`;
CREATE TABLE IF NOT EXISTS `cms_theme_data` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `theme` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `data` mediumtext COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cms_theme_data_theme_index` (`theme`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table prepa.cms_theme_data : ~0 rows (environ)
/*!40000 ALTER TABLE `cms_theme_data` DISABLE KEYS */;
INSERT INTO `cms_theme_data` (`id`, `theme`, `data`, `created_at`, `updated_at`) VALUES
	(1, 'sliderweb-403theme', '{"site_name":"Prepa Boosteur 2.0","site_name2":"Boosteur 2.0","gc7_flashy":"#FFF008"}', '2022-01-21 17:00:23', '2022-02-03 16:49:51'),
	(2, 'fabriciorabelo-squad', '{"site_name":"Squad","meta_title":"Squad","meta_description":"Squad Bootstrap Template"}', '2022-02-03 11:13:16', '2022-02-03 11:13:16'),
	(3, 'gregorlaan-bootstrap4withbootswatch', '{"site_name":"Bootstrap 4","theme_name":"default"}', '2022-02-03 11:14:11', '2022-02-03 11:14:11');
/*!40000 ALTER TABLE `cms_theme_data` ENABLE KEYS */;

-- Listage de la structure de la table prepa. cms_theme_logs
DROP TABLE IF EXISTS `cms_theme_logs`;
CREATE TABLE IF NOT EXISTS `cms_theme_logs` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `type` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `theme` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `template` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `old_template` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci,
  `old_content` longtext COLLATE utf8mb4_unicode_ci,
  `user_id` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cms_theme_logs_type_index` (`type`),
  KEY `cms_theme_logs_theme_index` (`theme`),
  KEY `cms_theme_logs_user_id_index` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table prepa.cms_theme_logs : ~0 rows (environ)
/*!40000 ALTER TABLE `cms_theme_logs` DISABLE KEYS */;
/*!40000 ALTER TABLE `cms_theme_logs` ENABLE KEYS */;

-- Listage de la structure de la table prepa. cms_theme_templates
DROP TABLE IF EXISTS `cms_theme_templates`;
CREATE TABLE IF NOT EXISTS `cms_theme_templates` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `source` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `path` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `file_size` int unsigned NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cms_theme_templates_source_index` (`source`),
  KEY `cms_theme_templates_path_index` (`path`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table prepa.cms_theme_templates : ~0 rows (environ)
/*!40000 ALTER TABLE `cms_theme_templates` DISABLE KEYS */;
/*!40000 ALTER TABLE `cms_theme_templates` ENABLE KEYS */;

-- Listage de la structure de la table prepa. deferred_bindings
DROP TABLE IF EXISTS `deferred_bindings`;
CREATE TABLE IF NOT EXISTS `deferred_bindings` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `master_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `master_field` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slave_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slave_id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `pivot_data` mediumtext COLLATE utf8mb4_unicode_ci,
  `session_key` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_bind` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `deferred_bindings_master_type_index` (`master_type`),
  KEY `deferred_bindings_master_field_index` (`master_field`),
  KEY `deferred_bindings_slave_type_index` (`slave_type`),
  KEY `deferred_bindings_slave_id_index` (`slave_id`),
  KEY `deferred_bindings_session_key_index` (`session_key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table prepa.deferred_bindings : ~0 rows (environ)
/*!40000 ALTER TABLE `deferred_bindings` DISABLE KEYS */;
/*!40000 ALTER TABLE `deferred_bindings` ENABLE KEYS */;

-- Listage de la structure de la table prepa. failed_jobs
DROP TABLE IF EXISTS `failed_jobs`;
CREATE TABLE IF NOT EXISTS `failed_jobs` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci,
  `failed_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table prepa.failed_jobs : ~0 rows (environ)
/*!40000 ALTER TABLE `failed_jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `failed_jobs` ENABLE KEYS */;

-- Listage de la structure de la table prepa. jobs
DROP TABLE IF EXISTS `jobs`;
CREATE TABLE IF NOT EXISTS `jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `queue` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint unsigned NOT NULL,
  `reserved_at` int unsigned DEFAULT NULL,
  `available_at` int unsigned NOT NULL,
  `created_at` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `jobs_queue_reserved_at_index` (`queue`,`reserved_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table prepa.jobs : ~0 rows (environ)
/*!40000 ALTER TABLE `jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `jobs` ENABLE KEYS */;

-- Listage de la structure de la table prepa. migrations
DROP TABLE IF EXISTS `migrations`;
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table prepa.migrations : ~41 rows (environ)
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
	(1, '2013_10_01_000001_Db_Deferred_Bindings', 1),
	(2, '2013_10_01_000002_Db_System_Files', 1),
	(3, '2013_10_01_000003_Db_System_Plugin_Versions', 1),
	(4, '2013_10_01_000004_Db_System_Plugin_History', 1),
	(5, '2013_10_01_000005_Db_System_Settings', 1),
	(6, '2013_10_01_000006_Db_System_Parameters', 1),
	(7, '2013_10_01_000007_Db_System_Add_Disabled_Flag', 1),
	(8, '2013_10_01_000008_Db_System_Mail_Templates', 1),
	(9, '2013_10_01_000009_Db_System_Mail_Layouts', 1),
	(10, '2014_10_01_000010_Db_Jobs', 1),
	(11, '2014_10_01_000011_Db_System_Event_Logs', 1),
	(12, '2014_10_01_000012_Db_System_Request_Logs', 1),
	(13, '2014_10_01_000013_Db_System_Sessions', 1),
	(14, '2015_10_01_000014_Db_System_Mail_Layout_Rename', 1),
	(15, '2015_10_01_000015_Db_System_Add_Frozen_Flag', 1),
	(16, '2015_10_01_000016_Db_Cache', 1),
	(17, '2015_10_01_000017_Db_System_Revisions', 1),
	(18, '2015_10_01_000018_Db_FailedJobs', 1),
	(19, '2016_10_01_000019_Db_System_Plugin_History_Detail_Text', 1),
	(20, '2016_10_01_000020_Db_System_Timestamp_Fix', 1),
	(21, '2017_08_04_121309_Db_Deferred_Bindings_Add_Index_Session', 1),
	(22, '2017_10_01_000021_Db_System_Sessions_Update', 1),
	(23, '2017_10_01_000022_Db_Jobs_FailedJobs_Update', 1),
	(24, '2017_10_01_000023_Db_System_Mail_Partials', 1),
	(25, '2017_10_23_000024_Db_System_Mail_Layouts_Add_Options_Field', 1),
	(26, '2021_10_01_000025_Db_Add_Pivot_Data_To_Deferred_Bindings', 1),
	(27, '2013_10_01_000001_Db_Backend_Users', 2),
	(28, '2013_10_01_000002_Db_Backend_User_Groups', 2),
	(29, '2013_10_01_000003_Db_Backend_Users_Groups', 2),
	(30, '2013_10_01_000004_Db_Backend_User_Throttle', 2),
	(31, '2014_01_04_000005_Db_Backend_User_Preferences', 2),
	(32, '2014_10_01_000006_Db_Backend_Access_Log', 2),
	(33, '2014_10_01_000007_Db_Backend_Add_Description_Field', 2),
	(34, '2015_10_01_000008_Db_Backend_Add_Superuser_Flag', 2),
	(35, '2016_10_01_000009_Db_Backend_Timestamp_Fix', 2),
	(36, '2017_10_01_000010_Db_Backend_User_Roles', 2),
	(37, '2018_12_16_000011_Db_Backend_Add_Deleted_At', 2),
	(38, '2014_10_01_000001_Db_Cms_Theme_Data', 3),
	(39, '2016_10_01_000002_Db_Cms_Timestamp_Fix', 3),
	(40, '2017_10_01_000003_Db_Cms_Theme_Logs', 3),
	(41, '2018_11_01_000001_Db_Cms_Theme_Templates', 3);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;

-- Listage de la structure de la table prepa. sessions
DROP TABLE IF EXISTS `sessions`;
CREATE TABLE IF NOT EXISTS `sessions` (
  `id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` text COLLATE utf8mb4_unicode_ci,
  `last_activity` int DEFAULT NULL,
  `user_id` int unsigned DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci,
  UNIQUE KEY `sessions_id_unique` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table prepa.sessions : ~0 rows (environ)
/*!40000 ALTER TABLE `sessions` DISABLE KEYS */;
/*!40000 ALTER TABLE `sessions` ENABLE KEYS */;

-- Listage de la structure de la table prepa. system_event_logs
DROP TABLE IF EXISTS `system_event_logs`;
CREATE TABLE IF NOT EXISTS `system_event_logs` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `level` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `message` text COLLATE utf8mb4_unicode_ci,
  `details` mediumtext COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `system_event_logs_level_index` (`level`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table prepa.system_event_logs : ~85 rows (environ)
/*!40000 ALTER TABLE `system_event_logs` DISABLE KEYS */;
INSERT INTO `system_event_logs` (`id`, `level`, `message`, `details`, `created_at`, `updated_at`) VALUES
	(1, 'error', 'ErrorException: syntax error, unexpected \'"\' in Unknown on line 5\n in /home/vagrant/code/prepa/vendor/winter/storm/src/Parse/Ini.php:22\nStack trace:\n#0 [internal function]: Illuminate\\Foundation\\Bootstrap\\HandleExceptions->handleError()\n#1 /home/vagrant/code/prepa/vendor/winter/storm/src/Parse/Ini.php(22): parse_ini_string()\n#2 /home/vagrant/code/prepa/vendor/laravel/framework/src/Illuminate/Support/Facades/Facade.php(261): Winter\\Storm\\Parse\\Ini->parse()\n#3 /home/vagrant/code/prepa/modules/cms/Classes/CmsCompoundObject.php(134): Illuminate\\Support\\Facades\\Facade::__callStatic()\n#4 /home/vagrant/code/prepa/modules/cms/Classes/CmsCompoundObject.php(91): Cms\\Classes\\CmsCompoundObject->validateSettings()\n#5 /home/vagrant/code/prepa/vendor/winter/storm/src/Halcyon/Model.php(244): Cms\\Classes\\CmsCompoundObject->afterFetch()\n#6 /home/vagrant/code/prepa/vendor/laravel/framework/src/Illuminate/Events/Dispatcher.php(369): Winter\\Storm\\Halcyon\\Model->Winter\\Storm\\Halcyon\\{closure}()\n#7 /home/vagrant/code/prepa/vendor/winter/storm/src/Events/Dispatcher.php(112): Illuminate\\Events\\Dispatcher->Illuminate\\Events\\{closure}()\n#8 /home/vagrant/code/prepa/vendor/winter/storm/src/Events/Dispatcher.php(78): Winter\\Storm\\Events\\Dispatcher->dispatch()\n#9 /home/vagrant/code/prepa/vendor/winter/storm/src/Halcyon/Model.php(1356): Winter\\Storm\\Events\\Dispatcher->fire()\n#10 /home/vagrant/code/prepa/vendor/winter/storm/src/Halcyon/Model.php(489): Winter\\Storm\\Halcyon\\Model->fireModelEvent()\n#11 /home/vagrant/code/prepa/vendor/winter/storm/src/Halcyon/Model.php(508): Winter\\Storm\\Halcyon\\Model->newFromBuilder()\n#12 [internal function]: Winter\\Storm\\Halcyon\\Model::Winter\\Storm\\Halcyon\\{closure}()\n#13 /home/vagrant/code/prepa/vendor/winter/storm/src/Halcyon/Model.php(507): array_map()\n#14 /home/vagrant/code/prepa/vendor/winter/storm/src/Halcyon/Builder.php(465): Winter\\Storm\\Halcyon\\Model::hydrate()\n#15 /home/vagrant/code/prepa/vendor/winter/storm/src/Halcyon/Builder.php(329): Winter\\Storm\\Halcyon\\Builder->getModels()\n#16 /home/vagrant/code/prepa/vendor/winter/storm/src/Halcyon/Builder.php(257): Winter\\Storm\\Halcyon\\Builder->get()\n#17 /home/vagrant/code/prepa/vendor/winter/storm/src/Halcyon/Builder.php(247): Winter\\Storm\\Halcyon\\Builder->first()\n#18 /home/vagrant/code/prepa/modules/cms/Classes/CmsObject.php(118): Winter\\Storm\\Halcyon\\Builder->find()\n#19 /home/vagrant/code/prepa/modules/cms/Classes/CmsObject.php(141): Cms\\Classes\\CmsObject::loadCached()\n#20 /home/vagrant/code/prepa/modules/cms/Classes/Theme.php(130): Cms\\Classes\\CmsObject::listInTheme()\n#21 /home/vagrant/code/prepa/modules/cms/Classes/Router.php(243): Cms\\Classes\\Theme->listPages()\n#22 /home/vagrant/code/prepa/modules/cms/Classes/Router.php(214): Cms\\Classes\\Router->loadUrlMap()\n#23 /home/vagrant/code/prepa/modules/cms/Classes/Router.php(195): Cms\\Classes\\Router->getUrlMap()\n#24 /home/vagrant/code/prepa/modules/cms/Classes/Router.php(114): Cms\\Classes\\Router->getRouterObject()\n#25 /home/vagrant/code/prepa/modules/cms/Classes/Controller.php(158): Cms\\Classes\\Router->findByUrl()\n#26 /home/vagrant/code/prepa/modules/cms/Classes/CmsController.php(50): Cms\\Classes\\Controller->run()\n#27 /home/vagrant/code/prepa/vendor/laravel/framework/src/Illuminate/Routing/Controller.php(54): Cms\\Classes\\CmsController->run()\n#28 /home/vagrant/code/prepa/vendor/laravel/framework/src/Illuminate/Routing/ControllerDispatcher.php(45): Illuminate\\Routing\\Controller->callAction()\n#29 /home/vagrant/code/prepa/vendor/laravel/framework/src/Illuminate/Routing/Route.php(219): Illuminate\\Routing\\ControllerDispatcher->dispatch()\n#30 /home/vagrant/code/prepa/vendor/laravel/framework/src/Illuminate/Routing/Route.php(176): Illuminate\\Routing\\Route->runController()\n#31 /home/vagrant/code/prepa/vendor/laravel/framework/src/Illuminate/Routing/Router.php(681): Illuminate\\Routing\\Route->run()\n#32 /home/vagrant/code/prepa/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(130): Illuminate\\Routing\\Router->Illuminate\\Routing\\{closure}()\n#33 /home/vagrant/code/prepa/vendor/laravel/framework/src/Illuminate/Routing/Middleware/SubstituteBindings.php(41): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}()\n#34 /home/vagrant/code/prepa/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(171): Illuminate\\Routing\\Middleware\\SubstituteBindings->handle()\n#35 /home/vagrant/code/prepa/vendor/laravel/framework/src/Illuminate/View/Middleware/ShareErrorsFromSession.php(49): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}()\n#36 /home/vagrant/code/prepa/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(171): Illuminate\\View\\Middleware\\ShareErrorsFromSession->handle()\n#37 /home/vagrant/code/prepa/vendor/laravel/framework/src/Illuminate/Session/Middleware/StartSession.php(56): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}()\n#38 /home/vagrant/code/prepa/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(171): Illuminate\\Session\\Middleware\\StartSession->handle()\n#39 /home/vagrant/code/prepa/vendor/laravel/framework/src/Illuminate/Cookie/Middleware/AddQueuedCookiesToResponse.php(37): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}()\n#40 /home/vagrant/code/prepa/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(171): Illuminate\\Cookie\\Middleware\\AddQueuedCookiesToResponse->handle()\n#41 /home/vagrant/code/prepa/vendor/laravel/framework/src/Illuminate/Cookie/Middleware/EncryptCookies.php(67): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}()\n#42 /home/vagrant/code/prepa/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(171): Illuminate\\Cookie\\Middleware\\EncryptCookies->handle()\n#43 /home/vagrant/code/prepa/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(105): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}()\n#44 /home/vagrant/code/prepa/vendor/laravel/framework/src/Illuminate/Routing/Router.php(683): Illuminate\\Pipeline\\Pipeline->then()\n#45 /home/vagrant/code/prepa/vendor/laravel/framework/src/Illuminate/Routing/Router.php(658): Illuminate\\Routing\\Router->runRouteWithinStack()\n#46 /home/vagrant/code/prepa/vendor/laravel/framework/src/Illuminate/Routing/Router.php(624): Illuminate\\Routing\\Router->runRoute()\n#47 /home/vagrant/code/prepa/vendor/winter/storm/src/Router/CoreRouter.php(20): Illuminate\\Routing\\Router->dispatchToRoute()\n#48 /home/vagrant/code/prepa/vendor/laravel/framework/src/Illuminate/Foundation/Http/Kernel.php(170): Winter\\Storm\\Router\\CoreRouter->dispatch()\n#49 /home/vagrant/code/prepa/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(130): Illuminate\\Foundation\\Http\\Kernel->Illuminate\\Foundation\\Http\\{closure}()\n#50 /home/vagrant/code/prepa/vendor/laravel/framework/src/Illuminate/Foundation/Http/Middleware/CheckForMaintenanceMode.php(63): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}()\n#51 /home/vagrant/code/prepa/vendor/winter/storm/src/Foundation/Http/Middleware/CheckForMaintenanceMode.php(25): Illuminate\\Foundation\\Http\\Middleware\\CheckForMaintenanceMode->handle()\n#52 /home/vagrant/code/prepa/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(171): Winter\\Storm\\Foundation\\Http\\Middleware\\CheckForMaintenanceMode->handle()\n#53 /home/vagrant/code/prepa/vendor/winter/storm/src/Foundation/Http/Middleware/CheckForTrustedProxies.php(56): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}()\n#54 /home/vagrant/code/prepa/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(171): Winter\\Storm\\Foundation\\Http\\Middleware\\CheckForTrustedProxies->handle()\n#55 /home/vagrant/code/prepa/vendor/winter/storm/src/Http/Middleware/TrustHosts.php(46): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}()\n#56 /home/vagrant/code/prepa/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(171): Winter\\Storm\\Http\\Middleware\\TrustHosts->handle()\n#57 /home/vagrant/code/prepa/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(105): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}()\n#58 /home/vagrant/code/prepa/vendor/laravel/framework/src/Illuminate/Foundation/Http/Kernel.php(145): Illuminate\\Pipeline\\Pipeline->then()\n#59 /home/vagrant/code/prepa/vendor/laravel/framework/src/Illuminate/Foundation/Http/Kernel.php(110): Illuminate\\Foundation\\Http\\Kernel->sendRequestThroughRouter()\n#60 /home/vagrant/code/prepa/index.php(41): Illuminate\\Foundation\\Http\\Kernel->handle()\n#61 {main}', NULL, '2022-02-03 12:01:45', '2022-02-03 12:01:45'),
	(2, 'error', 'ErrorException: syntax error, unexpected \'"\' in Unknown on line 5\n in /home/vagrant/code/prepa/vendor/winter/storm/src/Parse/Ini.php:22\nStack trace:\n#0 [internal function]: Illuminate\\Foundation\\Bootstrap\\HandleExceptions->handleError()\n#1 /home/vagrant/code/prepa/vendor/winter/storm/src/Parse/Ini.php(22): parse_ini_string()\n#2 /home/vagrant/code/prepa/vendor/laravel/framework/src/Illuminate/Support/Facades/Facade.php(261): Winter\\Storm\\Parse\\Ini->parse()\n#3 /home/vagrant/code/prepa/modules/cms/Classes/CmsCompoundObject.php(134): Illuminate\\Support\\Facades\\Facade::__callStatic()\n#4 /home/vagrant/code/prepa/modules/cms/Classes/CmsCompoundObject.php(91): Cms\\Classes\\CmsCompoundObject->validateSettings()\n#5 /home/vagrant/code/prepa/vendor/winter/storm/src/Halcyon/Model.php(244): Cms\\Classes\\CmsCompoundObject->afterFetch()\n#6 /home/vagrant/code/prepa/vendor/laravel/framework/src/Illuminate/Events/Dispatcher.php(369): Winter\\Storm\\Halcyon\\Model->Winter\\Storm\\Halcyon\\{closure}()\n#7 /home/vagrant/code/prepa/vendor/winter/storm/src/Events/Dispatcher.php(112): Illuminate\\Events\\Dispatcher->Illuminate\\Events\\{closure}()\n#8 /home/vagrant/code/prepa/vendor/winter/storm/src/Events/Dispatcher.php(78): Winter\\Storm\\Events\\Dispatcher->dispatch()\n#9 /home/vagrant/code/prepa/vendor/winter/storm/src/Halcyon/Model.php(1356): Winter\\Storm\\Events\\Dispatcher->fire()\n#10 /home/vagrant/code/prepa/vendor/winter/storm/src/Halcyon/Model.php(489): Winter\\Storm\\Halcyon\\Model->fireModelEvent()\n#11 /home/vagrant/code/prepa/vendor/winter/storm/src/Halcyon/Model.php(508): Winter\\Storm\\Halcyon\\Model->newFromBuilder()\n#12 [internal function]: Winter\\Storm\\Halcyon\\Model::Winter\\Storm\\Halcyon\\{closure}()\n#13 /home/vagrant/code/prepa/vendor/winter/storm/src/Halcyon/Model.php(507): array_map()\n#14 /home/vagrant/code/prepa/vendor/winter/storm/src/Halcyon/Builder.php(465): Winter\\Storm\\Halcyon\\Model::hydrate()\n#15 /home/vagrant/code/prepa/vendor/winter/storm/src/Halcyon/Builder.php(329): Winter\\Storm\\Halcyon\\Builder->getModels()\n#16 /home/vagrant/code/prepa/vendor/winter/storm/src/Halcyon/Builder.php(257): Winter\\Storm\\Halcyon\\Builder->get()\n#17 /home/vagrant/code/prepa/vendor/winter/storm/src/Halcyon/Builder.php(247): Winter\\Storm\\Halcyon\\Builder->first()\n#18 /home/vagrant/code/prepa/modules/cms/Classes/CmsObject.php(118): Winter\\Storm\\Halcyon\\Builder->find()\n#19 /home/vagrant/code/prepa/modules/cms/Classes/CmsObject.php(141): Cms\\Classes\\CmsObject::loadCached()\n#20 /home/vagrant/code/prepa/modules/cms/Classes/Theme.php(130): Cms\\Classes\\CmsObject::listInTheme()\n#21 /home/vagrant/code/prepa/modules/cms/Classes/Router.php(243): Cms\\Classes\\Theme->listPages()\n#22 /home/vagrant/code/prepa/modules/cms/Classes/Router.php(214): Cms\\Classes\\Router->loadUrlMap()\n#23 /home/vagrant/code/prepa/modules/cms/Classes/Router.php(195): Cms\\Classes\\Router->getUrlMap()\n#24 /home/vagrant/code/prepa/modules/cms/Classes/Router.php(114): Cms\\Classes\\Router->getRouterObject()\n#25 /home/vagrant/code/prepa/modules/cms/Classes/Controller.php(158): Cms\\Classes\\Router->findByUrl()\n#26 /home/vagrant/code/prepa/modules/cms/Classes/CmsController.php(50): Cms\\Classes\\Controller->run()\n#27 /home/vagrant/code/prepa/vendor/laravel/framework/src/Illuminate/Routing/Controller.php(54): Cms\\Classes\\CmsController->run()\n#28 /home/vagrant/code/prepa/vendor/laravel/framework/src/Illuminate/Routing/ControllerDispatcher.php(45): Illuminate\\Routing\\Controller->callAction()\n#29 /home/vagrant/code/prepa/vendor/laravel/framework/src/Illuminate/Routing/Route.php(219): Illuminate\\Routing\\ControllerDispatcher->dispatch()\n#30 /home/vagrant/code/prepa/vendor/laravel/framework/src/Illuminate/Routing/Route.php(176): Illuminate\\Routing\\Route->runController()\n#31 /home/vagrant/code/prepa/vendor/laravel/framework/src/Illuminate/Routing/Router.php(681): Illuminate\\Routing\\Route->run()\n#32 /home/vagrant/code/prepa/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(130): Illuminate\\Routing\\Router->Illuminate\\Routing\\{closure}()\n#33 /home/vagrant/code/prepa/vendor/laravel/framework/src/Illuminate/Routing/Middleware/SubstituteBindings.php(41): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}()\n#34 /home/vagrant/code/prepa/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(171): Illuminate\\Routing\\Middleware\\SubstituteBindings->handle()\n#35 /home/vagrant/code/prepa/vendor/laravel/framework/src/Illuminate/View/Middleware/ShareErrorsFromSession.php(49): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}()\n#36 /home/vagrant/code/prepa/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(171): Illuminate\\View\\Middleware\\ShareErrorsFromSession->handle()\n#37 /home/vagrant/code/prepa/vendor/laravel/framework/src/Illuminate/Session/Middleware/StartSession.php(56): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}()\n#38 /home/vagrant/code/prepa/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(171): Illuminate\\Session\\Middleware\\StartSession->handle()\n#39 /home/vagrant/code/prepa/vendor/laravel/framework/src/Illuminate/Cookie/Middleware/AddQueuedCookiesToResponse.php(37): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}()\n#40 /home/vagrant/code/prepa/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(171): Illuminate\\Cookie\\Middleware\\AddQueuedCookiesToResponse->handle()\n#41 /home/vagrant/code/prepa/vendor/laravel/framework/src/Illuminate/Cookie/Middleware/EncryptCookies.php(67): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}()\n#42 /home/vagrant/code/prepa/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(171): Illuminate\\Cookie\\Middleware\\EncryptCookies->handle()\n#43 /home/vagrant/code/prepa/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(105): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}()\n#44 /home/vagrant/code/prepa/vendor/laravel/framework/src/Illuminate/Routing/Router.php(683): Illuminate\\Pipeline\\Pipeline->then()\n#45 /home/vagrant/code/prepa/vendor/laravel/framework/src/Illuminate/Routing/Router.php(658): Illuminate\\Routing\\Router->runRouteWithinStack()\n#46 /home/vagrant/code/prepa/vendor/laravel/framework/src/Illuminate/Routing/Router.php(624): Illuminate\\Routing\\Router->runRoute()\n#47 /home/vagrant/code/prepa/vendor/winter/storm/src/Router/CoreRouter.php(20): Illuminate\\Routing\\Router->dispatchToRoute()\n#48 /home/vagrant/code/prepa/vendor/laravel/framework/src/Illuminate/Foundation/Http/Kernel.php(170): Winter\\Storm\\Router\\CoreRouter->dispatch()\n#49 /home/vagrant/code/prepa/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(130): Illuminate\\Foundation\\Http\\Kernel->Illuminate\\Foundation\\Http\\{closure}()\n#50 /home/vagrant/code/prepa/vendor/laravel/framework/src/Illuminate/Foundation/Http/Middleware/CheckForMaintenanceMode.php(63): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}()\n#51 /home/vagrant/code/prepa/vendor/winter/storm/src/Foundation/Http/Middleware/CheckForMaintenanceMode.php(25): Illuminate\\Foundation\\Http\\Middleware\\CheckForMaintenanceMode->handle()\n#52 /home/vagrant/code/prepa/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(171): Winter\\Storm\\Foundation\\Http\\Middleware\\CheckForMaintenanceMode->handle()\n#53 /home/vagrant/code/prepa/vendor/winter/storm/src/Foundation/Http/Middleware/CheckForTrustedProxies.php(56): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}()\n#54 /home/vagrant/code/prepa/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(171): Winter\\Storm\\Foundation\\Http\\Middleware\\CheckForTrustedProxies->handle()\n#55 /home/vagrant/code/prepa/vendor/winter/storm/src/Http/Middleware/TrustHosts.php(46): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}()\n#56 /home/vagrant/code/prepa/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(171): Winter\\Storm\\Http\\Middleware\\TrustHosts->handle()\n#57 /home/vagrant/code/prepa/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(105): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}()\n#58 /home/vagrant/code/prepa/vendor/laravel/framework/src/Illuminate/Foundation/Http/Kernel.php(145): Illuminate\\Pipeline\\Pipeline->then()\n#59 /home/vagrant/code/prepa/vendor/laravel/framework/src/Illuminate/Foundation/Http/Kernel.php(110): Illuminate\\Foundation\\Http\\Kernel->sendRequestThroughRouter()\n#60 /home/vagrant/code/prepa/index.php(41): Illuminate\\Foundation\\Http\\Kernel->handle()\n#61 {main}', NULL, '2022-02-03 12:01:58', '2022-02-03 12:01:58'),
	(3, 'error', 'ErrorException: file_get_contents(/home/vagrant/code/prepa/themes/sliderweb-403theme/assets/less/theme.less): Failed to open stream: No such file or directory in /home/vagrant/code/prepa/vendor/winter/storm/src/Assetic/Filter/LessCompiler.php:51\nStack trace:\n#0 [internal function]: Illuminate\\Foundation\\Bootstrap\\HandleExceptions->handleError()\n#1 /home/vagrant/code/prepa/vendor/winter/storm/src/Assetic/Filter/LessCompiler.php(51): file_get_contents()\n#2 /home/vagrant/code/prepa/modules/system/Classes/CombineAssets.php(494): Winter\\Storm\\Assetic\\Filter\\LessCompiler->hashAsset()\n#3 /home/vagrant/code/prepa/modules/system/Classes/CombineAssets.php(818): System\\Classes\\CombineAssets->getDeepHashFromAssets()\n#4 /home/vagrant/code/prepa/modules/system/Classes/CombineAssets.php(375): System\\Classes\\CombineAssets->getCacheKey()\n#5 /home/vagrant/code/prepa/modules/system/Classes/CombineAssets.php(183): System\\Classes\\CombineAssets->prepareRequest()\n#6 /home/vagrant/code/prepa/modules/cms/Classes/Controller.php(1395): System\\Classes\\CombineAssets::combine()\n#7 /home/vagrant/code/prepa/modules/cms/Twig/Extension.php(172): Cms\\Classes\\Controller->themeUrl()\n#8 /home/vagrant/code/prepa/storage/cms/twig/65/65090aeda404734b327edb1e50b2b0de8f449f89d0c53e92670e16ed110f036b.php(64): Cms\\Twig\\Extension->themeFilter()\n#9 /home/vagrant/code/prepa/vendor/twig/twig/src/Template.php(405): __TwigTemplate_5b7e5d5309b5f2499176cdcae1599af6400e07f009a108aa92b457d650b11653->doDisplay()\n#10 /home/vagrant/code/prepa/vendor/twig/twig/src/Template.php(378): Twig\\Template->displayWithErrorHandling()\n#11 /home/vagrant/code/prepa/vendor/twig/twig/src/Template.php(390): Twig\\Template->display()\n#12 /home/vagrant/code/prepa/modules/cms/Classes/Controller.php(1101): Twig\\Template->render()\n#13 /home/vagrant/code/prepa/modules/cms/Twig/Extension.php(102): Cms\\Classes\\Controller->renderPartial()\n#14 /home/vagrant/code/prepa/storage/cms/twig/ac/ac6fb4640fa9886db5f423bec6476abceb0b53a79b95433c1d924c6a8661f47b.php(44): Cms\\Twig\\Extension->partialFunction()\n#15 /home/vagrant/code/prepa/vendor/twig/twig/src/Template.php(405): __TwigTemplate_dc1d2b11d99318b6e888c7ba81424bda568ec04cb0bcac04a53d2e1d8cea37f2->doDisplay()\n#16 /home/vagrant/code/prepa/vendor/twig/twig/src/Template.php(378): Twig\\Template->displayWithErrorHandling()\n#17 /home/vagrant/code/prepa/vendor/twig/twig/src/Template.php(390): Twig\\Template->display()\n#18 /home/vagrant/code/prepa/modules/cms/Classes/Controller.php(444): Twig\\Template->render()\n#19 /home/vagrant/code/prepa/modules/cms/Classes/Controller.php(229): Cms\\Classes\\Controller->runPage()\n#20 /home/vagrant/code/prepa/modules/cms/Classes/CmsController.php(50): Cms\\Classes\\Controller->run()\n#21 /home/vagrant/code/prepa/vendor/laravel/framework/src/Illuminate/Routing/Controller.php(54): Cms\\Classes\\CmsController->run()\n#22 /home/vagrant/code/prepa/vendor/laravel/framework/src/Illuminate/Routing/ControllerDispatcher.php(45): Illuminate\\Routing\\Controller->callAction()\n#23 /home/vagrant/code/prepa/vendor/laravel/framework/src/Illuminate/Routing/Route.php(219): Illuminate\\Routing\\ControllerDispatcher->dispatch()\n#24 /home/vagrant/code/prepa/vendor/laravel/framework/src/Illuminate/Routing/Route.php(176): Illuminate\\Routing\\Route->runController()\n#25 /home/vagrant/code/prepa/vendor/laravel/framework/src/Illuminate/Routing/Router.php(681): Illuminate\\Routing\\Route->run()\n#26 /home/vagrant/code/prepa/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(130): Illuminate\\Routing\\Router->Illuminate\\Routing\\{closure}()\n#27 /home/vagrant/code/prepa/vendor/laravel/framework/src/Illuminate/Routing/Middleware/SubstituteBindings.php(41): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}()\n#28 /home/vagrant/code/prepa/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(171): Illuminate\\Routing\\Middleware\\SubstituteBindings->handle()\n#29 /home/vagrant/code/prepa/vendor/laravel/framework/src/Illuminate/View/Middleware/ShareErrorsFromSession.php(49): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}()\n#30 /home/vagrant/code/prepa/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(171): Illuminate\\View\\Middleware\\ShareErrorsFromSession->handle()\n#31 /home/vagrant/code/prepa/vendor/laravel/framework/src/Illuminate/Session/Middleware/StartSession.php(56): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}()\n#32 /home/vagrant/code/prepa/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(171): Illuminate\\Session\\Middleware\\StartSession->handle()\n#33 /home/vagrant/code/prepa/vendor/laravel/framework/src/Illuminate/Cookie/Middleware/AddQueuedCookiesToResponse.php(37): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}()\n#34 /home/vagrant/code/prepa/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(171): Illuminate\\Cookie\\Middleware\\AddQueuedCookiesToResponse->handle()\n#35 /home/vagrant/code/prepa/vendor/laravel/framework/src/Illuminate/Cookie/Middleware/EncryptCookies.php(67): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}()\n#36 /home/vagrant/code/prepa/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(171): Illuminate\\Cookie\\Middleware\\EncryptCookies->handle()\n#37 /home/vagrant/code/prepa/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(105): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}()\n#38 /home/vagrant/code/prepa/vendor/laravel/framework/src/Illuminate/Routing/Router.php(683): Illuminate\\Pipeline\\Pipeline->then()\n#39 /home/vagrant/code/prepa/vendor/laravel/framework/src/Illuminate/Routing/Router.php(658): Illuminate\\Routing\\Router->runRouteWithinStack()\n#40 /home/vagrant/code/prepa/vendor/laravel/framework/src/Illuminate/Routing/Router.php(624): Illuminate\\Routing\\Router->runRoute()\n#41 /home/vagrant/code/prepa/vendor/winter/storm/src/Router/CoreRouter.php(20): Illuminate\\Routing\\Router->dispatchToRoute()\n#42 /home/vagrant/code/prepa/vendor/laravel/framework/src/Illuminate/Foundation/Http/Kernel.php(170): Winter\\Storm\\Router\\CoreRouter->dispatch()\n#43 /home/vagrant/code/prepa/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(130): Illuminate\\Foundation\\Http\\Kernel->Illuminate\\Foundation\\Http\\{closure}()\n#44 /home/vagrant/code/prepa/vendor/laravel/framework/src/Illuminate/Foundation/Http/Middleware/CheckForMaintenanceMode.php(63): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}()\n#45 /home/vagrant/code/prepa/vendor/winter/storm/src/Foundation/Http/Middleware/CheckForMaintenanceMode.php(25): Illuminate\\Foundation\\Http\\Middleware\\CheckForMaintenanceMode->handle()\n#46 /home/vagrant/code/prepa/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(171): Winter\\Storm\\Foundation\\Http\\Middleware\\CheckForMaintenanceMode->handle()\n#47 /home/vagrant/code/prepa/vendor/winter/storm/src/Foundation/Http/Middleware/CheckForTrustedProxies.php(56): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}()\n#48 /home/vagrant/code/prepa/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(171): Winter\\Storm\\Foundation\\Http\\Middleware\\CheckForTrustedProxies->handle()\n#49 /home/vagrant/code/prepa/vendor/winter/storm/src/Http/Middleware/TrustHosts.php(46): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}()\n#50 /home/vagrant/code/prepa/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(171): Winter\\Storm\\Http\\Middleware\\TrustHosts->handle()\n#51 /home/vagrant/code/prepa/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(105): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}()\n#52 /home/vagrant/code/prepa/vendor/laravel/framework/src/Illuminate/Foundation/Http/Kernel.php(145): Illuminate\\Pipeline\\Pipeline->then()\n#53 /home/vagrant/code/prepa/vendor/laravel/framework/src/Illuminate/Foundation/Http/Kernel.php(110): Illuminate\\Foundation\\Http\\Kernel->sendRequestThroughRouter()\n#54 /home/vagrant/code/prepa/index.php(41): Illuminate\\Foundation\\Http\\Kernel->handle()\n#55 {main}\n\nNext Twig\\Error\\RuntimeError: An exception has been thrown during the rendering of a template ("file_get_contents(/home/vagrant/code/prepa/themes/sliderweb-403theme/assets/less/theme.less): Failed to open stream: No such file or directory") in "/home/vagrant/code/prepa/themes/sliderweb-403theme/partials/meta.htm" at line 16. in /home/vagrant/code/prepa/vendor/twig/twig/src/Template.php:419\nStack trace:\n#0 /home/vagrant/code/prepa/vendor/twig/twig/src/Template.php(378): Twig\\Template->displayWithErrorHandling()\n#1 /home/vagrant/code/prepa/vendor/twig/twig/src/Template.php(390): Twig\\Template->display()\n#2 /home/vagrant/code/prepa/modules/cms/Classes/Controller.php(1101): Twig\\Template->render()\n#3 /home/vagrant/code/prepa/modules/cms/Twig/Extension.php(102): Cms\\Classes\\Controller->renderPartial()\n#4 /home/vagrant/code/prepa/storage/cms/twig/ac/ac6fb4640fa9886db5f423bec6476abceb0b53a79b95433c1d924c6a8661f47b.php(44): Cms\\Twig\\Extension->partialFunction()\n#5 /home/vagrant/code/prepa/vendor/twig/twig/src/Template.php(405): __TwigTemplate_dc1d2b11d99318b6e888c7ba81424bda568ec04cb0bcac04a53d2e1d8cea37f2->doDisplay()\n#6 /home/vagrant/code/prepa/vendor/twig/twig/src/Template.php(378): Twig\\Template->displayWithErrorHandling()\n#7 /home/vagrant/code/prepa/vendor/twig/twig/src/Template.php(390): Twig\\Template->display()\n#8 /home/vagrant/code/prepa/modules/cms/Classes/Controller.php(444): Twig\\Template->render()\n#9 /home/vagrant/code/prepa/modules/cms/Classes/Controller.php(229): Cms\\Classes\\Controller->runPage()\n#10 /home/vagrant/code/prepa/modules/cms/Classes/CmsController.php(50): Cms\\Classes\\Controller->run()\n#11 /home/vagrant/code/prepa/vendor/laravel/framework/src/Illuminate/Routing/Controller.php(54): Cms\\Classes\\CmsController->run()\n#12 /home/vagrant/code/prepa/vendor/laravel/framework/src/Illuminate/Routing/ControllerDispatcher.php(45): Illuminate\\Routing\\Controller->callAction()\n#13 /home/vagrant/code/prepa/vendor/laravel/framework/src/Illuminate/Routing/Route.php(219): Illuminate\\Routing\\ControllerDispatcher->dispatch()\n#14 /home/vagrant/code/prepa/vendor/laravel/framework/src/Illuminate/Routing/Route.php(176): Illuminate\\Routing\\Route->runController()\n#15 /home/vagrant/code/prepa/vendor/laravel/framework/src/Illuminate/Routing/Router.php(681): Illuminate\\Routing\\Route->run()\n#16 /home/vagrant/code/prepa/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(130): Illuminate\\Routing\\Router->Illuminate\\Routing\\{closure}()\n#17 /home/vagrant/code/prepa/vendor/laravel/framework/src/Illuminate/Routing/Middleware/SubstituteBindings.php(41): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}()\n#18 /home/vagrant/code/prepa/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(171): Illuminate\\Routing\\Middleware\\SubstituteBindings->handle()\n#19 /home/vagrant/code/prepa/vendor/laravel/framework/src/Illuminate/View/Middleware/ShareErrorsFromSession.php(49): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}()\n#20 /home/vagrant/code/prepa/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(171): Illuminate\\View\\Middleware\\ShareErrorsFromSession->handle()\n#21 /home/vagrant/code/prepa/vendor/laravel/framework/src/Illuminate/Session/Middleware/StartSession.php(56): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}()\n#22 /home/vagrant/code/prepa/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(171): Illuminate\\Session\\Middleware\\StartSession->handle()\n#23 /home/vagrant/code/prepa/vendor/laravel/framework/src/Illuminate/Cookie/Middleware/AddQueuedCookiesToResponse.php(37): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}()\n#24 /home/vagrant/code/prepa/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(171): Illuminate\\Cookie\\Middleware\\AddQueuedCookiesToResponse->handle()\n#25 /home/vagrant/code/prepa/vendor/laravel/framework/src/Illuminate/Cookie/Middleware/EncryptCookies.php(67): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}()\n#26 /home/vagrant/code/prepa/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(171): Illuminate\\Cookie\\Middleware\\EncryptCookies->handle()\n#27 /home/vagrant/code/prepa/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(105): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}()\n#28 /home/vagrant/code/prepa/vendor/laravel/framework/src/Illuminate/Routing/Router.php(683): Illuminate\\Pipeline\\Pipeline->then()\n#29 /home/vagrant/code/prepa/vendor/laravel/framework/src/Illuminate/Routing/Router.php(658): Illuminate\\Routing\\Router->runRouteWithinStack()\n#30 /home/vagrant/code/prepa/vendor/laravel/framework/src/Illuminate/Routing/Router.php(624): Illuminate\\Routing\\Router->runRoute()\n#31 /home/vagrant/code/prepa/vendor/winter/storm/src/Router/CoreRouter.php(20): Illuminate\\Routing\\Router->dispatchToRoute()\n#32 /home/vagrant/code/prepa/vendor/laravel/framework/src/Illuminate/Foundation/Http/Kernel.php(170): Winter\\Storm\\Router\\CoreRouter->dispatch()\n#33 /home/vagrant/code/prepa/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(130): Illuminate\\Foundation\\Http\\Kernel->Illuminate\\Foundation\\Http\\{closure}()\n#34 /home/vagrant/code/prepa/vendor/laravel/framework/src/Illuminate/Foundation/Http/Middleware/CheckForMaintenanceMode.php(63): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}()\n#35 /home/vagrant/code/prepa/vendor/winter/storm/src/Foundation/Http/Middleware/CheckForMaintenanceMode.php(25): Illuminate\\Foundation\\Http\\Middleware\\CheckForMaintenanceMode->handle()\n#36 /home/vagrant/code/prepa/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(171): Winter\\Storm\\Foundation\\Http\\Middleware\\CheckForMaintenanceMode->handle()\n#37 /home/vagrant/code/prepa/vendor/winter/storm/src/Foundation/Http/Middleware/CheckForTrustedProxies.php(56): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}()\n#38 /home/vagrant/code/prepa/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(171): Winter\\Storm\\Foundation\\Http\\Middleware\\CheckForTrustedProxies->handle()\n#39 /home/vagrant/code/prepa/vendor/winter/storm/src/Http/Middleware/TrustHosts.php(46): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}()\n#40 /home/vagrant/code/prepa/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(171): Winter\\Storm\\Http\\Middleware\\TrustHosts->handle()\n#41 /home/vagrant/code/prepa/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(105): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}()\n#42 /home/vagrant/code/prepa/vendor/laravel/framework/src/Illuminate/Foundation/Http/Kernel.php(145): Illuminate\\Pipeline\\Pipeline->then()\n#43 /home/vagrant/code/prepa/vendor/laravel/framework/src/Illuminate/Foundation/Http/Kernel.php(110): Illuminate\\Foundation\\Http\\Kernel->sendRequestThroughRouter()\n#44 /home/vagrant/code/prepa/index.php(41): Illuminate\\Foundation\\Http\\Kernel->handle()\n#45 {main}', NULL, '2022-02-03 16:38:33', '2022-02-03 16:38:33');
/*!40000 ALTER TABLE `system_event_logs` ENABLE KEYS */;

-- Listage de la structure de la table prepa. system_files
DROP TABLE IF EXISTS `system_files`;
CREATE TABLE IF NOT EXISTS `system_files` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `disk_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `file_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `file_size` int NOT NULL,
  `content_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `field` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `attachment_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `attachment_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_public` tinyint(1) NOT NULL DEFAULT '1',
  `sort_order` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `system_files_field_index` (`field`),
  KEY `system_files_attachment_id_index` (`attachment_id`),
  KEY `system_files_attachment_type_index` (`attachment_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table prepa.system_files : ~0 rows (environ)
/*!40000 ALTER TABLE `system_files` DISABLE KEYS */;
/*!40000 ALTER TABLE `system_files` ENABLE KEYS */;

-- Listage de la structure de la table prepa. system_mail_layouts
DROP TABLE IF EXISTS `system_mail_layouts`;
CREATE TABLE IF NOT EXISTS `system_mail_layouts` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content_html` text COLLATE utf8mb4_unicode_ci,
  `content_text` text COLLATE utf8mb4_unicode_ci,
  `content_css` text COLLATE utf8mb4_unicode_ci,
  `is_locked` tinyint(1) NOT NULL DEFAULT '0',
  `options` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table prepa.system_mail_layouts : ~2 rows (environ)
/*!40000 ALTER TABLE `system_mail_layouts` DISABLE KEYS */;
INSERT INTO `system_mail_layouts` (`id`, `name`, `code`, `content_html`, `content_text`, `content_css`, `is_locked`, `options`, `created_at`, `updated_at`) VALUES
	(1, 'Default layout', 'default', '<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">\n<html xmlns="http://www.w3.org/1999/xhtml">\n<head>\n    <meta name="viewport" content="width=device-width, initial-scale=1.0" />\n    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />\n</head>\n<body>\n    <style type="text/css" media="screen">\n        {{ brandCss|raw }}\n        {{ css|raw }}\n    </style>\n\n    <table class="wrapper layout-default" width="100%" cellpadding="0" cellspacing="0">\n\n        <!-- Header -->\n        {% partial \'header\' body %}\n            {{ subject|raw }}\n        {% endpartial %}\n\n        <tr>\n            <td align="center">\n                <table class="content" width="100%" cellpadding="0" cellspacing="0">\n                    <!-- Email Body -->\n                    <tr>\n                        <td class="body" width="100%" cellpadding="0" cellspacing="0">\n                            <table class="inner-body" align="center" width="570" cellpadding="0" cellspacing="0">\n                                <!-- Body content -->\n                                <tr>\n                                    <td class="content-cell">\n                                        {{ content|raw }}\n                                    </td>\n                                </tr>\n                            </table>\n                        </td>\n                    </tr>\n                </table>\n            </td>\n        </tr>\n\n        <!-- Footer -->\n        {% partial \'footer\' body %}\n            &copy; {{ "now"|date("Y") }} {{ appName }}. All rights reserved.\n        {% endpartial %}\n\n    </table>\n\n</body>\n</html>', '{{ content|raw }}', '@media only screen and (max-width: 600px) {\n    .inner-body {\n        width: 100% !important;\n    }\n\n    .footer {\n        width: 100% !important;\n    }\n}\n\n@media only screen and (max-width: 500px) {\n    .button {\n        width: 100% !important;\n    }\n}', 1, NULL, '2022-01-21 15:20:51', '2022-01-21 15:20:51'),
	(2, 'System layout', 'system', '<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">\n<html xmlns="http://www.w3.org/1999/xhtml">\n<head>\n    <meta name="viewport" content="width=device-width, initial-scale=1.0" />\n    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />\n</head>\n<body>\n    <style type="text/css" media="screen">\n        {{ brandCss|raw }}\n        {{ css|raw }}\n    </style>\n\n    <table class="wrapper layout-system" width="100%" cellpadding="0" cellspacing="0">\n        <tr>\n            <td align="center">\n                <table class="content" width="100%" cellpadding="0" cellspacing="0">\n                    <!-- Email Body -->\n                    <tr>\n                        <td class="body" width="100%" cellpadding="0" cellspacing="0">\n                            <table class="inner-body" align="center" width="570" cellpadding="0" cellspacing="0">\n                                <!-- Body content -->\n                                <tr>\n                                    <td class="content-cell">\n                                        {{ content|raw }}\n\n                                        <!-- Subcopy -->\n                                        {% partial \'subcopy\' body %}\n                                            **This is an automatic message. Please do not reply to it.**\n                                        {% endpartial %}\n                                    </td>\n                                </tr>\n                            </table>\n                        </td>\n                    </tr>\n                </table>\n            </td>\n        </tr>\n    </table>\n\n</body>\n</html>', '{{ content|raw }}\n\n\n---\nThis is an automatic message. Please do not reply to it.', '@media only screen and (max-width: 600px) {\n    .inner-body {\n        width: 100% !important;\n    }\n\n    .footer {\n        width: 100% !important;\n    }\n}\n\n@media only screen and (max-width: 500px) {\n    .button {\n        width: 100% !important;\n    }\n}', 1, NULL, '2022-01-21 15:20:51', '2022-01-21 15:20:51');
/*!40000 ALTER TABLE `system_mail_layouts` ENABLE KEYS */;

-- Listage de la structure de la table prepa. system_mail_partials
DROP TABLE IF EXISTS `system_mail_partials`;
CREATE TABLE IF NOT EXISTS `system_mail_partials` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content_html` text COLLATE utf8mb4_unicode_ci,
  `content_text` text COLLATE utf8mb4_unicode_ci,
  `is_custom` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table prepa.system_mail_partials : ~0 rows (environ)
/*!40000 ALTER TABLE `system_mail_partials` DISABLE KEYS */;
/*!40000 ALTER TABLE `system_mail_partials` ENABLE KEYS */;

-- Listage de la structure de la table prepa. system_mail_templates
DROP TABLE IF EXISTS `system_mail_templates`;
CREATE TABLE IF NOT EXISTS `system_mail_templates` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subject` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `content_html` text COLLATE utf8mb4_unicode_ci,
  `content_text` text COLLATE utf8mb4_unicode_ci,
  `layout_id` int DEFAULT NULL,
  `is_custom` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `system_mail_templates_layout_id_index` (`layout_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table prepa.system_mail_templates : ~0 rows (environ)
/*!40000 ALTER TABLE `system_mail_templates` DISABLE KEYS */;
/*!40000 ALTER TABLE `system_mail_templates` ENABLE KEYS */;

-- Listage de la structure de la table prepa. system_parameters
DROP TABLE IF EXISTS `system_parameters`;
CREATE TABLE IF NOT EXISTS `system_parameters` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `namespace` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `group` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `item` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `item_index` (`namespace`,`group`,`item`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table prepa.system_parameters : ~6 rows (environ)
/*!40000 ALTER TABLE `system_parameters` DISABLE KEYS */;
INSERT INTO `system_parameters` (`id`, `namespace`, `group`, `item`, `value`) VALUES
	(1, 'system', 'update', 'count', '0'),
	(2, 'system', 'update', 'retry', '1643989416'),
	(3, 'system', 'theme', 'history', '{"SLIDERWEB.SLIDERWEB_003_October":"sliderweb-sliderweb_003_october","SLIDERWEB.403Theme":"sliderweb-403theme","FabricioRabelo.Squad":"fabriciorabelo-squad","GregorLaan.Bootstrap4WithBootswatch":"gregorlaan-bootstrap4withbootswatch","Pkurg.SpaceBootstrap5":"pkurg-spacebootstrap5"}'),
	(4, 'cms', 'theme', 'active', '"sliderweb-403theme"'),
	(5, 'system', 'core', 'build', '"1.1.7"'),
	(6, 'system', 'core', 'modified', 'true');
/*!40000 ALTER TABLE `system_parameters` ENABLE KEYS */;

-- Listage de la structure de la table prepa. system_plugin_history
DROP TABLE IF EXISTS `system_plugin_history`;
CREATE TABLE IF NOT EXISTS `system_plugin_history` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `version` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `detail` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `system_plugin_history_code_index` (`code`),
  KEY `system_plugin_history_type_index` (`type`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table prepa.system_plugin_history : ~7 rows (environ)
/*!40000 ALTER TABLE `system_plugin_history` DISABLE KEYS */;
INSERT INTO `system_plugin_history` (`id`, `code`, `type`, `version`, `detail`, `created_at`) VALUES
	(1, 'Winter.Demo', 'comment', '1.0.1', 'First version of Demo', '2022-01-21 15:20:51'),
	(2, 'Winter.MailChimp', 'comment', '1.0.1', 'Initialize plugin', '2022-01-21 17:34:35'),
	(3, 'Winter.MailChimp', 'comment', '1.0.2', 'Minor improvements to the code', '2022-01-21 17:34:35'),
	(4, 'Winter.MailChimp', 'comment', '1.0.3', 'Improve compatibility with PHP7', '2022-01-21 17:34:35'),
	(5, 'Winter.MailChimp', 'comment', '1.0.4', 'Switch to MailChimp API v3', '2022-01-21 17:34:35'),
	(6, 'Winter.MailChimp', 'script', '2.0.0', 'v2.0.0/convert_data.php', '2022-01-21 17:34:35'),
	(7, 'Winter.MailChimp', 'comment', '2.0.0', 'Rebrand to Winter.MailChimp', '2022-01-21 17:34:35');
/*!40000 ALTER TABLE `system_plugin_history` ENABLE KEYS */;

-- Listage de la structure de la table prepa. system_plugin_versions
DROP TABLE IF EXISTS `system_plugin_versions`;
CREATE TABLE IF NOT EXISTS `system_plugin_versions` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `version` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `is_disabled` tinyint(1) NOT NULL DEFAULT '0',
  `is_frozen` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `system_plugin_versions_code_index` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table prepa.system_plugin_versions : ~2 rows (environ)
/*!40000 ALTER TABLE `system_plugin_versions` DISABLE KEYS */;
INSERT INTO `system_plugin_versions` (`id`, `code`, `version`, `created_at`, `is_disabled`, `is_frozen`) VALUES
	(1, 'Winter.Demo', '1.0.1', '2022-01-21 15:20:51', 0, 0),
	(2, 'Winter.MailChimp', '2.0.0', '2022-01-21 17:34:35', 0, 0);
/*!40000 ALTER TABLE `system_plugin_versions` ENABLE KEYS */;

-- Listage de la structure de la table prepa. system_request_logs
DROP TABLE IF EXISTS `system_request_logs`;
CREATE TABLE IF NOT EXISTS `system_request_logs` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `status_code` int DEFAULT NULL,
  `url` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `referer` text COLLATE utf8mb4_unicode_ci,
  `count` int NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table prepa.system_request_logs : ~0 rows (environ)
/*!40000 ALTER TABLE `system_request_logs` DISABLE KEYS */;
INSERT INTO `system_request_logs` (`id`, `status_code`, `url`, `referer`, `count`, `created_at`, `updated_at`) VALUES
	(1, 404, 'http://prepa//humans.txt', NULL, 1, '2022-02-03 16:29:12', '2022-02-03 16:29:12');
/*!40000 ALTER TABLE `system_request_logs` ENABLE KEYS */;

-- Listage de la structure de la table prepa. system_revisions
DROP TABLE IF EXISTS `system_revisions`;
CREATE TABLE IF NOT EXISTS `system_revisions` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int unsigned DEFAULT NULL,
  `field` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cast` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `old_value` text COLLATE utf8mb4_unicode_ci,
  `new_value` text COLLATE utf8mb4_unicode_ci,
  `revisionable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `revisionable_id` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `system_revisions_revisionable_id_revisionable_type_index` (`revisionable_id`,`revisionable_type`),
  KEY `system_revisions_user_id_index` (`user_id`),
  KEY `system_revisions_field_index` (`field`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table prepa.system_revisions : ~0 rows (environ)
/*!40000 ALTER TABLE `system_revisions` DISABLE KEYS */;
/*!40000 ALTER TABLE `system_revisions` ENABLE KEYS */;

-- Listage de la structure de la table prepa. system_settings
DROP TABLE IF EXISTS `system_settings`;
CREATE TABLE IF NOT EXISTS `system_settings` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `item` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `value` mediumtext COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `system_settings_item_index` (`item`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table prepa.system_settings : ~0 rows (environ)
/*!40000 ALTER TABLE `system_settings` DISABLE KEYS */;
INSERT INTO `system_settings` (`id`, `item`, `value`) VALUES
	(1, 'winter_mailchimp_settings', '{"api_key":"5c6a0e53173d2149c5a4fe5ea4c67c55-us20"}'),
	(2, 'system_log_settings', '{"log_events":"1","log_requests":"1","log_theme":"1"}');
/*!40000 ALTER TABLE `system_settings` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
