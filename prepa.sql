-- --------------------------------------------------------
-- Hôte:                         192.168.10.10
-- Version du serveur:           8.0.28-0ubuntu0.20.04.3 - (Ubuntu)
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
CREATE DATABASE IF NOT EXISTS `prepa` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `prepa`;

-- Listage de la structure de la table prepa. activity_employee
CREATE TABLE IF NOT EXISTS `activity_employee` (
  `activity_id` int unsigned NOT NULL,
  `employee_id` int unsigned NOT NULL,
  PRIMARY KEY (`activity_id`,`employee_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table prepa.activity_employee : ~0 rows (environ)
DELETE FROM `activity_employee`;
/*!40000 ALTER TABLE `activity_employee` DISABLE KEYS */;
/*!40000 ALTER TABLE `activity_employee` ENABLE KEYS */;

-- Listage de la structure de la table prepa. backend_access_log
CREATE TABLE IF NOT EXISTS `backend_access_log` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int unsigned NOT NULL,
  `ip_address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table prepa.backend_access_log : ~3 rows (environ)
DELETE FROM `backend_access_log`;
/*!40000 ALTER TABLE `backend_access_log` DISABLE KEYS */;
INSERT INTO `backend_access_log` (`id`, `user_id`, `ip_address`, `created_at`, `updated_at`) VALUES
	(1, 1, '192.168.10.1', '2022-04-09 09:11:56', '2022-04-09 09:11:56'),
	(2, 1, '192.168.10.1', '2022-04-09 09:39:51', '2022-04-09 09:39:51'),
	(3, 1, '192.168.10.1', '2022-04-12 08:23:36', '2022-04-12 08:23:36');
/*!40000 ALTER TABLE `backend_access_log` ENABLE KEYS */;

-- Listage de la structure de la table prepa. backend_users
CREATE TABLE IF NOT EXISTS `backend_users` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `first_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `login` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `activation_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `persist_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `reset_password_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `permissions` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
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

-- Listage des données de la table prepa.backend_users : ~0 rows (environ)
DELETE FROM `backend_users`;
/*!40000 ALTER TABLE `backend_users` DISABLE KEYS */;
INSERT INTO `backend_users` (`id`, `first_name`, `last_name`, `login`, `email`, `password`, `activation_code`, `persist_code`, `reset_password_code`, `permissions`, `is_activated`, `role_id`, `activated_at`, `last_login`, `created_at`, `updated_at`, `deleted_at`, `is_superuser`) VALUES
	(1, 'Lionel', 'COTE', 'GrCOTE7', 'grcote7@gmail.com', '$2y$10$yZ6BbHbmLUSWcv2hLsCc8./1K9.xvPM.93ZEqdFoP1nlUP9r415wK', NULL, '$2y$10$4wYXc2X75JnNPgZQzwFEXuMNBIK7YWtHEcLZDe2G27fvx7GnUs0q.', NULL, '', 1, 2, NULL, '2022-04-12 08:23:36', '2022-04-09 09:10:45', '2022-04-12 08:23:36', NULL, 1);
/*!40000 ALTER TABLE `backend_users` ENABLE KEYS */;

-- Listage de la structure de la table prepa. backend_users_groups
CREATE TABLE IF NOT EXISTS `backend_users_groups` (
  `user_id` int unsigned NOT NULL,
  `user_group_id` int unsigned NOT NULL,
  PRIMARY KEY (`user_id`,`user_group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table prepa.backend_users_groups : ~0 rows (environ)
DELETE FROM `backend_users_groups`;
/*!40000 ALTER TABLE `backend_users_groups` DISABLE KEYS */;
INSERT INTO `backend_users_groups` (`user_id`, `user_group_id`) VALUES
	(1, 1);
/*!40000 ALTER TABLE `backend_users_groups` ENABLE KEYS */;

-- Listage de la structure de la table prepa. backend_user_groups
CREATE TABLE IF NOT EXISTS `backend_user_groups` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `is_new_user_default` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_unique` (`name`),
  KEY `code_index` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table prepa.backend_user_groups : ~0 rows (environ)
DELETE FROM `backend_user_groups`;
/*!40000 ALTER TABLE `backend_user_groups` DISABLE KEYS */;
INSERT INTO `backend_user_groups` (`id`, `name`, `created_at`, `updated_at`, `code`, `description`, `is_new_user_default`) VALUES
	(1, 'Owners', '2022-04-09 09:10:45', '2022-04-09 09:10:45', 'owners', 'Default group for website owners.', 0);
/*!40000 ALTER TABLE `backend_user_groups` ENABLE KEYS */;

-- Listage de la structure de la table prepa. backend_user_preferences
CREATE TABLE IF NOT EXISTS `backend_user_preferences` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int unsigned NOT NULL,
  `namespace` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `group` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `item` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `user_item_index` (`user_id`,`namespace`,`group`,`item`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table prepa.backend_user_preferences : ~2 rows (environ)
DELETE FROM `backend_user_preferences`;
/*!40000 ALTER TABLE `backend_user_preferences` DISABLE KEYS */;
INSERT INTO `backend_user_preferences` (`id`, `user_id`, `namespace`, `group`, `item`, `value`) VALUES
	(1, 1, 'backend', 'backend', 'preferences', '{"locale":"fr","fallback_locale":"en","timezone":"Europe\\/Paris","editor_font_size":"12","editor_word_wrap":"fluid","editor_code_folding":"manual","editor_tab_size":"4","editor_theme":"monokai","editor_show_invisibles":"0","editor_highlight_active_line":"1","editor_use_hard_tabs":"0","editor_show_gutter":"1","editor_auto_closing":"1","editor_autocompletion":"manual","editor_enable_snippets":"0","editor_display_indent_guides":"1","editor_show_print_margin":"0","user_id":1}'),
	(2, 1, 'winter_user', 'users', 'lists', '{"visible":["id","username","name","surname","email","created_at","last_seen"],"order":["id","username","name","surname","email","created_at","last_seen","is_guest","created_ip_address","last_ip_address"],"per_page":"20"}');
/*!40000 ALTER TABLE `backend_user_preferences` ENABLE KEYS */;

-- Listage de la structure de la table prepa. backend_user_roles
CREATE TABLE IF NOT EXISTS `backend_user_roles` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `permissions` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `is_system` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `role_unique` (`name`),
  KEY `role_code_index` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table prepa.backend_user_roles : ~2 rows (environ)
DELETE FROM `backend_user_roles`;
/*!40000 ALTER TABLE `backend_user_roles` DISABLE KEYS */;
INSERT INTO `backend_user_roles` (`id`, `name`, `code`, `description`, `permissions`, `is_system`, `created_at`, `updated_at`) VALUES
	(1, 'Publisher', 'publisher', 'Site editor with access to publishing tools.', '', 1, '2022-04-09 09:10:45', '2022-04-09 09:10:45'),
	(2, 'Developer', 'developer', 'Site administrator with access to developer tools.', '', 1, '2022-04-09 09:10:45', '2022-04-09 09:10:45');
/*!40000 ALTER TABLE `backend_user_roles` ENABLE KEYS */;

-- Listage de la structure de la table prepa. backend_user_throttle
CREATE TABLE IF NOT EXISTS `backend_user_throttle` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int unsigned DEFAULT NULL,
  `ip_address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
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
DELETE FROM `backend_user_throttle`;
/*!40000 ALTER TABLE `backend_user_throttle` DISABLE KEYS */;
INSERT INTO `backend_user_throttle` (`id`, `user_id`, `ip_address`, `attempts`, `last_attempt_at`, `is_suspended`, `suspended_at`, `is_banned`, `banned_at`) VALUES
	(1, 1, '192.168.10.1', 0, NULL, 0, NULL, 0, NULL);
/*!40000 ALTER TABLE `backend_user_throttle` ENABLE KEYS */;

-- Listage de la structure de la table prepa. cache
CREATE TABLE IF NOT EXISTS `cache` (
  `key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL,
  UNIQUE KEY `cache_key_unique` (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table prepa.cache : ~0 rows (environ)
DELETE FROM `cache`;
/*!40000 ALTER TABLE `cache` DISABLE KEYS */;
/*!40000 ALTER TABLE `cache` ENABLE KEYS */;

-- Listage de la structure de la table prepa. cms_theme_data
CREATE TABLE IF NOT EXISTS `cms_theme_data` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `theme` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `data` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cms_theme_data_theme_index` (`theme`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table prepa.cms_theme_data : ~0 rows (environ)
DELETE FROM `cms_theme_data`;
/*!40000 ALTER TABLE `cms_theme_data` DISABLE KEYS */;
/*!40000 ALTER TABLE `cms_theme_data` ENABLE KEYS */;

-- Listage de la structure de la table prepa. cms_theme_logs
CREATE TABLE IF NOT EXISTS `cms_theme_logs` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `theme` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `template` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `old_template` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `old_content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `user_id` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cms_theme_logs_type_index` (`type`),
  KEY `cms_theme_logs_theme_index` (`theme`),
  KEY `cms_theme_logs_user_id_index` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table prepa.cms_theme_logs : ~0 rows (environ)
DELETE FROM `cms_theme_logs`;
/*!40000 ALTER TABLE `cms_theme_logs` DISABLE KEYS */;
/*!40000 ALTER TABLE `cms_theme_logs` ENABLE KEYS */;

-- Listage de la structure de la table prepa. cms_theme_templates
CREATE TABLE IF NOT EXISTS `cms_theme_templates` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `source` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `file_size` int unsigned NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cms_theme_templates_source_index` (`source`),
  KEY `cms_theme_templates_path_index` (`path`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table prepa.cms_theme_templates : ~0 rows (environ)
DELETE FROM `cms_theme_templates`;
/*!40000 ALTER TABLE `cms_theme_templates` DISABLE KEYS */;
/*!40000 ALTER TABLE `cms_theme_templates` ENABLE KEYS */;

-- Listage de la structure de la table prepa. deferred_bindings
CREATE TABLE IF NOT EXISTS `deferred_bindings` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `master_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `master_field` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slave_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slave_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `pivot_data` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `session_key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_bind` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `deferred_bindings_master_type_index` (`master_type`),
  KEY `deferred_bindings_master_field_index` (`master_field`),
  KEY `deferred_bindings_slave_type_index` (`slave_type`),
  KEY `deferred_bindings_slave_id_index` (`slave_id`),
  KEY `deferred_bindings_session_key_index` (`session_key`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table prepa.deferred_bindings : ~0 rows (environ)
DELETE FROM `deferred_bindings`;
/*!40000 ALTER TABLE `deferred_bindings` DISABLE KEYS */;
INSERT INTO `deferred_bindings` (`id`, `master_type`, `master_field`, `slave_type`, `slave_id`, `pivot_data`, `session_key`, `is_bind`, `created_at`, `updated_at`) VALUES
	(9, 'Grcote7\\Movies\\Models\\Actor', 'actorimage', 'System\\Models\\File', '8', NULL, '9XqTJlJnE8I3Ctd3ttIWEIkJi2qgFhSR8crm0Iju', 0, '2022-04-12 18:51:11', '2022-04-12 18:51:11');
/*!40000 ALTER TABLE `deferred_bindings` ENABLE KEYS */;

-- Listage de la structure de la table prepa. failed_jobs
CREATE TABLE IF NOT EXISTS `failed_jobs` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `connection` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `failed_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table prepa.failed_jobs : ~0 rows (environ)
DELETE FROM `failed_jobs`;
/*!40000 ALTER TABLE `failed_jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `failed_jobs` ENABLE KEYS */;

-- Listage de la structure de la table prepa. grcote7_marriage_avatars
CREATE TABLE IF NOT EXISTS `grcote7_marriage_avatars` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `guest_id` int unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `grcote7_marriage_avatars_guest_id_index` (`guest_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table prepa.grcote7_marriage_avatars : ~5 rows (environ)
DELETE FROM `grcote7_marriage_avatars`;
/*!40000 ALTER TABLE `grcote7_marriage_avatars` DISABLE KEYS */;
INSERT INTO `grcote7_marriage_avatars` (`id`, `name`, `guest_id`, `created_at`, `updated_at`) VALUES
	(1, 'LC.png', 1, '2022-04-09 09:20:05', '2022-04-09 09:20:05'),
	(2, 'MPR.png', 2, '2022-04-09 09:20:05', '2022-04-09 09:20:05'),
	(3, 'JC.png', 3, '2022-04-09 09:20:05', '2022-04-09 09:20:05'),
	(4, 'AM.png', 4, '2022-04-09 09:20:05', '2022-04-09 09:20:05'),
	(5, 'JP.png', 6, '2022-04-09 09:20:05', '2022-04-09 09:20:05');
/*!40000 ALTER TABLE `grcote7_marriage_avatars` ENABLE KEYS */;

-- Listage de la structure de la table prepa. grcote7_marriage_famillies
CREATE TABLE IF NOT EXISTS `grcote7_marriage_famillies` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `guest_id` int unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `grcote7_marriage_famillies_guest_id_index` (`guest_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table prepa.grcote7_marriage_famillies : ~5 rows (environ)
DELETE FROM `grcote7_marriage_famillies`;
/*!40000 ALTER TABLE `grcote7_marriage_famillies` DISABLE KEYS */;
INSERT INTO `grcote7_marriage_famillies` (`id`, `name`, `guest_id`, `created_at`, `updated_at`) VALUES
	(1, 'COTE', 1, '2022-04-09 09:20:03', '2022-04-09 09:20:03'),
	(2, 'COTE', 3, '2022-04-09 09:20:03', '2022-04-09 09:20:03'),
	(3, 'COTE', 5, '2022-04-09 09:20:03', '2022-04-09 09:20:03'),
	(4, 'BIALLE', 6, '2022-04-09 09:20:03', '2022-04-09 09:20:03'),
	(5, 'RAQUIN', 2, '2022-04-09 09:20:03', '2022-04-09 09:20:03');
/*!40000 ALTER TABLE `grcote7_marriage_famillies` ENABLE KEYS */;

-- Listage de la structure de la table prepa. grcote7_marriage_groups
CREATE TABLE IF NOT EXISTS `grcote7_marriage_groups` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `grcote7_marriage_groups_name_unique` (`name`),
  KEY `grcote7_marriage_groups_name_index` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table prepa.grcote7_marriage_groups : ~3 rows (environ)
DELETE FROM `grcote7_marriage_groups`;
/*!40000 ALTER TABLE `grcote7_marriage_groups` DISABLE KEYS */;
INSERT INTO `grcote7_marriage_groups` (`id`, `name`, `created_at`, `updated_at`) VALUES
	(1, 'AMI', '2022-04-09 09:20:04', '2022-04-09 09:20:04'),
	(2, 'FAMILLE', '2022-04-09 09:20:04', '2022-04-09 09:20:04'),
	(3, 'TRAVAIL', '2022-04-09 09:20:04', '2022-04-09 09:20:04');
/*!40000 ALTER TABLE `grcote7_marriage_groups` ENABLE KEYS */;

-- Listage de la structure de la table prepa. grcote7_marriage_group_guest
CREATE TABLE IF NOT EXISTS `grcote7_marriage_group_guest` (
  `guest_id` int unsigned NOT NULL,
  `group_id` int unsigned NOT NULL,
  PRIMARY KEY (`guest_id`,`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table prepa.grcote7_marriage_group_guest : ~9 rows (environ)
DELETE FROM `grcote7_marriage_group_guest`;
/*!40000 ALTER TABLE `grcote7_marriage_group_guest` DISABLE KEYS */;
INSERT INTO `grcote7_marriage_group_guest` (`guest_id`, `group_id`) VALUES
	(1, 1),
	(1, 2),
	(1, 3),
	(2, 1),
	(2, 3),
	(3, 1),
	(3, 2),
	(4, 1),
	(4, 2);
/*!40000 ALTER TABLE `grcote7_marriage_group_guest` ENABLE KEYS */;

-- Listage de la structure de la table prepa. grcote7_marriage_guests
CREATE TABLE IF NOT EXISTS `grcote7_marriage_guests` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int unsigned NOT NULL,
  `familly_id` int unsigned NOT NULL,
  `mobile` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `grcote7_marriage_guests_familly_id_index` (`familly_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table prepa.grcote7_marriage_guests : ~6 rows (environ)
DELETE FROM `grcote7_marriage_guests`;
/*!40000 ALTER TABLE `grcote7_marriage_guests` DISABLE KEYS */;
INSERT INTO `grcote7_marriage_guests` (`id`, `user_id`, `familly_id`, `mobile`, `created_at`, `updated_at`) VALUES
	(1, 1, 1, '07 83 59 27 21', '2022-04-09 09:20:02', '2022-04-09 09:20:02'),
	(2, 2, 5, '06 17 82 09 27', '2022-04-09 09:20:02', '2022-04-09 09:20:02'),
	(3, 3, 3, '01 23 45 67 89', '2022-04-09 09:20:02', '2022-04-09 09:20:02'),
	(4, 4, 3, '02 23 45 67 89', '2022-04-09 09:20:02', '2022-04-09 09:20:02'),
	(5, 6, 4, 'GSM JP', '2022-04-09 09:20:02', '2022-04-09 09:20:02'),
	(6, 7, 4, 'GSMP AMB', '2022-04-09 09:20:02', '2022-04-09 09:20:02');
/*!40000 ALTER TABLE `grcote7_marriage_guests` ENABLE KEYS */;

-- Listage de la structure de la table prepa. grcote7_marriage_imgs
CREATE TABLE IF NOT EXISTS `grcote7_marriage_imgs` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `filename` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `imgable_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `imgable_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `grcote7_marriage_imgs_imgable_id_index` (`imgable_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table prepa.grcote7_marriage_imgs : ~6 rows (environ)
DELETE FROM `grcote7_marriage_imgs`;
/*!40000 ALTER TABLE `grcote7_marriage_imgs` DISABLE KEYS */;
INSERT INTO `grcote7_marriage_imgs` (`id`, `filename`, `imgable_id`, `imgable_type`, `created_at`, `updated_at`) VALUES
	(1, 'LC.png', '1', 'guest', '2022-04-09 09:20:04', '2022-04-09 09:20:04'),
	(2, 'MPR.png', '2', 'guest', '2022-04-09 09:20:04', '2022-04-09 09:20:04'),
	(3, 'JC.png', '3', 'guest', '2022-04-09 09:20:04', '2022-04-09 09:20:04'),
	(4, 'AM.png', '4', 'guest', '2022-04-09 09:20:04', '2022-04-09 09:20:04'),
	(5, 'JP.png', '6', 'guest', '2022-04-09 09:20:04', '2022-04-09 09:20:04'),
	(6, 'AMI.png', '1', 'group', '2022-04-09 09:20:04', '2022-04-09 09:20:04');
/*!40000 ALTER TABLE `grcote7_marriage_imgs` ENABLE KEYS */;

-- Listage de la structure de la table prepa. grcote7_marriage_msgs
CREATE TABLE IF NOT EXISTS `grcote7_marriage_msgs` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `guest_id` int unsigned NOT NULL,
  `to_guest_id` int unsigned NOT NULL,
  `subject` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `grcote7_marriage_msgs_guest_id_index` (`guest_id`),
  KEY `grcote7_marriage_msgs_to_guest_id_index` (`to_guest_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table prepa.grcote7_marriage_msgs : ~4 rows (environ)
DELETE FROM `grcote7_marriage_msgs`;
/*!40000 ALTER TABLE `grcote7_marriage_msgs` DISABLE KEYS */;
INSERT INTO `grcote7_marriage_msgs` (`id`, `guest_id`, `to_guest_id`, `subject`, `content`, `created_at`, `updated_at`) VALUES
	(1, 1, 2, 'Hey, darling !', 'Comment va MP ?', '2022-04-09 09:20:04', '2022-04-09 09:20:04'),
	(2, 1, 4, 'Hey, Mam !', 'Comment va Mam ?', '2022-04-09 09:20:04', '2022-04-09 09:20:04'),
	(3, 2, 4, 'Hey, Mam !', 'Comment va ma Belle Doche préférée ?', '2022-04-09 09:20:04', '2022-04-09 09:20:04'),
	(4, 3, 1, 'Hey, Fiston !', 'Comment va mon meilleur fils ?', '2022-04-09 09:20:04', '2022-04-09 09:20:04');
/*!40000 ALTER TABLE `grcote7_marriage_msgs` ENABLE KEYS */;

-- Listage de la structure de la table prepa. grcote7_movies_actors
CREATE TABLE IF NOT EXISTS `grcote7_movies_actors` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lastname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table prepa.grcote7_movies_actors : ~7 rows (environ)
DELETE FROM `grcote7_movies_actors`;
/*!40000 ALTER TABLE `grcote7_movies_actors` DISABLE KEYS */;
INSERT INTO `grcote7_movies_actors` (`id`, `name`, `lastname`) VALUES
	(1, 'Leonardo', 'Di Caprio'),
	(2, 'Ellen', 'Page'),
	(3, 'Brad', 'Pitt'),
	(4, 'Kevin', 'Spacey'),
	(5, 'Edward', 'Norton'),
	(6, 'John', 'Cusack'),
	(7, 'John', 'Wayne');
/*!40000 ALTER TABLE `grcote7_movies_actors` ENABLE KEYS */;

-- Listage de la structure de la table prepa. grcote7_movies_actors_movies
CREATE TABLE IF NOT EXISTS `grcote7_movies_actors_movies` (
  `movie_id` int unsigned NOT NULL,
  `actor_id` int unsigned NOT NULL,
  PRIMARY KEY (`actor_id`,`movie_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table prepa.grcote7_movies_actors_movies : ~3 rows (environ)
DELETE FROM `grcote7_movies_actors_movies`;
/*!40000 ALTER TABLE `grcote7_movies_actors_movies` DISABLE KEYS */;
INSERT INTO `grcote7_movies_actors_movies` (`movie_id`, `actor_id`) VALUES
	(1, 1),
	(2, 1),
	(3, 1);
/*!40000 ALTER TABLE `grcote7_movies_actors_movies` ENABLE KEYS */;

-- Listage de la structure de la table prepa. grcote7_movies_genres
CREATE TABLE IF NOT EXISTS `grcote7_movies_genres` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `genre_title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table prepa.grcote7_movies_genres : ~4 rows (environ)
DELETE FROM `grcote7_movies_genres`;
/*!40000 ALTER TABLE `grcote7_movies_genres` DISABLE KEYS */;
INSERT INTO `grcote7_movies_genres` (`id`, `genre_title`, `slug`) VALUES
	(1, 'Action', 'action'),
	(2, 'Comedy', 'comedy'),
	(3, 'Science Fiction', 'science-fiction'),
	(4, 'Drama', 'drama');
/*!40000 ALTER TABLE `grcote7_movies_genres` ENABLE KEYS */;

-- Listage de la structure de la table prepa. grcote7_movies_genres_movies
CREATE TABLE IF NOT EXISTS `grcote7_movies_genres_movies` (
  `movie_id` int NOT NULL,
  `genre_id` int NOT NULL,
  PRIMARY KEY (`movie_id`,`genre_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table prepa.grcote7_movies_genres_movies : ~7 rows (environ)
DELETE FROM `grcote7_movies_genres_movies`;
/*!40000 ALTER TABLE `grcote7_movies_genres_movies` DISABLE KEYS */;
INSERT INTO `grcote7_movies_genres_movies` (`movie_id`, `genre_id`) VALUES
	(1, 1),
	(1, 2),
	(1, 3),
	(2, 1),
	(2, 2),
	(3, 2),
	(3, 4);
/*!40000 ALTER TABLE `grcote7_movies_genres_movies` ENABLE KEYS */;

-- Listage de la structure de la table prepa. grcote7_movies_movies
CREATE TABLE IF NOT EXISTS `grcote7_movies_movies` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `year` int DEFAULT NULL,
  `slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table prepa.grcote7_movies_movies : ~3 rows (environ)
DELETE FROM `grcote7_movies_movies`;
/*!40000 ALTER TABLE `grcote7_movies_movies` DISABLE KEYS */;
INSERT INTO `grcote7_movies_movies` (`id`, `name`, `description`, `year`, `slug`) VALUES
	(1, 'Inception', '<p>Lorem ipsum dolor, sit amet consectetur adipisicing elit. Possimus excepturi ullam, nostrum error dolorum ipsum necessitatibus natus hic fugit labore. Laudantium soluta, commodi consequatur placeat atque explicabo temporibus accusamus aperiam quas tempora deleniti dolore ipsum nihil accusantium quibusdam velit facilis laborum eius assumenda impedit earum, incidunt reprehenderit aliquam! Facilis, rem!</p>', 2011, 'inception'),
	(2, 'Fight Club', '<p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Veritatis quidem earum nihil, vero fugit harum quisquam magni molestias eligendi mollitia maxime explicabo laboriosam molestiae? Minus, neque distinctio. Consequatur officia maxime laudantium deserunt, odit facilis saepe sapiente. Soluta, nulla alias mollitia veniam dolor nesciunt perspiciatis totam quis distinctio ratione eum nemo officiis expedita culpa voluptatem dolores esse reprehenderit ex cupiditate? Perferendis deleniti eaque eius quas ad modi illum illo? Et molestiae quisquam reprehenderit eum nisi rerum dolor facere excepturi odit, amet officia totam. Culpa possimus veniam voluptas minima laudantium? Corrupti voluptatem sequi natus nulla cumque voluptate sint ut veniam unde dolor?</p>', 1999, 'fight-club'),
	(3, 'American Beauty', '<p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Fugit quo laborum cumque architecto blanditiis possimus, ad unde neque corporis, temporibus vero consequuntur nisi perferendis odit adipisci, facilis quis eius ullam? At enim fugit beatae praesentium dolore blanditiis illo non atque. Temporibus quam tenetur alias voluptate eveniet perspiciatis vel nostrum molestiae!</p>', 2001, 'american-beauty');
/*!40000 ALTER TABLE `grcote7_movies_movies` ENABLE KEYS */;

-- Listage de la structure de la table prepa. grcote7_winterlearning_activities
CREATE TABLE IF NOT EXISTS `grcote7_winterlearning_activities` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `color` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `activity_id` int unsigned NOT NULL,
  `activity_type_id` int unsigned NOT NULL,
  `activity_status_id` int unsigned NOT NULL,
  `created_by_id` int unsigned NOT NULL,
  `updated_by_id` int unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table prepa.grcote7_winterlearning_activities : ~0 rows (environ)
DELETE FROM `grcote7_winterlearning_activities`;
/*!40000 ALTER TABLE `grcote7_winterlearning_activities` DISABLE KEYS */;
/*!40000 ALTER TABLE `grcote7_winterlearning_activities` ENABLE KEYS */;

-- Listage de la structure de la table prepa. grcote7_winterlearning_employees
CREATE TABLE IF NOT EXISTS `grcote7_winterlearning_employees` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `activity_id` int unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table prepa.grcote7_winterlearning_employees : ~3 rows (environ)
DELETE FROM `grcote7_winterlearning_employees`;
/*!40000 ALTER TABLE `grcote7_winterlearning_employees` DISABLE KEYS */;
INSERT INTO `grcote7_winterlearning_employees` (`id`, `activity_id`, `created_at`, `updated_at`) VALUES
	(1, 1, NULL, NULL),
	(2, 4, NULL, NULL),
	(3, 7, NULL, NULL);
/*!40000 ALTER TABLE `grcote7_winterlearning_employees` ENABLE KEYS */;

-- Listage de la structure de la table prepa. grcote7_winterlearning_sub_activities
CREATE TABLE IF NOT EXISTS `grcote7_winterlearning_sub_activities` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `color` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `activity_id` int unsigned NOT NULL,
  `activity_type_id` int unsigned NOT NULL,
  `activity_status_id` int unsigned NOT NULL,
  `created_by_id` int unsigned NOT NULL,
  `updated_by_id` int unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table prepa.grcote7_winterlearning_sub_activities : ~0 rows (environ)
DELETE FROM `grcote7_winterlearning_sub_activities`;
/*!40000 ALTER TABLE `grcote7_winterlearning_sub_activities` DISABLE KEYS */;
/*!40000 ALTER TABLE `grcote7_winterlearning_sub_activities` ENABLE KEYS */;

-- Listage de la structure de la table prepa. jobs
CREATE TABLE IF NOT EXISTS `jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `queue` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint unsigned NOT NULL,
  `reserved_at` int unsigned DEFAULT NULL,
  `available_at` int unsigned NOT NULL,
  `created_at` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `jobs_queue_reserved_at_index` (`queue`,`reserved_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table prepa.jobs : ~0 rows (environ)
DELETE FROM `jobs`;
/*!40000 ALTER TABLE `jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `jobs` ENABLE KEYS */;

-- Listage de la structure de la table prepa. migrations
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table prepa.migrations : ~41 rows (environ)
DELETE FROM `migrations`;
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
CREATE TABLE IF NOT EXISTS `sessions` (
  `id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `last_activity` int DEFAULT NULL,
  `user_id` int unsigned DEFAULT NULL,
  `ip_address` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  UNIQUE KEY `sessions_id_unique` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table prepa.sessions : ~0 rows (environ)
DELETE FROM `sessions`;
/*!40000 ALTER TABLE `sessions` DISABLE KEYS */;
/*!40000 ALTER TABLE `sessions` ENABLE KEYS */;

-- Listage de la structure de la table prepa. system_event_logs
CREATE TABLE IF NOT EXISTS `system_event_logs` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `level` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `message` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `details` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `system_event_logs_level_index` (`level`)
) ENGINE=InnoDB AUTO_INCREMENT=382 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table prepa.system_event_logs : ~175 rows (environ)
DELETE FROM `system_event_logs`;
/*!40000 ALTER TABLE `system_event_logs` DISABLE KEYS */;
/*!40000 ALTER TABLE `system_event_logs` ENABLE KEYS */;

-- Listage de la structure de la table prepa. system_files
CREATE TABLE IF NOT EXISTS `system_files` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `disk_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `file_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `file_size` int NOT NULL,
  `content_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `field` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `attachment_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `attachment_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_public` tinyint(1) NOT NULL DEFAULT '1',
  `sort_order` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `system_files_field_index` (`field`),
  KEY `system_files_attachment_id_index` (`attachment_id`),
  KEY `system_files_attachment_type_index` (`attachment_type`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table prepa.system_files : ~6 rows (environ)
DELETE FROM `system_files`;
/*!40000 ALTER TABLE `system_files` DISABLE KEYS */;
INSERT INTO `system_files` (`id`, `disk_name`, `file_name`, `file_size`, `content_type`, `title`, `description`, `field`, `attachment_id`, `attachment_type`, `is_public`, `sort_order`, `created_at`, `updated_at`) VALUES
	(1, '62513ca791963211013379.jpg', '5b28cb7ccc731743937092.jpg', 140137, 'image/jpeg', NULL, NULL, 'poster', '1', 'Grcote7\\Movies\\Models\\Movie', 1, 1, '2022-04-09 09:58:31', '2022-04-09 09:58:45'),
	(2, '62513cad8b55d174136564.jpg', '5b28cba7f3447162346338.jpg', 40733, 'image/jpeg', NULL, NULL, 'movie_gallery', '1', 'Grcote7\\Movies\\Models\\Movie', 1, 2, '2022-04-09 09:58:37', '2022-04-09 09:58:45'),
	(3, '62513cad8b638593431218.jpg', '5b28cba7ecf5c242492749.jpg', 68498, 'image/jpeg', NULL, NULL, 'movie_gallery', '1', 'Grcote7\\Movies\\Models\\Movie', 1, 3, '2022-04-09 09:58:37', '2022-04-09 09:58:45'),
	(4, '62513cae05da1114995630.jpg', '5b28cba902b31231359535.jpg', 40464, 'image/jpeg', NULL, NULL, 'movie_gallery', '1', 'Grcote7\\Movies\\Models\\Movie', 1, 4, '2022-04-09 09:58:38', '2022-04-09 09:58:46'),
	(5, '62513cae05e1b699223632.jpg', '5b28cba8babd7521748553.jpg', 78208, 'image/jpeg', NULL, NULL, 'movie_gallery', '1', 'Grcote7\\Movies\\Models\\Movie', 1, 5, '2022-04-09 09:58:38', '2022-04-09 09:58:45'),
	(6, '62513cae7fef5063289637.jpg', '5c6155877ee42054292735.jpg', 11639, 'image/jpeg', NULL, NULL, 'movie_gallery', '1', 'Grcote7\\Movies\\Models\\Movie', 1, 6, '2022-04-09 09:58:38', '2022-04-09 09:58:46');
/*!40000 ALTER TABLE `system_files` ENABLE KEYS */;

-- Listage de la structure de la table prepa. system_mail_layouts
CREATE TABLE IF NOT EXISTS `system_mail_layouts` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content_html` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `content_text` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `content_css` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `is_locked` tinyint(1) NOT NULL DEFAULT '0',
  `options` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table prepa.system_mail_layouts : ~2 rows (environ)
DELETE FROM `system_mail_layouts`;
/*!40000 ALTER TABLE `system_mail_layouts` DISABLE KEYS */;
INSERT INTO `system_mail_layouts` (`id`, `name`, `code`, `content_html`, `content_text`, `content_css`, `is_locked`, `options`, `created_at`, `updated_at`) VALUES
	(1, 'Default layout', 'default', '<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">\n<html xmlns="http://www.w3.org/1999/xhtml">\n<head>\n    <meta name="viewport" content="width=device-width, initial-scale=1.0" />\n    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />\n</head>\n<body>\n    <style type="text/css" media="screen">\n        {{ brandCss|raw }}\n        {{ css|raw }}\n    </style>\n\n    <table class="wrapper layout-default" width="100%" cellpadding="0" cellspacing="0">\n\n        <!-- Header -->\n        {% partial \'header\' body %}\n            {{ subject|raw }}\n        {% endpartial %}\n\n        <tr>\n            <td align="center">\n                <table class="content" width="100%" cellpadding="0" cellspacing="0">\n                    <!-- Email Body -->\n                    <tr>\n                        <td class="body" width="100%" cellpadding="0" cellspacing="0">\n                            <table class="inner-body" align="center" width="570" cellpadding="0" cellspacing="0">\n                                <!-- Body content -->\n                                <tr>\n                                    <td class="content-cell">\n                                        {{ content|raw }}\n                                    </td>\n                                </tr>\n                            </table>\n                        </td>\n                    </tr>\n                </table>\n            </td>\n        </tr>\n\n        <!-- Footer -->\n        {% partial \'footer\' body %}\n            &copy; {{ "now"|date("Y") }} {{ appName }}. All rights reserved.\n        {% endpartial %}\n\n    </table>\n\n</body>\n</html>', '{{ content|raw }}', '@media only screen and (max-width: 600px) {\n    .inner-body {\n        width: 100% !important;\n    }\n\n    .footer {\n        width: 100% !important;\n    }\n}\n\n@media only screen and (max-width: 500px) {\n    .button {\n        width: 100% !important;\n    }\n}', 1, NULL, '2022-04-09 09:10:45', '2022-04-09 09:10:45'),
	(2, 'System layout', 'system', '<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">\n<html xmlns="http://www.w3.org/1999/xhtml">\n<head>\n    <meta name="viewport" content="width=device-width, initial-scale=1.0" />\n    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />\n</head>\n<body>\n    <style type="text/css" media="screen">\n        {{ brandCss|raw }}\n        {{ css|raw }}\n    </style>\n\n    <table class="wrapper layout-system" width="100%" cellpadding="0" cellspacing="0">\n        <tr>\n            <td align="center">\n                <table class="content" width="100%" cellpadding="0" cellspacing="0">\n                    <!-- Email Body -->\n                    <tr>\n                        <td class="body" width="100%" cellpadding="0" cellspacing="0">\n                            <table class="inner-body" align="center" width="570" cellpadding="0" cellspacing="0">\n                                <!-- Body content -->\n                                <tr>\n                                    <td class="content-cell">\n                                        {{ content|raw }}\n\n                                        <!-- Subcopy -->\n                                        {% partial \'subcopy\' body %}\n                                            **This is an automatic message. Please do not reply to it.**\n                                        {% endpartial %}\n                                    </td>\n                                </tr>\n                            </table>\n                        </td>\n                    </tr>\n                </table>\n            </td>\n        </tr>\n    </table>\n\n</body>\n</html>', '{{ content|raw }}\n\n\n---\nThis is an automatic message. Please do not reply to it.', '@media only screen and (max-width: 600px) {\n    .inner-body {\n        width: 100% !important;\n    }\n\n    .footer {\n        width: 100% !important;\n    }\n}\n\n@media only screen and (max-width: 500px) {\n    .button {\n        width: 100% !important;\n    }\n}', 1, NULL, '2022-04-09 09:10:45', '2022-04-09 09:10:45');
/*!40000 ALTER TABLE `system_mail_layouts` ENABLE KEYS */;

-- Listage de la structure de la table prepa. system_mail_partials
CREATE TABLE IF NOT EXISTS `system_mail_partials` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content_html` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `content_text` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `is_custom` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table prepa.system_mail_partials : ~0 rows (environ)
DELETE FROM `system_mail_partials`;
/*!40000 ALTER TABLE `system_mail_partials` DISABLE KEYS */;
/*!40000 ALTER TABLE `system_mail_partials` ENABLE KEYS */;

-- Listage de la structure de la table prepa. system_mail_templates
CREATE TABLE IF NOT EXISTS `system_mail_templates` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subject` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `content_html` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `content_text` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `layout_id` int DEFAULT NULL,
  `is_custom` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `system_mail_templates_layout_id_index` (`layout_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table prepa.system_mail_templates : ~0 rows (environ)
DELETE FROM `system_mail_templates`;
/*!40000 ALTER TABLE `system_mail_templates` DISABLE KEYS */;
/*!40000 ALTER TABLE `system_mail_templates` ENABLE KEYS */;

-- Listage de la structure de la table prepa. system_parameters
CREATE TABLE IF NOT EXISTS `system_parameters` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `namespace` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `group` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `item` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `item_index` (`namespace`,`group`,`item`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table prepa.system_parameters : ~3 rows (environ)
DELETE FROM `system_parameters`;
/*!40000 ALTER TABLE `system_parameters` DISABLE KEYS */;
INSERT INTO `system_parameters` (`id`, `namespace`, `group`, `item`, `value`) VALUES
	(1, 'system', 'update', 'count', '0'),
	(2, 'system', 'update', 'retry', '1649851409'),
	(3, 'cms', 'theme', 'active', '"olympos"'),
	(4, 'system', 'core', 'build', '"1.1.8"'),
	(5, 'system', 'core', 'modified', 'true');
/*!40000 ALTER TABLE `system_parameters` ENABLE KEYS */;

-- Listage de la structure de la table prepa. system_plugin_history
CREATE TABLE IF NOT EXISTS `system_plugin_history` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `version` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `detail` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `system_plugin_history_code_index` (`code`),
  KEY `system_plugin_history_type_index` (`type`)
) ENGINE=InnoDB AUTO_INCREMENT=416 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table prepa.system_plugin_history : ~408 rows (environ)
DELETE FROM `system_plugin_history`;
/*!40000 ALTER TABLE `system_plugin_history` DISABLE KEYS */;
INSERT INTO `system_plugin_history` (`id`, `code`, `type`, `version`, `detail`, `created_at`) VALUES
	(1, 'Grcote7.Contact', 'comment', '1.0.1', 'Initialize plugin.', '2022-04-09 09:10:46'),
	(2, 'Grcote7.Movies', 'comment', '1.0.1', 'Initialize plugin.', '2022-04-09 09:10:46'),
	(3, 'Grcote7.Movies', 'script', '1.0.2', 'builder_table_create_grcote7_movies_.php', '2022-04-09 09:10:46'),
	(4, 'Grcote7.Movies', 'comment', '1.0.2', 'Created table grcote7_movies_', '2022-04-09 09:10:46'),
	(5, 'Grcote7.Movies', 'script', '1.0.3', 'builder_table_update_grcote7_movies_movies.php', '2022-04-09 09:10:46'),
	(6, 'Grcote7.Movies', 'comment', '1.0.3', 'Updated table grcote7_movies_', '2022-04-09 09:10:46'),
	(7, 'Grcote7.Movies', 'script', '1.0.4', 'builder_table_update_grcote7_movies_movies_2.php', '2022-04-09 09:10:46'),
	(8, 'Grcote7.Movies', 'comment', '1.0.4', 'Updated table grcote7_movies_movies', '2022-04-09 09:10:46'),
	(9, 'Grcote7.Movies', 'script', '1.0.5', 'builder_table_create_grcote7_movies_genres.php', '2022-04-09 09:10:46'),
	(10, 'Grcote7.Movies', 'comment', '1.0.5', 'Created table grcote7_movies_genres', '2022-04-09 09:10:46'),
	(11, 'Grcote7.Movies', 'script', '1.0.6', 'builder_table_create_grcote7_movies_genre_movie.php', '2022-04-09 09:10:47'),
	(12, 'Grcote7.Movies', 'comment', '1.0.6', 'Created table grcote7_movies_genre_movie', '2022-04-09 09:10:47'),
	(13, 'Grcote7.Movies', 'script', '1.0.7', 'builder_table_update_grcote7_movies_genres_movies.php', '2022-04-09 09:10:47'),
	(14, 'Grcote7.Movies', 'comment', '1.0.7', 'Updated table grcote7_movies_genre_movie', '2022-04-09 09:10:47'),
	(15, 'Grcote7.Movies', 'script', '1.0.8', 'builder_table_update_grcote7_movies_movies_3.php', '2022-04-09 09:10:47'),
	(16, 'Grcote7.Movies', 'comment', '1.0.8', 'Updated table grcote7_movies_movies', '2022-04-09 09:10:47'),
	(17, 'Grcote7.Movies', 'script', '1.0.9', 'builder_table_create_grcote7_movies_actors.php', '2022-04-09 09:10:47'),
	(18, 'Grcote7.Movies', 'comment', '1.0.9', 'Created table grcote7_movies_actors', '2022-04-09 09:10:47'),
	(19, 'Grcote7.Movies', 'script', '1.0.10', 'builder_table_update_grcote7_movies_movies_4.php', '2022-04-09 09:10:47'),
	(20, 'Grcote7.Movies', 'comment', '1.0.10', 'Updated table grcote7_movies_movies', '2022-04-09 09:10:47'),
	(21, 'Grcote7.Movies', 'script', '1.0.11', 'builder_table_create_grcote7_movies_actors_movies.php', '2022-04-09 09:10:48'),
	(22, 'Grcote7.Movies', 'comment', '1.0.11', 'Created table grcote7_movies_actors_movies', '2022-04-09 09:10:48'),
	(23, 'Winter.Blog', 'script', '1.0.1', 'v1.0.1/create_posts_table.php', '2022-04-09 09:10:48'),
	(24, 'Winter.Blog', 'script', '1.0.1', 'v1.0.1/create_categories_table.php', '2022-04-09 09:10:49'),
	(25, 'Winter.Blog', 'script', '1.0.1', 'v1.0.1/seed_all_tables.php', '2022-04-09 09:10:49'),
	(26, 'Winter.Blog', 'comment', '1.0.1', 'Initialize plugin.', '2022-04-09 09:10:49'),
	(27, 'Winter.Blog', 'comment', '1.0.2', 'Added the processed HTML content column to the posts table.', '2022-04-09 09:10:49'),
	(28, 'Winter.Blog', 'comment', '1.0.3', 'Category component has been merged with Posts component.', '2022-04-09 09:10:49'),
	(29, 'Winter.Blog', 'comment', '1.0.4', 'Improvements to the Posts list management UI.', '2022-04-09 09:10:49'),
	(30, 'Winter.Blog', 'comment', '1.0.5', 'Removes the Author column from blog post list.', '2022-04-09 09:10:49'),
	(31, 'Winter.Blog', 'comment', '1.0.6', 'Featured images now appear in the Post component.', '2022-04-09 09:10:49'),
	(32, 'Winter.Blog', 'comment', '1.0.7', 'Added support for the Static Pages menus.', '2022-04-09 09:10:49'),
	(33, 'Winter.Blog', 'comment', '1.0.8', 'Added total posts to category list.', '2022-04-09 09:10:49'),
	(34, 'Winter.Blog', 'comment', '1.0.9', 'Added support for the Sitemap plugin.', '2022-04-09 09:10:49'),
	(35, 'Winter.Blog', 'comment', '1.0.10', 'Added permission to prevent users from seeing posts they did not create.', '2022-04-09 09:10:49'),
	(36, 'Winter.Blog', 'comment', '1.0.11', 'Deprecate "idParam" component property in favour of "slug" property.', '2022-04-09 09:10:49'),
	(37, 'Winter.Blog', 'comment', '1.0.12', 'Fixes issue where images cannot be uploaded caused by latest Markdown library.', '2022-04-09 09:10:49'),
	(38, 'Winter.Blog', 'comment', '1.0.13', 'Fixes problem with providing pages to Sitemap and Pages plugins.', '2022-04-09 09:10:49'),
	(39, 'Winter.Blog', 'comment', '1.0.14', 'Add support for CSRF protection feature added to core.', '2022-04-09 09:10:49'),
	(40, 'Winter.Blog', 'comment', '1.1.0', 'Replaced the Post editor with the new core Markdown editor.', '2022-04-09 09:10:49'),
	(41, 'Winter.Blog', 'comment', '1.1.1', 'Posts can now be imported and exported.', '2022-04-09 09:10:49'),
	(42, 'Winter.Blog', 'comment', '1.1.2', 'Posts are no longer visible if the published date has not passed.', '2022-04-09 09:10:49'),
	(43, 'Winter.Blog', 'comment', '1.1.3', 'Added a New Post shortcut button to the blog menu.', '2022-04-09 09:10:50'),
	(44, 'Winter.Blog', 'script', '1.2.0', 'v1.2.0/categories_add_nested_fields.php', '2022-04-09 09:10:50'),
	(45, 'Winter.Blog', 'comment', '1.2.0', 'Categories now support nesting.', '2022-04-09 09:10:50'),
	(46, 'Winter.Blog', 'comment', '1.2.1', 'Post slugs now must be unique.', '2022-04-09 09:10:50'),
	(47, 'Winter.Blog', 'comment', '1.2.2', 'Fixes issue on new installs.', '2022-04-09 09:10:50'),
	(48, 'Winter.Blog', 'comment', '1.2.3', 'Minor user interface update.', '2022-04-09 09:10:50'),
	(49, 'Winter.Blog', 'script', '1.2.4', 'v1.2.4/update_timestamp_nullable.php', '2022-04-09 09:10:50'),
	(50, 'Winter.Blog', 'comment', '1.2.4', 'Database maintenance. Updated all timestamp columns to be nullable.', '2022-04-09 09:10:50'),
	(51, 'Winter.Blog', 'comment', '1.2.5', 'Added translation support for blog posts.', '2022-04-09 09:10:50'),
	(52, 'Winter.Blog', 'comment', '1.2.6', 'The published field can now supply a time with the date.', '2022-04-09 09:10:50'),
	(53, 'Winter.Blog', 'comment', '1.2.7', 'Introduced a new RSS feed component.', '2022-04-09 09:10:50'),
	(54, 'Winter.Blog', 'comment', '1.2.8', 'Fixes issue with translated `content_html` attribute on blog posts.', '2022-04-09 09:10:50'),
	(55, 'Winter.Blog', 'comment', '1.2.9', 'Added translation support for blog categories.', '2022-04-09 09:10:50'),
	(56, 'Winter.Blog', 'comment', '1.2.10', 'Added translation support for post slugs.', '2022-04-09 09:10:50'),
	(57, 'Winter.Blog', 'comment', '1.2.11', 'Fixes bug where excerpt is not translated.', '2022-04-09 09:10:50'),
	(58, 'Winter.Blog', 'comment', '1.2.12', 'Description field added to category form.', '2022-04-09 09:10:50'),
	(59, 'Winter.Blog', 'comment', '1.2.13', 'Improved support for Static Pages menus, added a blog post and all blog posts.', '2022-04-09 09:10:50'),
	(60, 'Winter.Blog', 'comment', '1.2.14', 'Added post exception property to the post list component, useful for showing related posts.', '2022-04-09 09:10:50'),
	(61, 'Winter.Blog', 'comment', '1.2.15', 'Back-end navigation sort order updated.', '2022-04-09 09:10:50'),
	(62, 'Winter.Blog', 'comment', '1.2.16', 'Added `nextPost` and `previousPost` to the blog post component.', '2022-04-09 09:10:50'),
	(63, 'Winter.Blog', 'comment', '1.2.17', 'Improved the next and previous logic to sort by the published date.', '2022-04-09 09:10:51'),
	(64, 'Winter.Blog', 'comment', '1.2.18', 'Minor change to internals.', '2022-04-09 09:10:51'),
	(65, 'Winter.Blog', 'comment', '1.2.19', 'Improved support for Build 420+', '2022-04-09 09:10:51'),
	(66, 'Winter.Blog', 'script', '1.3.0', 'v1.3.0/posts_add_metadata.php', '2022-04-09 09:10:51'),
	(67, 'Winter.Blog', 'comment', '1.3.0', 'Added metadata column for plugins to store data in', '2022-04-09 09:10:51'),
	(68, 'Winter.Blog', 'comment', '1.3.1', 'Fixed metadata column not being jsonable', '2022-04-09 09:10:51'),
	(69, 'Winter.Blog', 'comment', '1.3.2', 'Allow custom slug name for components, add 404 handling for missing blog posts, allow exporting of blog images.', '2022-04-09 09:10:51'),
	(70, 'Winter.Blog', 'comment', '1.3.3', 'Fixed \'excluded categories\' filter from being run when value is empty.', '2022-04-09 09:10:51'),
	(71, 'Winter.Blog', 'comment', '1.3.4', 'Allow post author to be specified. Improved translations.', '2022-04-09 09:10:51'),
	(72, 'Winter.Blog', 'comment', '1.3.5', 'Fixed missing user info from breaking initial seeder in migrations. Fixed a PostgreSQL issue with blog exports.', '2022-04-09 09:10:51'),
	(73, 'Winter.Blog', 'comment', '1.3.6', 'Improved French translations.', '2022-04-09 09:10:51'),
	(74, 'Winter.Blog', 'comment', '1.4.0', 'Stability improvements. Rollback custom slug names for components', '2022-04-09 09:10:51'),
	(75, 'Winter.Blog', 'comment', '1.4.1', 'Fixes potential security issue with unsafe Markdown. Allow blog bylines to be translated.', '2022-04-09 09:10:51'),
	(76, 'Winter.Blog', 'comment', '1.4.2', 'Fix 404 redirects for missing blog posts. Assign current category to the listed posts when using the Posts component on a page with the category parameter available.', '2022-04-09 09:10:51'),
	(77, 'Winter.Blog', 'comment', '1.4.3', 'Fixes incompatibility with locale switching when plugin is used in conjunction with the Translate plugin. Fixes undefined category error.', '2022-04-09 09:10:51'),
	(78, 'Winter.Blog', 'comment', '1.4.4', 'Rollback translated bylines, please move or override the default component markup instead.', '2022-04-09 09:10:51'),
	(79, 'Winter.Blog', 'comment', '1.5.0', 'Implement support for October CMS v2.0', '2022-04-09 09:10:51'),
	(80, 'Winter.Blog', 'script', '2.0.0', 'v2.0.0/rename_tables.php', '2022-04-09 09:10:52'),
	(81, 'Winter.Blog', 'comment', '2.0.0', 'Rebrand to Winter.Blog', '2022-04-09 09:10:52'),
	(82, 'Winter.Blog', 'script', '2.0.1', 'v2.0.1/rename_indexes.php', '2022-04-09 09:10:52'),
	(83, 'Winter.Blog', 'script', '2.0.1', 'v2.0.1/fix_translate_records.php', '2022-04-09 09:10:52'),
	(84, 'Winter.Blog', 'comment', '2.0.1', 'Rebrand table indexes', '2022-04-09 09:10:52'),
	(85, 'Winter.Blog', 'comment', '2.0.1', 'Add migrations for translate plugin attributes and indexes tables', '2022-04-09 09:10:52'),
	(86, 'Winter.Blog', 'comment', '2.0.2', 'Fixes issue where images could not be uploaded directly to the Markdown editor.', '2022-04-09 09:10:52'),
	(87, 'Winter.Builder', 'comment', '1.0.1', 'Initialize plugin.', '2022-04-09 09:10:52'),
	(88, 'Winter.Builder', 'comment', '1.0.2', 'Fixes the problem with selecting a plugin. Minor localization corrections. Configuration files in the list and form behaviors are now autocomplete.', '2022-04-09 09:10:52'),
	(89, 'Winter.Builder', 'comment', '1.0.3', 'Improved handling of the enum data type.', '2022-04-09 09:10:52'),
	(90, 'Winter.Builder', 'comment', '1.0.4', 'Added user permissions to work with the Builder.', '2022-04-09 09:10:52'),
	(91, 'Winter.Builder', 'comment', '1.0.5', 'Fixed permissions registration.', '2022-04-09 09:10:53'),
	(92, 'Winter.Builder', 'comment', '1.0.6', 'Fixed front-end record ordering in the Record List component.', '2022-04-09 09:10:53'),
	(93, 'Winter.Builder', 'comment', '1.0.7', 'Builder settings are now protected with user permissions. The database table column list is scrollable now. Minor code cleanup.', '2022-04-09 09:10:54'),
	(94, 'Winter.Builder', 'comment', '1.0.8', 'Added the Reorder Controller behavior.', '2022-04-09 09:10:55'),
	(95, 'Winter.Builder', 'comment', '1.0.9', 'Minor API and UI updates.', '2022-04-09 09:10:55'),
	(96, 'Winter.Builder', 'comment', '1.0.10', 'Minor styling update.', '2022-04-09 09:10:57'),
	(97, 'Winter.Builder', 'comment', '1.0.11', 'Fixed a bug where clicking placeholder in a repeater would open Inspector. Fixed a problem with saving forms with repeaters in tabs. Minor style fix.', '2022-04-09 09:10:58'),
	(98, 'Winter.Builder', 'comment', '1.0.12', 'Added support for the Trigger property to the Media Finder widget configuration. Names of form fields and list columns definition files can now contain underscores.', '2022-04-09 09:10:58'),
	(99, 'Winter.Builder', 'comment', '1.0.13', 'Minor styling fix on the database editor.', '2022-04-09 09:10:58'),
	(100, 'Winter.Builder', 'comment', '1.0.14', 'Added support for published_at timestamp field', '2022-04-09 09:10:59'),
	(101, 'Winter.Builder', 'comment', '1.0.15', 'Fixed a bug where saving a localization string in Inspector could cause a JavaScript error. Added support for Timestamps and Soft Deleting for new models.', '2022-04-09 09:11:00'),
	(102, 'Winter.Builder', 'comment', '1.0.16', 'Fixed a bug when saving a form with the Repeater widget in a tab could create invalid fields in the form\'s outside area. Added a check that prevents creating localization strings inside other existing strings.', '2022-04-09 09:11:01'),
	(103, 'Winter.Builder', 'comment', '1.0.17', 'Added support Trigger attribute support for RecordFinder and Repeater form widgets.', '2022-04-09 09:11:02'),
	(104, 'Winter.Builder', 'comment', '1.0.18', 'Fixes a bug where \'::class\' notations in a model class definition could prevent the model from appearing in the Builder model list. Added emptyOption property support to the dropdown form control.', '2022-04-09 09:11:03'),
	(105, 'Winter.Builder', 'comment', '1.0.19', 'Added a feature allowing to add all database columns to a list definition. Added max length validation for database table and column names.', '2022-04-09 09:11:03'),
	(106, 'Winter.Builder', 'comment', '1.0.20', 'Fixes a bug where form the builder could trigger the "current.hasAttribute is not a function" error.', '2022-04-09 09:11:04'),
	(107, 'Winter.Builder', 'comment', '1.0.21', 'Back-end navigation sort order updated.', '2022-04-09 09:11:04'),
	(108, 'Winter.Builder', 'comment', '1.0.22', 'Added scopeValue property to the RecordList component.', '2022-04-09 09:11:05'),
	(109, 'Winter.Builder', 'comment', '1.0.23', 'Added support for balloon-selector field type, added Brazilian Portuguese translation, fixed some bugs', '2022-04-09 09:11:05'),
	(110, 'Winter.Builder', 'comment', '1.0.24', 'Added support for tag list field type, added read only toggle for fields. Prevent plugins from using reserved PHP keywords for class names and namespaces', '2022-04-09 09:11:06'),
	(111, 'Winter.Builder', 'comment', '1.0.25', 'Allow editing of migration code in the "Migration" popup when saving changes in the database editor.', '2022-04-09 09:11:06'),
	(112, 'Winter.Builder', 'comment', '1.0.26', 'Allow special default values for columns and added new "Add ID column" button to database editor.', '2022-04-09 09:11:07'),
	(113, 'Winter.Builder', 'comment', '1.0.27', 'Added ability to use \'scope\' in a form relation field, added ability to change the sort order of versions and added additional properties for repeater widget in form builder. Added Polish translation.', '2022-04-09 09:11:08'),
	(114, 'Winter.Builder', 'script', '2.0.0', 'v2.0.0/convert_data.php', '2022-04-09 09:11:08'),
	(115, 'Winter.Builder', 'comment', '2.0.0', 'Rebrand to Winter.Builder', '2022-04-09 09:11:08'),
	(116, 'Winter.Builder', 'comment', '2.0.0', 'Fixes namespace parsing on php >= 8.0', '2022-04-09 09:11:09'),
	(117, 'Winter.Builder', 'comment', '2.0.1', 'Fixed missing icons in icon selection, rebranded icons to Winter.', '2022-04-09 09:11:10'),
	(118, 'Winter.Builder', 'comment', '2.0.2', 'Added fields to control plugin replacement, PHP8 compatibility fixes.', '2022-04-09 09:11:10'),
	(119, 'Winter.Builder', 'comment', '2.0.3', 'Added support for image columns', '2022-04-09 09:11:10'),
	(120, 'Winter.Builder', 'comment', '2.0.4', 'Added ability to modify Plugin replacement options. Automatically populate the model\'s `$jsonable` property for field types that require it. UX improvements.', '2022-04-09 09:11:11'),
	(121, 'Winter.Builder', 'comment', '2.0.5', 'Hot-fix issue with table selection when creating a model.', '2022-04-09 09:11:12'),
	(122, 'Winter.Demo', 'comment', '1.0.1', 'First version of Demo', '2022-04-09 09:11:13'),
	(123, 'Winter.Docs', 'comment', '1.0.0', 'Initial version of the Winter Docs plugin.', '2022-04-09 09:11:13'),
	(124, 'Winter.User', 'script', '1.0.1', 'v1.0.1/create_users_table.php', '2022-04-09 09:17:43'),
	(125, 'Winter.User', 'script', '1.0.1', 'v1.0.1/create_throttle_table.php', '2022-04-09 09:17:43'),
	(126, 'Winter.User', 'comment', '1.0.1', 'Initialize plugin.', '2022-04-09 09:17:43'),
	(127, 'Winter.User', 'comment', '1.0.2', 'Seed tables.', '2022-04-09 09:17:43'),
	(128, 'Winter.User', 'comment', '1.0.3', 'Translated hard-coded text to language strings.', '2022-04-09 09:17:43'),
	(129, 'Winter.User', 'comment', '1.0.4', 'Improvements to user-interface for Location manager.', '2022-04-09 09:17:43'),
	(130, 'Winter.User', 'comment', '1.0.5', 'Added contact details for users.', '2022-04-09 09:17:43'),
	(131, 'Winter.User', 'script', '1.0.6', 'v1.0.6/create_mail_blockers_table.php', '2022-04-09 09:17:43'),
	(132, 'Winter.User', 'comment', '1.0.6', 'Added Mail Blocker utility so users can block specific mail templates.', '2022-04-09 09:17:43'),
	(133, 'Winter.User', 'comment', '1.0.7', 'Add back-end Settings page.', '2022-04-09 09:17:43'),
	(134, 'Winter.User', 'comment', '1.0.8', 'Updated the Settings page.', '2022-04-09 09:17:43'),
	(135, 'Winter.User', 'comment', '1.0.9', 'Adds new welcome mail message for users and administrators.', '2022-04-09 09:17:43'),
	(136, 'Winter.User', 'comment', '1.0.10', 'Adds administrator-only activation mode.', '2022-04-09 09:17:43'),
	(137, 'Winter.User', 'script', '1.0.11', 'v1.0.11/users_add_login_column.php', '2022-04-09 09:17:44'),
	(138, 'Winter.User', 'comment', '1.0.11', 'Users now have an optional login field that defaults to the email field.', '2022-04-09 09:17:44'),
	(139, 'Winter.User', 'script', '1.0.12', 'v1.0.12/users_rename_login_to_username.php', '2022-04-09 09:17:44'),
	(140, 'Winter.User', 'comment', '1.0.12', 'Create a dedicated setting for choosing the login mode.', '2022-04-09 09:17:44'),
	(141, 'Winter.User', 'comment', '1.0.13', 'Minor fix to the Account sign in logic.', '2022-04-09 09:17:44'),
	(142, 'Winter.User', 'comment', '1.0.14', 'Minor improvements to the code.', '2022-04-09 09:17:44'),
	(143, 'Winter.User', 'script', '1.0.15', 'v1.0.15/users_add_surname.php', '2022-04-09 09:17:44'),
	(144, 'Winter.User', 'comment', '1.0.15', 'Adds last name column to users table (surname).', '2022-04-09 09:17:44'),
	(145, 'Winter.User', 'comment', '1.0.16', 'Require permissions for settings page too.', '2022-04-09 09:17:44'),
	(146, 'Winter.User', 'comment', '1.1.0', '!!! Profile fields and Locations have been removed.', '2022-04-09 09:17:44'),
	(147, 'Winter.User', 'script', '1.1.1', 'v1.1.1/create_user_groups_table.php', '2022-04-09 09:17:44'),
	(148, 'Winter.User', 'script', '1.1.1', 'v1.1.1/seed_user_groups_table.php', '2022-04-09 09:17:44'),
	(149, 'Winter.User', 'comment', '1.1.1', 'Users can now be added to groups.', '2022-04-09 09:17:45'),
	(150, 'Winter.User', 'comment', '1.1.2', 'A raw URL can now be passed as the redirect property in the Account component.', '2022-04-09 09:17:45'),
	(151, 'Winter.User', 'comment', '1.1.3', 'Adds a super user flag to the users table, reserved for future use.', '2022-04-09 09:17:45'),
	(152, 'Winter.User', 'comment', '1.1.4', 'User list can be filtered by the group they belong to.', '2022-04-09 09:17:45'),
	(153, 'Winter.User', 'comment', '1.1.5', 'Adds a new permission to hide the User settings menu item.', '2022-04-09 09:17:45'),
	(154, 'Winter.User', 'script', '1.2.0', 'v1.2.0/users_add_deleted_at.php', '2022-04-09 09:17:45'),
	(155, 'Winter.User', 'comment', '1.2.0', 'Users can now deactivate their own accounts.', '2022-04-09 09:17:45'),
	(156, 'Winter.User', 'comment', '1.2.1', 'New feature for checking if a user is recently active/online.', '2022-04-09 09:17:45'),
	(157, 'Winter.User', 'comment', '1.2.2', 'Add bulk action button to user list.', '2022-04-09 09:17:45'),
	(158, 'Winter.User', 'comment', '1.2.3', 'Included some descriptive paragraphs in the Reset Password component markup.', '2022-04-09 09:17:45'),
	(159, 'Winter.User', 'comment', '1.2.4', 'Added a checkbox for blocking all mail sent to the user.', '2022-04-09 09:17:45'),
	(160, 'Winter.User', 'script', '1.2.5', 'v1.2.5/update_timestamp_nullable.php', '2022-04-09 09:17:45'),
	(161, 'Winter.User', 'comment', '1.2.5', 'Database maintenance. Updated all timestamp columns to be nullable.', '2022-04-09 09:17:45'),
	(162, 'Winter.User', 'script', '1.2.6', 'v1.2.6/users_add_last_seen.php', '2022-04-09 09:17:45'),
	(163, 'Winter.User', 'comment', '1.2.6', 'Add a dedicated last seen column for users.', '2022-04-09 09:17:45'),
	(164, 'Winter.User', 'comment', '1.2.7', 'Minor fix to user timestamp attributes.', '2022-04-09 09:17:45'),
	(165, 'Winter.User', 'comment', '1.2.8', 'Add date range filter to users list. Introduced a logout event.', '2022-04-09 09:17:45'),
	(166, 'Winter.User', 'comment', '1.2.9', 'Add invitation mail for new accounts created in the back-end.', '2022-04-09 09:17:45'),
	(167, 'Winter.User', 'script', '1.3.0', 'v1.3.0/users_add_guest_flag.php', '2022-04-09 09:17:45'),
	(168, 'Winter.User', 'script', '1.3.0', 'v1.3.0/users_add_superuser_flag.php', '2022-04-09 09:17:45'),
	(169, 'Winter.User', 'comment', '1.3.0', 'Introduced guest user accounts.', '2022-04-09 09:17:45'),
	(170, 'Winter.User', 'comment', '1.3.1', 'User notification variables can now be extended.', '2022-04-09 09:17:45'),
	(171, 'Winter.User', 'comment', '1.3.2', 'Minor fix to the Auth::register method.', '2022-04-09 09:17:45'),
	(172, 'Winter.User', 'comment', '1.3.3', 'Allow prevention of concurrent user sessions via the user settings.', '2022-04-09 09:17:45'),
	(173, 'Winter.User', 'comment', '1.3.4', 'Added force secure protocol property to the account component.', '2022-04-09 09:17:46'),
	(174, 'Winter.User', 'comment', '1.4.0', '!!! The Notifications tab in User settings has been removed.', '2022-04-09 09:17:46'),
	(175, 'Winter.User', 'comment', '1.4.1', 'Added support for user impersonation.', '2022-04-09 09:17:46'),
	(176, 'Winter.User', 'comment', '1.4.2', 'Fixes security bug in Password Reset component.', '2022-04-09 09:17:46'),
	(177, 'Winter.User', 'comment', '1.4.3', 'Fixes session handling for AJAX requests.', '2022-04-09 09:17:46'),
	(178, 'Winter.User', 'comment', '1.4.4', 'Fixes bug where impersonation touches the last seen timestamp.', '2022-04-09 09:17:46'),
	(179, 'Winter.User', 'comment', '1.4.5', 'Added token fallback process to Account / Reset Password components when parameter is missing.', '2022-04-09 09:17:46'),
	(180, 'Winter.User', 'comment', '1.4.6', 'Fixes Auth::register method signature mismatch with core Winter CMS Auth library', '2022-04-09 09:17:46'),
	(181, 'Winter.User', 'comment', '1.4.7', 'Fixes redirect bug in Account component / Update translations and separate user and group management.', '2022-04-09 09:17:46'),
	(182, 'Winter.User', 'comment', '1.4.8', 'Fixes a bug where calling MailBlocker::removeBlock could remove all mail blocks for the user.', '2022-04-09 09:17:46'),
	(183, 'Winter.User', 'comment', '1.5.0', '!!! Required password length is now a minimum of 8 characters. Previous passwords will not be affected until the next password change.', '2022-04-09 09:17:46'),
	(184, 'Winter.User', 'script', '1.5.1', 'v1.5.1/users_add_ip_address.php', '2022-04-09 09:17:46'),
	(185, 'Winter.User', 'comment', '1.5.1', 'User IP addresses are now logged. Introduce registration throttle.', '2022-04-09 09:17:46'),
	(186, 'Winter.User', 'comment', '1.5.2', 'Whitespace from usernames is now trimmed, allowed for username to be added to Reset Password mail templates.', '2022-04-09 09:17:46'),
	(187, 'Winter.User', 'comment', '1.5.3', 'Fixes a bug in the user update functionality if password is not changed. Added highlighting for banned users in user list.', '2022-04-09 09:17:46'),
	(188, 'Winter.User', 'comment', '1.5.4', 'Multiple translation improvements. Added view events to extend user preview and user listing toolbars.', '2022-04-09 09:17:46'),
	(189, 'Winter.User', 'script', '2.0.0', 'v2.0.0/rename_tables.php', '2022-04-09 09:17:46'),
	(190, 'Winter.User', 'comment', '2.0.0', 'Rebrand to Winter.User', '2022-04-09 09:17:46'),
	(191, 'Winter.Translate', 'script', '1.0.1', 'v1.0.1/create_messages_table.php', '2022-04-09 09:18:43'),
	(192, 'Winter.Translate', 'script', '1.0.1', 'v1.0.1/create_attributes_table.php', '2022-04-09 09:18:44'),
	(193, 'Winter.Translate', 'script', '1.0.1', 'v1.0.1/create_locales_table.php', '2022-04-09 09:18:44'),
	(194, 'Winter.Translate', 'comment', '1.0.1', 'First version of Translate', '2022-04-09 09:18:44'),
	(195, 'Winter.Translate', 'comment', '1.0.2', 'Languages and Messages can now be deleted.', '2022-04-09 09:18:44'),
	(196, 'Winter.Translate', 'comment', '1.0.3', 'Minor updates for latest Winter CMS release.', '2022-04-09 09:18:44'),
	(197, 'Winter.Translate', 'comment', '1.0.4', 'Locale cache will clear when updating a language.', '2022-04-09 09:18:44'),
	(198, 'Winter.Translate', 'comment', '1.0.5', 'Add Spanish language and fix plugin config.', '2022-04-09 09:18:44'),
	(199, 'Winter.Translate', 'comment', '1.0.6', 'Minor improvements to the code.', '2022-04-09 09:18:44'),
	(200, 'Winter.Translate', 'comment', '1.0.7', 'Fixes major bug where translations are skipped entirely!', '2022-04-09 09:18:44'),
	(201, 'Winter.Translate', 'comment', '1.0.8', 'Minor bug fixes.', '2022-04-09 09:18:44'),
	(202, 'Winter.Translate', 'comment', '1.0.9', 'Fixes an issue where newly created models lose their translated values.', '2022-04-09 09:18:44'),
	(203, 'Winter.Translate', 'comment', '1.0.10', 'Minor fix for latest build.', '2022-04-09 09:18:44'),
	(204, 'Winter.Translate', 'comment', '1.0.11', 'Fix multilingual rich editor when used in stretch mode.', '2022-04-09 09:18:44'),
	(205, 'Winter.Translate', 'comment', '1.1.0', 'Introduce compatibility with Winter.Pages plugin.', '2022-04-09 09:18:44'),
	(206, 'Winter.Translate', 'comment', '1.1.1', 'Minor UI fix to the language picker.', '2022-04-09 09:18:44'),
	(207, 'Winter.Translate', 'comment', '1.1.2', 'Add support for translating Static Content files.', '2022-04-09 09:18:44'),
	(208, 'Winter.Translate', 'comment', '1.1.3', 'Improved support for the multilingual rich editor.', '2022-04-09 09:18:44'),
	(209, 'Winter.Translate', 'comment', '1.1.4', 'Adds new multilingual markdown editor.', '2022-04-09 09:18:44'),
	(210, 'Winter.Translate', 'comment', '1.1.5', 'Minor update to the multilingual control API.', '2022-04-09 09:18:44'),
	(211, 'Winter.Translate', 'comment', '1.1.6', 'Minor improvements in the message editor.', '2022-04-09 09:18:44'),
	(212, 'Winter.Translate', 'comment', '1.1.7', 'Fixes bug not showing content when first loading multilingual textarea controls.', '2022-04-09 09:18:44'),
	(213, 'Winter.Translate', 'comment', '1.2.0', 'CMS pages now support translating the URL.', '2022-04-09 09:18:44'),
	(214, 'Winter.Translate', 'comment', '1.2.1', 'Minor update in the rich editor and code editor language control position.', '2022-04-09 09:18:45'),
	(215, 'Winter.Translate', 'comment', '1.2.2', 'Static Pages now support translating the URL.', '2022-04-09 09:18:45'),
	(216, 'Winter.Translate', 'comment', '1.2.3', 'Fixes Rich Editor when inserting a page link.', '2022-04-09 09:18:45'),
	(217, 'Winter.Translate', 'script', '1.2.4', 'v1.2.4/create_indexes_table.php', '2022-04-09 09:18:45'),
	(218, 'Winter.Translate', 'comment', '1.2.4', 'Translatable attributes can now be declared as indexes.', '2022-04-09 09:18:45'),
	(219, 'Winter.Translate', 'comment', '1.2.5', 'Adds new multilingual repeater form widget.', '2022-04-09 09:18:45'),
	(220, 'Winter.Translate', 'comment', '1.2.6', 'Fixes repeater usage with static pages plugin.', '2022-04-09 09:18:45'),
	(221, 'Winter.Translate', 'comment', '1.2.7', 'Fixes placeholder usage with static pages plugin.', '2022-04-09 09:18:45'),
	(222, 'Winter.Translate', 'comment', '1.2.8', 'Improvements to code for latest Winter CMS build compatibility.', '2022-04-09 09:18:45'),
	(223, 'Winter.Translate', 'comment', '1.2.9', 'Fixes context for translated strings when used with Static Pages.', '2022-04-09 09:18:45'),
	(224, 'Winter.Translate', 'comment', '1.2.10', 'Minor UI fix to the multilingual repeater.', '2022-04-09 09:18:45'),
	(225, 'Winter.Translate', 'comment', '1.2.11', 'Fixes translation not working with partials loaded via AJAX.', '2022-04-09 09:18:45'),
	(226, 'Winter.Translate', 'comment', '1.2.12', 'Add support for translating the new grouped repeater feature.', '2022-04-09 09:18:45'),
	(227, 'Winter.Translate', 'comment', '1.3.0', 'Added search to the translate messages page.', '2022-04-09 09:18:45'),
	(228, 'Winter.Translate', 'script', '1.3.1', 'v1.3.1/add_sort_order.php', '2022-04-09 09:18:45'),
	(229, 'Winter.Translate', 'script', '1.3.1', 'v1.3.1/seed_all_tables.php', '2022-04-09 09:18:45'),
	(230, 'Winter.Translate', 'comment', '1.3.1', 'Added reordering to languages', '2022-04-09 09:18:45'),
	(231, 'Winter.Translate', 'comment', '1.3.2', 'Improved compatibility with Winter.Pages, added ability to scan Mail Messages for translatable variables.', '2022-04-09 09:18:45'),
	(232, 'Winter.Translate', 'comment', '1.3.3', 'Fix to the locale picker session handling in Build 420 onwards.', '2022-04-09 09:18:45'),
	(233, 'Winter.Translate', 'comment', '1.3.4', 'Add alternate hreflang elements and adds prefixDefaultLocale setting.', '2022-04-09 09:18:45'),
	(234, 'Winter.Translate', 'comment', '1.3.5', 'Fix MLRepeater bug when switching locales.', '2022-04-09 09:18:46'),
	(235, 'Winter.Translate', 'comment', '1.3.6', 'Fix Middleware to use the prefixDefaultLocale setting introduced in 1.3.4', '2022-04-09 09:18:46'),
	(236, 'Winter.Translate', 'comment', '1.3.7', 'Fix config reference in LocaleMiddleware', '2022-04-09 09:18:46'),
	(237, 'Winter.Translate', 'comment', '1.3.8', 'Keep query string when switching locales', '2022-04-09 09:18:46'),
	(238, 'Winter.Translate', 'comment', '1.4.0', 'Add importer and exporter for messages', '2022-04-09 09:18:46'),
	(239, 'Winter.Translate', 'comment', '1.4.1', 'Updated Hungarian translation. Added Arabic translation. Fixed issue where default texts are overwritten by import. Fixed issue where the language switcher for repeater fields would overlap with the first repeater row.', '2022-04-09 09:18:46'),
	(240, 'Winter.Translate', 'comment', '1.4.2', 'Add multilingual MediaFinder', '2022-04-09 09:18:46'),
	(241, 'Winter.Translate', 'comment', '1.4.3', '!!! Please update Winter CMS to Build 444 before updating this plugin. Added ability to translate CMS Pages fields (e.g. title, description, meta-title, meta-description)', '2022-04-09 09:18:46'),
	(242, 'Winter.Translate', 'comment', '1.4.4', 'Minor improvements to compatibility with Laravel framework.', '2022-04-09 09:18:46'),
	(243, 'Winter.Translate', 'comment', '1.4.5', 'Fixed issue when using the language switcher', '2022-04-09 09:18:46'),
	(244, 'Winter.Translate', 'comment', '1.5.0', 'Compatibility fix with Build 451', '2022-04-09 09:18:46'),
	(245, 'Winter.Translate', 'comment', '1.6.0', 'Make File Upload widget properties translatable. Merge Repeater core changes into MLRepeater widget. Add getter method to retrieve original translate data.', '2022-04-09 09:18:46'),
	(246, 'Winter.Translate', 'comment', '1.6.1', 'Add ability for models to provide translated computed data, add option to disable locale prefix routing', '2022-04-09 09:18:46'),
	(247, 'Winter.Translate', 'comment', '1.6.2', 'Implement localeUrl filter, add per-locale theme configuration support', '2022-04-09 09:18:46'),
	(248, 'Winter.Translate', 'comment', '1.6.3', 'Add eager loading for translations, restore support for accessors & mutators', '2022-04-09 09:18:46'),
	(249, 'Winter.Translate', 'comment', '1.6.4', 'Fixes PHP 7.4 compatibility', '2022-04-09 09:18:46'),
	(250, 'Winter.Translate', 'comment', '1.6.5', 'Fixes compatibility issue when other plugins use a custom model morph map', '2022-04-09 09:18:46'),
	(251, 'Winter.Translate', 'script', '1.6.6', 'v1.6.6/migrate_morphed_attributes.php', '2022-04-09 09:18:46'),
	(252, 'Winter.Translate', 'comment', '1.6.6', 'Introduce migration to patch existing translations using morph map', '2022-04-09 09:18:46'),
	(253, 'Winter.Translate', 'script', '1.6.7', 'v1.6.7/migrate_morphed_indexes.php', '2022-04-09 09:18:46'),
	(254, 'Winter.Translate', 'comment', '1.6.7', 'Introduce migration to patch existing indexes using morph map', '2022-04-09 09:18:46'),
	(255, 'Winter.Translate', 'comment', '1.6.8', 'Add support for transOrderBy; Add translation support for ThemeData; Update russian localization.', '2022-04-09 09:18:46'),
	(256, 'Winter.Translate', 'comment', '1.6.9', 'Clear Static Page menu cache after saving the model; CSS fix for Text/Textarea input fields language selector.', '2022-04-09 09:18:46'),
	(257, 'Winter.Translate', 'script', '1.6.10', 'v1.6.10/update_messages_table.php', '2022-04-09 09:18:46'),
	(258, 'Winter.Translate', 'comment', '1.6.10', 'Add option to purge deleted messages when scanning messages', '2022-04-09 09:18:46'),
	(259, 'Winter.Translate', 'comment', '1.6.10', 'Add Scan error column on Messages page', '2022-04-09 09:18:46'),
	(260, 'Winter.Translate', 'comment', '1.6.10', 'Fix translations that were lost when clicking locale twice while holding ctrl key', '2022-04-09 09:18:46'),
	(261, 'Winter.Translate', 'comment', '1.6.10', 'Fix error with nested fields default locale value', '2022-04-09 09:18:46'),
	(262, 'Winter.Translate', 'comment', '1.6.10', 'Escape Message translate params value', '2022-04-09 09:18:46'),
	(263, 'Winter.Translate', 'comment', '1.7.0', '!!! Breaking change for the Message::trans() method (params are now escaped)', '2022-04-09 09:18:46'),
	(264, 'Winter.Translate', 'comment', '1.7.0', 'fix message translation documentation', '2022-04-09 09:18:46'),
	(265, 'Winter.Translate', 'comment', '1.7.0', 'fix string translation key for scan errors column header', '2022-04-09 09:18:46'),
	(266, 'Winter.Translate', 'comment', '1.7.1', 'Fix YAML issue with previous tag/release.', '2022-04-09 09:18:46'),
	(267, 'Winter.Translate', 'comment', '1.7.2', 'Fix regex when "|_" filter is followed by another filter', '2022-04-09 09:18:46'),
	(268, 'Winter.Translate', 'comment', '1.7.2', 'Try locale without country before returning default translation', '2022-04-09 09:18:46'),
	(269, 'Winter.Translate', 'comment', '1.7.2', 'Allow exporting default locale', '2022-04-09 09:18:46'),
	(270, 'Winter.Translate', 'comment', '1.7.2', 'Fire \'winter.translate.themeScanner.afterScan\' event in the theme scanner for extendability', '2022-04-09 09:18:47'),
	(271, 'Winter.Translate', 'comment', '1.7.3', 'Make plugin ready for Laravel 6 update', '2022-04-09 09:18:47'),
	(272, 'Winter.Translate', 'comment', '1.7.3', 'Add support for translating Winter.Pages MenuItem properties (requires Winter.Pages v1.3.6)', '2022-04-09 09:18:47'),
	(273, 'Winter.Translate', 'comment', '1.7.3', 'Restore multilingual button position for textarea', '2022-04-09 09:18:47'),
	(274, 'Winter.Translate', 'comment', '1.7.3', 'Fix translatableAttributes', '2022-04-09 09:18:47'),
	(275, 'Winter.Translate', 'comment', '1.7.4', 'Faster version of transWhere', '2022-04-09 09:18:47'),
	(276, 'Winter.Translate', 'comment', '1.7.4', 'Mail templates/views can now be localized', '2022-04-09 09:18:47'),
	(277, 'Winter.Translate', 'comment', '1.7.4', 'Fix messages table layout on mobile', '2022-04-09 09:18:47'),
	(278, 'Winter.Translate', 'comment', '1.7.4', 'Fix scopeTransOrderBy duplicates', '2022-04-09 09:18:47'),
	(279, 'Winter.Translate', 'comment', '1.7.4', 'Polish localization updates', '2022-04-09 09:18:47'),
	(280, 'Winter.Translate', 'comment', '1.7.4', 'Turkish localization updates', '2022-04-09 09:18:47'),
	(281, 'Winter.Translate', 'comment', '1.7.4', 'Add Greek language localization', '2022-04-09 09:18:47'),
	(282, 'Winter.Translate', 'comment', '1.8.0', 'Adds initial support for October v2.0', '2022-04-09 09:18:47'),
	(283, 'Winter.Translate', 'comment', '1.8.1', 'Minor bugfix', '2022-04-09 09:18:47'),
	(284, 'Winter.Translate', 'comment', '1.8.2', 'Fixes translated file models and theme data for v2.0. The parent model must implement translatable behavior for their related file models to be translated.', '2022-04-09 09:18:47'),
	(285, 'Winter.Translate', 'script', '2.0.0', 'v2.0.0/rename_tables.php', '2022-04-09 09:18:47'),
	(286, 'Winter.Translate', 'comment', '2.0.0', 'Rebrand to Winter.Translate', '2022-04-09 09:18:47'),
	(287, 'Winter.Translate', 'comment', '2.0.0', 'Fix location for dropdown-to in css file', '2022-04-09 09:18:47'),
	(288, 'Grcote7.Marriage', 'script', '1.0.1', 'v1.0.1/seed_users_table.php', '2022-04-09 09:20:02'),
	(289, 'Grcote7.Marriage', 'script', '1.0.1', 'v1.0.1/create_guests_table.php', '2022-04-09 09:20:02'),
	(290, 'Grcote7.Marriage', 'comment', '1.0.1', 'First version of Marriage', '2022-04-09 09:20:02'),
	(291, 'Grcote7.Marriage', 'comment', '1.0.1', 'Populate users table', '2022-04-09 09:20:02'),
	(292, 'Grcote7.Marriage', 'comment', '1.0.1', 'Create guests table', '2022-04-09 09:20:02'),
	(293, 'Grcote7.Marriage', 'script', '1.0.2', 'v1.0.2/seed_guests_table.php', '2022-04-09 09:20:02'),
	(294, 'Grcote7.Marriage', 'comment', '1.0.2', 'Populate guests table', '2022-04-09 09:20:03'),
	(295, 'Grcote7.Marriage', 'script', '1.0.3', 'v1.0.3/create_famillies_table.php', '2022-04-09 09:20:03'),
	(296, 'Grcote7.Marriage', 'comment', '1.0.3', 'Add Familly Model', '2022-04-09 09:20:03'),
	(297, 'Grcote7.Marriage', 'script', '1.0.4', 'v1.0.4/seed_famillies_table.php', '2022-04-09 09:20:03'),
	(298, 'Grcote7.Marriage', 'comment', '1.0.4', 'Populate famillies table', '2022-04-09 09:20:03'),
	(299, 'Grcote7.Marriage', 'script', '1.0.5', 'v1.0.5/create_groups_table.php', '2022-04-09 09:20:03'),
	(300, 'Grcote7.Marriage', 'script', '1.0.5', 'v1.0.5/create_group_guest_table.php', '2022-04-09 09:20:03'),
	(301, 'Grcote7.Marriage', 'script', '1.0.5', 'v1.0.5/seed_groups_table.php', '2022-04-09 09:20:04'),
	(302, 'Grcote7.Marriage', 'script', '1.0.5', 'v1.0.5/seed_group_guest_table.php', '2022-04-09 09:20:04'),
	(303, 'Grcote7.Marriage', 'comment', '1.0.5', 'Create Group Model - To have a Many to Many relationship', '2022-04-09 09:20:04'),
	(304, 'Grcote7.Marriage', 'comment', '1.0.5', 'Create groups & pivot group_guest tables', '2022-04-09 09:20:04'),
	(305, 'Grcote7.Marriage', 'comment', '1.0.5', 'Populate groups & pivot group_guest tables', '2022-04-09 09:20:04'),
	(306, 'Grcote7.Marriage', 'script', '1.0.6', 'v1.0.6/create_msgs_table.php', '2022-04-09 09:20:04'),
	(307, 'Grcote7.Marriage', 'script', '1.0.6', 'v1.0.6/seed_msgs_table.php', '2022-04-09 09:20:04'),
	(308, 'Grcote7.Marriage', 'comment', '1.0.6', 'Create & populate Msg Model', '2022-04-09 09:20:04'),
	(309, 'Grcote7.Marriage', 'comment', '1.0.6', 'To have a Many to Many Through relationship', '2022-04-09 09:20:04'),
	(310, 'Grcote7.Marriage', 'script', '1.0.7', 'v1.0.7/create_imgs_table.php', '2022-04-09 09:20:04'),
	(311, 'Grcote7.Marriage', 'script', '1.0.7', 'v1.0.7/seed_imgs_table.php', '2022-04-09 09:20:04'),
	(312, 'Grcote7.Marriage', 'comment', '1.0.7', 'Create & populate Img Model', '2022-04-09 09:20:04'),
	(313, 'Grcote7.Marriage', 'script', '1.0.8', 'v1.0.8/create_avatars_table.php', '2022-04-09 09:20:05'),
	(314, 'Grcote7.Marriage', 'script', '1.0.8', 'v1.0.8/seed_avatars_table.php', '2022-04-09 09:20:05'),
	(315, 'Grcote7.Marriage', 'comment', '1.0.8', 'Create & populate Avatar Model - To test File Attachments', '2022-04-09 09:20:05'),
	(316, 'GrCote7.Tests', 'comment', '1.0.1', 'First version of Tests', '2022-04-09 09:20:48'),
	(317, 'GrCote7.WinterLearning', 'script', '1.0.1', '1.0.1/create_employees_table.php', '2022-04-09 09:20:49'),
	(318, 'GrCote7.WinterLearning', 'script', '1.0.1', '1.0.1/seed_employees_table.php', '2022-04-09 09:20:49'),
	(319, 'GrCote7.WinterLearning', 'script', '1.0.1', '1.0.1/create_activities_table.php', '2022-04-09 09:20:49'),
	(320, 'GrCote7.WinterLearning', 'script', '1.0.1', '1.0.1/create_sub_activities_table.php', '2022-04-09 09:20:49'),
	(321, 'GrCote7.WinterLearning', 'script', '1.0.1', '1.0.1/create_activity_employee_table.php', '2022-04-09 09:20:49'),
	(322, 'GrCote7.WinterLearning', 'comment', '1.0.1', 'First version of WinterLearning by GrCote7', '2022-04-09 09:20:49'),
	(323, 'GrCote7.WinterLearning', 'comment', '1.0.1', 'According to Drenad\'s capture (Chat in Discord)', '2022-04-09 09:20:49'),
	(324, 'GrCote7.WinterLearning', 'comment', '1.0.1', 'ManyToMany → addMany()', '2022-04-09 09:20:49'),
	(325, 'GrCote7.WinterLearning', 'comment', '1.0.1', 'Create employees table', '2022-04-09 09:20:49'),
	(326, 'GrCote7.WinterLearning', 'comment', '1.0.1', 'Populate employees table', '2022-04-09 09:20:49'),
	(327, 'GrCote7.WinterLearning', 'comment', '1.0.1', 'Create activities table', '2022-04-09 09:20:49'),
	(328, 'GrCote7.WinterLearning', 'comment', '1.0.1', 'Create sub activities table', '2022-04-09 09:20:49'),
	(329, 'GrCote7.WinterLearning', 'comment', '1.0.1', 'Create pit activity employee table', '2022-04-09 09:20:49'),
	(330, 'RainLab.Pages', 'comment', '1.0.1', 'Implemented the static pages management and the Static Page component.', '2022-04-09 09:20:49'),
	(331, 'RainLab.Pages', 'comment', '1.0.2', 'Fixed the page preview URL.', '2022-04-09 09:20:49'),
	(332, 'RainLab.Pages', 'comment', '1.0.3', 'Implemented menus.', '2022-04-09 09:20:49'),
	(333, 'RainLab.Pages', 'comment', '1.0.4', 'Implemented the content block management and placeholder support.', '2022-04-09 09:20:49'),
	(334, 'RainLab.Pages', 'comment', '1.0.5', 'Added support for the Sitemap plugin.', '2022-04-09 09:20:49'),
	(335, 'RainLab.Pages', 'comment', '1.0.6', 'Minor updates to the internal API.', '2022-04-09 09:20:50'),
	(336, 'RainLab.Pages', 'comment', '1.0.7', 'Added the Snippets feature.', '2022-04-09 09:20:50'),
	(337, 'RainLab.Pages', 'comment', '1.0.8', 'Minor improvements to the code.', '2022-04-09 09:20:50'),
	(338, 'RainLab.Pages', 'comment', '1.0.9', 'Fixes issue where Snippet tab is missing from the Partials form.', '2022-04-09 09:20:50'),
	(339, 'RainLab.Pages', 'comment', '1.0.10', 'Add translations for various locales.', '2022-04-09 09:20:50'),
	(340, 'RainLab.Pages', 'comment', '1.0.11', 'Fixes issue where placeholders tabs were missing from Page form.', '2022-04-09 09:20:50'),
	(341, 'RainLab.Pages', 'comment', '1.0.12', 'Implement Media Manager support.', '2022-04-09 09:20:50'),
	(342, 'RainLab.Pages', 'script', '1.1.0', 'snippets_rename_viewbag_properties.php', '2022-04-09 09:20:50'),
	(343, 'RainLab.Pages', 'comment', '1.1.0', 'Adds meta title and description to pages. Adds |staticPage filter.', '2022-04-09 09:20:50'),
	(344, 'RainLab.Pages', 'comment', '1.1.1', 'Add support for Syntax Fields.', '2022-04-09 09:20:50'),
	(345, 'RainLab.Pages', 'comment', '1.1.2', 'Static Breadcrumbs component now respects the hide from navigation setting.', '2022-04-09 09:20:50'),
	(346, 'RainLab.Pages', 'comment', '1.1.3', 'Minor back-end styling fix.', '2022-04-09 09:20:50'),
	(347, 'RainLab.Pages', 'comment', '1.1.4', 'Minor fix to the StaticPage component API.', '2022-04-09 09:20:50'),
	(348, 'RainLab.Pages', 'comment', '1.1.5', 'Fixes bug when using syntax fields.', '2022-04-09 09:20:50'),
	(349, 'RainLab.Pages', 'comment', '1.1.6', 'Minor styling fix to the back-end UI.', '2022-04-09 09:20:50'),
	(350, 'RainLab.Pages', 'comment', '1.1.7', 'Improved menu item form to include CSS class, open in a new window and hidden flag.', '2022-04-09 09:20:50'),
	(351, 'RainLab.Pages', 'comment', '1.1.8', 'Improved the output of snippet partials when saved.', '2022-04-09 09:20:50'),
	(352, 'RainLab.Pages', 'comment', '1.1.9', 'Minor update to snippet inspector internal API.', '2022-04-09 09:20:50'),
	(353, 'RainLab.Pages', 'comment', '1.1.10', 'Fixes a bug where selecting a layout causes permanent unsaved changes.', '2022-04-09 09:20:50'),
	(354, 'RainLab.Pages', 'comment', '1.1.11', 'Add support for repeater syntax field.', '2022-04-09 09:20:50'),
	(355, 'RainLab.Pages', 'comment', '1.2.0', 'Added support for translations, UI updates.', '2022-04-09 09:20:50'),
	(356, 'RainLab.Pages', 'comment', '1.2.1', 'Use nice titles when listing the content files.', '2022-04-09 09:20:50'),
	(357, 'RainLab.Pages', 'comment', '1.2.2', 'Minor styling update.', '2022-04-09 09:20:50'),
	(358, 'RainLab.Pages', 'comment', '1.2.3', 'Snippets can now be moved by dragging them.', '2022-04-09 09:20:51'),
	(359, 'RainLab.Pages', 'comment', '1.2.4', 'Fixes a bug where the cursor is misplaced when editing text files.', '2022-04-09 09:20:51'),
	(360, 'RainLab.Pages', 'comment', '1.2.5', 'Fixes a bug where the parent page is lost upon changing a page layout.', '2022-04-09 09:20:51'),
	(361, 'RainLab.Pages', 'comment', '1.2.6', 'Shared view variables are now passed to static pages.', '2022-04-09 09:20:51'),
	(362, 'RainLab.Pages', 'comment', '1.2.7', 'Fixes issue with duplicating properties when adding multiple snippets on the same page.', '2022-04-09 09:20:51'),
	(363, 'RainLab.Pages', 'comment', '1.2.8', 'Fixes a bug where creating a content block without extension doesn\'t save the contents to file.', '2022-04-09 09:20:51'),
	(364, 'RainLab.Pages', 'comment', '1.2.9', 'Add conditional support for translating page URLs.', '2022-04-09 09:20:51'),
	(365, 'RainLab.Pages', 'comment', '1.2.10', 'Streamline generation of URLs to use the new Cms::url helper.', '2022-04-09 09:20:51'),
	(366, 'RainLab.Pages', 'comment', '1.2.11', 'Implements repeater usage with translate plugin.', '2022-04-09 09:20:51'),
	(367, 'RainLab.Pages', 'comment', '1.2.12', 'Fixes minor issue when using snippets and switching the application locale.', '2022-04-09 09:20:51'),
	(368, 'RainLab.Pages', 'comment', '1.2.13', 'Fixes bug when AJAX is used on a page that does not yet exist.', '2022-04-09 09:20:51'),
	(369, 'RainLab.Pages', 'comment', '1.2.14', 'Add theme logging support for changes made to menus.', '2022-04-09 09:20:51'),
	(370, 'RainLab.Pages', 'comment', '1.2.15', 'Back-end navigation sort order updated.', '2022-04-09 09:20:51'),
	(371, 'RainLab.Pages', 'comment', '1.2.16', 'Fixes a bug when saving a template that has been modified outside of the CMS (mtime mismatch).', '2022-04-09 09:20:51'),
	(372, 'RainLab.Pages', 'comment', '1.2.17', 'Changes locations of custom fields to secondary tabs instead of the primary Settings area. New menu search ability on adding menu items', '2022-04-09 09:20:51'),
	(373, 'RainLab.Pages', 'comment', '1.2.18', 'Fixes cache-invalidation issues when RainLab.Translate is not installed. Added Greek & Simplified Chinese translations. Removed deprecated calls. Allowed saving HTML in snippet properties. Added support for the MediaFinder in menu items.', '2022-04-09 09:20:51'),
	(374, 'RainLab.Pages', 'comment', '1.2.19', 'Catch exception with corrupted menu file.', '2022-04-09 09:20:51'),
	(375, 'RainLab.Pages', 'comment', '1.2.20', 'StaticMenu component now exposes menuName property; added pages.menu.referencesGenerated event.', '2022-04-09 09:20:51'),
	(376, 'RainLab.Pages', 'comment', '1.2.21', 'Fixes a bug where last Static Menu item cannot be deleted. Improved Persian, Slovak and Turkish translations.', '2022-04-09 09:20:51'),
	(377, 'RainLab.Pages', 'comment', '1.3.0', 'Added support for using Database-driven Themes when enabled in the CMS configuration.', '2022-04-09 09:20:51'),
	(378, 'RainLab.Pages', 'comment', '1.3.1', 'Added ChildPages Component, prevent hidden pages from being returned via menu item resolver.', '2022-04-09 09:20:51'),
	(379, 'RainLab.Pages', 'comment', '1.3.2', 'Fixes error when creating a subpage whose parent has no layout set.', '2022-04-09 09:20:51'),
	(380, 'RainLab.Pages', 'comment', '1.3.3', 'Improves user experience for users with only partial access through permissions', '2022-04-09 09:20:51'),
	(381, 'RainLab.Pages', 'comment', '1.3.4', 'Fix error where large menus were being truncated due to the PHP "max_input_vars" configuration value. Improved Slovenian translation.', '2022-04-09 09:20:51'),
	(382, 'RainLab.Pages', 'comment', '1.3.5', 'Minor fix to bust the browser cache for JS assets. Prevent duplicate property fields in snippet inspector.', '2022-04-09 09:20:51'),
	(383, 'RainLab.Pages', 'comment', '1.3.6', 'ChildPages component now displays localized page titles from Translate plugin.', '2022-04-09 09:20:51'),
	(384, 'RainLab.Pages', 'comment', '1.3.7', 'Adds MenuPicker formwidget. Adds future support for v2.0 of October CMS.', '2022-04-09 09:20:51'),
	(385, 'RainLab.Pages', 'comment', '1.4.0', 'Fixes bug when adding menu items in October CMS v2.0.', '2022-04-09 09:20:51'),
	(386, 'RainLab.Pages', 'comment', '1.4.1', 'Fixes support for configuration values.', '2022-04-09 09:20:52'),
	(387, 'RainLab.Pages', 'comment', '1.4.3', 'Fixes page deletion is newer platform builds.', '2022-04-09 09:20:52'),
	(388, 'Winter.Debugbar', 'comment', '1.0.1', 'First version of Debugbar', '2022-04-09 09:20:52'),
	(389, 'Winter.Debugbar', 'comment', '1.0.2', 'Debugbar facade aliased (Alxy)', '2022-04-09 09:20:52'),
	(390, 'Winter.Debugbar', 'comment', '1.0.3', 'Added ajax debugging', '2022-04-09 09:20:52'),
	(391, 'Winter.Debugbar', 'comment', '1.0.4', 'Only display to backend authenticated users', '2022-04-09 09:20:52'),
	(392, 'Winter.Debugbar', 'comment', '1.0.5', 'Use elevated privileges', '2022-04-09 09:20:52'),
	(393, 'Winter.Debugbar', 'comment', '1.0.6', 'Fix fatal error when cms.page.beforeDisplay is fired multiple times (mnishihan)', '2022-04-09 09:20:52'),
	(394, 'Winter.Debugbar', 'comment', '1.0.7', 'Allow plugin to be installed via Composer (tim0991)', '2022-04-09 09:20:52'),
	(395, 'Winter.Debugbar', 'comment', '1.0.8', 'Fix debugbar dependency', '2022-04-09 09:20:52'),
	(396, 'Winter.Debugbar', 'comment', '2.0.0', '!!! Upgrade for compatibility with Laravel 5.5 (PHP 7+, October 420+)', '2022-04-09 09:20:52'),
	(397, 'Winter.Debugbar', 'comment', '2.0.1', 'Add config file to prevent exceptions from being thrown (credit alxy)', '2022-04-09 09:20:52'),
	(398, 'Winter.Debugbar', 'comment', '3.0.0', 'Switched vendor to RainLab from Bedard, upgraded for compatibility with Laravel 6.x', '2022-04-09 09:20:52'),
	(399, 'Winter.Debugbar', 'comment', '3.0.1', 'Fixed bug that caused 502 errors on AJAX requests', '2022-04-09 09:20:52'),
	(400, 'Winter.Debugbar', 'comment', '3.1.0', 'Important security update and improved styling.', '2022-04-09 09:20:52'),
	(401, 'Winter.Debugbar', 'comment', '3.1.1', 'Added new "store all requests" config option. Added Slovenian translations.', '2022-04-09 09:20:52'),
	(402, 'Winter.Debugbar', 'comment', '4.0.0', 'Switched vendor to Winter from RainLab', '2022-04-09 09:20:52'),
	(403, 'Winter.Test', 'comment', '1.0.1', 'First version of Test', '2022-04-09 09:20:52'),
	(404, 'Winter.Test', 'script', '1.0.2', 'v1.0.2/create_tables.php', '2022-04-09 09:20:56'),
	(405, 'Winter.Test', 'comment', '1.0.2', 'Create tables', '2022-04-09 09:20:56'),
	(406, 'Winter.Test', 'script', '1.0.3', 'v1.0.3/seed_tables.php', '2022-04-09 09:20:58'),
	(407, 'Winter.Test', 'comment', '1.0.3', 'Seed tables', '2022-04-09 09:20:59'),
	(408, 'Winter.Test', 'comment', '2.0.0', 'Rebrand to Winter.Test', '2022-04-09 09:20:59'),
	(414, 'Grcote7.Profile', 'script', '1.0.1', 'add_new_fields.php', '2022-04-12 08:50:26'),
	(415, 'Grcote7.Profile', 'comment', '1.0.1', 'Initialize plugin.', '2022-04-12 08:50:26');
/*!40000 ALTER TABLE `system_plugin_history` ENABLE KEYS */;

-- Listage de la structure de la table prepa. system_plugin_versions
CREATE TABLE IF NOT EXISTS `system_plugin_versions` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `version` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `is_disabled` tinyint(1) NOT NULL DEFAULT '0',
  `is_frozen` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `system_plugin_versions_code_index` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table prepa.system_plugin_versions : ~14 rows (environ)
DELETE FROM `system_plugin_versions`;
/*!40000 ALTER TABLE `system_plugin_versions` DISABLE KEYS */;
INSERT INTO `system_plugin_versions` (`id`, `code`, `version`, `created_at`, `is_disabled`, `is_frozen`) VALUES
	(1, 'Grcote7.Contact', '1.0.1', '2022-04-09 09:10:46', 0, 0),
	(2, 'Grcote7.Movies', '1.0.11', '2022-04-09 09:10:48', 0, 0),
	(3, 'Winter.Blog', '2.0.2', '2022-04-09 09:10:52', 0, 0),
	(4, 'Winter.Builder', '2.0.5', '2022-04-09 09:11:12', 0, 0),
	(5, 'Winter.Demo', '1.0.1', '2022-04-09 09:11:13', 0, 0),
	(6, 'Winter.Docs', '1.0.0', '2022-04-09 09:11:13', 0, 0),
	(7, 'Winter.User', '2.0.0', '2022-04-09 09:17:46', 0, 0),
	(8, 'Winter.Translate', '2.0.0', '2022-04-09 09:18:47', 0, 0),
	(9, 'Grcote7.Marriage', '1.0.8', '2022-04-09 09:20:05', 0, 0),
	(10, 'GrCote7.Tests', '1.0.1', '2022-04-09 09:20:48', 0, 0),
	(11, 'GrCote7.WinterLearning', '1.0.1', '2022-04-09 09:20:49', 0, 0),
	(12, 'RainLab.Pages', '1.4.3', '2022-04-09 09:20:52', 0, 0),
	(13, 'Winter.Debugbar', '4.0.0', '2022-04-09 09:20:52', 1, 0),
	(14, 'Winter.Test', '2.0.0', '2022-04-09 09:20:59', 0, 0),
	(18, 'Grcote7.Profile', '1.0.1', '2022-04-12 08:50:26', 0, 0);
/*!40000 ALTER TABLE `system_plugin_versions` ENABLE KEYS */;

-- Listage de la structure de la table prepa. system_request_logs
CREATE TABLE IF NOT EXISTS `system_request_logs` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `status_code` int DEFAULT NULL,
  `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `referer` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `count` int NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table prepa.system_request_logs : ~0 rows (environ)
DELETE FROM `system_request_logs`;
/*!40000 ALTER TABLE `system_request_logs` DISABLE KEYS */;
/*!40000 ALTER TABLE `system_request_logs` ENABLE KEYS */;

-- Listage de la structure de la table prepa. system_revisions
CREATE TABLE IF NOT EXISTS `system_revisions` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int unsigned DEFAULT NULL,
  `field` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cast` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `old_value` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `new_value` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `revisionable_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `revisionable_id` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `system_revisions_revisionable_id_revisionable_type_index` (`revisionable_id`,`revisionable_type`),
  KEY `system_revisions_user_id_index` (`user_id`),
  KEY `system_revisions_field_index` (`field`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table prepa.system_revisions : ~0 rows (environ)
DELETE FROM `system_revisions`;
/*!40000 ALTER TABLE `system_revisions` DISABLE KEYS */;
/*!40000 ALTER TABLE `system_revisions` ENABLE KEYS */;

-- Listage de la structure de la table prepa. system_settings
CREATE TABLE IF NOT EXISTS `system_settings` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `item` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `value` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `system_settings_item_index` (`item`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table prepa.system_settings : ~1 rows (environ)
DELETE FROM `system_settings`;
/*!40000 ALTER TABLE `system_settings` DISABLE KEYS */;
INSERT INTO `system_settings` (`id`, `item`, `value`) VALUES
	(1, 'winter_builder_settings', '{"author_name":"Grcote7","author_namespace":"Grcote7"}');
/*!40000 ALTER TABLE `system_settings` ENABLE KEYS */;

-- Listage de la structure de la table prepa. users
CREATE TABLE IF NOT EXISTS `users` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `activation_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `persist_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `reset_password_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `permissions` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `is_activated` tinyint(1) NOT NULL DEFAULT '0',
  `activated_at` timestamp NULL DEFAULT NULL,
  `last_login` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `surname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `last_seen` timestamp NULL DEFAULT NULL,
  `is_guest` tinyint(1) NOT NULL DEFAULT '0',
  `is_superuser` tinyint(1) NOT NULL DEFAULT '0',
  `created_ip_address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_ip_address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `facebook` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bio` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`),
  UNIQUE KEY `users_login_unique` (`username`),
  KEY `users_activation_code_index` (`activation_code`),
  KEY `users_reset_password_code_index` (`reset_password_code`),
  KEY `users_login_index` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table prepa.users : ~7 rows (environ)
DELETE FROM `users`;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` (`id`, `name`, `email`, `password`, `activation_code`, `persist_code`, `reset_password_code`, `permissions`, `is_activated`, `activated_at`, `last_login`, `created_at`, `updated_at`, `username`, `surname`, `deleted_at`, `last_seen`, `is_guest`, `is_superuser`, `created_ip_address`, `last_ip_address`, `facebook`, `bio`) VALUES
	(1, 'Lionel', 'GrCOTE7@Gmail.com', '$2y$10$Rg585acKvjI706jemJSoGeOq9mCjEfg0Y0I2iwgz8MSOweVESAs0W', NULL, NULL, NULL, NULL, 1, NULL, NULL, '2022-04-09 09:20:02', '2022-04-09 09:20:02', 'GrCOTE7', 'COTE', NULL, NULL, 0, 0, NULL, NULL, NULL, NULL),
	(2, 'Marie-Pierre', 'MP@COTE7.com', '$2y$10$usSIBfgpVyxXYksN/VMBJ.9NboVJZtplZvNFzVgdu0OlIZ9AQxh.G', NULL, NULL, NULL, NULL, 1, NULL, NULL, '2022-04-09 09:20:02', '2022-04-09 09:20:02', 'MP', 'RAQUIN', NULL, NULL, 0, 0, NULL, NULL, NULL, NULL),
	(3, 'Jean', 'Jean@Gmail.com', '$2y$10$92Rzwkba4K0Dcro3PHZ8nOjz2Fn4q7KBtrEVNXoYucmFf4KNKd9Hq', NULL, NULL, NULL, NULL, 1, NULL, NULL, '2022-04-09 09:20:02', '2022-04-09 09:20:02', 'JC', 'COTE', NULL, NULL, 0, 0, NULL, NULL, NULL, NULL),
	(4, 'Andrée', 'Ginandree@Gmail.com', '$2y$10$RQLcLInmWSdKtHGzaQzFg.gnHI/kYrtkYSGhi/uT.sEO252ZOovHG', NULL, NULL, NULL, NULL, 1, NULL, NULL, '2022-04-09 09:20:02', '2022-04-09 09:20:02', 'Ginandrée', 'MIELLE', NULL, NULL, 0, 0, NULL, NULL, NULL, NULL),
	(5, 'Samuel', 'Sam@Gmail.com', '$2y$10$2Z0fqkRWCNf3QO9PbXoPYeG3bxPS2qqI1EpCuwPs4UvvgguFTgyRm', NULL, NULL, NULL, NULL, 1, NULL, NULL, '2022-04-09 09:20:02', '2022-04-09 09:20:02', 'Sam', 'COTE', NULL, NULL, 0, 0, NULL, NULL, NULL, NULL),
	(6, 'Jean-Pierre', 'JP@Gmail.com', '$2y$10$YpVRbsfFYAfem1dsjYcJSeMLDl07zRsML2nrtiqgIuNyYnkqiC.JG', NULL, NULL, NULL, NULL, 1, NULL, NULL, '2022-04-09 09:20:02', '2022-04-09 09:20:02', 'JP', 'BIALLE', NULL, NULL, 0, 0, NULL, NULL, NULL, NULL),
	(7, 'Anne-Marie', 'AMB@Gmail.com', '$2y$10$H0zkZL1KcnA67uYZH5dTh.WPX/ej6DFmMdAR9kJHOnHjboeick7cK', NULL, '$2y$10$0eyCcE6vHjGZuUkBZ68fw.mMbVeF9U5drWu8Ai7mrHWHtkqjuYe.K', NULL, NULL, 1, NULL, '2022-04-12 09:05:42', '2022-04-09 09:20:02', '2022-04-12 09:20:22', 'Luluce', 'BIALLE', NULL, '2022-04-12 19:10:01', 0, 0, NULL, '192.168.10.1', 'sdfdsfs21', 'dfsdfds fdsfd dsf sf');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;

-- Listage de la structure de la table prepa. users_groups
CREATE TABLE IF NOT EXISTS `users_groups` (
  `user_id` int unsigned NOT NULL,
  `user_group_id` int unsigned NOT NULL,
  PRIMARY KEY (`user_id`,`user_group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table prepa.users_groups : ~0 rows (environ)
DELETE FROM `users_groups`;
/*!40000 ALTER TABLE `users_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `users_groups` ENABLE KEYS */;

-- Listage de la structure de la table prepa. user_groups
CREATE TABLE IF NOT EXISTS `user_groups` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_groups_code_index` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table prepa.user_groups : ~2 rows (environ)
DELETE FROM `user_groups`;
/*!40000 ALTER TABLE `user_groups` DISABLE KEYS */;
INSERT INTO `user_groups` (`id`, `name`, `code`, `description`, `created_at`, `updated_at`) VALUES
	(1, 'Guest', 'guest', 'Default group for guest users.', '2022-04-09 09:17:44', '2022-04-09 09:17:44'),
	(2, 'Registered', 'registered', 'Default group for registered users.', '2022-04-09 09:17:44', '2022-04-09 09:17:44');
/*!40000 ALTER TABLE `user_groups` ENABLE KEYS */;

-- Listage de la structure de la table prepa. user_throttle
CREATE TABLE IF NOT EXISTS `user_throttle` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int unsigned DEFAULT NULL,
  `ip_address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `attempts` int NOT NULL DEFAULT '0',
  `last_attempt_at` timestamp NULL DEFAULT NULL,
  `is_suspended` tinyint(1) NOT NULL DEFAULT '0',
  `suspended_at` timestamp NULL DEFAULT NULL,
  `is_banned` tinyint(1) NOT NULL DEFAULT '0',
  `banned_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_throttle_user_id_index` (`user_id`),
  KEY `user_throttle_ip_address_index` (`ip_address`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table prepa.user_throttle : ~1 rows (environ)
DELETE FROM `user_throttle`;
/*!40000 ALTER TABLE `user_throttle` DISABLE KEYS */;
INSERT INTO `user_throttle` (`id`, `user_id`, `ip_address`, `attempts`, `last_attempt_at`, `is_suspended`, `suspended_at`, `is_banned`, `banned_at`) VALUES
	(1, 6, NULL, 0, NULL, 0, NULL, 0, NULL),
	(2, 7, NULL, 0, NULL, 0, NULL, 0, NULL);
/*!40000 ALTER TABLE `user_throttle` ENABLE KEYS */;

-- Listage de la structure de la table prepa. winter_blog_categories
CREATE TABLE IF NOT EXISTS `winter_blog_categories` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `parent_id` int unsigned DEFAULT NULL,
  `nest_left` int DEFAULT NULL,
  `nest_right` int DEFAULT NULL,
  `nest_depth` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `rainlab_blog_categories_slug_index` (`slug`),
  KEY `rainlab_blog_categories_parent_id_index` (`parent_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table prepa.winter_blog_categories : ~0 rows (environ)
DELETE FROM `winter_blog_categories`;
/*!40000 ALTER TABLE `winter_blog_categories` DISABLE KEYS */;
INSERT INTO `winter_blog_categories` (`id`, `name`, `slug`, `code`, `description`, `parent_id`, `nest_left`, `nest_right`, `nest_depth`, `created_at`, `updated_at`) VALUES
	(1, 'Non catégorisé', 'uncategorized', NULL, NULL, NULL, 1, 2, 0, '2022-04-09 09:10:49', '2022-04-09 09:10:49');
/*!40000 ALTER TABLE `winter_blog_categories` ENABLE KEYS */;

-- Listage de la structure de la table prepa. winter_blog_posts
CREATE TABLE IF NOT EXISTS `winter_blog_posts` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int unsigned DEFAULT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `excerpt` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `content_html` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `published_at` timestamp NULL DEFAULT NULL,
  `published` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `metadata` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `rainlab_blog_posts_user_id_index` (`user_id`),
  KEY `rainlab_blog_posts_slug_index` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table prepa.winter_blog_posts : ~0 rows (environ)
DELETE FROM `winter_blog_posts`;
/*!40000 ALTER TABLE `winter_blog_posts` DISABLE KEYS */;
INSERT INTO `winter_blog_posts` (`id`, `user_id`, `title`, `slug`, `excerpt`, `content`, `content_html`, `published_at`, `published`, `created_at`, `updated_at`, `metadata`) VALUES
	(1, NULL, 'First blog post', 'first-blog-post', 'The first ever blog post is here. It might be a good idea to update this post with some more relevant content.', 'This is your first ever **blog post**! It might be a good idea to update this post with some more relevant content.\r\n\r\nYou can edit this content by selecting **Blog** from the administration back-end menu.\r\n\r\n*Enjoy the good times!*', '<p>This is your first ever <strong>blog post</strong>! It might be a good idea to update this post with some more relevant content.</p>\n<p>You can edit this content by selecting <strong>Blog</strong> from the administration back-end menu.</p>\n<p><em>Enjoy the good times!</em></p>', '2022-04-09 09:10:49', 1, '2022-04-09 09:10:49', '2022-04-09 09:10:49', NULL);
/*!40000 ALTER TABLE `winter_blog_posts` ENABLE KEYS */;

-- Listage de la structure de la table prepa. winter_blog_posts_categories
CREATE TABLE IF NOT EXISTS `winter_blog_posts_categories` (
  `post_id` int unsigned NOT NULL,
  `category_id` int unsigned NOT NULL,
  PRIMARY KEY (`post_id`,`category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table prepa.winter_blog_posts_categories : ~0 rows (environ)
DELETE FROM `winter_blog_posts_categories`;
/*!40000 ALTER TABLE `winter_blog_posts_categories` DISABLE KEYS */;
/*!40000 ALTER TABLE `winter_blog_posts_categories` ENABLE KEYS */;

-- Listage de la structure de la table prepa. winter_test_attributes
CREATE TABLE IF NOT EXISTS `winter_test_attributes` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `label` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_default` tinyint(1) NOT NULL DEFAULT '0',
  `sort_order` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table prepa.winter_test_attributes : ~0 rows (environ)
DELETE FROM `winter_test_attributes`;
/*!40000 ALTER TABLE `winter_test_attributes` DISABLE KEYS */;
/*!40000 ALTER TABLE `winter_test_attributes` ENABLE KEYS */;

-- Listage de la structure de la table prepa. winter_test_categories
CREATE TABLE IF NOT EXISTS `winter_test_categories` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` int unsigned DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sort_order` int DEFAULT NULL,
  `is_visible` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `winter_test_categories_parent_id_index` (`parent_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table prepa.winter_test_categories : ~11 rows (environ)
DELETE FROM `winter_test_categories`;
/*!40000 ALTER TABLE `winter_test_categories` DISABLE KEYS */;
INSERT INTO `winter_test_categories` (`id`, `parent_id`, `name`, `description`, `sort_order`, `is_visible`, `created_at`, `updated_at`) VALUES
	(1, NULL, 'Web', 'Websites & Web Applications', 1, 1, '2022-04-09 09:20:58', '2022-04-09 09:20:58'),
	(2, 1, 'Create a website', NULL, 2, 1, '2022-04-09 09:20:58', '2022-04-09 09:20:58'),
	(3, 1, 'Convert a template to a website', NULL, 3, 1, '2022-04-09 09:20:58', '2022-04-09 09:20:58'),
	(4, NULL, 'Desktop', 'Desktop Software', 4, 1, '2022-04-09 09:20:58', '2022-04-09 09:20:58'),
	(5, 4, 'Write software for Windows', NULL, 5, 1, '2022-04-09 09:20:58', '2022-04-09 09:20:58'),
	(6, 4, 'Write software for Mac', NULL, 6, 1, '2022-04-09 09:20:58', '2022-04-09 09:20:58'),
	(7, 4, 'Write software for Linux', NULL, 7, 1, '2022-04-09 09:20:58', '2022-04-09 09:20:58'),
	(8, NULL, 'Mobile', 'Mobile Apps', 8, 1, '2022-04-09 09:20:58', '2022-04-09 09:20:58'),
	(9, 8, 'Write software for iPhone / iPad', NULL, 9, 1, '2022-04-09 09:20:58', '2022-04-09 09:20:58'),
	(10, 8, 'Write software for Android', NULL, 10, 1, '2022-04-09 09:20:58', '2022-04-09 09:20:58'),
	(11, 8, 'Create a mobile website', NULL, 11, 1, '2022-04-09 09:20:58', '2022-04-09 09:20:58');
/*!40000 ALTER TABLE `winter_test_categories` ENABLE KEYS */;

-- Listage de la structure de la table prepa. winter_test_channels
CREATE TABLE IF NOT EXISTS `winter_test_channels` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` int unsigned DEFAULT NULL,
  `user_id` int unsigned DEFAULT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nest_left` int DEFAULT NULL,
  `nest_right` int DEFAULT NULL,
  `nest_depth` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `winter_test_channels_parent_id_index` (`parent_id`),
  KEY `winter_test_channels_user_id_index` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table prepa.winter_test_channels : ~9 rows (environ)
DELETE FROM `winter_test_channels`;
/*!40000 ALTER TABLE `winter_test_channels` DISABLE KEYS */;
INSERT INTO `winter_test_channels` (`id`, `parent_id`, `user_id`, `title`, `description`, `nest_left`, `nest_right`, `nest_depth`, `created_at`, `updated_at`) VALUES
	(1, NULL, 1, 'Channel Orange', 'A root level forum channel', 1, 12, 0, '2022-04-09 09:20:57', '2022-04-09 09:20:58'),
	(2, 1, NULL, 'Autumn Leaves', 'Disccusion about the season of falling leaves.', 2, 9, 1, '2022-04-09 09:20:57', '2022-04-09 09:20:58'),
	(3, 2, NULL, 'September', 'The start of the fall season.', 3, 4, 2, '2022-04-09 09:20:57', '2022-04-09 09:20:57'),
	(4, 2, NULL, 'Winter', 'The middle of the fall season.', 5, 6, 2, '2022-04-09 09:20:57', '2022-04-09 09:20:58'),
	(5, 2, NULL, 'November', 'The end of the fall season.', 7, 8, 2, '2022-04-09 09:20:58', '2022-04-09 09:20:58'),
	(6, 1, NULL, 'Summer Breeze', 'Disccusion about the wind at the ocean.', 10, 11, 1, '2022-04-09 09:20:58', '2022-04-09 09:20:58'),
	(7, NULL, 1, 'Channel Green', 'A root level forum channel', 13, 18, 0, '2022-04-09 09:20:58', '2022-04-09 09:20:58'),
	(8, 7, NULL, 'Winter Snow', 'Disccusion about the frosty snow flakes.', 14, 15, 1, '2022-04-09 09:20:58', '2022-04-09 09:20:58'),
	(9, 7, NULL, 'Spring Trees', 'Disccusion about the blooming gardens.', 16, 17, 1, '2022-04-09 09:20:58', '2022-04-09 09:20:58');
/*!40000 ALTER TABLE `winter_test_channels` ENABLE KEYS */;

-- Listage de la structure de la table prepa. winter_test_cities
CREATE TABLE IF NOT EXISTS `winter_test_cities` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `country_id` int unsigned NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table prepa.winter_test_cities : ~8 rows (environ)
DELETE FROM `winter_test_cities`;
/*!40000 ALTER TABLE `winter_test_cities` DISABLE KEYS */;
INSERT INTO `winter_test_cities` (`id`, `country_id`, `name`) VALUES
	(1, 1, 'Regina'),
	(2, 1, 'Vancouver'),
	(3, 1, 'Toronto'),
	(4, 1, 'Ottawa'),
	(5, 2, 'New York'),
	(6, 2, 'Seattle'),
	(7, 2, 'Boston'),
	(8, 2, 'San Francisco');
/*!40000 ALTER TABLE `winter_test_cities` ENABLE KEYS */;

-- Listage de la structure de la table prepa. winter_test_comments
CREATE TABLE IF NOT EXISTS `winter_test_comments` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `content_md` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `content_html` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `breakdown` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `mood` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `quotes` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `is_visible` tinyint(1) NOT NULL DEFAULT '1',
  `post_id` int unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `winter_test_comments_post_id_index` (`post_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table prepa.winter_test_comments : ~2 rows (environ)
DELETE FROM `winter_test_comments`;
/*!40000 ALTER TABLE `winter_test_comments` DISABLE KEYS */;
INSERT INTO `winter_test_comments` (`id`, `name`, `content`, `content_md`, `content_html`, `breakdown`, `mood`, `quotes`, `is_visible`, `post_id`, `created_at`, `updated_at`) VALUES
	(1, 'deadmau5', 'Hai fwiend, hai fwiend, hai fwiend, hai fwiend, hai fwiend. Brrrrrup bloop. Brrrrrp bloop. Brrrrrp bloop. Brrrrrp bloop.', NULL, NULL, NULL, NULL, NULL, 1, 1, '2022-04-09 09:20:57', '2022-04-09 09:20:57'),
	(2, 'Hidden comment', 'This comment should be hidden as defined in the relationship.', NULL, NULL, NULL, NULL, NULL, 0, 1, '2022-04-09 09:20:57', '2022-04-09 09:20:57');
/*!40000 ALTER TABLE `winter_test_comments` ENABLE KEYS */;

-- Listage de la structure de la table prepa. winter_test_countries
CREATE TABLE IF NOT EXISTS `winter_test_countries` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `pages` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `states` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `locations` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `language` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `currency` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table prepa.winter_test_countries : ~2 rows (environ)
DELETE FROM `winter_test_countries`;
/*!40000 ALTER TABLE `winter_test_countries` DISABLE KEYS */;
INSERT INTO `winter_test_countries` (`id`, `name`, `code`, `content`, `pages`, `states`, `locations`, `language`, `currency`, `is_active`, `created_at`, `updated_at`) VALUES
	(1, 'Petoria', 'petoria', NULL, NULL, '[{"title":"Stewie"},{"title":"Brian"},{"title":"Chris"},{"title":"Lois"},{"title":"Meg"}]', NULL, 'eh', 'btc', 0, '2022-04-09 09:20:57', '2022-04-09 09:20:57'),
	(2, 'Blueseed', 'blueseed', NULL, NULL, '[{"title":"Boaty"},{"title":"McBoat"},{"title":"Face"}]', NULL, 'bs', 'btc', 0, '2022-04-09 09:20:57', '2022-04-09 09:20:57');
/*!40000 ALTER TABLE `winter_test_countries` ENABLE KEYS */;

-- Listage de la structure de la table prepa. winter_test_countries_types
CREATE TABLE IF NOT EXISTS `winter_test_countries_types` (
  `country_id` int unsigned NOT NULL,
  `attribute_id` int unsigned NOT NULL,
  PRIMARY KEY (`country_id`,`attribute_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table prepa.winter_test_countries_types : ~0 rows (environ)
DELETE FROM `winter_test_countries_types`;
/*!40000 ALTER TABLE `winter_test_countries_types` DISABLE KEYS */;
/*!40000 ALTER TABLE `winter_test_countries_types` ENABLE KEYS */;

-- Listage de la structure de la table prepa. winter_test_galleries
CREATE TABLE IF NOT EXISTS `winter_test_galleries` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `party_mode` tinyint(1) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table prepa.winter_test_galleries : ~0 rows (environ)
DELETE FROM `winter_test_galleries`;
/*!40000 ALTER TABLE `winter_test_galleries` DISABLE KEYS */;
INSERT INTO `winter_test_galleries` (`id`, `title`, `status`, `party_mode`, `created_at`, `updated_at`) VALUES
	(1, 'Featured', NULL, NULL, '2022-04-09 09:20:57', '2022-04-09 09:20:57');
/*!40000 ALTER TABLE `winter_test_galleries` ENABLE KEYS */;

-- Listage de la structure de la table prepa. winter_test_gallery_entity
CREATE TABLE IF NOT EXISTS `winter_test_gallery_entity` (
  `gallery_id` int unsigned NOT NULL,
  `entity_id` int unsigned NOT NULL,
  `entity_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`gallery_id`,`entity_id`,`entity_type`),
  KEY `gallery_id_idx` (`gallery_id`),
  KEY `entity_id_idx` (`entity_id`),
  KEY `entity_type_idx` (`entity_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table prepa.winter_test_gallery_entity : ~0 rows (environ)
DELETE FROM `winter_test_gallery_entity`;
/*!40000 ALTER TABLE `winter_test_gallery_entity` DISABLE KEYS */;
INSERT INTO `winter_test_gallery_entity` (`gallery_id`, `entity_id`, `entity_type`) VALUES
	(1, 1, 'Winter\\Test\\Models\\Post');
/*!40000 ALTER TABLE `winter_test_gallery_entity` ENABLE KEYS */;

-- Listage de la structure de la table prepa. winter_test_locations
CREATE TABLE IF NOT EXISTS `winter_test_locations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `country_id` int unsigned NOT NULL,
  `city_id` int unsigned NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table prepa.winter_test_locations : ~8 rows (environ)
DELETE FROM `winter_test_locations`;
/*!40000 ALTER TABLE `winter_test_locations` DISABLE KEYS */;
INSERT INTO `winter_test_locations` (`id`, `country_id`, `city_id`, `name`) VALUES
	(1, 1, 1, '240 5th Ave'),
	(2, 1, 2, '101 McKay Street'),
	(3, 1, 3, '123 Nowhere Lane'),
	(4, 1, 4, '10099 Bob Loop'),
	(5, 2, 5, '9442 Scary Street'),
	(6, 2, 6, '5309 Imagination Crescrent'),
	(7, 2, 7, '22 2201 Seymour Drive'),
	(8, 2, 8, '2322 Xray Alphabet');
/*!40000 ALTER TABLE `winter_test_locations` ENABLE KEYS */;

-- Listage de la structure de la table prepa. winter_test_members
CREATE TABLE IF NOT EXISTS `winter_test_members` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` int unsigned DEFAULT NULL,
  `user_id` int unsigned DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `winter_test_members_parent_id_index` (`parent_id`),
  KEY `winter_test_members_user_id_index` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table prepa.winter_test_members : ~7 rows (environ)
DELETE FROM `winter_test_members`;
/*!40000 ALTER TABLE `winter_test_members` DISABLE KEYS */;
INSERT INTO `winter_test_members` (`id`, `parent_id`, `user_id`, `name`, `created_at`, `updated_at`) VALUES
	(1, NULL, NULL, 'Khaleesi', '2022-04-09 09:20:57', '2022-04-09 09:20:57'),
	(2, 1, NULL, 'Ian', '2022-04-09 09:20:57', '2022-04-09 09:20:57'),
	(3, 2, NULL, 'Vangelis', '2022-04-09 09:20:57', '2022-04-09 09:20:57'),
	(4, 3, NULL, 'Joe', '2022-04-09 09:20:57', '2022-04-09 09:20:57'),
	(5, 4, 1, 'Johnny', '2022-04-09 09:20:57', '2022-04-09 09:20:57'),
	(6, 4, 1, 'Sally', '2022-04-09 09:20:57', '2022-04-09 09:20:57'),
	(7, 4, 1, 'Rick', '2022-04-09 09:20:57', '2022-04-09 09:20:57');
/*!40000 ALTER TABLE `winter_test_members` ENABLE KEYS */;

-- Listage de la structure de la table prepa. winter_test_meta
CREATE TABLE IF NOT EXISTS `winter_test_meta` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `taggable_id` int unsigned DEFAULT NULL,
  `taggable_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_keywords` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `canonical_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `redirect_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `robot_index` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `robot_follow` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `winter_test_meta_taggable_id_index` (`taggable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table prepa.winter_test_meta : ~0 rows (environ)
DELETE FROM `winter_test_meta`;
/*!40000 ALTER TABLE `winter_test_meta` DISABLE KEYS */;
/*!40000 ALTER TABLE `winter_test_meta` ENABLE KEYS */;

-- Listage de la structure de la table prepa. winter_test_pages
CREATE TABLE IF NOT EXISTS `winter_test_pages` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `type` int unsigned NOT NULL,
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table prepa.winter_test_pages : ~2 rows (environ)
DELETE FROM `winter_test_pages`;
/*!40000 ALTER TABLE `winter_test_pages` DISABLE KEYS */;
INSERT INTO `winter_test_pages` (`id`, `type`, `content`) VALUES
	(1, 1, '{"title":"This is a simple page","content":"<h1>Hello, World<\\/h1>"}'),
	(2, 2, '{"title":"This is a complex page","content":"<h1>Hello, Complex World<\\/h1>","meta_description":"Meta Description","meta_tags":["WinterCMS","Fun"],"colors":{"primary":"#ff0000","secondary":"#00ff00"}}');
/*!40000 ALTER TABLE `winter_test_pages` ENABLE KEYS */;

-- Listage de la structure de la table prepa. winter_test_people
CREATE TABLE IF NOT EXISTS `winter_test_people` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `preferred_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bio` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `expenses` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `birth` datetime DEFAULT NULL,
  `birthtime` time DEFAULT NULL,
  `birthdate` date DEFAULT NULL,
  `favcolor` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `hobbies` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `sports` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `is_married` tinyint(1) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table prepa.winter_test_people : ~6 rows (environ)
DELETE FROM `winter_test_people`;
/*!40000 ALTER TABLE `winter_test_people` DISABLE KEYS */;
INSERT INTO `winter_test_people` (`id`, `name`, `preferred_name`, `bio`, `expenses`, `birth`, `birthtime`, `birthdate`, `favcolor`, `hobbies`, `sports`, `is_married`, `created_at`, `updated_at`) VALUES
	(1, 'Eddie Valiant', NULL, 'I have a phone set up already', '19999', NULL, NULL, NULL, '#5fb6f5', NULL, NULL, NULL, '2022-04-09 09:20:56', '2022-04-09 09:20:56'),
	(2, 'Baby Herman', NULL, 'I have nothing at all', '550', NULL, NULL, NULL, '#990000', NULL, NULL, NULL, '2022-04-09 09:20:57', '2022-04-09 09:20:57'),
	(3, 'Jon Doe', NULL, 'I like turtles', NULL, NULL, NULL, NULL, '#111111', NULL, NULL, NULL, '2022-04-09 09:20:57', '2022-04-09 09:20:57'),
	(4, 'John Smith', NULL, 'I like dolphins', NULL, NULL, NULL, NULL, '#222222', NULL, NULL, NULL, '2022-04-09 09:20:57', '2022-04-09 09:20:57'),
	(5, 'Jon Smith', NULL, 'I like snakes', NULL, NULL, NULL, NULL, '#333333', NULL, NULL, NULL, '2022-04-09 09:20:57', '2022-04-09 09:20:57'),
	(6, 'Mary Smith', NULL, 'I like fish', '2000', NULL, NULL, NULL, '#444444', NULL, NULL, NULL, '2022-04-09 09:20:57', '2022-04-09 09:20:57');
/*!40000 ALTER TABLE `winter_test_people` ENABLE KEYS */;

-- Listage de la structure de la table prepa. winter_test_phones
CREATE TABLE IF NOT EXISTS `winter_test_phones` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `number` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `brand` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `person_id` int unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `winter_test_phones_person_id_index` (`person_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table prepa.winter_test_phones : ~0 rows (environ)
DELETE FROM `winter_test_phones`;
/*!40000 ALTER TABLE `winter_test_phones` DISABLE KEYS */;
INSERT INTO `winter_test_phones` (`id`, `name`, `number`, `brand`, `is_active`, `person_id`, `created_at`, `updated_at`) VALUES
	(1, 'Mobile', '(360) 733-2263', NULL, 1, NULL, '2022-04-09 09:20:56', '2022-04-09 09:20:57'),
	(2, 'Home', '(360) 867-3563', NULL, 1, 1, '2022-04-09 09:20:56', '2022-04-09 09:20:57'),
	(3, 'Work', '(360) 595-2146', NULL, 1, NULL, '2022-04-09 09:20:57', '2022-04-09 09:20:57'),
	(4, 'Fax', '(360) 595-2146', NULL, 1, NULL, '2022-04-09 09:20:57', '2022-04-09 09:20:57'),
	(5, 'Inactive', '(xxx) xxx-xxx', NULL, 0, NULL, '2022-04-09 09:20:57', '2022-04-09 09:20:57');
/*!40000 ALTER TABLE `winter_test_phones` ENABLE KEYS */;

-- Listage de la structure de la table prepa. winter_test_plugins
CREATE TABLE IF NOT EXISTS `winter_test_plugins` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table prepa.winter_test_plugins : ~0 rows (environ)
DELETE FROM `winter_test_plugins`;
/*!40000 ALTER TABLE `winter_test_plugins` DISABLE KEYS */;
INSERT INTO `winter_test_plugins` (`id`, `name`, `code`, `content`, `created_at`, `updated_at`) VALUES
	(1, 'Angular', 'angular', 'An AngularJS plugin.', '2022-04-09 09:20:57', '2022-04-09 09:20:57');
/*!40000 ALTER TABLE `winter_test_plugins` ENABLE KEYS */;

-- Listage de la structure de la table prepa. winter_test_posts
CREATE TABLE IF NOT EXISTS `winter_test_posts` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `content_md` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `content_html` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `tags_array` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tags_string` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tags_array_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tags_string_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_published` tinyint(1) NOT NULL DEFAULT '0',
  `published_at` timestamp NULL DEFAULT NULL,
  `status_id` int unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `winter_test_posts_status_id_index` (`status_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table prepa.winter_test_posts : ~0 rows (environ)
DELETE FROM `winter_test_posts`;
/*!40000 ALTER TABLE `winter_test_posts` DISABLE KEYS */;
INSERT INTO `winter_test_posts` (`id`, `name`, `content`, `content_md`, `content_html`, `tags_array`, `tags_string`, `tags_array_id`, `tags_string_id`, `is_published`, `published_at`, `status_id`, `created_at`, `updated_at`) VALUES
	(1, 'First post, yay!', 'I have some comments!', NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, '2022-04-09 09:20:57', '2022-04-09 09:20:57'),
	(2, 'A lonely toon', 'I have nothing at all', NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, '2022-04-09 09:20:57', '2022-04-09 09:20:57');
/*!40000 ALTER TABLE `winter_test_posts` ENABLE KEYS */;

-- Listage de la structure de la table prepa. winter_test_posts_tags
CREATE TABLE IF NOT EXISTS `winter_test_posts_tags` (
  `post_id` int NOT NULL,
  `tag_id` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table prepa.winter_test_posts_tags : ~0 rows (environ)
DELETE FROM `winter_test_posts_tags`;
/*!40000 ALTER TABLE `winter_test_posts_tags` DISABLE KEYS */;
/*!40000 ALTER TABLE `winter_test_posts_tags` ENABLE KEYS */;

-- Listage de la structure de la table prepa. winter_test_related_channels
CREATE TABLE IF NOT EXISTS `winter_test_related_channels` (
  `channel_id` int unsigned NOT NULL,
  `related_id` int unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`channel_id`,`related_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table prepa.winter_test_related_channels : ~0 rows (environ)
DELETE FROM `winter_test_related_channels`;
/*!40000 ALTER TABLE `winter_test_related_channels` DISABLE KEYS */;
/*!40000 ALTER TABLE `winter_test_related_channels` ENABLE KEYS */;

-- Listage de la structure de la table prepa. winter_test_reviews
CREATE TABLE IF NOT EXISTS `winter_test_reviews` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `product_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `product_id` int unsigned DEFAULT NULL,
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `is_positive` tinyint(1) DEFAULT NULL,
  `rating` int unsigned NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table prepa.winter_test_reviews : ~0 rows (environ)
DELETE FROM `winter_test_reviews`;
/*!40000 ALTER TABLE `winter_test_reviews` DISABLE KEYS */;
INSERT INTO `winter_test_reviews` (`id`, `product_type`, `product_id`, `content`, `is_positive`, `rating`, `created_at`, `updated_at`) VALUES
	(1, NULL, NULL, 'Orphan review', 0, 2, '2022-04-09 09:20:57', '2022-04-09 09:20:57'),
	(2, 'Winter\\Test\\Models\\Theme', 1, 'Excellent design work', 1, 4, '2022-04-09 09:20:57', '2022-04-09 09:20:57');
/*!40000 ALTER TABLE `winter_test_reviews` ENABLE KEYS */;

-- Listage de la structure de la table prepa. winter_test_roles
CREATE TABLE IF NOT EXISTS `winter_test_roles` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table prepa.winter_test_roles : ~0 rows (environ)
DELETE FROM `winter_test_roles`;
/*!40000 ALTER TABLE `winter_test_roles` DISABLE KEYS */;
INSERT INTO `winter_test_roles` (`id`, `name`, `description`, `created_at`, `updated_at`) VALUES
	(1, 'Chief Executive Orangutan', 'You can call this person CEO for short', '2022-04-09 09:20:57', '2022-04-09 09:20:57'),
	(2, 'Chief Friendship Organiser', 'You can call this person CFO for short', '2022-04-09 09:20:57', '2022-04-09 09:20:57'),
	(3, 'Caring Technical Officer', 'You can call this person CTO for short', '2022-04-09 09:20:57', '2022-04-09 09:20:57');
/*!40000 ALTER TABLE `winter_test_roles` ENABLE KEYS */;

-- Listage de la structure de la table prepa. winter_test_tags
CREATE TABLE IF NOT EXISTS `winter_test_tags` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table prepa.winter_test_tags : ~0 rows (environ)
DELETE FROM `winter_test_tags`;
/*!40000 ALTER TABLE `winter_test_tags` DISABLE KEYS */;
/*!40000 ALTER TABLE `winter_test_tags` ENABLE KEYS */;

-- Listage de la structure de la table prepa. winter_test_themes
CREATE TABLE IF NOT EXISTS `winter_test_themes` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table prepa.winter_test_themes : ~0 rows (environ)
DELETE FROM `winter_test_themes`;
/*!40000 ALTER TABLE `winter_test_themes` DISABLE KEYS */;
INSERT INTO `winter_test_themes` (`id`, `name`, `code`, `content`, `created_at`, `updated_at`) VALUES
	(1, 'Bootstrap', 'bootstrap', 'A bootstrap theme.', '2022-04-09 09:20:57', '2022-04-09 09:20:57');
/*!40000 ALTER TABLE `winter_test_themes` ENABLE KEYS */;

-- Listage de la structure de la table prepa. winter_test_users
CREATE TABLE IF NOT EXISTS `winter_test_users` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `security_code` int DEFAULT NULL,
  `media_image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `media_file` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table prepa.winter_test_users : ~0 rows (environ)
DELETE FROM `winter_test_users`;
/*!40000 ALTER TABLE `winter_test_users` DISABLE KEYS */;
INSERT INTO `winter_test_users` (`id`, `username`, `security_code`, `media_image`, `media_file`, `created_at`, `updated_at`) VALUES
	(1, 'Neo', 1111, NULL, NULL, '2022-04-09 09:20:57', '2022-04-09 09:20:57'),
	(2, 'Morpheus', 8888, NULL, NULL, '2022-04-09 09:20:57', '2022-04-09 09:20:57');
/*!40000 ALTER TABLE `winter_test_users` ENABLE KEYS */;

-- Listage de la structure de la table prepa. winter_test_users_roles
CREATE TABLE IF NOT EXISTS `winter_test_users_roles` (
  `user_id` int unsigned NOT NULL,
  `role_id` int unsigned NOT NULL,
  `clearance_level` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `manager_id` int unsigned DEFAULT NULL,
  `is_executive` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`user_id`,`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table prepa.winter_test_users_roles : ~0 rows (environ)
DELETE FROM `winter_test_users_roles`;
/*!40000 ALTER TABLE `winter_test_users_roles` DISABLE KEYS */;
INSERT INTO `winter_test_users_roles` (`user_id`, `role_id`, `clearance_level`, `manager_id`, `is_executive`, `created_at`, `updated_at`) VALUES
	(1, 1, 'Top Secret', NULL, 1, '2022-04-09 09:20:57', '2022-04-09 09:20:57');
/*!40000 ALTER TABLE `winter_test_users_roles` ENABLE KEYS */;

-- Listage de la structure de la table prepa. winter_translate_attributes
CREATE TABLE IF NOT EXISTS `winter_translate_attributes` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `locale` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `model_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `attribute_data` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `rainlab_translate_attributes_locale_index` (`locale`),
  KEY `rainlab_translate_attributes_model_id_index` (`model_id`),
  KEY `rainlab_translate_attributes_model_type_index` (`model_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table prepa.winter_translate_attributes : ~0 rows (environ)
DELETE FROM `winter_translate_attributes`;
/*!40000 ALTER TABLE `winter_translate_attributes` DISABLE KEYS */;
/*!40000 ALTER TABLE `winter_translate_attributes` ENABLE KEYS */;

-- Listage de la structure de la table prepa. winter_translate_indexes
CREATE TABLE IF NOT EXISTS `winter_translate_indexes` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `locale` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `model_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `item` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `value` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `rainlab_translate_indexes_locale_index` (`locale`),
  KEY `rainlab_translate_indexes_model_id_index` (`model_id`),
  KEY `rainlab_translate_indexes_model_type_index` (`model_type`),
  KEY `rainlab_translate_indexes_item_index` (`item`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table prepa.winter_translate_indexes : ~0 rows (environ)
DELETE FROM `winter_translate_indexes`;
/*!40000 ALTER TABLE `winter_translate_indexes` DISABLE KEYS */;
/*!40000 ALTER TABLE `winter_translate_indexes` ENABLE KEYS */;

-- Listage de la structure de la table prepa. winter_translate_locales
CREATE TABLE IF NOT EXISTS `winter_translate_locales` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_default` tinyint(1) NOT NULL DEFAULT '0',
  `is_enabled` tinyint(1) NOT NULL DEFAULT '0',
  `sort_order` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `rainlab_translate_locales_code_index` (`code`),
  KEY `rainlab_translate_locales_name_index` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table prepa.winter_translate_locales : ~0 rows (environ)
DELETE FROM `winter_translate_locales`;
/*!40000 ALTER TABLE `winter_translate_locales` DISABLE KEYS */;
INSERT INTO `winter_translate_locales` (`id`, `code`, `name`, `is_default`, `is_enabled`, `sort_order`) VALUES
	(1, 'en', 'English', 1, 1, 1);
/*!40000 ALTER TABLE `winter_translate_locales` ENABLE KEYS */;

-- Listage de la structure de la table prepa. winter_translate_messages
CREATE TABLE IF NOT EXISTS `winter_translate_messages` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `message_data` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `found` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `rainlab_translate_messages_code_index` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table prepa.winter_translate_messages : ~0 rows (environ)
DELETE FROM `winter_translate_messages`;
/*!40000 ALTER TABLE `winter_translate_messages` DISABLE KEYS */;
/*!40000 ALTER TABLE `winter_translate_messages` ENABLE KEYS */;

-- Listage de la structure de la table prepa. winter_user_mail_blockers
CREATE TABLE IF NOT EXISTS `winter_user_mail_blockers` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `template` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` int unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `rainlab_user_mail_blockers_email_index` (`email`),
  KEY `rainlab_user_mail_blockers_template_index` (`template`),
  KEY `rainlab_user_mail_blockers_user_id_index` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table prepa.winter_user_mail_blockers : ~0 rows (environ)
DELETE FROM `winter_user_mail_blockers`;
/*!40000 ALTER TABLE `winter_user_mail_blockers` DISABLE KEYS */;
/*!40000 ALTER TABLE `winter_user_mail_blockers` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
