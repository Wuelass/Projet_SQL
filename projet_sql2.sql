-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : ven. 22 nov. 2024 à 11:24
-- Version du serveur : 8.2.0
-- Version de PHP : 8.2.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `projet_sql2`
--

-- --------------------------------------------------------

--
-- Structure de la table `address`
--

DROP TABLE IF EXISTS `address`;
CREATE TABLE IF NOT EXISTS `address` (
  `address_id` int NOT NULL AUTO_INCREMENT,
  `user_id` int DEFAULT NULL,
  `street` varchar(255) NOT NULL,
  `city` varchar(100) NOT NULL,
  `state` varchar(100) DEFAULT NULL,
  `postal_code` varchar(20) DEFAULT NULL,
  `country` varchar(100) NOT NULL,
  PRIMARY KEY (`address_id`),
  KEY `user_id` (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `address`
--

INSERT INTO `address` (`address_id`, `user_id`, `street`, `city`, `state`, `postal_code`, `country`) VALUES
(1, 2, '8, place de Guyon', 'Bertrandnec', 'Array', '47839', 'Sainte Lucie'),
(2, 3, '18, avenue de Diallo', 'Diallo', 'Provence-Alpes-Côte d\'Azur', '84526', 'Territoire britannique de l\'océan Indien'),
(3, 4, 'avenue Torres', 'Barthelemy', 'Centre-Val de Loire', '51003', 'Mali'),
(4, 5, '54, place de Descamps', 'Bergerboeuf', 'Normandie', '00408', 'Christmas (Île)'),
(5, 6, '56, rue Louis Courtois', 'Blotboeuf', 'Pays de la Loire', '41064', 'Namibie'),
(6, 7, '8, rue de Grenier', 'Lemaire', 'Centre-Val de Loire', '87709', 'Liechtenstein'),
(7, 8, 'boulevard Constance Mary', 'Lecoq', 'Auvergne-Rhône-Alpes', '78750', 'Rwanda'),
(8, 9, '26, boulevard de Techer', 'Leveque', 'Auvergne-Rhône-Alpes', '00684', 'Tonga'),
(9, 10, '567, chemin Victor Delannoy', 'Reynaud-sur-Mer', 'Bretagne', '67449', 'Guyane'),
(10, 11, '83, impasse Nicolas Munoz', 'Marechal', 'Occitanie', '60783', 'Fidji (République des)'),
(11, 12, '57, chemin Delannoy', 'Leleu', 'Guyane', '57824', 'Lettonie');

-- --------------------------------------------------------

--
-- Structure de la table `cart`
--

DROP TABLE IF EXISTS `cart`;
CREATE TABLE IF NOT EXISTS `cart` (
  `cart_id` int NOT NULL AUTO_INCREMENT,
  `user_id` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`cart_id`),
  KEY `user_id` (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `cart`
--

INSERT INTO `cart` (`cart_id`, `user_id`, `created_at`) VALUES
(1, 2, '2024-10-31 11:06:55'),
(2, 3, '2024-10-31 11:08:26'),
(3, 4, '2024-10-31 11:08:26'),
(4, 5, '2024-10-31 11:08:26'),
(5, 6, '2024-10-31 11:08:26'),
(6, 7, '2024-10-31 11:08:26'),
(7, 8, '2024-10-31 11:08:26'),
(8, 9, '2024-10-31 11:08:26'),
(9, 10, '2024-10-31 11:08:26'),
(10, 11, '2024-10-31 11:08:26'),
(11, 12, '2024-10-31 11:08:26');

-- --------------------------------------------------------

--
-- Structure de la table `cart_items`
--

DROP TABLE IF EXISTS `cart_items`;
CREATE TABLE IF NOT EXISTS `cart_items` (
  `cart_id` int NOT NULL,
  `product_id` int NOT NULL,
  `quantity` int NOT NULL,
  PRIMARY KEY (`cart_id`,`product_id`),
  KEY `product_id` (`product_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `cart_items`
--

INSERT INTO `cart_items` (`cart_id`, `product_id`, `quantity`) VALUES
(1, 8, 5),
(2, 10, 5),
(2, 3, 2),
(3, 10, 2),
(4, 9, 4),
(4, 4, 2),
(5, 10, 2),
(5, 1, 3),
(6, 9, 4),
(7, 1, 1),
(8, 6, 1),
(9, 1, 2),
(9, 10, 4),
(10, 5, 5),
(11, 5, 2),
(11, 9, 3);

-- --------------------------------------------------------

--
-- Structure de la table `command`
--

DROP TABLE IF EXISTS `command`;
CREATE TABLE IF NOT EXISTS `command` (
  `command_id` int NOT NULL AUTO_INCREMENT,
  `cart_id` int DEFAULT NULL,
  `address_id` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `status` enum('pending','shipped','delivered') DEFAULT 'pending',
  PRIMARY KEY (`command_id`),
  KEY `cart_id` (`cart_id`),
  KEY `address_id` (`address_id`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `command`
--

INSERT INTO `command` (`command_id`, `cart_id`, `address_id`, `created_at`, `status`) VALUES
(1, 1, 2, '2024-10-31 11:06:55', 'shipped'),
(2, 2, 3, '2024-10-31 11:08:26', 'pending'),
(3, 3, 4, '2024-10-31 11:08:26', 'delivered'),
(4, 4, 5, '2024-10-31 11:08:26', 'shipped'),
(5, 5, 6, '2024-10-31 11:08:26', 'delivered'),
(6, 6, 7, '2024-10-31 11:08:26', 'pending'),
(7, 7, 8, '2024-10-31 11:08:26', 'shipped'),
(8, 8, 9, '2024-10-31 11:08:26', 'pending'),
(9, 9, 10, '2024-10-31 11:08:26', 'shipped'),
(10, 10, 11, '2024-10-31 11:08:26', 'shipped'),
(11, 11, 12, '2024-10-31 11:08:26', 'shipped');

-- --------------------------------------------------------

--
-- Structure de la table `invoice`
--

DROP TABLE IF EXISTS `invoice`;
CREATE TABLE IF NOT EXISTS `invoice` (
  `invoice_id` int NOT NULL AUTO_INCREMENT,
  `command_id` int DEFAULT NULL,
  `issued_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `total_amount` decimal(10,2) NOT NULL,
  PRIMARY KEY (`invoice_id`),
  KEY `command_id` (`command_id`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `invoice`
--

INSERT INTO `invoice` (`invoice_id`, `command_id`, `issued_date`, `total_amount`) VALUES
(1, 2, '2024-10-31 11:08:26', 0.00),
(2, 3, '2024-10-31 11:08:26', 0.00),
(3, 4, '2024-10-31 11:08:26', 0.00),
(4, 5, '2024-10-31 11:08:26', 0.00),
(5, 6, '2024-10-31 11:08:26', 0.00),
(6, 7, '2024-10-31 11:08:26', 0.00),
(7, 8, '2024-10-31 11:08:26', 0.00),
(8, 9, '2024-10-31 11:08:26', 0.00),
(9, 10, '2024-10-31 11:08:26', 0.00),
(10, 11, '2024-10-31 11:08:26', 0.00);

-- --------------------------------------------------------

--
-- Structure de la table `product`
--

DROP TABLE IF EXISTS `product`;
CREATE TABLE IF NOT EXISTS `product` (
  `product_id` int NOT NULL AUTO_INCREMENT,
  `product_name` varchar(100) NOT NULL,
  `description` text,
  `price` decimal(10,2) NOT NULL,
  `stock_quantity` int DEFAULT '0',
  PRIMARY KEY (`product_id`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `product`
--

INSERT INTO `product` (`product_id`, `product_name`, `description`, `price`, `stock_quantity`) VALUES
(1, 'et qui dolorum', 'Ut fuga nemo officiis labore ea in.', 92.39, 27),
(2, 'quisquam sit iste', 'Ut est eaque odio voluptate quia assumenda et.', 53.96, 48),
(3, 'laborum est molestiae', 'Ut officia eum qui rerum sit porro.', 60.51, 38),
(4, 'et amet voluptas', 'Expedita ducimus architecto ad sed dolorem aut maiores ut hic aliquam sunt rerum aut.', 79.11, 19),
(5, 'totam voluptas id', 'Sint et voluptatem aut et quo consequatur.', 79.89, 41),
(6, 'ducimus magni ab', 'Consequuntur nihil corporis eos aut sunt ea possimus sed.', 81.64, 24),
(7, 'et voluptas adipisci', 'Recusandae odio ratione harum ipsam sint similique aut.', 10.80, 4),
(8, 'quia rerum quo', 'Nostrum dolore quis qui labore ipsam ex autem.', 87.65, 17),
(9, 'ut rerum eos', 'Et in velit dicta earum aut ducimus suscipit dolor nisi consectetur.', 45.08, 37),
(10, 'nihil est ut', 'Sit sapiente magnam est molestiae consequatur in.', 71.81, 22);

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
  `user_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `phone` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `user`
--

INSERT INTO `user` (`user_id`, `name`, `email`, `phone`) VALUES
(1, 'Lucy Thibault', 'hamon.franck@vallet.com', '+33 8 01 43 94 '),
(2, 'Jules Pons', 'cousin.christophe@live.com', '+33 (0)8 17 29 '),
(3, 'Michel Masson', 'aime.bodin@dbmail.com', '01 91 81 29 63'),
(4, 'Xavier-Dominique Maury', 'bertrand.pauline@neveu.com', '01 45 45 98 76'),
(5, 'Alexandre Fleury', 'kauger@orange.fr', '+33 (0)2 67 19 '),
(6, 'Marine Leroux-Perret', 'roy.veronique@cousin.fr', '0779177965'),
(7, 'Théodore Joubert', 'rferreira@yahoo.fr', '+33 (0)6 93 61 '),
(8, 'Danielle du Lefevre', 'marc.paris@blot.com', '0891777836'),
(9, 'Éléonore Laurent', 'emmanuel.meunier@yahoo.fr', '03 76 72 82 29'),
(10, 'David Valentin', 'odette.pages@laposte.net', '+33 (0)8 21 36 '),
(11, 'Vincent Colin', 'jean60@levy.fr', '+33 (0)7 44 36 '),
(12, 'Nicolas Bouvier', 'anastasie.lebreton@berger.net', '+33 1 28 91 14 ');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
