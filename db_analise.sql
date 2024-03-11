-- --------------------------------------------------------
-- Servidor:                     127.0.0.1
-- Versão do servidor:           10.4.32-MariaDB - mariadb.org binary distribution
-- OS do Servidor:               Win64
-- HeidiSQL Versão:              12.4.0.6659
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Copiando estrutura do banco de dados para db_analise
DROP DATABASE IF EXISTS `db_analise`;
CREATE DATABASE IF NOT EXISTS `db_analise` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */;
USE `db_analise`;

-- Copiando estrutura para tabela db_analise.campeonatos
DROP TABLE IF EXISTS `campeonatos`;
CREATE TABLE IF NOT EXISTS `campeonatos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `str_campeonato` varchar(1000) DEFAULT NULL,
  `str_logo` varchar(1000) DEFAULT NULL,
  `id_categoria` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Copiando dados para a tabela db_analise.campeonatos: ~11 rows (aproximadamente)
DELETE FROM `campeonatos`;
INSERT INTO `campeonatos` (`id`, `str_campeonato`, `str_logo`, `id_categoria`) VALUES
	(1, 'Premier League', 'app/View/Img/Logos/Campeonatos/1.png', 1),
	(2, 'La Liga', 'app/View/Img/Logos/Campeonatos/2.png', 1),
	(3, 'Copa do Rei', 'app/View/Img/Logos/Campeonatos/3.png', 1),
	(4, 'Supercopa da Espanha', 'app/View/Img/Logos/Campeonatos/4.png', 1),
	(5, 'UEFA Champions League', 'app/View/Img/Logos/Campeonatos/5.png', 1),
	(6, 'Campeonato Carioca', 'app/View/Img/Logos/Campeonatos/6.png', 1),
	(7, 'Copa do Brasil', 'app/View/Img/Logos/Campeonatos/7.png', 1),
	(8, 'Brasileirão Série A', 'app/View/Img/Logos/Campeonatos/8.png', 1),
	(9, 'Libertadores', 'app/View/Img/Logos/Campeonatos/9.png', 1),
	(10, 'NBA', 'app/View/Img/Logos/Campeonatos/10.png', 2),
	(11, 'Campeonato Italiano (Série A)', 'app/View/Img/Logos/Campeonatos/11.png', 1);

-- Copiando estrutura para tabela db_analise.categorias
DROP TABLE IF EXISTS `categorias`;
CREATE TABLE IF NOT EXISTS `categorias` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `str_categoria` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Copiando dados para a tabela db_analise.categorias: ~4 rows (aproximadamente)
DELETE FROM `categorias`;
INSERT INTO `categorias` (`id`, `str_categoria`) VALUES
	(1, 'Futebol'),
	(2, 'Basquete'),
	(3, 'Esports'),
	(4, 'Tenis');

-- Copiando estrutura para tabela db_analise.confrontos
DROP TABLE IF EXISTS `confrontos`;
CREATE TABLE IF NOT EXISTS `confrontos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `str_status` varchar(1) DEFAULT NULL,
  `id_campeonato` int(11) NOT NULL,
  `id_time1` int(11) NOT NULL,
  `id_time2` int(11) NOT NULL,
  `int_gols_time1` int(11) DEFAULT NULL,
  `int_gols_time2` int(11) DEFAULT NULL,
  `int_escanteios_time1` int(11) DEFAULT NULL,
  `int_escanteios_time2` int(11) DEFAULT NULL,
  `int_cartoes_am_time1` int(11) DEFAULT NULL,
  `int_cartoes_am_time2` int(11) DEFAULT NULL,
  `int_cartoes_ver_time1` int(11) DEFAULT NULL,
  `int_cartoes_ver_time2` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Copiando dados para a tabela db_analise.confrontos: ~0 rows (aproximadamente)
DELETE FROM `confrontos`;
INSERT INTO `confrontos` (`id`, `str_status`, `id_campeonato`, `id_time1`, `id_time2`, `int_gols_time1`, `int_gols_time2`, `int_escanteios_time1`, `int_escanteios_time2`, `int_cartoes_am_time1`, `int_cartoes_am_time2`, `int_cartoes_ver_time1`, `int_cartoes_ver_time2`) VALUES
	(1, 'P', 2, 3, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- Copiando estrutura para tabela db_analise.failed_jobs
DROP TABLE IF EXISTS `failed_jobs`;
CREATE TABLE IF NOT EXISTS `failed_jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Copiando dados para a tabela db_analise.failed_jobs: ~0 rows (aproximadamente)
DELETE FROM `failed_jobs`;

-- Copiando estrutura para tabela db_analise.gestao
DROP TABLE IF EXISTS `gestao`;
CREATE TABLE IF NOT EXISTS `gestao` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `str_gestao` varchar(50) NOT NULL,
  `flo_banca_inicial` float NOT NULL DEFAULT 0,
  `dat_inicio` date DEFAULT NULL,
  `flo_stoploss` decimal(20,6) NOT NULL DEFAULT 0.000000,
  `dat_fim` date DEFAULT NULL,
  `flo_banca_final` decimal(20,6) NOT NULL DEFAULT 0.000000,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Copiando dados para a tabela db_analise.gestao: ~0 rows (aproximadamente)
DELETE FROM `gestao`;
INSERT INTO `gestao` (`id`, `str_gestao`, `flo_banca_inicial`, `dat_inicio`, `flo_stoploss`, `dat_fim`, `flo_banca_final`) VALUES
	(1, 'Teste Gestão', 100, '2024-03-06', 10.000000, '2024-03-06', 0.000000);

-- Copiando estrutura para tabela db_analise.mercados
DROP TABLE IF EXISTS `mercados`;
CREATE TABLE IF NOT EXISTS `mercados` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `str_mercado` varchar(100) NOT NULL DEFAULT '',
  `id_categoria` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Copiando dados para a tabela db_analise.mercados: ~45 rows (aproximadamente)
DELETE FROM `mercados`;
INSERT INTO `mercados` (`id`, `str_mercado`, `id_categoria`) VALUES
	(1, 'Resultado Final: Casa', 1),
	(2, 'Resultado Final: Fora', 1),
	(3, 'Resultado Final: Empate', 1),
	(4, 'Dupla Chance: Casa/Empate', 1),
	(5, 'Dupla Chance: Fora/Empate', 1),
	(6, 'Dupla Chance: Casa/Fora', 1),
	(7, 'Empate Anula: Casa', 1),
	(8, 'Empate Anula: Fora', 1),
	(9, '+0.5 Gols FT', 1),
	(10, '+0.5 Gols FT: Casa', 1),
	(11, '+0.5 Gols FT: Fora', 1),
	(12, '+0.5 Gols HT', 1),
	(13, '+0.5 Gols HT: Casa', 1),
	(14, '+0.5 Gols HT: Fora', 1),
	(15, '+1.5 Gols FT', 1),
	(16, '+1.5 Gols FT: Casa', 1),
	(17, '+1.5 Gols FT: Fora', 1),
	(18, '+1.5 Gols HT', 1),
	(19, '+1.5 Gols HT: Casa', 1),
	(20, '+1.5 Gols HT: Fora', 1),
	(21, '+2.5 Gols FT', 1),
	(22, '+2.5 Gols FT: Casa', 1),
	(23, '+2.5 Gols FT: Fora', 1),
	(24, '+2.5 Gols HT', 1),
	(25, '+2.5 Gols HT: Casa', 1),
	(26, '+2.5 Gols HT: Fora', 1),
	(27, 'Ambas Marcam', 1),
	(28, '-0.5 Gols FT', 1),
	(29, '-0.5 Gols HT', 1),
	(30, '-1.5 Gols FT', 1),
	(31, '-1.5 Gols HT', 1),
	(32, '-2.5 Gols FT', 1),
	(33, '-2.5 Gols HT', 1),
	(34, '-3.5 Gols FT', 1),
	(35, '-3.5 Gols HT', 1),
	(36, '-4.5 Gols FT', 1),
	(37, '-4.5 Gols HT', 1),
	(38, '-5.5 Gols FT', 1),
	(39, '-5.5 Gols HT', 1),
	(40, 'Ambas Equipes Recebem Um Cartão', 1),
	(41, 'Ambas Equipes Recebem Dois ou Mais Cartões', 1),
	(42, 'Qualificar-se', 1),
	(43, '+0.5 Chutes a Gol', 1),
	(44, '+1.5 Chutes a Gol', 1),
	(45, '+2.5 Chutes ao Gol', 1);

-- Copiando estrutura para tabela db_analise.migrations
DROP TABLE IF EXISTS `migrations`;
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Copiando dados para a tabela db_analise.migrations: ~4 rows (aproximadamente)
DELETE FROM `migrations`;
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
	(1, '2014_10_12_000000_create_users_table', 1),
	(2, '2014_10_12_100000_create_password_reset_tokens_table', 1),
	(3, '2019_08_19_000000_create_failed_jobs_table', 1),
	(4, '2019_12_14_000001_create_personal_access_tokens_table', 1);

-- Copiando estrutura para tabela db_analise.password_reset_tokens
DROP TABLE IF EXISTS `password_reset_tokens`;
CREATE TABLE IF NOT EXISTS `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Copiando dados para a tabela db_analise.password_reset_tokens: ~0 rows (aproximadamente)
DELETE FROM `password_reset_tokens`;

-- Copiando estrutura para tabela db_analise.personal_access_tokens
DROP TABLE IF EXISTS `personal_access_tokens`;
CREATE TABLE IF NOT EXISTS `personal_access_tokens` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) unsigned NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Copiando dados para a tabela db_analise.personal_access_tokens: ~0 rows (aproximadamente)
DELETE FROM `personal_access_tokens`;

-- Copiando estrutura para tabela db_analise.times
DROP TABLE IF EXISTS `times`;
CREATE TABLE IF NOT EXISTS `times` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `str_time` varchar(50) NOT NULL DEFAULT '',
  `str_logo` varchar(50) NOT NULL DEFAULT '',
  `str_campeonatos` varchar(1000) DEFAULT NULL,
  `id_categoria` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Copiando dados para a tabela db_analise.times: ~4 rows (aproximadamente)
DELETE FROM `times`;
INSERT INTO `times` (`id`, `str_time`, `str_logo`, `str_campeonatos`, `id_categoria`) VALUES
	(1, 'Flamengo', 'app/View/Img/Logos/Times/1.png', '8,6,7,9', 1),
	(2, 'Palmeiras', 'app/View/Img/Logos/Times/2.png', '8,6,7,9', 1),
	(3, 'São Paulo', 'app/View/Img/Logos/Times/3.png', '8,7,9', 1),
	(7, 'Arsenal', 'app/View/Img/Logos/Times/7.png', '1,5', 1);

-- Copiando estrutura para tabela db_analise.users
DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Copiando dados para a tabela db_analise.users: ~0 rows (aproximadamente)
DELETE FROM `users`;
INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
	(1, 'Eduardo Lourenço Dias', 'dudu_dias.lourenco@hotmail.com', NULL, '$2y$12$8VI9a0L3CBzbY30LzLlkKOLPJt7eQlh0ipaODc2ZzBr.e97Ps3f9W', NULL, '2024-03-05 20:44:49', '2024-03-05 20:44:49');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
