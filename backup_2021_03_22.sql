/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: allhousing
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `allhousing` (
  `id` int(11) NOT NULL,
  `owner` varchar(50) NOT NULL,
  `ownername` varchar(50) NOT NULL,
  `owned` tinyint(4) NOT NULL,
  `price` int(11) NOT NULL,
  `resalepercent` int(11) NOT NULL,
  `resalejob` varchar(50) NOT NULL,
  `entry` longtext DEFAULT NULL,
  `garage` longtext DEFAULT NULL,
  `furniture` longtext DEFAULT NULL,
  `shell` varchar(50) NOT NULL,
  `interior` varchar(50) NOT NULL,
  `shells` longtext DEFAULT NULL,
  `doors` longtext DEFAULT NULL,
  `housekeys` longtext DEFAULT NULL,
  `wardrobe` longtext DEFAULT NULL,
  `inventory` longtext DEFAULT NULL,
  `inventorylocation` longtext DEFAULT NULL,
  `mortgage_owed` int(11) NOT NULL DEFAULT 0,
  `last_repayment` int(11) NOT NULL DEFAULT 0
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: apartments
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `apartments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `label` varchar(255) DEFAULT NULL,
  `citizenid` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `citizenid` (`citizenid`),
  KEY `name` (`name`)
) ENGINE = InnoDB AUTO_INCREMENT = 4161 DEFAULT CHARSET = latin1;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: api_tokens
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `api_tokens` (
  `token` varchar(255) NOT NULL,
  `purpose` varchar(255) DEFAULT NULL,
  `time` int(25) DEFAULT NULL,
  PRIMARY KEY (`token`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: arsenal_lspd
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `arsenal_lspd` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `modelo` varchar(255) DEFAULT NULL,
  `nome` varchar(255) DEFAULT NULL,
  `tipo` varchar(255) NOT NULL,
  `quantidade` int(2) DEFAULT NULL,
  `img` text DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE = InnoDB AUTO_INCREMENT = 9 DEFAULT CHARSET = utf8;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: bank_accounts
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `bank_accounts` (
  `record_id` bigint(255) NOT NULL AUTO_INCREMENT,
  `citizenid` varchar(250) DEFAULT NULL,
  `buisness` varchar(50) DEFAULT NULL,
  `buisnessid` int(11) DEFAULT NULL,
  `gangid` longtext DEFAULT NULL,
  `amount` text NOT NULL DEFAULT '0',
  `account_type` enum('Current', 'Savings', 'Buisness', 'Gang') NOT NULL DEFAULT 'Current',
  PRIMARY KEY (`record_id`),
  UNIQUE KEY `citizenid` (`citizenid`),
  KEY `buisness` (`buisness`),
  KEY `buisnessid` (`buisnessid`),
  KEY `gangid` (`gangid`(3072))
) ENGINE = InnoDB AUTO_INCREMENT = 25 DEFAULT CHARSET = latin1;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: bank_cards
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `bank_cards` (
  `record_id` bigint(255) NOT NULL AUTO_INCREMENT,
  `steamid` varchar(50) DEFAULT NULL,
  `cardNumber` varchar(50) DEFAULT NULL,
  `cardPin` text DEFAULT NULL,
  `cardActive` tinyint(1) DEFAULT NULL,
  `cardLocked` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`record_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 41 DEFAULT CHARSET = latin1;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: bank_statements
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `bank_statements` (
  `record_id` bigint(255) NOT NULL AUTO_INCREMENT,
  `account` varchar(50) DEFAULT NULL,
  `citizenid` varchar(250) DEFAULT NULL,
  `buisness` varchar(50) DEFAULT NULL,
  `buisnessid` int(11) DEFAULT NULL,
  `gangid` varchar(50) DEFAULT NULL,
  `account_number` int(11) DEFAULT NULL,
  `sort_code` int(11) DEFAULT NULL,
  `deposited` int(11) DEFAULT NULL,
  `withdraw` int(11) DEFAULT NULL,
  `balance` int(11) DEFAULT NULL,
  `date` varchar(50) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`record_id`),
  KEY `character_id` (`citizenid`),
  KEY `account_number` (`account_number`),
  KEY `sort_code` (`sort_code`),
  KEY `buisness` (`buisness`),
  KEY `buisnessid` (`buisnessid`),
  KEY `gangid` (`gangid`)
) ENGINE = InnoDB AUTO_INCREMENT = 2 DEFAULT CHARSET = utf8mb4;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: banks
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `banks` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `coords` longtext DEFAULT NULL,
  `cashiercoords` longtext DEFAULT NULL,
  `beforevaults` longtext DEFAULT NULL,
  `vaults` longtext DEFAULT NULL,
  `vaultgate` longtext DEFAULT NULL,
  `finalgate` longtext DEFAULT NULL,
  `vg_spots` longtext DEFAULT NULL,
  `m_spots` longtext DEFAULT NULL,
  `bankOpen` tinyint(1) NOT NULL DEFAULT 1,
  `bankCooldown` int(11) NOT NULL DEFAULT 0,
  `bankType` enum('Small', 'Big', 'Paleto') NOT NULL DEFAULT 'Small',
  `moneyBags` longtext DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE = InnoDB AUTO_INCREMENT = 11 DEFAULT CHARSET = utf8mb4;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: bans
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `bans` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `steam` varchar(50) DEFAULT NULL,
  `license` varchar(50) DEFAULT NULL,
  `discord` varchar(50) DEFAULT NULL,
  `ip` varchar(50) DEFAULT NULL,
  `reason` text DEFAULT NULL,
  `expire` int(11) DEFAULT NULL,
  `bannedby` varchar(255) NOT NULL DEFAULT 'LeBanhammer',
  PRIMARY KEY (`id`),
  KEY `steam` (`steam`),
  KEY `license` (`license`),
  KEY `discord` (`discord`),
  KEY `ip` (`ip`)
) ENGINE = InnoDB AUTO_INCREMENT = 518 DEFAULT CHARSET = utf8mb4;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: bills
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `bills` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `citizenid` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `amount` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `citizenid` (`citizenid`)
) ENGINE = InnoDB AUTO_INCREMENT = 1111 DEFAULT CHARSET = utf8mb4;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: businesses
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `businesses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `description` varchar(75) NOT NULL,
  `blipname` varchar(75) DEFAULT NULL,
  `owner` varchar(255) DEFAULT NULL,
  `price` int(11) NOT NULL,
  `earnings` int(11) NOT NULL,
  `position` text NOT NULL,
  `stock` int(11) NOT NULL DEFAULT 0,
  `stock_price` int(11) NOT NULL DEFAULT 100,
  `employees` text NOT NULL,
  `taxrate` float DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE = InnoDB AUTO_INCREMENT = 3 DEFAULT CHARSET = utf8mb4;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: crypto
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `crypto` (
  `#` int(11) NOT NULL AUTO_INCREMENT,
  `crypto` varchar(50) NOT NULL DEFAULT 'qbit',
  `worth` int(11) NOT NULL DEFAULT 0,
  `history` text DEFAULT NULL,
  PRIMARY KEY (`#`)
) ENGINE = InnoDB AUTO_INCREMENT = 2 DEFAULT CHARSET = utf8mb4;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: crypto_transactions
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `crypto_transactions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `citizenid` varchar(50) DEFAULT NULL,
  `title` varchar(50) DEFAULT NULL,
  `message` varchar(50) DEFAULT NULL,
  `date` timestamp NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `citizenid` (`citizenid`)
) ENGINE = InnoDB AUTO_INCREMENT = 939 DEFAULT CHARSET = utf8mb4;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: dealers
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `dealers` (
  `#` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL DEFAULT '0',
  `coords` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `time` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `createdby` varchar(50) NOT NULL DEFAULT '0',
  PRIMARY KEY (`#`)
) ENGINE = InnoDB AUTO_INCREMENT = 19 DEFAULT CHARSET = latin1;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: dpkeybinds
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `dpkeybinds` (
  `id` varchar(50) DEFAULT NULL,
  `keybind1` varchar(50) DEFAULT 'num4',
  `emote1` varchar(255) DEFAULT '',
  `keybind2` varchar(50) DEFAULT 'num5',
  `emote2` varchar(255) DEFAULT '',
  `keybind3` varchar(50) DEFAULT 'num6',
  `emote3` varchar(255) DEFAULT '',
  `keybind4` varchar(50) DEFAULT 'num7',
  `emote4` varchar(255) DEFAULT '',
  `keybind5` varchar(50) DEFAULT 'num8',
  `emote5` varchar(255) DEFAULT '',
  `keybind6` varchar(50) DEFAULT 'num9',
  `emote6` varchar(255) DEFAULT ''
) ENGINE = InnoDB DEFAULT CHARSET = latin1;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: end_mechanic
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `end_mechanic` (
  `citizenid` varchar(255) CHARACTER SET latin1 NOT NULL,
  `shopID` int(11) NOT NULL,
  `name` varchar(100) CHARACTER SET latin1 NOT NULL DEFAULT 'Mechanic Shop',
  `money` int(11) NOT NULL DEFAULT 0,
  `employees` longtext NOT NULL DEFAULT '[]',
  `storage` longtext NOT NULL DEFAULT '[]'
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: fine_types
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `fine_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `label` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `amount` int(11) DEFAULT NULL,
  `category` int(11) DEFAULT NULL,
  `jailtime` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE = InnoDB AUTO_INCREMENT = 105 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_bin;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: gang_territoriums
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `gang_territoriums` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `gang` varchar(50) DEFAULT NULL,
  `points` text DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: gangs
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `gangs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `label` varchar(255) DEFAULT NULL,
  `grades` text DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE = InnoDB DEFAULT CHARSET = latin1;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: garagem_ems
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `garagem_ems` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `modelo` varchar(255) DEFAULT NULL,
  `nome` varchar(255) DEFAULT NULL,
  `veh_tipo` varchar(255) NOT NULL,
  `placa` varchar(255) DEFAULT NULL,
  `quantidade` int(2) DEFAULT NULL,
  `img` text DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE = InnoDB AUTO_INCREMENT = 3 DEFAULT CHARSET = utf8;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: garagem_lspd
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `garagem_lspd` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `modelo` varchar(255) DEFAULT NULL,
  `nome` varchar(255) DEFAULT NULL,
  `veh_tipo` varchar(255) NOT NULL,
  `placa` varchar(255) DEFAULT NULL,
  `quantidade` int(2) DEFAULT NULL,
  `img` text DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE = InnoDB AUTO_INCREMENT = 13 DEFAULT CHARSET = utf8;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: gloveboxitems
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `gloveboxitems` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `plate` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `amount` int(11) DEFAULT NULL,
  `info` text DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `slot` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE = InnoDB AUTO_INCREMENT = 8 DEFAULT CHARSET = latin1;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: gloveboxitemsnew
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `gloveboxitemsnew` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `plate` varchar(255) DEFAULT NULL,
  `items` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `plate` (`plate`)
) ENGINE = InnoDB AUTO_INCREMENT = 1554 DEFAULT CHARSET = latin1;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: house_plants
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `house_plants` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `building` varchar(50) DEFAULT NULL,
  `stage` varchar(50) DEFAULT 'stage-a',
  `sort` varchar(50) DEFAULT NULL,
  `gender` varchar(50) DEFAULT NULL,
  `food` int(11) DEFAULT 100,
  `health` int(11) DEFAULT 100,
  `progress` int(11) DEFAULT 0,
  `coords` text DEFAULT NULL,
  `plantid` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `building` (`building`),
  KEY `plantid` (`plantid`)
) ENGINE = InnoDB AUTO_INCREMENT = 7123 DEFAULT CHARSET = utf8mb4;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: houselocations
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `houselocations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `label` varchar(255) DEFAULT NULL,
  `coords` text DEFAULT NULL,
  `owned` tinyint(2) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `tier` tinyint(2) DEFAULT NULL,
  `garage` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`)
) ENGINE = InnoDB AUTO_INCREMENT = 163 DEFAULT CHARSET = latin1;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: jobs
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `jobs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `label` varchar(255) NOT NULL,
  `grades` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE = InnoDB AUTO_INCREMENT = 12 DEFAULT CHARSET = latin1;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: jsfour_dna
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `jsfour_dna` (
  `uid` int(11) NOT NULL AUTO_INCREMENT,
  `parent` int(11) NOT NULL DEFAULT 0,
  `suspect` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `dead` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `weapon` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT 'murder',
  `uploader` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `datum` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  UNIQUE KEY `Index 1` (`uid`)
) ENGINE = InnoDB AUTO_INCREMENT = 46 DEFAULT CHARSET = utf8;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: lapraces
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `lapraces` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `checkpoints` text DEFAULT NULL,
  `records` text DEFAULT NULL,
  `creator` varchar(50) DEFAULT NULL,
  `distance` int(11) DEFAULT NULL,
  `raceid` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `raceid` (`raceid`)
) ENGINE = InnoDB AUTO_INCREMENT = 63 DEFAULT CHARSET = utf8mb4;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: lspd
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `lspd` (
  `id` int(11) NOT NULL,
  `police_id` int(11) NOT NULL,
  `data` text NOT NULL,
  `timer` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `type` tinyint(4) NOT NULL
) ENGINE = InnoDB DEFAULT CHARSET = utf8;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: mdt_reports
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `mdt_reports` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `char_id` varchar(48) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `incident` longtext DEFAULT NULL,
  `charges` longtext DEFAULT NULL,
  `author` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `date` varchar(255) DEFAULT NULL,
  `jailtime` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: mdt_warrants
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `mdt_warrants` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `char_id` varchar(48) DEFAULT NULL,
  `report_id` int(11) DEFAULT NULL,
  `report_title` varchar(255) DEFAULT NULL,
  `charges` longtext DEFAULT NULL,
  `date` varchar(255) DEFAULT NULL,
  `expire` varchar(255) DEFAULT NULL,
  `notes` varchar(255) DEFAULT NULL,
  `author` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: moneysafes
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `moneysafes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `safe` varchar(50) NOT NULL DEFAULT '0',
  `money` int(11) NOT NULL DEFAULT 0,
  `transactions` text NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE = InnoDB DEFAULT CHARSET = latin1;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: nl_usados
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `nl_usados` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `dono` int(11) DEFAULT NULL,
  `dono_nome` varchar(255) DEFAULT NULL,
  `telefone` varchar(20) DEFAULT NULL,
  `modelo` varchar(255) DEFAULT NULL,
  `placa` varchar(20) DEFAULT NULL,
  `preco` int(11) DEFAULT NULL,
  `slot` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE = InnoDB AUTO_INCREMENT = 6 DEFAULT CHARSET = utf8;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: occasion_vehicles
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `occasion_vehicles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `seller` varchar(50) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `description` longtext DEFAULT NULL,
  `plate` varchar(50) DEFAULT NULL,
  `model` varchar(50) DEFAULT NULL,
  `mods` text DEFAULT NULL,
  `occasionid` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `occasionId` (`occasionid`)
) ENGINE = InnoDB AUTO_INCREMENT = 325 DEFAULT CHARSET = utf8mb4;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: org_criminosa
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `org_criminosa` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `id_dono` int(11) DEFAULT NULL,
  `nome` varchar(255) DEFAULT NULL,
  `img` text DEFAULT NULL,
  `membros` text DEFAULT NULL,
  `cargos` text DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE = InnoDB AUTO_INCREMENT = 2 DEFAULT CHARSET = utf8;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: permissions
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `steam` varchar(255) NOT NULL,
  `license` varchar(255) NOT NULL,
  `permission` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `steam` (`steam`)
) ENGINE = InnoDB AUTO_INCREMENT = 56 DEFAULT CHARSET = latin1;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: phone_app_chat
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `phone_app_chat` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `channel` varchar(20) NOT NULL,
  `message` varchar(255) NOT NULL,
  `time` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE = InnoDB AUTO_INCREMENT = 28 DEFAULT CHARSET = utf8;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: phone_calls
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `phone_calls` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `owner` varchar(10) NOT NULL COMMENT 'Num tel proprio',
  `num` varchar(10) NOT NULL COMMENT 'Num reférence du contact',
  `incoming` int(11) NOT NULL COMMENT 'Défini si on est à l''origine de l''appels',
  `time` timestamp NOT NULL DEFAULT current_timestamp(),
  `accepts` int(11) NOT NULL COMMENT 'Appels accepter ou pas',
  PRIMARY KEY (`id`)
) ENGINE = InnoDB AUTO_INCREMENT = 126 DEFAULT CHARSET = utf8;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: phone_invoices
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `phone_invoices` (
  `#` int(11) NOT NULL AUTO_INCREMENT,
  `citizenid` varchar(50) DEFAULT NULL,
  `amount` int(11) NOT NULL DEFAULT 0,
  `invoiceid` varchar(50) NOT NULL DEFAULT '0',
  PRIMARY KEY (`#`),
  KEY `citizenid` (`citizenid`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: phone_messages
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `phone_messages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `transmitter` varchar(10) NOT NULL,
  `receiver` varchar(10) NOT NULL,
  `message` varchar(255) NOT NULL DEFAULT '0',
  `time` timestamp NOT NULL DEFAULT current_timestamp(),
  `isRead` int(11) NOT NULL DEFAULT 0,
  `owner` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE = MyISAM AUTO_INCREMENT = 6734 DEFAULT CHARSET = utf8;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: phone_tweets
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `phone_tweets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `citizenid` varchar(50) DEFAULT NULL,
  `sender` varchar(50) DEFAULT NULL,
  `message` text DEFAULT NULL,
  `date` datetime DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `citizenid` (`citizenid`)
) ENGINE = InnoDB AUTO_INCREMENT = 5436 DEFAULT CHARSET = utf8mb4;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: phone_users_contacts
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `phone_users_contacts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(60) CHARACTER SET utf8mb4 DEFAULT NULL,
  `number` varchar(10) CHARACTER SET utf8mb4 DEFAULT NULL,
  `display` varchar(64) CHARACTER SET utf8mb4 NOT NULL DEFAULT '-1',
  PRIMARY KEY (`id`)
) ENGINE = MyISAM AUTO_INCREMENT = 7 DEFAULT CHARSET = utf8;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: player_boats
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `player_boats` (
  `#` int(11) NOT NULL AUTO_INCREMENT,
  `citizenid` varchar(50) DEFAULT NULL,
  `model` varchar(50) DEFAULT NULL,
  `plate` varchar(50) DEFAULT NULL,
  `boathouse` varchar(50) DEFAULT NULL,
  `fuel` int(11) NOT NULL DEFAULT 100,
  `state` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`#`),
  KEY `citizenid` (`citizenid`)
) ENGINE = InnoDB AUTO_INCREMENT = 16 DEFAULT CHARSET = utf8mb4;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: player_contacts
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `player_contacts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `citizenid` varchar(50) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `number` varchar(50) DEFAULT NULL,
  `iban` varchar(50) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `citizenid` (`citizenid`)
) ENGINE = InnoDB AUTO_INCREMENT = 12437 DEFAULT CHARSET = utf8mb4;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: player_houses
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `player_houses` (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `house` varchar(50) NOT NULL,
  `identifier` varchar(50) DEFAULT NULL,
  `citizenid` varchar(50) DEFAULT NULL,
  `keyholders` text DEFAULT NULL,
  `decorations` text DEFAULT NULL,
  `stash` text DEFAULT NULL,
  `outfit` text DEFAULT NULL,
  `logout` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `house` (`house`),
  KEY `citizenid` (`citizenid`),
  KEY `identifier` (`identifier`)
) ENGINE = InnoDB AUTO_INCREMENT = 95 DEFAULT CHARSET = utf8mb4;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: player_mails
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `player_mails` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `citizenid` varchar(50) DEFAULT NULL,
  `sender` varchar(50) DEFAULT NULL,
  `subject` varchar(50) DEFAULT NULL,
  `message` text DEFAULT NULL,
  `read` tinyint(4) DEFAULT 0,
  `mailid` int(11) DEFAULT NULL,
  `date` timestamp NULL DEFAULT current_timestamp(),
  `button` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `citizenid` (`citizenid`)
) ENGINE = InnoDB AUTO_INCREMENT = 67026 DEFAULT CHARSET = utf8mb4;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: player_outfits
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `player_outfits` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `citizenid` varchar(50) DEFAULT NULL,
  `outfitname` varchar(50) NOT NULL,
  `model` varchar(50) DEFAULT NULL,
  `skin` text DEFAULT NULL,
  `outfitId` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `citizenid` (`citizenid`),
  KEY `outfitId` (`outfitId`)
) ENGINE = InnoDB AUTO_INCREMENT = 8974 DEFAULT CHARSET = utf8mb4;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: player_vehicles
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `player_vehicles` (
  `#` int(11) NOT NULL AUTO_INCREMENT,
  `steam` varchar(50) DEFAULT NULL,
  `citizenid` varchar(50) DEFAULT NULL,
  `vehicle` varchar(50) DEFAULT NULL,
  `hash` varchar(50) DEFAULT NULL,
  `mods` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `plate` varchar(50) NOT NULL,
  `fakeplate` varchar(50) DEFAULT NULL,
  `garage` varchar(50) DEFAULT NULL,
  `fuel` int(11) DEFAULT 100,
  `engine` float DEFAULT 1000,
  `body` float DEFAULT 1000,
  `state` int(11) DEFAULT 1,
  `depotprice` int(11) NOT NULL DEFAULT 0,
  `drivingdistance` int(50) DEFAULT NULL,
  `color` varchar(50) DEFAULT NULL,
  `status` text DEFAULT NULL,
  PRIMARY KEY (`#`),
  KEY `plate` (`plate`),
  KEY `citizenid` (`citizenid`),
  KEY `steam` (`steam`)
) ENGINE = InnoDB AUTO_INCREMENT = 2441 DEFAULT CHARSET = utf8mb4;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: player_warns
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `player_warns` (
  `#` int(11) NOT NULL AUTO_INCREMENT,
  `senderIdentifier` varchar(50) DEFAULT NULL,
  `targetIdentifier` varchar(50) DEFAULT NULL,
  `reason` text DEFAULT NULL,
  `warnId` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`#`)
) ENGINE = InnoDB AUTO_INCREMENT = 129 DEFAULT CHARSET = utf8mb4;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: playerammo
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `playerammo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `citizenid` varchar(255) NOT NULL,
  `ammo` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `citizenid` (`citizenid`)
) ENGINE = InnoDB AUTO_INCREMENT = 3638 DEFAULT CHARSET = latin1;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: playeritems
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `playeritems` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `citizenid` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `amount` int(11) NOT NULL,
  `info` text DEFAULT NULL,
  `type` varchar(255) NOT NULL,
  `slot` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE = InnoDB AUTO_INCREMENT = 255891 DEFAULT CHARSET = latin1;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: players
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `players` (
  `#` int(11) NOT NULL,
  `citizenid` varchar(255) NOT NULL,
  `cid` int(11) DEFAULT NULL,
  `steam` varchar(255) NOT NULL,
  `license` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `money` text NOT NULL,
  `charinfo` text DEFAULT NULL,
  `firstname` text DEFAULT NULL,
  `lastname` text DEFAULT NULL,
  `job` text NOT NULL,
  `gang` text DEFAULT NULL,
  `position` text NOT NULL,
  `metadata` text NOT NULL,
  `inventory` longtext DEFAULT NULL,
  `skills` longtext DEFAULT NULL,
  `zetony` int(11) DEFAULT NULL,
  `last_updated` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE = InnoDB DEFAULT CHARSET = latin1;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: playerskins
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `playerskins` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `citizenid` varchar(255) NOT NULL,
  `model` varchar(255) NOT NULL,
  `skin` text NOT NULL,
  `active` tinyint(2) NOT NULL DEFAULT 1,
  `tattoos` longtext NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `citizenid` (`citizenid`),
  KEY `active` (`active`)
) ENGINE = InnoDB AUTO_INCREMENT = 43036 DEFAULT CHARSET = latin1;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: queue
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `queue` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `steam` varchar(255) NOT NULL,
  `license` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `priority` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE = InnoDB AUTO_INCREMENT = 21 DEFAULT CHARSET = utf8mb4;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: savedobjects
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `savedobjects` (
  `pos` longtext DEFAULT NULL,
  `rot` longtext DEFAULT NULL,
  `model` bigint(20) DEFAULT NULL
) ENGINE = InnoDB DEFAULT CHARSET = utf8;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: stashitems
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `stashitems` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `stash` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `amount` int(11) NOT NULL,
  `info` text NOT NULL,
  `type` varchar(255) NOT NULL,
  `slot` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE = InnoDB AUTO_INCREMENT = 15024 DEFAULT CHARSET = latin1;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: stashitemsnew
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `stashitemsnew` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `stash` varchar(255) NOT NULL,
  `items` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `stash` (`stash`)
) ENGINE = InnoDB AUTO_INCREMENT = 2118 DEFAULT CHARSET = latin1;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: t1ger_druglabs
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `t1ger_druglabs` (
  `citizenid` varchar(100) CHARACTER SET latin1 NOT NULL,
  `labID` int(11) NOT NULL,
  `supplies` int(11) NOT NULL DEFAULT 0,
  `stock` int(11) NOT NULL DEFAULT 0
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: trunkitems
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `trunkitems` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `plate` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `amount` int(11) NOT NULL,
  `info` text NOT NULL,
  `type` varchar(255) NOT NULL,
  `slot` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE = InnoDB AUTO_INCREMENT = 633 DEFAULT CHARSET = latin1;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: trunkitemsnew
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `trunkitemsnew` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `plate` varchar(255) NOT NULL,
  `items` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `plate` (`plate`)
) ENGINE = InnoDB AUTO_INCREMENT = 1127 DEFAULT CHARSET = latin1;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: twitter_accounts
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `twitter_accounts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) CHARACTER SET utf8 NOT NULL DEFAULT '0',
  `password` varchar(50) COLLATE utf8mb4_bin NOT NULL DEFAULT '0',
  `avatar_url` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE = InnoDB AUTO_INCREMENT = 38 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_bin;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: twitter_likes
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `twitter_likes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `authorId` int(11) DEFAULT NULL,
  `tweetId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_twitter_likes_twitter_accounts` (`authorId`),
  KEY `FK_twitter_likes_twitter_tweets` (`tweetId`),
  CONSTRAINT `FK_twitter_likes_twitter_accounts` FOREIGN KEY (`authorId`) REFERENCES `twitter_accounts` (`id`),
  CONSTRAINT `FK_twitter_likes_twitter_tweets` FOREIGN KEY (`tweetId`) REFERENCES `twitter_tweets` (`id`) ON DELETE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 137 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_bin;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: twitter_tweets
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `twitter_tweets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `authorId` int(11) NOT NULL,
  `realUser` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `message` varchar(256) COLLATE utf8mb4_unicode_ci NOT NULL,
  `time` timestamp NOT NULL DEFAULT current_timestamp(),
  `likes` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `FK_twitter_tweets_twitter_accounts` (`authorId`),
  CONSTRAINT `FK_twitter_tweets_twitter_accounts` FOREIGN KEY (`authorId`) REFERENCES `twitter_accounts` (`id`)
) ENGINE = InnoDB AUTO_INCREMENT = 170 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_unicode_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: user_convictions
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `user_convictions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `char_id` varchar(48) DEFAULT NULL,
  `offense` varchar(255) DEFAULT NULL,
  `count` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: user_mdt
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `user_mdt` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `char_id` varchar(48) DEFAULT NULL,
  `notes` varchar(255) DEFAULT NULL,
  `mugshot_url` varchar(255) DEFAULT NULL,
  `fingerprint` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE = InnoDB AUTO_INCREMENT = 2 DEFAULT CHARSET = utf8mb4;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: vrp_banco
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `vrp_banco` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `extrato` varchar(255) DEFAULT NULL,
  `data` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE = InnoDB AUTO_INCREMENT = 20 DEFAULT CHARSET = utf8;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: vrp_cet
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `vrp_cet` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `dono` int(11) DEFAULT NULL,
  `dono_nome` varchar(255) DEFAULT NULL,
  `modelo` varchar(255) DEFAULT NULL,
  `placa` varchar(20) DEFAULT NULL,
  `valor` int(11) DEFAULT NULL,
  `slot` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: vrp_concessionaria
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `vrp_concessionaria` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `modelo` varchar(255) DEFAULT NULL,
  `nome` varchar(255) DEFAULT NULL,
  `preco` int(11) DEFAULT NULL,
  `quantidade` int(11) DEFAULT NULL,
  `descricao` text DEFAULT NULL,
  `tipo` text DEFAULT NULL,
  `img` text DEFAULT NULL,
  UNIQUE KEY `id` (`id`)
) ENGINE = InnoDB AUTO_INCREMENT = 7 DEFAULT CHARSET = utf8;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: vrp_gunshop
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `vrp_gunshop` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_dono` int(11) DEFAULT NULL,
  `nome` varchar(255) DEFAULT NULL,
  `preco` int(11) DEFAULT NULL,
  `a_venda` tinyint(1) DEFAULT NULL,
  `estoque` text DEFAULT NULL,
  `cofre` int(11) DEFAULT NULL,
  `cofreLimite` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE = InnoDB AUTO_INCREMENT = 7 DEFAULT CHARSET = utf8;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: vrp_homes_permissions
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `vrp_homes_permissions` (
  `owner` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `garage` int(11) NOT NULL,
  `home` varchar(100) NOT NULL DEFAULT '',
  `tax` varchar(24) NOT NULL DEFAULT ''
) ENGINE = InnoDB DEFAULT CHARSET = latin1;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: vrp_imobiliaria
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `vrp_imobiliaria` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(255) DEFAULT NULL,
  `preco` int(11) DEFAULT NULL,
  `img` text DEFAULT NULL,
  `categoria` text DEFAULT NULL,
  `a_venda` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE = InnoDB AUTO_INCREMENT = 7 DEFAULT CHARSET = utf8;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: vrp_mercado
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `vrp_mercado` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_dono` int(11) DEFAULT NULL,
  `nome` varchar(255) DEFAULT NULL,
  `preco` int(11) DEFAULT NULL,
  `a_venda` tinyint(1) DEFAULT NULL,
  `estoque` text DEFAULT NULL,
  `cofre` int(11) DEFAULT NULL,
  `cofreLimite` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE = InnoDB AUTO_INCREMENT = 11 DEFAULT CHARSET = utf8;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: vrp_organizacoes
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `vrp_organizacoes` (
  `id` smallint(6) NOT NULL AUTO_INCREMENT,
  `accepted` tinyint(4) NOT NULL DEFAULT 0,
  `data` text DEFAULT NULL,
  UNIQUE KEY `id` (`id`)
) ENGINE = InnoDB AUTO_INCREMENT = 3 DEFAULT CHARSET = utf8;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: vrp_srv_data
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `vrp_srv_data` (
  `dkey` varchar(100) NOT NULL,
  `dvalue` text DEFAULT NULL,
  PRIMARY KEY (`dkey`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: vrp_user_data
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `vrp_user_data` (
  `user_id` int(11) NOT NULL,
  `dkey` varchar(100) NOT NULL,
  `dvalue` text DEFAULT NULL,
  PRIMARY KEY (`user_id`, `dkey`),
  CONSTRAINT `fk_user_data_users` FOREIGN KEY (`user_id`) REFERENCES `vrp_users` (`id`) ON DELETE CASCADE
) ENGINE = InnoDB DEFAULT CHARSET = utf8;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: vrp_user_homes
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `vrp_user_homes` (
  `user_id` int(11) NOT NULL,
  `home` varchar(255) NOT NULL,
  `number` int(11) DEFAULT NULL,
  `locked` tinyint(1) DEFAULT NULL,
  `guardaRoupa` text DEFAULT NULL,
  `bau` text DEFAULT NULL,
  `bauLimite` int(11) DEFAULT NULL,
  PRIMARY KEY (`user_id`, `home`),
  CONSTRAINT `fk_user_homes_users` FOREIGN KEY (`user_id`) REFERENCES `vrp_users` (`id`) ON DELETE CASCADE
) ENGINE = InnoDB DEFAULT CHARSET = utf8;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: vrp_user_identities
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `vrp_user_identities` (
  `user_id` int(11) NOT NULL,
  `age` int(11) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `firstname` varchar(50) DEFAULT NULL,
  `carma` int(11) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `registration` varchar(20) DEFAULT NULL,
  `foto` text DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  KEY `registration` (`registration`),
  KEY `phone` (`phone`),
  CONSTRAINT `fk_user_identities_users` FOREIGN KEY (`user_id`) REFERENCES `vrp_users` (`id`) ON DELETE CASCADE
) ENGINE = InnoDB DEFAULT CHARSET = utf8;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: vrp_user_ids
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `vrp_user_ids` (
  `identifier` varchar(100) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`identifier`),
  KEY `fk_user_ids_users` (`user_id`),
  CONSTRAINT `fk_user_ids_users` FOREIGN KEY (`user_id`) REFERENCES `vrp_users` (`id`) ON DELETE CASCADE
) ENGINE = InnoDB DEFAULT CHARSET = utf8;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: vrp_user_moneys
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `vrp_user_moneys` (
  `user_id` int(11) NOT NULL,
  `wallet` int(11) DEFAULT NULL,
  `bank` int(11) DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  CONSTRAINT `fk_user_moneys_users` FOREIGN KEY (`user_id`) REFERENCES `vrp_users` (`id`) ON DELETE CASCADE
) ENGINE = InnoDB DEFAULT CHARSET = utf8;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: vrp_user_vehicles
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `vrp_user_vehicles` (
  `user_id` int(11) NOT NULL,
  `vehicle` varchar(100) NOT NULL,
  `state` int(11) DEFAULT NULL,
  `placa` varchar(100) DEFAULT NULL,
  `tipo` text DEFAULT NULL,
  `img` text DEFAULT NULL,
  `motor` varchar(100) DEFAULT NULL,
  `lataria` varchar(100) DEFAULT NULL,
  `gasolina` varchar(100) DEFAULT NULL,
  `custom` text DEFAULT NULL,
  `bau` text DEFAULT NULL,
  `bauLimite` int(11) DEFAULT NULL,
  `ipva` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`user_id`, `vehicle`),
  CONSTRAINT `fk_user_vehicles_users` FOREIGN KEY (`user_id`) REFERENCES `vrp_users` (`id`) ON DELETE CASCADE
) ENGINE = InnoDB DEFAULT CHARSET = utf8;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: vrp_users
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `vrp_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `last_login` varchar(255) DEFAULT NULL,
  `whitelisted` tinyint(1) DEFAULT NULL,
  `banned` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE = InnoDB AUTO_INCREMENT = 2 DEFAULT CHARSET = utf8;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: whitelist
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `whitelist` (
  `steam` varchar(255) NOT NULL,
  `license` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`steam`),
  UNIQUE KEY `identifier` (`license`)
) ENGINE = InnoDB DEFAULT CHARSET = latin1;

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: allhousing
# ------------------------------------------------------------

INSERT INTO
  `allhousing` (
    `id`,
    `owner`,
    `ownername`,
    `owned`,
    `price`,
    `resalepercent`,
    `resalejob`,
    `entry`,
    `garage`,
    `furniture`,
    `shell`,
    `interior`,
    `shells`,
    `doors`,
    `housekeys`,
    `wardrobe`,
    `inventory`,
    `inventorylocation`,
    `mortgage_owed`,
    `last_repayment`
  )
VALUES
  (
    1,
    '',
    '',
    0,
    25000,
    0,
    '',
    '{\"z\":23.0,\"w\":200.0,\"x\":54.25,\"y\":-1873.3399658203126}',
    '{\"z\":22.5,\"w\":45.0,\"x\":58.77000045776367,\"y\":-1881.72998046875}',
    '[]',
    'HotelV1',
    '',
    '{\"HotelV1\":true,\"ApartmentV1\":true}',
    NULL,
    '[]',
    '[]',
    '{\"DirtyMoney\":0,\"Weapons\":[],\"Items\":[],\"Cash\":0}',
    '[]',
    0,
    0
  );
INSERT INTO
  `allhousing` (
    `id`,
    `owner`,
    `ownername`,
    `owned`,
    `price`,
    `resalepercent`,
    `resalejob`,
    `entry`,
    `garage`,
    `furniture`,
    `shell`,
    `interior`,
    `shells`,
    `doors`,
    `housekeys`,
    `wardrobe`,
    `inventory`,
    `inventorylocation`,
    `mortgage_owed`,
    `last_repayment`
  )
VALUES
  (
    2,
    '',
    '',
    0,
    25000,
    0,
    '',
    '{\"z\":23.5,\"w\":200.0,\"x\":45.72999954223633,\"y\":-1864.5}',
    '{\"z\":22.82999992370605,\"w\":135.0,\"x\":42.1500015258789,\"y\":-1852.8199462890626}',
    '[]',
    'HotelV1',
    '',
    '{\"HotelV1\":true,\"ApartmentV1\":true}',
    NULL,
    '[]',
    '[]',
    '{\"DirtyMoney\":0,\"Weapons\":[],\"Items\":[],\"Cash\":0}',
    '[]',
    0,
    0
  );
INSERT INTO
  `allhousing` (
    `id`,
    `owner`,
    `ownername`,
    `owned`,
    `price`,
    `resalepercent`,
    `resalejob`,
    `entry`,
    `garage`,
    `furniture`,
    `shell`,
    `interior`,
    `shells`,
    `doors`,
    `housekeys`,
    `wardrobe`,
    `inventory`,
    `inventorylocation`,
    `mortgage_owed`,
    `last_repayment`
  )
VALUES
  (
    3,
    '',
    '',
    0,
    25000,
    0,
    '',
    '{\"z\":24.20000076293945,\"w\":200.0,\"x\":29.85000038146972,\"y\":-1854.449951171875}',
    '[]',
    '[]',
    'HotelV1',
    '',
    '{\"HotelV1\":true,\"ApartmentV1\":true}',
    NULL,
    '[]',
    '[]',
    '{\"DirtyMoney\":0,\"Weapons\":[],\"Items\":[],\"Cash\":0}',
    '[]',
    0,
    0
  );
INSERT INTO
  `allhousing` (
    `id`,
    `owner`,
    `ownername`,
    `owned`,
    `price`,
    `resalepercent`,
    `resalejob`,
    `entry`,
    `garage`,
    `furniture`,
    `shell`,
    `interior`,
    `shells`,
    `doors`,
    `housekeys`,
    `wardrobe`,
    `inventory`,
    `inventorylocation`,
    `mortgage_owed`,
    `last_repayment`
  )
VALUES
  (
    4,
    '',
    '',
    0,
    25000,
    0,
    '',
    '{\"z\":25.0,\"w\":200.0,\"x\":21.14999961853027,\"y\":-1844.3199462890626}',
    '{\"z\":24.29999923706054,\"w\":135.0,\"x\":10.06999969482421,\"y\":-1845.3499755859376}',
    '[]',
    'HotelV1',
    '',
    '{\"HotelV1\":true,\"ApartmentV1\":true}',
    NULL,
    '[]',
    '[]',
    '{\"DirtyMoney\":0,\"Weapons\":[],\"Items\":[],\"Cash\":0}',
    '[]',
    0,
    0
  );
INSERT INTO
  `allhousing` (
    `id`,
    `owner`,
    `ownername`,
    `owned`,
    `price`,
    `resalepercent`,
    `resalejob`,
    `entry`,
    `garage`,
    `furniture`,
    `shell`,
    `interior`,
    `shells`,
    `doors`,
    `housekeys`,
    `wardrobe`,
    `inventory`,
    `inventorylocation`,
    `mortgage_owed`,
    `last_repayment`
  )
VALUES
  (
    5,
    '',
    '',
    0,
    25000,
    0,
    '',
    '{\"z\":24.0,\"w\":200.0,\"x\":5.09000015258789,\"y\":-1884.22998046875}',
    '{\"z\":23.14999961853027,\"w\":319.0,\"x\":15.1899995803833,\"y\":-1883.3699951171876}',
    '[]',
    'HotelV1',
    '',
    '{\"HotelV1\":true,\"ApartmentV1\":true}',
    NULL,
    '[]',
    '[]',
    '{\"DirtyMoney\":0,\"Weapons\":[],\"Items\":[],\"Cash\":0}',
    '[]',
    0,
    0
  );
INSERT INTO
  `allhousing` (
    `id`,
    `owner`,
    `ownername`,
    `owned`,
    `price`,
    `resalepercent`,
    `resalejob`,
    `entry`,
    `garage`,
    `furniture`,
    `shell`,
    `interior`,
    `shells`,
    `doors`,
    `housekeys`,
    `wardrobe`,
    `inventory`,
    `inventorylocation`,
    `mortgage_owed`,
    `last_repayment`
  )
VALUES
  (
    6,
    '',
    '',
    0,
    25000,
    0,
    '',
    '{\"z\":26.5,\"w\":200.0,\"x\":-34.13000106811523,\"y\":-1847.199951171875}',
    '[]',
    '[]',
    'HotelV1',
    '',
    '{\"HotelV1\":true,\"ApartmentV1\":true}',
    NULL,
    '[]',
    '[]',
    '{\"DirtyMoney\":0,\"Weapons\":[],\"Items\":[],\"Cash\":0}',
    '[]',
    0,
    0
  );
INSERT INTO
  `allhousing` (
    `id`,
    `owner`,
    `ownername`,
    `owned`,
    `price`,
    `resalepercent`,
    `resalejob`,
    `entry`,
    `garage`,
    `furniture`,
    `shell`,
    `interior`,
    `shells`,
    `doors`,
    `housekeys`,
    `wardrobe`,
    `inventory`,
    `inventorylocation`,
    `mortgage_owed`,
    `last_repayment`
  )
VALUES
  (
    7,
    '',
    '',
    0,
    25000,
    0,
    '',
    '{\"z\":25.60000038146972,\"w\":200.0,\"x\":-20.51000022888183,\"y\":-1858.719970703125}',
    '{\"z\":25.09000015258789,\"w\":25.09000015258789,\"x\":-22.97999954223632,\"y\":-1852.4300537109376}',
    '[]',
    'HotelV1',
    '',
    '{\"HotelV1\":true,\"ApartmentV1\":true}',
    NULL,
    '[]',
    '[]',
    '{\"DirtyMoney\":0,\"Weapons\":[],\"Items\":[],\"Cash\":0}',
    '[]',
    0,
    0
  );
INSERT INTO
  `allhousing` (
    `id`,
    `owner`,
    `ownername`,
    `owned`,
    `price`,
    `resalepercent`,
    `resalejob`,
    `entry`,
    `garage`,
    `furniture`,
    `shell`,
    `interior`,
    `shells`,
    `doors`,
    `housekeys`,
    `wardrobe`,
    `inventory`,
    `inventorylocation`,
    `mortgage_owed`,
    `last_repayment`
  )
VALUES
  (
    8,
    '',
    '',
    0,
    25000,
    0,
    '',
    '{\"z\":24.5,\"w\":200.0,\"x\":-5.01999998092651,\"y\":-1872.18994140625}',
    '{\"z\":23.64999961853027,\"w\":315.5,\"x\":-4.86999988555908,\"y\":-1883.2900390625}',
    '[]',
    'HotelV1',
    '',
    '{\"HotelV1\":true,\"ApartmentV1\":true}',
    NULL,
    '[]',
    '[]',
    '{\"DirtyMoney\":0,\"Weapons\":[],\"Items\":[],\"Cash\":0}',
    '[]',
    0,
    0
  );
INSERT INTO
  `allhousing` (
    `id`,
    `owner`,
    `ownername`,
    `owned`,
    `price`,
    `resalepercent`,
    `resalejob`,
    `entry`,
    `garage`,
    `furniture`,
    `shell`,
    `interior`,
    `shells`,
    `doors`,
    `housekeys`,
    `wardrobe`,
    `inventory`,
    `inventorylocation`,
    `mortgage_owed`,
    `last_repayment`
  )
VALUES
  (
    9,
    '',
    '',
    0,
    25000,
    0,
    '',
    '{\"z\":23.29999923706054,\"w\":200.0,\"x\":23.23999977111816,\"y\":-1896.550048828125}',
    '{\"z\":22.17000007629394,\"w\":316.6499938964844,\"x\":18.02000045776367,\"y\":-1885.3499755859376}',
    '[]',
    'HotelV1',
    '',
    '{\"HotelV1\":true,\"ApartmentV1\":true}',
    NULL,
    '[]',
    '[]',
    '{\"DirtyMoney\":0,\"Weapons\":[],\"Items\":[],\"Cash\":0}',
    '[]',
    0,
    0
  );
INSERT INTO
  `allhousing` (
    `id`,
    `owner`,
    `ownername`,
    `owned`,
    `price`,
    `resalepercent`,
    `resalejob`,
    `entry`,
    `garage`,
    `furniture`,
    `shell`,
    `interior`,
    `shells`,
    `doors`,
    `housekeys`,
    `wardrobe`,
    `inventory`,
    `inventorylocation`,
    `mortgage_owed`,
    `last_repayment`
  )
VALUES
  (
    10,
    '',
    '',
    0,
    25000,
    0,
    '',
    '{\"z\":22.29999923706054,\"w\":200.0,\"x\":39.11000061035156,\"y\":-1911.5899658203126}',
    '{\"z\":21.67000007629394,\"w\":316.6499938964844,\"x\":39.27000045776367,\"y\":-1924.1099853515626}',
    '[]',
    'HotelV1',
    '',
    '{\"HotelV1\":true,\"ApartmentV1\":true}',
    NULL,
    '[]',
    '[]',
    '{\"DirtyMoney\":0,\"Weapons\":[],\"Items\":[],\"Cash\":0}',
    '[]',
    0,
    0
  );
INSERT INTO
  `allhousing` (
    `id`,
    `owner`,
    `ownername`,
    `owned`,
    `price`,
    `resalepercent`,
    `resalejob`,
    `entry`,
    `garage`,
    `furniture`,
    `shell`,
    `interior`,
    `shells`,
    `doors`,
    `housekeys`,
    `wardrobe`,
    `inventory`,
    `inventorylocation`,
    `mortgage_owed`,
    `last_repayment`
  )
VALUES
  (
    11,
    '',
    '',
    0,
    25000,
    0,
    '',
    '{\"z\":21.90999984741211,\"w\":200.0,\"x\":56.5099983215332,\"y\":-1922.6600341796876}',
    '{\"z\":21.32999992370605,\"w\":319.95001220703127,\"x\":68.0,\"y\":-1921.8599853515626}',
    '[]',
    'HotelV1',
    '',
    '{\"HotelV1\":true,\"ApartmentV1\":true}',
    NULL,
    '[]',
    '[]',
    '{\"DirtyMoney\":0,\"Weapons\":[],\"Items\":[],\"Cash\":0}',
    '[]',
    0,
    0
  );
INSERT INTO
  `allhousing` (
    `id`,
    `owner`,
    `ownername`,
    `owned`,
    `price`,
    `resalepercent`,
    `resalejob`,
    `entry`,
    `garage`,
    `furniture`,
    `shell`,
    `interior`,
    `shells`,
    `doors`,
    `housekeys`,
    `wardrobe`,
    `inventory`,
    `inventorylocation`,
    `mortgage_owed`,
    `last_repayment`
  )
VALUES
  (
    12,
    '',
    '',
    0,
    25000,
    0,
    '',
    '{\"z\":21.3700008392334,\"w\":200.0,\"x\":72.18000030517578,\"y\":-1939.0899658203126}',
    '[]',
    '[]',
    'HotelV1',
    '',
    '{\"HotelV1\":true,\"ApartmentV1\":true}',
    NULL,
    '[]',
    '[]',
    '{\"DirtyMoney\":0,\"Weapons\":[],\"Items\":[],\"Cash\":0}',
    '[]',
    0,
    0
  );
INSERT INTO
  `allhousing` (
    `id`,
    `owner`,
    `ownername`,
    `owned`,
    `price`,
    `resalepercent`,
    `resalejob`,
    `entry`,
    `garage`,
    `furniture`,
    `shell`,
    `interior`,
    `shells`,
    `doors`,
    `housekeys`,
    `wardrobe`,
    `inventory`,
    `inventorylocation`,
    `mortgage_owed`,
    `last_repayment`
  )
VALUES
  (
    13,
    '',
    '',
    0,
    25000,
    0,
    '',
    '{\"z\":21.17000007629394,\"w\":200.0,\"x\":76.20999908447266,\"y\":-1948.1400146484376}',
    '[]',
    '[]',
    'HotelV1',
    '',
    '{\"HotelV1\":true,\"ApartmentV1\":true}',
    NULL,
    '[]',
    '[]',
    '{\"DirtyMoney\":0,\"Weapons\":[],\"Items\":[],\"Cash\":0}',
    '[]',
    0,
    0
  );
INSERT INTO
  `allhousing` (
    `id`,
    `owner`,
    `ownername`,
    `owned`,
    `price`,
    `resalepercent`,
    `resalejob`,
    `entry`,
    `garage`,
    `furniture`,
    `shell`,
    `interior`,
    `shells`,
    `doors`,
    `housekeys`,
    `wardrobe`,
    `inventory`,
    `inventorylocation`,
    `mortgage_owed`,
    `last_repayment`
  )
VALUES
  (
    14,
    '',
    '',
    0,
    25000,
    0,
    '',
    '{\"z\":21.1200008392334,\"w\":200.0,\"x\":85.88999938964844,\"y\":-1959.6800537109376}',
    '{\"z\":20.75,\"w\":316.6499938964844,\"x\":85.61000061035156,\"y\":-1971.300048828125}',
    '[]',
    'HotelV1',
    '',
    '{\"HotelV1\":true,\"ApartmentV1\":true}',
    NULL,
    '[]',
    '[]',
    '{\"DirtyMoney\":0,\"Weapons\":[],\"Items\":[],\"Cash\":0}',
    '[]',
    0,
    0
  );
INSERT INTO
  `allhousing` (
    `id`,
    `owner`,
    `ownername`,
    `owned`,
    `price`,
    `resalepercent`,
    `resalejob`,
    `entry`,
    `garage`,
    `furniture`,
    `shell`,
    `interior`,
    `shells`,
    `doors`,
    `housekeys`,
    `wardrobe`,
    `inventory`,
    `inventorylocation`,
    `mortgage_owed`,
    `last_repayment`
  )
VALUES
  (
    15,
    '',
    '',
    0,
    25000,
    0,
    '',
    '{\"z\":21.32999992370605,\"w\":200.0,\"x\":114.19000244140625,\"y\":-1961.1099853515626}',
    '{\"z\":20.75,\"w\":0.94999998807907,\"x\":103.76000213623047,\"y\":-1957.2900390625}',
    '[]',
    'HotelV1',
    '',
    '{\"HotelV1\":true,\"ApartmentV1\":true}',
    NULL,
    '[]',
    '[]',
    '{\"DirtyMoney\":0,\"Weapons\":[],\"Items\":[],\"Cash\":0}',
    '[]',
    0,
    0
  );
INSERT INTO
  `allhousing` (
    `id`,
    `owner`,
    `ownername`,
    `owned`,
    `price`,
    `resalepercent`,
    `resalejob`,
    `entry`,
    `garage`,
    `furniture`,
    `shell`,
    `interior`,
    `shells`,
    `doors`,
    `housekeys`,
    `wardrobe`,
    `inventory`,
    `inventorylocation`,
    `mortgage_owed`,
    `last_repayment`
  )
VALUES
  (
    16,
    '',
    '',
    0,
    25000,
    0,
    '',
    '{\"z\":21.3799991607666,\"w\":200.0,\"x\":126.68000030517578,\"y\":-1930.06005859375}',
    '{\"z\":20.65999984741211,\"w\":111.95999908447266,\"x\":127.58999633789063,\"y\":-1939.4300537109376}',
    '[]',
    'HotelV1',
    '',
    '{\"HotelV1\":true,\"ApartmentV1\":true}',
    NULL,
    '[]',
    '[]',
    '{\"DirtyMoney\":0,\"Weapons\":[],\"Items\":[],\"Cash\":0}',
    '[]',
    0,
    0
  );
INSERT INTO
  `allhousing` (
    `id`,
    `owner`,
    `ownername`,
    `owned`,
    `price`,
    `resalepercent`,
    `resalejob`,
    `entry`,
    `garage`,
    `furniture`,
    `shell`,
    `interior`,
    `shells`,
    `doors`,
    `housekeys`,
    `wardrobe`,
    `inventory`,
    `inventorylocation`,
    `mortgage_owed`,
    `last_repayment`
  )
VALUES
  (
    17,
    '',
    '',
    0,
    25000,
    0,
    '',
    '{\"z\":21.31999969482422,\"w\":200.0,\"x\":118.41999816894531,\"y\":-1921.1199951171876}',
    '[]',
    '[]',
    'HotelV1',
    '',
    '{\"HotelV1\":true,\"ApartmentV1\":true}',
    NULL,
    '[]',
    '[]',
    '{\"DirtyMoney\":0,\"Weapons\":[],\"Items\":[],\"Cash\":0}',
    '[]',
    0,
    0
  );
INSERT INTO
  `allhousing` (
    `id`,
    `owner`,
    `ownername`,
    `owned`,
    `price`,
    `resalepercent`,
    `resalejob`,
    `entry`,
    `garage`,
    `furniture`,
    `shell`,
    `interior`,
    `shells`,
    `doors`,
    `housekeys`,
    `wardrobe`,
    `inventory`,
    `inventorylocation`,
    `mortgage_owed`,
    `last_repayment`
  )
VALUES
  (
    18,
    '',
    '',
    0,
    25000,
    0,
    '',
    '{\"z\":21.40999984741211,\"w\":200.0,\"x\":100.9000015258789,\"y\":-1912.18994140625}',
    '[]',
    '[]',
    'HotelV1',
    '',
    '{\"HotelV1\":true,\"ApartmentV1\":true}',
    NULL,
    '[]',
    '[]',
    '{\"DirtyMoney\":0,\"Weapons\":[],\"Items\":[],\"Cash\":0}',
    '[]',
    0,
    0
  );
INSERT INTO
  `allhousing` (
    `id`,
    `owner`,
    `ownername`,
    `owned`,
    `price`,
    `resalepercent`,
    `resalejob`,
    `entry`,
    `garage`,
    `furniture`,
    `shell`,
    `interior`,
    `shells`,
    `doors`,
    `housekeys`,
    `wardrobe`,
    `inventory`,
    `inventorylocation`,
    `mortgage_owed`,
    `last_repayment`
  )
VALUES
  (
    19,
    '',
    '',
    0,
    55000,
    0,
    '',
    '{\"z\":71.7300033569336,\"w\":160.6300048828125,\"x\":1301.0899658203126,\"y\":-574.5599975585938}',
    '{\"z\":71.73999786376953,\"w\":343.0,\"x\":1291.0899658203126,\"y\":-583.010009765625}',
    '[]',
    'ApartmentV1',
    '',
    '{\"HotelV1\":true,\"ApartmentV1\":true}',
    NULL,
    '[]',
    '[]',
    '{\"DirtyMoney\":0,\"Weapons\":[],\"Items\":[],\"Cash\":0}',
    '[]',
    0,
    0
  );
INSERT INTO
  `allhousing` (
    `id`,
    `owner`,
    `ownername`,
    `owned`,
    `price`,
    `resalepercent`,
    `resalejob`,
    `entry`,
    `garage`,
    `furniture`,
    `shell`,
    `interior`,
    `shells`,
    `doors`,
    `housekeys`,
    `wardrobe`,
    `inventory`,
    `inventorylocation`,
    `mortgage_owed`,
    `last_repayment`
  )
VALUES
  (
    20,
    '',
    '',
    0,
    55000,
    0,
    '',
    '{\"z\":73.23999786376953,\"w\":0.15000000596046,\"x\":1323.3900146484376,\"y\":-582.9600219726563}',
    '{\"z\":72.93000030517578,\"w\":340.0,\"x\":1312.969970703125,\"y\":-588.8599853515625}',
    '[]',
    'ApartmentV1',
    '',
    '{\"HotelV1\":true,\"ApartmentV1\":true}',
    NULL,
    '[]',
    '[]',
    '{\"DirtyMoney\":0,\"Weapons\":[],\"Items\":[],\"Cash\":0}',
    '[]',
    0,
    0
  );
INSERT INTO
  `allhousing` (
    `id`,
    `owner`,
    `ownername`,
    `owned`,
    `price`,
    `resalepercent`,
    `resalejob`,
    `entry`,
    `garage`,
    `furniture`,
    `shell`,
    `interior`,
    `shells`,
    `doors`,
    `housekeys`,
    `wardrobe`,
    `inventory`,
    `inventorylocation`,
    `mortgage_owed`,
    `last_repayment`
  )
VALUES
  (
    21,
    'steam:110000119780f86',
    'Felipe',
    1,
    55000,
    0,
    '',
    '{\"z\":74.69999694824219,\"w\":220.3000030517578,\"x\":1341.3699951171876,\"y\":-597.1900024414063}',
    '{\"w\":65.61225128173828,\"x\":1336.6751708984376,\"y\":-598.3553466796875,\"z\":78.89329528808594}',
    '[]',
    'ApartmentV1',
    '',
    '{\"HotelV1\":true,\"ApartmentV1\":true}',
    NULL,
    '[]',
    '[]',
    '{\"DirtyMoney\":0,\"Weapons\":[],\"Items\":[],\"Cash\":0}',
    '[]',
    0,
    0
  );
INSERT INTO
  `allhousing` (
    `id`,
    `owner`,
    `ownername`,
    `owned`,
    `price`,
    `resalepercent`,
    `resalejob`,
    `entry`,
    `garage`,
    `furniture`,
    `shell`,
    `interior`,
    `shells`,
    `doors`,
    `housekeys`,
    `wardrobe`,
    `inventory`,
    `inventorylocation`,
    `mortgage_owed`,
    `last_repayment`
  )
VALUES
  (
    22,
    '1',
    'Felipe',
    1,
    55000,
    0,
    '',
    '{\"z\":74.70999908447266,\"w\":0.75999999046325,\"x\":1367.219970703125,\"y\":-606.47998046875}',
    '{\"z\":74.33000183105469,\"w\":360.0,\"x\":1360.2099609375,\"y\":-615.8400268554688}',
    '[]',
    'ApartmentV1',
    '',
    '{\"HotelV1\":true,\"ApartmentV1\":true}',
    NULL,
    '[]',
    '[]',
    '{\"DirtyMoney\":0,\"Weapons\":[],\"Items\":[],\"Cash\":0}',
    '[]',
    0,
    0
  );
INSERT INTO
  `allhousing` (
    `id`,
    `owner`,
    `ownername`,
    `owned`,
    `price`,
    `resalepercent`,
    `resalejob`,
    `entry`,
    `garage`,
    `furniture`,
    `shell`,
    `interior`,
    `shells`,
    `doors`,
    `housekeys`,
    `wardrobe`,
    `inventory`,
    `inventorylocation`,
    `mortgage_owed`,
    `last_repayment`
  )
VALUES
  (
    23,
    'steam:11000013ca91d93',
    'Felipe',
    1,
    55000,
    0,
    '',
    '{\"z\":74.4800033569336,\"w\":75.66000366210938,\"x\":1386.050048828125,\"y\":-593.4099731445313}',
    '{\"z\":74.33000183105469,\"w\":55.20999908447265,\"x\":1389.989990234375,\"y\":-605.3200073242188}',
    '[]',
    'ApartmentV1',
    '',
    '{\"HotelV1\":true,\"ApartmentV1\":true}',
    NULL,
    '[]',
    '[]',
    '{\"DirtyMoney\":0,\"Weapons\":[],\"Items\":[],\"Cash\":0}',
    '[]',
    0,
    0
  );
INSERT INTO
  `allhousing` (
    `id`,
    `owner`,
    `ownername`,
    `owned`,
    `price`,
    `resalepercent`,
    `resalejob`,
    `entry`,
    `garage`,
    `furniture`,
    `shell`,
    `interior`,
    `shells`,
    `doors`,
    `housekeys`,
    `wardrobe`,
    `inventory`,
    `inventorylocation`,
    `mortgage_owed`,
    `last_repayment`
  )
VALUES
  (
    24,
    'steam:11000013ca91d93',
    'Felipe',
    1,
    55000,
    0,
    '',
    '{\"z\":74.48999786376953,\"w\":135.97999572753907,\"x\":1388.9599609375,\"y\":-569.6099853515625}',
    '{\"z\":74.33000183105469,\"w\":115.19999694824219,\"x\":1400.969970703125,\"y\":-572.2000122070313}',
    '[]',
    'ApartmentV1',
    '',
    '{\"HotelV1\":true,\"ApartmentV1\":true}',
    NULL,
    '[]',
    '[]',
    '{\"DirtyMoney\":0,\"Weapons\":[],\"Items\":[],\"Cash\":0}',
    '[]',
    0,
    0
  );
INSERT INTO
  `allhousing` (
    `id`,
    `owner`,
    `ownername`,
    `owned`,
    `price`,
    `resalepercent`,
    `resalejob`,
    `entry`,
    `garage`,
    `furniture`,
    `shell`,
    `interior`,
    `shells`,
    `doors`,
    `housekeys`,
    `wardrobe`,
    `inventory`,
    `inventorylocation`,
    `mortgage_owed`,
    `last_repayment`
  )
VALUES
  (
    25,
    '',
    '',
    0,
    55000,
    0,
    '',
    '{\"z\":74.68000030517578,\"w\":90.43000030517578,\"x\":1373.260009765625,\"y\":-555.8400268554688}',
    '{\"z\":74.33000183105469,\"w\":155.9499969482422,\"x\":1365.3900146484376,\"y\":-547.7999877929688}',
    '[]',
    'ApartmentV1',
    '',
    '{\"HotelV1\":true,\"ApartmentV1\":true}',
    NULL,
    '[]',
    '[]',
    '{\"DirtyMoney\":0,\"Weapons\":[],\"Items\":[],\"Cash\":0}',
    '[]',
    0,
    0
  );
INSERT INTO
  `allhousing` (
    `id`,
    `owner`,
    `ownername`,
    `owned`,
    `price`,
    `resalepercent`,
    `resalejob`,
    `entry`,
    `garage`,
    `furniture`,
    `shell`,
    `interior`,
    `shells`,
    `doors`,
    `housekeys`,
    `wardrobe`,
    `inventory`,
    `inventorylocation`,
    `mortgage_owed`,
    `last_repayment`
  )
VALUES
  (
    26,
    '',
    '',
    0,
    55000,
    0,
    '',
    '{\"z\":73.88999938964844,\"w\":170.16000366210938,\"x\":1348.3399658203126,\"y\":-546.9000244140625}',
    '{\"z\":73.7699966430664,\"w\":160.61000061035157,\"x\":1358.3299560546876,\"y\":-541.3599853515625}',
    '[]',
    'ApartmentV1',
    '',
    '{\"HotelV1\":true,\"ApartmentV1\":true}',
    NULL,
    '[]',
    '[]',
    '{\"DirtyMoney\":0,\"Weapons\":[],\"Items\":[],\"Cash\":0}',
    '[]',
    0,
    0
  );
INSERT INTO
  `allhousing` (
    `id`,
    `owner`,
    `ownername`,
    `owned`,
    `price`,
    `resalepercent`,
    `resalejob`,
    `entry`,
    `garage`,
    `furniture`,
    `shell`,
    `interior`,
    `shells`,
    `doors`,
    `housekeys`,
    `wardrobe`,
    `inventory`,
    `inventorylocation`,
    `mortgage_owed`,
    `last_repayment`
  )
VALUES
  (
    27,
    '',
    '',
    0,
    55000,
    0,
    '',
    '{\"z\":72.44000244140625,\"w\":90.20999908447266,\"x\":1328.5,\"y\":-536.0}',
    '{\"z\":72.12000274658203,\"w\":159.91000366210938,\"x\":1320.4100341796876,\"y\":-528.3300170898438}',
    '[]',
    'ApartmentV1',
    '',
    '{\"HotelV1\":true,\"ApartmentV1\":true}',
    NULL,
    '[]',
    '[]',
    '{\"DirtyMoney\":0,\"Weapons\":[],\"Items\":[],\"Cash\":0}',
    '[]',
    49500,
    1614995240
  );
INSERT INTO
  `allhousing` (
    `id`,
    `owner`,
    `ownername`,
    `owned`,
    `price`,
    `resalepercent`,
    `resalejob`,
    `entry`,
    `garage`,
    `furniture`,
    `shell`,
    `interior`,
    `shells`,
    `doors`,
    `housekeys`,
    `wardrobe`,
    `inventory`,
    `inventorylocation`,
    `mortgage_owed`,
    `last_repayment`
  )
VALUES
  (
    28,
    'steam:11000013ca91d93',
    'Felipe',
    1,
    55000,
    0,
    '',
    '{\"z\":71.45999908447266,\"w\":180.55999755859376,\"x\":1303.199951171875,\"y\":-527.4600219726563}',
    '{\"z\":71.30999755859375,\"w\":162.44000244140626,\"x\":1312.6600341796876,\"y\":-521.6900024414063}',
    '[]',
    'ApartmentV1',
    '',
    '{\"HotelV1\":true,\"ApartmentV1\":true}',
    NULL,
    '[]',
    '[]',
    '{\"DirtyMoney\":0,\"Weapons\":[],\"Items\":[],\"Cash\":0}',
    '[]',
    0,
    0
  );

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: apartments
# ------------------------------------------------------------

INSERT INTO
  `apartments` (`id`, `name`, `type`, `label`, `citizenid`)
VALUES
  (
    4144,
    'apartment3310',
    'apartment3',
    'Integrity Way 310',
    'LRP87077'
  );
INSERT INTO
  `apartments` (`id`, `name`, `type`, `label`, `citizenid`)
VALUES
  (
    4145,
    'apartment36432',
    'apartment3',
    'Integrity Way 6432',
    'DUK13299'
  );
INSERT INTO
  `apartments` (`id`, `name`, `type`, `label`, `citizenid`)
VALUES
  (
    4146,
    'apartment58618',
    'apartment5',
    'Fantastic Plaza 8618',
    'FTB86373'
  );
INSERT INTO
  `apartments` (`id`, `name`, `type`, `label`, `citizenid`)
VALUES
  (
    4147,
    'apartment47475',
    'apartment4',
    'Tinsel Towers 7475',
    'YFH94042'
  );
INSERT INTO
  `apartments` (`id`, `name`, `type`, `label`, `citizenid`)
VALUES
  (
    4148,
    'apartment49050',
    'apartment4',
    'Tinsel Towers 9050',
    'ULS88307'
  );
INSERT INTO
  `apartments` (`id`, `name`, `type`, `label`, `citizenid`)
VALUES
  (
    4149,
    'apartment37400',
    'apartment3',
    'Integrity Way 7400',
    'NGR07907'
  );
INSERT INTO
  `apartments` (`id`, `name`, `type`, `label`, `citizenid`)
VALUES
  (
    4150,
    'apartment31973',
    'apartment3',
    'Integrity Way 1973',
    'IHN96025'
  );
INSERT INTO
  `apartments` (`id`, `name`, `type`, `label`, `citizenid`)
VALUES
  (
    4151,
    'apartment39726',
    'apartment3',
    'Integrity Way 9726',
    'OEA13112'
  );
INSERT INTO
  `apartments` (`id`, `name`, `type`, `label`, `citizenid`)
VALUES
  (
    4152,
    'apartment39213',
    'apartment3',
    'Integrity Way 9213',
    'UCU66269'
  );
INSERT INTO
  `apartments` (`id`, `name`, `type`, `label`, `citizenid`)
VALUES
  (
    4153,
    'apartment23493',
    'apartment2',
    'Morningwood Blvd 3493',
    'RKB90005'
  );
INSERT INTO
  `apartments` (`id`, `name`, `type`, `label`, `citizenid`)
VALUES
  (
    4154,
    'apartment31991',
    'apartment3',
    'Integrity Way 1991',
    'TPL08484'
  );
INSERT INTO
  `apartments` (`id`, `name`, `type`, `label`, `citizenid`)
VALUES
  (
    4155,
    'apartment18330',
    'apartment1',
    'South Rockford Drive 8330',
    'MHS13929'
  );
INSERT INTO
  `apartments` (`id`, `name`, `type`, `label`, `citizenid`)
VALUES
  (
    4156,
    'apartment57978',
    'apartment5',
    'Fantastic Plaza 7978',
    'SWS16905'
  );
INSERT INTO
  `apartments` (`id`, `name`, `type`, `label`, `citizenid`)
VALUES
  (
    4157,
    'apartment12061',
    'apartment1',
    'South Rockford Drive 2061',
    'YVB96377'
  );
INSERT INTO
  `apartments` (`id`, `name`, `type`, `label`, `citizenid`)
VALUES
  (
    4158,
    'apartment21336',
    'apartment2',
    'Morningwood Blvd 1336',
    'HCA16181'
  );
INSERT INTO
  `apartments` (`id`, `name`, `type`, `label`, `citizenid`)
VALUES
  (
    4159,
    'apartment56804',
    'apartment5',
    'Fantastic Plaza 6804',
    'NUS45975'
  );
INSERT INTO
  `apartments` (`id`, `name`, `type`, `label`, `citizenid`)
VALUES
  (
    4160,
    'apartment12649',
    'apartment1',
    'South Rockford Drive 2649',
    'ZBX75995'
  );

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: api_tokens
# ------------------------------------------------------------


# ------------------------------------------------------------
# DATA DUMP FOR TABLE: arsenal_lspd
# ------------------------------------------------------------

INSERT INTO
  `arsenal_lspd` (`id`, `modelo`, `nome`, `tipo`, `quantidade`, `img`)
VALUES
  (
    1,
    'WEAPON_PISTOL',
    'Pistola',
    'pistola',
    99,
    'https://vignette.wikia.nocookie.net/gtawiki/images/d/d3/Pistol.50-GTAVPC-HUD.png/revision/latest?cb=20150419121107'
  );
INSERT INTO
  `arsenal_lspd` (`id`, `modelo`, `nome`, `tipo`, `quantidade`, `img`)
VALUES
  (
    2,
    'WEAPON_ASSAULTRIFLE',
    'Assault',
    'rifle',
    88,
    'https://i.imgur.com/IUEUsJk.png'
  );

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: bank_accounts
# ------------------------------------------------------------


# ------------------------------------------------------------
# DATA DUMP FOR TABLE: bank_cards
# ------------------------------------------------------------


# ------------------------------------------------------------
# DATA DUMP FOR TABLE: bank_statements
# ------------------------------------------------------------


# ------------------------------------------------------------
# DATA DUMP FOR TABLE: banks
# ------------------------------------------------------------

INSERT INTO
  `banks` (
    `id`,
    `name`,
    `coords`,
    `cashiercoords`,
    `beforevaults`,
    `vaults`,
    `vaultgate`,
    `finalgate`,
    `vg_spots`,
    `m_spots`,
    `bankOpen`,
    `bankCooldown`,
    `bankType`,
    `moneyBags`
  )
VALUES
  (
    1,
    'Fleeca',
    '{\"x\":149.88,\"y\":-1040.34,\"z\":29.37,\"h\":157.66}',
    '{\"door\":{\"outside\":{\"x\":145.26,\"y\":-1041.17,\"z\":29.37,\"h\":242.62},\"coords\":{\"x\":145.4186,\"y\":-1041.813,\"z\":29.64255}, \"hash\":-131754413, \"oh\":160.0 , \"ch\":249.846}, \"counters\":[{\"x\":146.87,\"y\":-1041.12,\"z\":29.37,\"h\":339.77},{\"x\":148.23,\"y\":-1041.62,\"z\":29.37,\"h\":345.57},{\"x\":149.66,\"y\":-1042.15,\"z\":29.37,\"h\":346.35},{\"x\":150.98,\"y\":-1042.62,\"z\":29.37,\"h\":332.29}]}',
    NULL,
    '{\"door\":{\"thermite\":{\"spark\":{\"x\":147.515,\"y\":-1044.41,\"z\":29.47},\"drip\":{\"x\":147.29,\"y\":-1045.41,\"z\":29.37},\"bomb\":{\"offset\":{\"x\":0.20,\"y\":-0.025,\"z\":0.15},\"rotation\":{\"x\":90.0,\"y\":-90.0,\"z\":0.0}},\"heading\":250.0},\"coords\":{\"x\":148.0266,\"y\":-1044.364,\"z\":29.50693}, \"hash\":2121050683, \"oh\": 160.0, \"ch\":249.846}, \"coords\":{\"x\":146.94,\"y\":-1046.14,\"z\":29.37,\"h\":247.43}}',
    '{\"door\":{\"coords\":{\"x\":150.2913,\"y\":-1047.629,\"z\":29.6663}, \"hash\":-1591004109, \"oh\": 90.0, \"ch\":159.478}, \"coords\":{\"x\":148.55,\"y\":-1046.29,\"z\":29.35,\"h\":162.25}}',
    NULL,
    '[{\"x\":151.18,\"y\":-1046.7,\"z\":29.35,\"h\":248.73},{\"x\":150.53,\"y\":-1045.16,\"z\":29.35,\"h\":340.25},{\"x\":149.03,\"y\":-1044.7,\"z\":29.35,\"h\":333.25}]',
    '[{\"x\":147.11,\"y\":-1047.69,\"z\":29.35,\"h\":77.05},{\"x\":146.6,\"y\":-1049.02,\"z\":29.35,\"h\":69.09},{\"x\":146.94,\"y\":-1050.24,\"z\":29.35,\"h\":160.26},{\"x\":149.21,\"y\":-1051.16,\"z\":29.35,\"h\":158.39},{\"x\":150.6,\"y\":-1049.09,\"z\":29.35,\"h\":253.12}]',
    1,
    0,
    'Small',
    NULL
  );
INSERT INTO
  `banks` (
    `id`,
    `name`,
    `coords`,
    `cashiercoords`,
    `beforevaults`,
    `vaults`,
    `vaultgate`,
    `finalgate`,
    `vg_spots`,
    `m_spots`,
    `bankOpen`,
    `bankCooldown`,
    `bankType`,
    `moneyBags`
  )
VALUES
  (
    2,
    'Fleeca 2',
    '{\"x\":-350.83,\"y\":-49.6,\"z\":49.04,\"h\":156.65}',
    '{\"door\":{\"outside\":{\"x\":-355.5,\"y\":-50.52,\"z\":49.04,\"h\":250.89},\"coords\":{\"x\":-355.3892,\"y\":-51.06769,\"z\":49.31105}, \"hash\":-131754413, \"oh\":160.0 , \"ch\":249.846}, \"counters\":[{\"x\":-354.06,\"y\":-50.37,\"z\":49.04,\"h\":340.74},{\"x\":-352.64,\"y\":-50.92,\"z\":49.04,\"h\":342.21},{\"x\":-351.15,\"y\":-51.34,\"z\":49.04,\"h\":339.83},{\"x\":-349.83,\"y\":-51.82,\"z\":49.04,\"h\":332.06}]}',
    NULL,
    '{\"door\":{\"thermite\":{\"spark\":{\"x\":-353.235,\"y\":-53.645,\"z\":49.14},\"drip\":{\"x\":-353.41,\"y\":-54.53,\"z\":49.04},\"bomb\":{\"rotation\":{\"x\":90.0,\"y\":-90.0,\"z\":0.0},\"offset\":{\"x\":0.25,\"y\":-0.125,\"z\":0.15}},\"heading\":250.0},\"coords\":{\"x\":-352.7365,\"y\":-53.57248,\"z\":49.17543}, \"hash\":2121050683, \"oh\": 160.0, \"ch\":249.846}, \"coords\":{\"x\":-353.85,\"y\":-55.32,\"z\":49.04,\"h\":247.94}}',
    '{\"door\":{\"coords\":{\"x\":-350.4144,\"y\":-56.79705,\"z\":49.3348}, \"hash\":-1591004109, \"oh\": 90.0, \"ch\":159.478}, \"coords\":{\"x\":-352.16,\"y\":-55.5,\"z\":49.01,\"h\":155.42}}',
    NULL,
    '[{\"x\":-349.55,\"y\":-55.83,\"z\":49.01,\"h\":250.5},{\"x\":-350.3,\"y\":-54.37,\"z\":49.01,\"h\":335.7},{\"x\":-351.58,\"y\":-53.84,\"z\":49.01,\"h\":344.11}]',
    '[{\"x\":-353.56,\"y\":-56.99,\"z\":49.01,\"h\":71.28},{\"x\":-354.12,\"y\":-58.49,\"z\":49.01,\"h\":70.56},{\"x\":-353.35,\"y\":-59.59,\"z\":49.01,\"h\":159.66},{\"x\":-351.55,\"y\":-60.29,\"z\":49.01,\"h\":169.66},{\"x\":-350.17,\"y\":-59.12,\"z\":49.01,\"h\":252.22}]',
    1,
    0,
    'Small',
    NULL
  );
INSERT INTO
  `banks` (
    `id`,
    `name`,
    `coords`,
    `cashiercoords`,
    `beforevaults`,
    `vaults`,
    `vaultgate`,
    `finalgate`,
    `vg_spots`,
    `m_spots`,
    `bankOpen`,
    `bankCooldown`,
    `bankType`,
    `moneyBags`
  )
VALUES
  (
    3,
    'Fleeca 3',
    '{\"y\":-278.46,\"z\":54.17,\"h\":161.96,\"x\":314.36}',
    '{\"door\":{\"outside\":{\"y\":-279.61,\"z\":54.16,\"h\":257.06,\"x\":309.62},\"coords\":{\"x\":309.74914550781,\"y\":-280.1796875,\"z\":54.439262390137}, \"hash\":-131754413, \"oh\":170.0 , \"ch\":249.86596679688}, \"counters\":[{\"y\":-279.47,\"z\":54.16,\"h\":336.19,\"x\":311.17},{\"y\":-280.04,\"z\":54.16,\"h\":335.54,\"x\":312.59},{\"y\":-280.57,\"z\":54.16,\"h\":348.41,\"x\":314.09},{\"y\":-281.04,\"z\":54.16,\"h\":346.89,\"x\":315.44}]}',
    NULL,
    '{\"door\":{\"thermite\":{\"spark\":{\"x\":311.85,\"y\":-282.7875,\"z\":54.26},\"drip\":{\"x\":311.6,\"y\":-283.75,\"z\":54.16},\"bomb\":{\"rotation\":{\"x\":-90.0,\"y\":-70.0,\"z\":0.0},\"offset\":{\"x\":0.2775,\"y\":-0.04525,\"z\":0.15}},\"heading\":250.8},\"coords\":{\"x\":312.35800170898,\"y\":-282.73013305664,\"z\":54.303646087646}, \"hash\":2121050683, \"oh\": 160.0, \"ch\":249.86596679688}, \"coords\":{\"y\":-284.47,\"z\":54.16,\"h\":238.11,\"x\":311.25}}',
    '{\"door\":{\"coords\":{\"x\":314.62387084961,\"y\":-285.99447631836,\"z\":54.463008880615}, \"hash\":-1591004109, \"oh\": 90.0, \"ch\":159.86486816406}, \"coords\":{\"y\":-284.65,\"z\":54.14,\"h\":156.52,\"x\":312.85}}',
    NULL,
    '[{\"y\":-282.92,\"z\":54.14,\"h\":332.43,\"x\":313.28},{\"y\":-283.55,\"z\":54.14,\"h\":342.97,\"x\":314.91},{\"y\":-285.06,\"z\":54.14,\"h\":269.63,\"x\":315.49}]',
    '[{\"y\":-286.9,\"z\":54.14,\"h\":65.4,\"x\":311.13},{\"y\":-288.78,\"z\":54.14,\"h\":161.69,\"x\":311.49},{\"y\":-289.41,\"z\":54.14,\"h\":161.05,\"x\":313.18},{\"y\":-288.29,\"z\":54.14,\"h\":250.12,\"x\":314.91}]',
    1,
    0,
    'Small',
    NULL
  );
INSERT INTO
  `banks` (
    `id`,
    `name`,
    `coords`,
    `cashiercoords`,
    `beforevaults`,
    `vaults`,
    `vaultgate`,
    `finalgate`,
    `vg_spots`,
    `m_spots`,
    `bankOpen`,
    `bankCooldown`,
    `bankType`,
    `moneyBags`
  )
VALUES
  (
    4,
    'Fleeca 4',
    '{\"y\":-330.26,\"z\":37.79,\"h\":202.22,\"x\":-1212.98}',
    '{\"door\":{\"outside\":{\"y\":-334.43,\"z\":37.78,\"h\":297.06,\"x\":-1215.42},\"coords\":{\"x\":-1214.9053955078,\"y\":-334.72808837891,\"z\":38.055507659912}, \"hash\":-131754413, \"oh\":206.0 , \"ch\":296.86373901367}, \"counters\":[{\"y\":-333.21,\"z\":37.78,\"h\":20.72,\"x\":-1214.47},{\"y\":-332.53,\"z\":37.78,\"h\":27.31,\"x\":-1213.13},{\"y\":-331.85,\"z\":37.78,\"h\":23.82,\"x\":-1211.79},{\"y\":-331.23,\"z\":37.78,\"h\":29.4,\"x\":-1210.52}]}',
    NULL,
    '{\"door\":{\"thermite\":{\"spark\":{\"x\":-1210.84,\"y\":-334.672,\"z\":37.88},\"drip\":{\"y\":-335.82,\"z\":37.78,\"h\":292.56,\"x\":-1211.04},\"bomb\":{\"rotation\":{\"x\":-90.0,\"y\":-117.0,\"z\":0.0},\"offset\":{\"x\":0.2275,\"y\":0.18525,\"z\":0.15}},\"heading\":300.0},\"coords\":{\"x\":-1211.2609863281,\"y\":-334.55960083008,\"z\":37.919891357422}, \"hash\":2121050683, \"oh\": 206.0, \"ch\":296.86373901367}, \"coords\":{\"y\":-336.54,\"z\":37.78,\"h\":300.07,\"x\":-1210.74}}',
    '{\"door\":{\"coords\":{\"x\":-1207.3282470703,\"y\":-335.12893676758,\"z\":38.079254150391}, \"hash\":-1591004109, \"oh\": 116.0, \"ch\":206.86373901367}, \"coords\":{\"y\":-335.44,\"z\":37.76,\"h\":208.27,\"x\":-1209.54}}',
    NULL,
    '[{\"y\":-333.94,\"z\":37.76,\"h\":18.13,\"x\":-1210.35},{\"y\":-333.27,\"z\":37.76,\"h\":17.2,\"x\":-1208.9},{\"y\":-333.75,\"z\":37.76,\"h\":297.68,\"x\":-1207.46}]',
    '[{\"y\":-338.26,\"z\":37.76,\"h\":116.27,\"x\":-1209.09},{\"y\":-339.5,\"z\":37.76,\"h\":209.88,\"x\":-1207.77},{\"y\":-338.33,\"z\":37.76,\"h\":206.97,\"x\":-1205.55},{\"y\":-336.61,\"z\":37.76,\"h\":293.18,\"x\":-1205.48}]',
    1,
    0,
    'Small',
    NULL
  );
INSERT INTO
  `banks` (
    `id`,
    `name`,
    `coords`,
    `cashiercoords`,
    `beforevaults`,
    `vaults`,
    `vaultgate`,
    `finalgate`,
    `vg_spots`,
    `m_spots`,
    `bankOpen`,
    `bankCooldown`,
    `bankType`,
    `moneyBags`
  )
VALUES
  (
    5,
    'Fleeca 5',
    '{\"y\":482.81,\"z\":15.7,\"h\":263.13,\"x\":-2963.45}',
    '{\"door\":{\"outside\":{\"y\":478.74,\"z\":15.7,\"h\":2.36,\"x\":-2960.71},\"coords\":{\"x\":-2960.1762695313,\"y\":479.0104675293,\"z\":15.971563339233}, \"hash\":-131754413, \"oh\":267.0 , \"ch\":357.54205322266}, \"counters\":[{\"y\":480.22,\"z\":15.7,\"h\":102.5,\"x\":-2961.21},{\"y\":481.59,\"z\":15.7,\"h\":80.38,\"x\":-2961.19},{\"y\":483.14,\"z\":15.7,\"h\":89.06,\"x\":-2961.07},{\"y\":484.51,\"z\":15.7,\"h\":89.16,\"x\":-2961.09}]}',
    NULL,
    '{\"door\":{\"thermite\":{\"spark\":{\"x\":-2957.353,\"y\":483.2,\"z\":15.75},\"drip\":{\"y\":481.9,\"z\":15.7,\"h\":292.56,\"x\":-2957.33},\"bomb\":{\"rotation\":{\"x\":-90.0,\"y\":-180.0,\"z\":0.0},\"offset\":{\"x\":-0.0495,\"y\":0.22525,\"z\":0.15}},\"heading\":355.0},\"coords\":{\"x\":-2958.5385742188,\"y\":482.27056884766,\"z\":15.83594417572}, \"hash\":-63539571, \"oh\": 267.0, \"ch\":357.54205322266}, \"coords\":{\"y\":481.7,\"z\":15.7,\"h\":4.28,\"x\":-2956.5}}',
    '{\"door\":{\"coords\":{\"x\":-2956.1162109375,\"y\":485.42059326172,\"z\":15.995308876038}, \"hash\":-1591004109, \"oh\": 197.0, \"ch\":267.54205322266}, \"coords\":{\"y\":483.33,\"z\":15.68,\"h\":273.76,\"x\":-2956.87}}',
    NULL,
    '[{\"y\":483.36,\"z\":15.68,\"h\":88.47,\"x\":-2958.6},{\"y\":485.0,\"z\":15.68,\"h\":84.28,\"x\":-2958.44},{\"y\":485.96,\"z\":15.68,\"h\":359.14,\"x\":-2957.34}]',
    '[{\"y\":482.38,\"z\":15.68,\"h\":177.51,\"x\":-2954.18},{\"y\":483.4,\"z\":15.68,\"h\":269.76,\"x\":-2952.52},{\"y\":485.46,\"z\":15.68,\"h\":265.06,\"x\":-2952.43},{\"y\":486.28,\"z\":15.68,\"h\":350.95,\"x\":-2954.08}]',
    1,
    0,
    'Small',
    NULL
  );
INSERT INTO
  `banks` (
    `id`,
    `name`,
    `coords`,
    `cashiercoords`,
    `beforevaults`,
    `vaults`,
    `vaultgate`,
    `finalgate`,
    `vg_spots`,
    `m_spots`,
    `bankOpen`,
    `bankCooldown`,
    `bankType`,
    `moneyBags`
  )
VALUES
  (
    6,
    'Fleeca 6',
    '{\"y\":2706.07,\"z\":38.09,\"h\":3.7,\"x\":1175.15}',
    '{\"door\":{\"outside\":{\"y\":2708.92,\"z\":38.09,\"h\":93.29,\"x\":1179.26},\"coords\":{\"x\":1178.8695068359,\"y\":2709.3647460938,\"z\":38.362506866455}, \"hash\":-131754413, \"oh\":0.1 , \"ch\":90.0}, \"counters\":[{\"y\":2708.25,\"z\":38.09,\"h\":173.3,\"x\":1177.77},{\"y\":2708.23,\"z\":38.09,\"h\":181.91,\"x\":1176.23},{\"y\":2708.24,\"z\":38.09,\"h\":187.4,\"x\":1174.81},{\"y\":2708.21,\"z\":38.09,\"h\":183.0,\"x\":1173.38}]}',
    NULL,
    '{\"door\":{\"thermite\":{\"spark\":{\"x\":1175.66,\"y\":2713.025,\"z\":38.19},\"drip\":{\"y\":2712.09,\"z\":38.09,\"h\":92.71,\"x\":1175.86},\"bomb\":{\"rotation\":{\"x\":-90.0,\"y\":-270.0,\"z\":0.0},\"offset\":{\"x\":-0.2195,\"y\":-0.05925,\"z\":0.13}},\"heading\":90.0},\"coords\":{\"x\":1175.5421142578,\"y\":2710.861328125,\"z\":38.226890563965}, \"hash\":2121050683, \"oh\": 0.1, \"ch\":90.0}, \"coords\":{\"y\":2712.88,\"z\":38.09,\"h\":97.27,\"x\":1175.97}}',
    '{\"door\":{\"coords\":{\"x\":1172.2911376953,\"y\":2713.1462402344,\"z\":38.386253356934}, \"hash\":-1591004109, \"oh\": 289.0, \"ch\":359.0}, \"coords\":{\"y\":2712.49,\"z\":38.07,\"h\":2.81,\"x\":1174.41}}',
    NULL,
    '[{\"y\":2710.82,\"z\":38.07,\"h\":183.46,\"x\":1174.3},{\"y\":2710.73,\"z\":38.07,\"h\":186.75,\"x\":1172.99},{\"y\":2711.95,\"z\":38.07,\"h\":90.38,\"x\":1171.78}]',
    '[{\"y\":2715.16,\"z\":38.07,\"h\":271.11,\"x\":1175.2},{\"y\":2716.82,\"z\":38.07,\"h\":356.82,\"x\":1174.22}{\"y\":2716.82,\"z\":38.07,\"h\":356.82,\"x\":1174.22},{\"y\":2716.79,\"z\":38.07,\"h\":1.54,\"x\":1172.25},{\"y\":2715.23,\"z\":38.07,\"h\":99.02,\"x\":1171.22}]',
    1,
    0,
    'Small',
    NULL
  );
INSERT INTO
  `banks` (
    `id`,
    `name`,
    `coords`,
    `cashiercoords`,
    `beforevaults`,
    `vaults`,
    `vaultgate`,
    `finalgate`,
    `vg_spots`,
    `m_spots`,
    `bankOpen`,
    `bankCooldown`,
    `bankType`,
    `moneyBags`
  )
VALUES
  (
    7,
    'Fleeca 7',
    '{\"y\":4850.56,\"z\":41.99,\"h\":96.41,\"x\":1653.78}',
    '{\"door\":{\"outside\":{\"y\":4854.28,\"z\":41.98,\"h\":186.04,\"x\":1650.66},\"coords\":{\"x\":1650.2530517578,\"y\":4853.880859375,\"z\":42.258907318115}, \"hash\":-131754413, \"oh\":97.0 , \"ch\":187.12115478516}, \"counters\":[{\"y\":4852.91,\"z\":41.98,\"h\":279.48,\"x\":1651.52},{\"y\":4851.56,\"z\":41.98,\"h\":273.93,\"x\":1651.71},{\"y\":4849.95,\"z\":41.98,\"h\":273.74,\"x\":1651.9},{\"y\":4848.58,\"z\":41.98,\"h\":277.28,\"x\":1652.07}]}',
    NULL,
    '{\"door\":{\"thermite\":{\"spark\":{\"x\":1648.05,\"y\":4851.246,\"z\":42.08},\"drip\":{\"y\":4850.56,\"z\":41.98,\"h\":184.07,\"x\":1647.94},\"bomb\":{\"rotation\":{\"x\":-90.0,\"y\":-8.0,\"z\":0.0},\"offset\":{\"x\":0.06195,\"y\":-0.1995,\"z\":0.165}},\"heading\":190.0},\"coords\":{\"x\":1649.1805419922,\"y\":4850.3935546875,\"z\":42.123291015625}, \"hash\":2121050683, \"oh\": 97.0, \"ch\":187.12115478516}, \"coords\":{\"y\":4850.58,\"z\":41.98,\"h\":191.07,\"x\":1647.15}}',
    '{\"door\":{\"coords\":{\"x\":1647.3162841797,\"y\":4846.884765625,\"z\":42.282653808594}, \"hash\":-1591004109, \"oh\": 27.0, \"ch\":97.121147155762}, \"coords\":{\"y\":4849.02,\"z\":41.98,\"h\":90.35,\"x\":1647.73}}',
    NULL,
    '[{\"y\":4849.28,\"z\":41.97,\"h\":280.18,\"x\":1649.46},{\"y\":4847.74,\"z\":41.98,\"h\":277.31,\"x\":1649.65},{\"y\":4846.53,\"z\":41.98,\"h\":188.45,\"x\":1648.59}]',
    '[{\"y\":4849.6,\"z\":41.99,\"h\":6.09,\"x\":1644.94},{\"y\":4848.28,\"z\":42.01,\"h\":91.9,\"x\":1643.45},{\"y\":4846.57,\"z\":42.01,\"h\":93.97,\"x\":1643.63},{\"y\":4845.58,\"z\":42.0,\"h\":180.27,\"x\":1645.42}]',
    1,
    0,
    'Small',
    NULL
  );
INSERT INTO
  `banks` (
    `id`,
    `name`,
    `coords`,
    `cashiercoords`,
    `beforevaults`,
    `vaults`,
    `vaultgate`,
    `finalgate`,
    `vg_spots`,
    `m_spots`,
    `bankOpen`,
    `bankCooldown`,
    `bankType`,
    `moneyBags`
  )
VALUES
  (
    8,
    'Fleeca 8',
    '{\"h\":59.7,\"x\":-1074.67,\"y\":-2559.01,\"z\":13.97}',
    '{\"door\":{\"outside\":{\"h\":145.31,\"x\":-1075.26,\"y\":-2553.99,\"z\":13.96},\"coords\":{\"x\":-1075.8262939453,\"y\":-2554.0134277344,\"z\":14.236138343811}, \"hash\":-131754413, \"oh\":60.0 , \"ch\":149.57022094727}, \"counters\":[{\"h\":235.9,\"x\":-1075.47,\"y\":-2555.55,\"z\":13.96},{\"h\":246.14,\"x\":-1076.13,\"y\":-2556.79,\"z\":13.96},{\"h\":237.63,\"x\":-1076.95,\"y\":-2558.12,\"z\":13.96},{\"h\":245.43,\"x\":-1077.62,\"y\":-2559.35,\"z\":13.96}]}',
    NULL,
    '{\"door\":{\"thermite\":{\"spark\":{\"x\":-1079.75,\"y\":-2554.45,\"z\":14.06},\"drip\":{\"h\":148.19,\"x\":-1079.7,\"y\":-2555.2,\"z\":13.96},\"bomb\":{\"rotation\":{\"x\":-90.0,\"y\":30.0,\"z\":0.0},\"offset\":{\"x\":-0.070795,\"y\":-0.270195,\"z\":0.15}},\"heading\":150.0},\"coords\":{\"x\":-1078.8018798828,\"y\":-2556.1247558594,\"z\":14.100519180298}, \"hash\":2121050683, \"oh\": 60.0, \"ch\":149.57022094727}, \"coords\":{\"h\":160.61,\"x\":-1080.29,\"y\":-2554.64,\"z\":13.96}}',
    '{\"door\":{\"coords\":{\"x\":-1082.4187011719,\"y\":-2557.7705078125,\"z\":14.259883880615}, \"hash\":-1591004109, \"oh\": 0.1, \"ch\":59.57022857666}, \"coords\":{\"h\":59.56,\"x\":-1080.8,\"y\":-2556.32,\"z\":13.94}}',
    NULL,
    '[{\"h\":247.53,\"x\":-1079.19,\"y\":-2557.06,\"z\":13.94},{\"h\":247.92,\"x\":-1080.04,\"y\":-2558.5,\"z\":13.94},{\"h\":156.79,\"x\":-1081.64,\"y\":-2558.82,\"z\":13.94}]',
    '[{\"h\":335.51,\"x\":-1082.55,\"y\":-2554.26,\"z\":13.94},{\"h\":55.25,\"x\":-1084.62,\"y\":-2554.28,\"z\":13.94},{\"h\":53.21,\"x\":-1085.58,\"y\":-2555.85,\"z\":13.94},{\"h\":148.34,\"x\":-1084.78,\"y\":-2557.63,\"z\":13.94}]',
    1,
    0,
    'Small',
    NULL
  );
INSERT INTO
  `banks` (
    `id`,
    `name`,
    `coords`,
    `cashiercoords`,
    `beforevaults`,
    `vaults`,
    `vaultgate`,
    `finalgate`,
    `vg_spots`,
    `m_spots`,
    `bankOpen`,
    `bankCooldown`,
    `bankType`,
    `moneyBags`
  )
VALUES
  (
    9,
    'Paleto',
    '{\"x\":-112.22,\"h\":314.95,\"z\":31.63,\"y\":6468.92}',
    '{\"door\":{\"outside\":{\"y\":6468.29,\"z\":31.63,\"h\":41.06,\"x\":-108.89},\"reverse\":1,\"coords\":{\"x\":-108.91468811035,\"y\":6469.1049804688,\"z\":31.910284042358}, \"hash\":-1184592117, \"oh\":325.0 , \"ch\":44.863204956055}, \"counters\":[{\"y\":6468.99,\"z\":31.63,\"h\":136.44,\"x\":-110.22},{\"y\":6470.04,\"z\":31.63,\"h\":134.15,\"x\":-111.27},{\"y\":6471.14,\"z\":31.63,\"h\":134.03,\"x\":-112.28},{\"y\":6472.25,\"z\":31.63,\"h\":132.97,\"x\":-113.35}]}',
    '{\"door\":{\"coords\":{\"x\":-104.60489654541,\"y\":6473.4438476563,\"z\":31.795324325562,\"h\":150.00003051758},\"hash\":-1185205679,\"ch\":45.0,\"oh\":150.00003051758},\"coords\":{\"y\":6471.9,\"z\":31.63,\"h\":40.24,\"x\":-105.54}}',
    '{\"door\":{\"thermite\":{\"spark\":{\"x\":-105.8085,\"y\":6473.49509,\"z\":31.80},\"drip\":{\"y\":6472.29,\"z\":31.63,\"h\":184.07,\"x\":-105.49},\"bomb\":{\"rotation\":{\"x\":-90.0,\"y\":-225.0,\"z\":0.0},\"offset\":{\"x\":-0.32795,\"y\":0.220195,\"z\": 0.175}},\"heading\":45.0},\"reverse\":1,\"coords\":{\"x\":-104.81363677979,\"y\":6473.646484375,\"z\":31.9547996521}, \"hash\":1622278560, \"oh\": 325.0, \"ch\":45.013021469116}, \"coords\":{\"y\":6472.36,\"z\":31.63,\"h\":37.87,\"x\":-105.43}}',
    '{\"door\":{\"thermite\":{\"spark\":{\"x\":-105.552,\"y\":6476.13,\"z\":31.95},\"drip\":{\"y\":6474.6,\"z\":31.63,\"h\":314.79,\"x\":-105.82},\"bomb\":{\"rotation\":{\"x\":-90.0,\"y\":-135.0,\"z\":0.0},\"offset\":{\"x\":0.26795,\"y\":0.5495,\"z\":0.36}},\"heading\":320.0},\"coords\":{\"x\":-106.47130584717,\"y\":6476.1577148438,\"z\":31.9547996521}, \"hash\":1309269072, \"oh\": 244.0, \"ch\":314.96466064453}, \"coords\":{\"y\":6474.72,\"z\":31.63,\"h\":316.34,\"x\":-105.76}}',
    NULL,
    '[{\"y\":6472.92,\"z\":31.63,\"h\":141.47,\"x\":-106.56},{\"y\":6474.14,\"z\":31.63,\"h\":133.41,\"x\":-107.76},{\"y\":6475.82,\"z\":31.63,\"h\":55.73,\"x\":-107.53}]',
    '[{\"y\":6475.52,\"z\":31.63,\"h\":225.83,\"x\":-102.89},{\"y\":6477.48,\"z\":31.68,\"h\":320.61,\"x\":-102.47},{\"y\":6478.97,\"z\":31.63,\"h\":316.32,\"x\":-103.95},{\"y\":6478.68,\"z\":31.63,\"h\":39.94,\"x\":-105.89}]',
    1,
    0,
    'Paleto',
    '{\"x\":-113.32,\"h\":316.07,\"z\":31.63,\"y\":6469.96}'
  );
INSERT INTO
  `banks` (
    `id`,
    `name`,
    `coords`,
    `cashiercoords`,
    `beforevaults`,
    `vaults`,
    `vaultgate`,
    `finalgate`,
    `vg_spots`,
    `m_spots`,
    `bankOpen`,
    `bankCooldown`,
    `bankType`,
    `moneyBags`
  )
VALUES
  (
    10,
    'Pacific',
    '{\"x\":242.1,\"y\":224.44,\"z\":106.29,\"h\":336.9}',
    '{\"door\":{\"thermite\":{\"spark\":{\"x\":257.457,\"y\":221.105,\"z\":106.39},\"drip\":{\"x\":257.27,\"y\":219.8,\"z\":106.29},\"bomb\":{\"rotation\":{\"x\":90.0,\"y\":-20.0,\"z\":0.0},\"offset\":{\"x\":0.135,\"y\":0.385,\"z\":0.15}},\"heading\":339.0},\"outside\":{\"x\":256.79,\"y\":220.03,\"z\":106.29,\"h\":355.46},\"coords\":{\"x\":256.31155395508,\"y\":220.65785217285,\"z\":106.42955780029,\"h\":340.00003051758},\"hash\":-222270721,\"ch\":-19.999971389771,\"oh\":70.0},\"coords\":{\"x\":256.79,\"y\":220.03,\"z\":106.29,\"h\":355.46}}',
    '{\"door\":{\"coords\":{\"x\":262.19808959961,\"y\":222.51881408691,\"z\":106.42955780029,\"h\":256.77621459961},\"hash\":746855201,\"ch\":-110.22378540039,\"oh\":-20.0},\"coords\":{\"x\":261.95,\"y\":223.1,\"z\":106.28,\"h\":241.67}}',
    '{\"door\":{\"coords\":{\"x\":255.22825622559,\"y\":223.97601318359,\"z\":102.39321899414,\"h\":160.17094421387},\"hash\":961976194,\"ch\":160.17094421387,\"oh\":70.0},\"coords\":{\"x\":253.29,\"y\":228.46,\"z\":101.68,\"h\":65.44}}',
    '{\"door\":{\"thermite\":{\"spark\":{\"x\":252.99,\"y\":221.75,\"z\":101.78},\"drip\":{\"x\":253.0,\"y\":220.97,\"z\":101.68},\"bomb\":{\"rotation\":{\"x\":-90.0,\"y\":20.0,\"z\":0.0},\"offset\":{\"x\":-0.005,\"y\":-0.255,\"z\":0.15}},\"heading\":161.0},\"coords\":{\"x\":251.85757446289,\"y\":221.06549072266,\"z\":101.83240509033,\"h\":160.00001525879},\"hash\":-1508355822,\"ch\":160.00001525879,\"oh\":70.0},\"coords\":{\"x\":252.63,\"y\":221.29,\"z\":101.68,\"h\":156.96}}',
    '{\"door\":{\"thermite\":{\"spark\":{\"x\":261.65,\"y\":216.62,\"z\":101.78},\"drip\":{\"x\":261.4,\"y\":215.67,\"z\":101.68},\"bomb\":{\"rotation\":{\"x\":-90.0,\"y\":-70.0,\"z\": 0.0},\"offset\":{\"x\":0.25,\"y\":-0.0325,\"z\":0.15}},\"heading\":250.0},\"reverse\":-1,\"coords\":{\"x\":261.30041503906,\"y\":214.50514221191,\"z\":101.83240509033,\"h\":250.17224121094},\"hash\":-1508355822,\"ch\":-109.82776641846,\"oh\":170.0},\"coords\":{\"x\":261.12,\"y\":215.24,\"z\":101.68,\"h\":252.85},\"coords\":{\"x\":261.06,\"y\":215.22,\"z\":101.68,\"h\":247.37}}',
    '[{\"x\":258.16,\"y\":218.56,\"z\":101.68,\"h\":341.82},{\"x\":259.71,\"y\":218.03,\"z\":101.68,\"h\":359.39},{\"x\":261.44,\"y\":217.41,\"z\":101.68,\"h\":0.29},{\"x\":259.99,\"y\":213.48,\"z\":101.68,\"h\":159.81},{\"x\":258.27,\"y\":214.1,\"z\":101.68,\"h\":167.51},{\"x\":256.48,\"y\":214.76,\"z\":101.68,\"h\":169.49}]',
    '[{\"x\":263.19,\"y\":212.32,\"z\":101.68,\"h\":164.78},{\"x\":266.09,\"y\":213.42,\"z\":101.68,\"h\":275.82},{\"x\":264.66,\"y\":216.23,\"z\":101.68,\"h\":357.47}]',
    1,
    0,
    'Big',
    NULL
  );

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: bans
# ------------------------------------------------------------


# ------------------------------------------------------------
# DATA DUMP FOR TABLE: bills
# ------------------------------------------------------------


# ------------------------------------------------------------
# DATA DUMP FOR TABLE: businesses
# ------------------------------------------------------------

INSERT INTO
  `businesses` (
    `id`,
    `name`,
    `address`,
    `description`,
    `blipname`,
    `owner`,
    `price`,
    `earnings`,
    `position`,
    `stock`,
    `stock_price`,
    `employees`,
    `taxrate`
  )
VALUES
  (
    1,
    'Gucci Store',
    'Some random street 1337, Beverly Hills',
    'Very fancy store',
    NULL,
    NULL,
    100,
    10000,
    '{\"buy\":{\"x\":2524.11, \"y\":-382.22, \"z\":93},\"actions\":{\"x\":2526.04,\"y\":-379.43,\"z\":92.99}}',
    42,
    100,
    '{}',
    NULL
  );
INSERT INTO
  `businesses` (
    `id`,
    `name`,
    `address`,
    `description`,
    `blipname`,
    `owner`,
    `price`,
    `earnings`,
    `position`,
    `stock`,
    `stock_price`,
    `employees`,
    `taxrate`
  )
VALUES
  (
    2,
    'Gucci Store 2',
    'Some random street 1338, Beverly Hills',
    'Very fancy store',
    NULL,
    NULL,
    1333337,
    1337,
    '{\"buy\":{\"x\":0.0,\"y\":0.0,\"z\":0.0},\"actions\":{\"x\":0.0,\"y\":0.0,\"z\":0.0}}',
    0,
    100,
    '{}',
    NULL
  );

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: crypto
# ------------------------------------------------------------


# ------------------------------------------------------------
# DATA DUMP FOR TABLE: crypto_transactions
# ------------------------------------------------------------


# ------------------------------------------------------------
# DATA DUMP FOR TABLE: dealers
# ------------------------------------------------------------


# ------------------------------------------------------------
# DATA DUMP FOR TABLE: dpkeybinds
# ------------------------------------------------------------

INSERT INTO
  `dpkeybinds` (
    `id`,
    `keybind1`,
    `emote1`,
    `keybind2`,
    `emote2`,
    `keybind3`,
    `emote3`,
    `keybind4`,
    `emote4`,
    `keybind5`,
    `emote5`,
    `keybind6`,
    `emote6`
  )
VALUES
  (
    'steam:11000010b5232ae',
    'num4',
    '',
    'num5',
    '',
    'num6',
    '',
    'num7',
    '',
    'num8',
    '',
    'num9',
    ''
  );
INSERT INTO
  `dpkeybinds` (
    `id`,
    `keybind1`,
    `emote1`,
    `keybind2`,
    `emote2`,
    `keybind3`,
    `emote3`,
    `keybind4`,
    `emote4`,
    `keybind5`,
    `emote5`,
    `keybind6`,
    `emote6`
  )
VALUES
  (
    'steam:110000104b4db3f',
    'num4',
    '',
    'num5',
    '',
    'num6',
    '',
    'num7',
    '',
    'num8',
    '',
    'num9',
    ''
  );
INSERT INTO
  `dpkeybinds` (
    `id`,
    `keybind1`,
    `emote1`,
    `keybind2`,
    `emote2`,
    `keybind3`,
    `emote3`,
    `keybind4`,
    `emote4`,
    `keybind5`,
    `emote5`,
    `keybind6`,
    `emote6`
  )
VALUES
  (
    'steam:11000010395ceb2',
    'num4',
    '',
    'num5',
    '',
    'num6',
    '',
    'num7',
    '',
    'num8',
    '',
    'num9',
    ''
  );
INSERT INTO
  `dpkeybinds` (
    `id`,
    `keybind1`,
    `emote1`,
    `keybind2`,
    `emote2`,
    `keybind3`,
    `emote3`,
    `keybind4`,
    `emote4`,
    `keybind5`,
    `emote5`,
    `keybind6`,
    `emote6`
  )
VALUES
  (
    'steam:11000011a146436',
    'num4',
    '',
    'num5',
    '',
    'num6',
    '',
    'num7',
    '',
    'num8',
    '',
    'num9',
    ''
  );
INSERT INTO
  `dpkeybinds` (
    `id`,
    `keybind1`,
    `emote1`,
    `keybind2`,
    `emote2`,
    `keybind3`,
    `emote3`,
    `keybind4`,
    `emote4`,
    `keybind5`,
    `emote5`,
    `keybind6`,
    `emote6`
  )
VALUES
  (
    'steam:110000111b555ba',
    'num4',
    '',
    'num5',
    '',
    'num6',
    '',
    'num7',
    '',
    'num8',
    '',
    'num9',
    ''
  );
INSERT INTO
  `dpkeybinds` (
    `id`,
    `keybind1`,
    `emote1`,
    `keybind2`,
    `emote2`,
    `keybind3`,
    `emote3`,
    `keybind4`,
    `emote4`,
    `keybind5`,
    `emote5`,
    `keybind6`,
    `emote6`
  )
VALUES
  (
    'steam:11000010a8eaa66',
    'num4',
    '',
    'num5',
    '',
    'num6',
    '',
    'num7',
    '',
    'num8',
    '',
    'num9',
    ''
  );
INSERT INTO
  `dpkeybinds` (
    `id`,
    `keybind1`,
    `emote1`,
    `keybind2`,
    `emote2`,
    `keybind3`,
    `emote3`,
    `keybind4`,
    `emote4`,
    `keybind5`,
    `emote5`,
    `keybind6`,
    `emote6`
  )
VALUES
  (
    'steam:110000119df392c',
    'num4',
    '',
    'num5',
    '',
    'num6',
    '',
    'num7',
    '',
    'num8',
    '',
    'num9',
    ''
  );
INSERT INTO
  `dpkeybinds` (
    `id`,
    `keybind1`,
    `emote1`,
    `keybind2`,
    `emote2`,
    `keybind3`,
    `emote3`,
    `keybind4`,
    `emote4`,
    `keybind5`,
    `emote5`,
    `keybind6`,
    `emote6`
  )
VALUES
  (
    'steam:11000010b7402c9',
    'num4',
    '',
    'num5',
    '',
    'num6',
    '',
    'num7',
    '',
    'num8',
    '',
    'num9',
    ''
  );
INSERT INTO
  `dpkeybinds` (
    `id`,
    `keybind1`,
    `emote1`,
    `keybind2`,
    `emote2`,
    `keybind3`,
    `emote3`,
    `keybind4`,
    `emote4`,
    `keybind5`,
    `emote5`,
    `keybind6`,
    `emote6`
  )
VALUES
  (
    'steam:110000105396a2f',
    'num4',
    '',
    'num5',
    '',
    'num6',
    '',
    'num7',
    '',
    'num8',
    '',
    'num9',
    ''
  );
INSERT INTO
  `dpkeybinds` (
    `id`,
    `keybind1`,
    `emote1`,
    `keybind2`,
    `emote2`,
    `keybind3`,
    `emote3`,
    `keybind4`,
    `emote4`,
    `keybind5`,
    `emote5`,
    `keybind6`,
    `emote6`
  )
VALUES
  (
    'steam:110000115ec790b',
    'num4',
    '',
    'num5',
    '',
    'num6',
    '',
    'num7',
    '',
    'num8',
    '',
    'num9',
    ''
  );

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: end_mechanic
# ------------------------------------------------------------


# ------------------------------------------------------------
# DATA DUMP FOR TABLE: fine_types
# ------------------------------------------------------------

INSERT INTO
  `fine_types` (`id`, `label`, `amount`, `category`, `jailtime`)
VALUES
  (1, 'Murder', 25000, 0, 0);
INSERT INTO
  `fine_types` (`id`, `label`, `amount`, `category`, `jailtime`)
VALUES
  (2, 'Involuntary Manslaughter', 10000, 0, 120);
INSERT INTO
  `fine_types` (`id`, `label`, `amount`, `category`, `jailtime`)
VALUES
  (3, 'Vehicular Manslaughter', 7500, 0, 100);
INSERT INTO
  `fine_types` (`id`, `label`, `amount`, `category`, `jailtime`)
VALUES
  (4, 'Attempted Murder on LEO', 1500, 0, 60);
INSERT INTO
  `fine_types` (`id`, `label`, `amount`, `category`, `jailtime`)
VALUES
  (5, 'Attempted Murder', 1000, 0, 50);
INSERT INTO
  `fine_types` (`id`, `label`, `amount`, `category`, `jailtime`)
VALUES
  (6, 'Assault w/ Deadly Weapon on LEO', 700, 0, 45);
INSERT INTO
  `fine_types` (`id`, `label`, `amount`, `category`, `jailtime`)
VALUES
  (7, 'Assault w/ Deadly Weapon', 350, 0, 30);
INSERT INTO
  `fine_types` (`id`, `label`, `amount`, `category`, `jailtime`)
VALUES
  (8, 'Assault on LEO', 150, 0, 15);
INSERT INTO
  `fine_types` (`id`, `label`, `amount`, `category`, `jailtime`)
VALUES
  (9, 'Assault', 100, 0, 10);
INSERT INTO
  `fine_types` (`id`, `label`, `amount`, `category`, `jailtime`)
VALUES
  (10, 'Kidnapping of an LEO', 400, 0, 40);
INSERT INTO
  `fine_types` (`id`, `label`, `amount`, `category`, `jailtime`)
VALUES
  (11, 'Kidnapping / Hostage Taking', 200, 0, 20);
INSERT INTO
  `fine_types` (`id`, `label`, `amount`, `category`, `jailtime`)
VALUES
  (12, 'Bank Robbery', 800, 0, 50);
INSERT INTO
  `fine_types` (`id`, `label`, `amount`, `category`, `jailtime`)
VALUES
  (13, 'Armored Truck Robbery', 650, 0, 40);
INSERT INTO
  `fine_types` (`id`, `label`, `amount`, `category`, `jailtime`)
VALUES
  (14, 'Jewelery Store Robbery ', 500, 0, 30);
INSERT INTO
  `fine_types` (`id`, `label`, `amount`, `category`, `jailtime`)
VALUES
  (15, 'Store Robbery', 150, 0, 15);
INSERT INTO
  `fine_types` (`id`, `label`, `amount`, `category`, `jailtime`)
VALUES
  (16, 'House Robbery', 100, 0, 10);
INSERT INTO
  `fine_types` (`id`, `label`, `amount`, `category`, `jailtime`)
VALUES
  (17, 'Corruption', 10000, 0, 650);
INSERT INTO
  `fine_types` (`id`, `label`, `amount`, `category`, `jailtime`)
VALUES
  (18, 'Felony Driving Under the Influence', 300, 0, 30);
INSERT INTO
  `fine_types` (`id`, `label`, `amount`, `category`, `jailtime`)
VALUES
  (19, 'Grand Theft Auto', 300, 0, 20);
INSERT INTO
  `fine_types` (`id`, `label`, `amount`, `category`, `jailtime`)
VALUES
  (20, 'Evading Arrest', 200, 0, 20);
INSERT INTO
  `fine_types` (`id`, `label`, `amount`, `category`, `jailtime`)
VALUES
  (21, 'Driving Under the Influence', 150, 0, 15);
INSERT INTO
  `fine_types` (`id`, `label`, `amount`, `category`, `jailtime`)
VALUES
  (22, 'Hit and Run', 150, 0, 15);
INSERT INTO
  `fine_types` (`id`, `label`, `amount`, `category`, `jailtime`)
VALUES
  (
    23,
    'Operating a Motor Vehicle without a License',
    100,
    0,
    10
  );
INSERT INTO
  `fine_types` (`id`, `label`, `amount`, `category`, `jailtime`)
VALUES
  (24, 'Criminal Speeding', 300, 0, 10);
INSERT INTO
  `fine_types` (`id`, `label`, `amount`, `category`, `jailtime`)
VALUES
  (25, 'Excessive Speeding 4', 250, 0, 0);
INSERT INTO
  `fine_types` (`id`, `label`, `amount`, `category`, `jailtime`)
VALUES
  (26, 'Excessive Speeding 3', 200, 0, 0);
INSERT INTO
  `fine_types` (`id`, `label`, `amount`, `category`, `jailtime`)
VALUES
  (27, 'Excessive Speeding 2', 150, 0, 0);
INSERT INTO
  `fine_types` (`id`, `label`, `amount`, `category`, `jailtime`)
VALUES
  (28, 'Excessive Speeding', 100, 0, 0);
INSERT INTO
  `fine_types` (`id`, `label`, `amount`, `category`, `jailtime`)
VALUES
  (
    29,
    'Operating an Unregisted Motor Vehicle',
    100,
    0,
    5
  );
INSERT INTO
  `fine_types` (`id`, `label`, `amount`, `category`, `jailtime`)
VALUES
  (30, 'Reckless Endangerment', 150, 0, 5);
INSERT INTO
  `fine_types` (`id`, `label`, `amount`, `category`, `jailtime`)
VALUES
  (31, 'Careless Driving', 100, 0, 0);
INSERT INTO
  `fine_types` (`id`, `label`, `amount`, `category`, `jailtime`)
VALUES
  (
    32,
    'Operating a Non-Street Legal Vehicle',
    200,
    0,
    5
  );
INSERT INTO
  `fine_types` (`id`, `label`, `amount`, `category`, `jailtime`)
VALUES
  (33, 'Failure to Stop', 100, 0, 0);
INSERT INTO
  `fine_types` (`id`, `label`, `amount`, `category`, `jailtime`)
VALUES
  (34, 'Obstructing Traffic', 150, 0, 0);
INSERT INTO
  `fine_types` (`id`, `label`, `amount`, `category`, `jailtime`)
VALUES
  (35, 'Illegal Lane Change', 100, 0, 0);
INSERT INTO
  `fine_types` (`id`, `label`, `amount`, `category`, `jailtime`)
VALUES
  (
    36,
    'Failure to Yield to an Emergency Vehicle',
    150,
    0,
    0
  );
INSERT INTO
  `fine_types` (`id`, `label`, `amount`, `category`, `jailtime`)
VALUES
  (37, 'Illegal Parking', 100, 0, 0);
INSERT INTO
  `fine_types` (`id`, `label`, `amount`, `category`, `jailtime`)
VALUES
  (38, 'Excessive Vehicle Noise', 100, 0, 0);
INSERT INTO
  `fine_types` (`id`, `label`, `amount`, `category`, `jailtime`)
VALUES
  (
    39,
    'Driving without Proper Use of Headlights',
    100,
    0,
    0
  );
INSERT INTO
  `fine_types` (`id`, `label`, `amount`, `category`, `jailtime`)
VALUES
  (40, 'Illegal U-Turn', 100, 0, 0);
INSERT INTO
  `fine_types` (`id`, `label`, `amount`, `category`, `jailtime`)
VALUES
  (41, 'Drug Manufacturing/Cultivation', 550, 0, 40);
INSERT INTO
  `fine_types` (`id`, `label`, `amount`, `category`, `jailtime`)
VALUES
  (42, 'Possession of Schedule 1 Drug', 150, 0, 15);
INSERT INTO
  `fine_types` (`id`, `label`, `amount`, `category`, `jailtime`)
VALUES
  (43, 'Possession of Schedule 2 Drug', 250, 0, 20);
INSERT INTO
  `fine_types` (`id`, `label`, `amount`, `category`, `jailtime`)
VALUES
  (
    44,
    'Sale/Distribution of Schedule 1 Drug',
    250,
    0,
    20
  );
INSERT INTO
  `fine_types` (`id`, `label`, `amount`, `category`, `jailtime`)
VALUES
  (
    45,
    'Sale/Distribution of Schedule 2 Drug',
    400,
    0,
    30
  );
INSERT INTO
  `fine_types` (`id`, `label`, `amount`, `category`, `jailtime`)
VALUES
  (46, 'Drug Trafficking', 500, 0, 40);
INSERT INTO
  `fine_types` (`id`, `label`, `amount`, `category`, `jailtime`)
VALUES
  (47, 'Weapons Caching of Class 2s', 2500, 0, 120);
INSERT INTO
  `fine_types` (`id`, `label`, `amount`, `category`, `jailtime`)
VALUES
  (48, 'Weapons Caching of Class 1s', 1250, 0, 60);
INSERT INTO
  `fine_types` (`id`, `label`, `amount`, `category`, `jailtime`)
VALUES
  (49, 'Weapons Trafficking of Class 2s', 1700, 0, 80);
INSERT INTO
  `fine_types` (`id`, `label`, `amount`, `category`, `jailtime`)
VALUES
  (50, 'Weapons Trafficking of Class 1s', 800, 0, 45);
INSERT INTO
  `fine_types` (`id`, `label`, `amount`, `category`, `jailtime`)
VALUES
  (51, 'Possession of a Class 2 Firearm', 800, 0, 40);
INSERT INTO
  `fine_types` (`id`, `label`, `amount`, `category`, `jailtime`)
VALUES
  (52, 'Possession of a Class 1 Firearm', 150, 0, 15);
INSERT INTO
  `fine_types` (`id`, `label`, `amount`, `category`, `jailtime`)
VALUES
  (53, 'Brandishing a Firearm', 100, 0, 5);
INSERT INTO
  `fine_types` (`id`, `label`, `amount`, `category`, `jailtime`)
VALUES
  (54, 'Unlawful discharge of a firearm', 150, 0, 10);
INSERT INTO
  `fine_types` (`id`, `label`, `amount`, `category`, `jailtime`)
VALUES
  (55, 'Perjury', 1000, 0, 60);
INSERT INTO
  `fine_types` (`id`, `label`, `amount`, `category`, `jailtime`)
VALUES
  (56, 'Arson', 500, 0, 30);
INSERT INTO
  `fine_types` (`id`, `label`, `amount`, `category`, `jailtime`)
VALUES
  (
    57,
    'False Impersonation of a Government Official',
    200,
    0,
    25
  );
INSERT INTO
  `fine_types` (`id`, `label`, `amount`, `category`, `jailtime`)
VALUES
  (58, 'Possession of Dirty Money', 200, 0, 25);
INSERT INTO
  `fine_types` (`id`, `label`, `amount`, `category`, `jailtime`)
VALUES
  (59, 'Possession of Stolen Goods', 100, 0, 15);
INSERT INTO
  `fine_types` (`id`, `label`, `amount`, `category`, `jailtime`)
VALUES
  (60, 'Unlawful Solicitation', 150, 0, 20);
INSERT INTO
  `fine_types` (`id`, `label`, `amount`, `category`, `jailtime`)
VALUES
  (61, 'Larceny', 150, 0, 20);
INSERT INTO
  `fine_types` (`id`, `label`, `amount`, `category`, `jailtime`)
VALUES
  (
    62,
    'Felony Attempted Commision of an Offence/Crime',
    350,
    0,
    20
  );
INSERT INTO
  `fine_types` (`id`, `label`, `amount`, `category`, `jailtime`)
VALUES
  (63, 'Tampering With Evidence', 200, 0, 20);
INSERT INTO
  `fine_types` (`id`, `label`, `amount`, `category`, `jailtime`)
VALUES
  (64, 'Illegal Gambling', 200, 0, 20);
INSERT INTO
  `fine_types` (`id`, `label`, `amount`, `category`, `jailtime`)
VALUES
  (65, 'Bribery', 200, 0, 20);
INSERT INTO
  `fine_types` (`id`, `label`, `amount`, `category`, `jailtime`)
VALUES
  (66, 'Stalking', 350, 0, 20);
INSERT INTO
  `fine_types` (`id`, `label`, `amount`, `category`, `jailtime`)
VALUES
  (67, 'Organizing an illegal event', 150, 0, 15);
INSERT INTO
  `fine_types` (`id`, `label`, `amount`, `category`, `jailtime`)
VALUES
  (68, 'Participating in an illegal event', 50, 0, 5);
INSERT INTO
  `fine_types` (`id`, `label`, `amount`, `category`, `jailtime`)
VALUES
  (69, 'Criminal Mischief', 100, 0, 15);
INSERT INTO
  `fine_types` (`id`, `label`, `amount`, `category`, `jailtime`)
VALUES
  (70, 'Prostitution', 250, 0, 15);
INSERT INTO
  `fine_types` (`id`, `label`, `amount`, `category`, `jailtime`)
VALUES
  (71, 'Failure to Identify', 150, 0, 15);
INSERT INTO
  `fine_types` (`id`, `label`, `amount`, `category`, `jailtime`)
VALUES
  (72, 'Obstruction of Justice', 150, 0, 15);
INSERT INTO
  `fine_types` (`id`, `label`, `amount`, `category`, `jailtime`)
VALUES
  (73, 'Resisting Arrest', 100, 0, 10);
INSERT INTO
  `fine_types` (`id`, `label`, `amount`, `category`, `jailtime`)
VALUES
  (74, 'Disturbing the Peace', 100, 0, 10);
INSERT INTO
  `fine_types` (`id`, `label`, `amount`, `category`, `jailtime`)
VALUES
  (75, 'Threat to do Bodily Harm', 100, 0, 10);
INSERT INTO
  `fine_types` (`id`, `label`, `amount`, `category`, `jailtime`)
VALUES
  (76, 'Terroristic Threat', 150, 0, 10);
INSERT INTO
  `fine_types` (`id`, `label`, `amount`, `category`, `jailtime`)
VALUES
  (77, 'Damage to Government Property', 150, 0, 10);
INSERT INTO
  `fine_types` (`id`, `label`, `amount`, `category`, `jailtime`)
VALUES
  (78, 'Contempt of Court', 250, 0, 10);
INSERT INTO
  `fine_types` (`id`, `label`, `amount`, `category`, `jailtime`)
VALUES
  (79, 'Failure to Obey a Lawful Order', 150, 0, 10);
INSERT INTO
  `fine_types` (`id`, `label`, `amount`, `category`, `jailtime`)
VALUES
  (80, 'False Report', 100, 0, 10);
INSERT INTO
  `fine_types` (`id`, `label`, `amount`, `category`, `jailtime`)
VALUES
  (81, 'Trespassing', 100, 0, 10);
INSERT INTO
  `fine_types` (`id`, `label`, `amount`, `category`, `jailtime`)
VALUES
  (82, 'Loitering', 100, 0, 0);
INSERT INTO
  `fine_types` (`id`, `label`, `amount`, `category`, `jailtime`)
VALUES
  (83, 'Public Intoxication', 100, 0, 0);
INSERT INTO
  `fine_types` (`id`, `label`, `amount`, `category`, `jailtime`)
VALUES
  (84, 'Indecent Exposure', 100, 0, 0);
INSERT INTO
  `fine_types` (`id`, `label`, `amount`, `category`, `jailtime`)
VALUES
  (85, 'Verbal Harassment ', 100, 0, 0);
INSERT INTO
  `fine_types` (`id`, `label`, `amount`, `category`, `jailtime`)
VALUES
  (86, 'Aiding and Abetting', 100, 0, 0);
INSERT INTO
  `fine_types` (`id`, `label`, `amount`, `category`, `jailtime`)
VALUES
  (87, 'Incident Report', 0, 0, 0);
INSERT INTO
  `fine_types` (`id`, `label`, `amount`, `category`, `jailtime`)
VALUES
  (88, 'Written Citation', 0, 0, 0);
INSERT INTO
  `fine_types` (`id`, `label`, `amount`, `category`, `jailtime`)
VALUES
  (89, 'Verbal Warning', 0, 0, 0);

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: gang_territoriums
# ------------------------------------------------------------


# ------------------------------------------------------------
# DATA DUMP FOR TABLE: gangs
# ------------------------------------------------------------


# ------------------------------------------------------------
# DATA DUMP FOR TABLE: garagem_ems
# ------------------------------------------------------------

INSERT INTO
  `garagem_ems` (
    `id`,
    `modelo`,
    `nome`,
    `veh_tipo`,
    `placa`,
    `quantidade`,
    `img`
  )
VALUES
  (
    2,
    'Ambulance',
    'Ambulancia',
    'carro',
    'NL-LSPD',
    99,
    'https://vignette.wikia.nocookie.net/gtawiki/images/e/ee/Ambulance-GTAV-front-LSMC.png/revision/latest/scale-to-width-down/350?cb=20160116221217'
  );

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: garagem_lspd
# ------------------------------------------------------------

INSERT INTO
  `garagem_lspd` (
    `id`,
    `modelo`,
    `nome`,
    `veh_tipo`,
    `placa`,
    `quantidade`,
    `img`
  )
VALUES
  (
    7,
    'bmwpm',
    'BMW',
    'carro',
    'NL-LSPD',
    100,
    'https://i.imgur.com/00I8B0G.png'
  );
INSERT INTO
  `garagem_lspd` (
    `id`,
    `modelo`,
    `nome`,
    `veh_tipo`,
    `placa`,
    `quantidade`,
    `img`
  )
VALUES
  (
    8,
    'rocam',
    'PM Rocam',
    'moto',
    'NL-LSPD',
    99,
    'https://i.imgur.com/1io7Cus.png'
  );
INSERT INTO
  `garagem_lspd` (
    `id`,
    `modelo`,
    `nome`,
    `veh_tipo`,
    `placa`,
    `quantidade`,
    `img`
  )
VALUES
  (
    9,
    'riot',
    'Caminhão Blindado',
    'carro',
    'NL-LSPD',
    99,
    'https://i.imgur.com/c5Dn0fi.png'
  );
INSERT INTO
  `garagem_lspd` (
    `id`,
    `modelo`,
    `nome`,
    `veh_tipo`,
    `placa`,
    `quantidade`,
    `img`
  )
VALUES
  (
    10,
    'pbus',
    'Onibus Blindado',
    'carro',
    'NL-LSPD',
    101,
    'https://i.imgur.com/U2evSuY.png'
  );
INSERT INTO
  `garagem_lspd` (
    `id`,
    `modelo`,
    `nome`,
    `veh_tipo`,
    `placa`,
    `quantidade`,
    `img`
  )
VALUES
  (
    11,
    'x5pm',
    'BMW X6',
    'carro',
    'NL-LSPD',
    99,
    'https://i.imgur.com/PsadI37.png'
  );
INSERT INTO
  `garagem_lspd` (
    `id`,
    `modelo`,
    `nome`,
    `veh_tipo`,
    `placa`,
    `quantidade`,
    `img`
  )
VALUES
  (
    12,
    'aguiapm',
    'Águia PM',
    'carro',
    'NL-LSPD',
    99,
    'https://imgur.com/6CQq98l'
  );

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: gloveboxitems
# ------------------------------------------------------------


# ------------------------------------------------------------
# DATA DUMP FOR TABLE: gloveboxitemsnew
# ------------------------------------------------------------

INSERT INTO
  `gloveboxitemsnew` (`id`, `plate`, `items`)
VALUES
  (1551, '5EK373UN', '[]');
INSERT INTO
  `gloveboxitemsnew` (`id`, `plate`, `items`)
VALUES
  (1552, '3VK145LV', '[]');
INSERT INTO
  `gloveboxitemsnew` (`id`, `plate`, `items`)
VALUES
  (1553, '4VG066AR', '[]');

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: house_plants
# ------------------------------------------------------------


# ------------------------------------------------------------
# DATA DUMP FOR TABLE: houselocations
# ------------------------------------------------------------

INSERT INTO
  `houselocations` (
    `id`,
    `name`,
    `label`,
    `coords`,
    `owned`,
    `price`,
    `tier`,
    `garage`
  )
VALUES
  (
    1,
    'tESTE',
    '\"testee\"',
    'enter = {x = -137.43251037598, y = -1267.1223144531, z = 47.898086547852, h = 100}, cam = { x = -137.43251037598, y = -1267.1223144531, z = 47.898086547852, h = 100, yaw = -10.00}',
    0,
    125,
    1,
    NULL
  );

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: jobs
# ------------------------------------------------------------


# ------------------------------------------------------------
# DATA DUMP FOR TABLE: jsfour_dna
# ------------------------------------------------------------


# ------------------------------------------------------------
# DATA DUMP FOR TABLE: lapraces
# ------------------------------------------------------------


# ------------------------------------------------------------
# DATA DUMP FOR TABLE: lspd
# ------------------------------------------------------------


# ------------------------------------------------------------
# DATA DUMP FOR TABLE: mdt_reports
# ------------------------------------------------------------


# ------------------------------------------------------------
# DATA DUMP FOR TABLE: mdt_warrants
# ------------------------------------------------------------


# ------------------------------------------------------------
# DATA DUMP FOR TABLE: moneysafes
# ------------------------------------------------------------


# ------------------------------------------------------------
# DATA DUMP FOR TABLE: nl_usados
# ------------------------------------------------------------

INSERT INTO
  `nl_usados` (
    `id`,
    `dono`,
    `dono_nome`,
    `telefone`,
    `modelo`,
    `placa`,
    `preco`,
    `slot`
  )
VALUES
  (
    5,
    1,
    'Felipe QR',
    '372-8711',
    't20',
    'P24795 ',
    10000,
    4
  );

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: occasion_vehicles
# ------------------------------------------------------------


# ------------------------------------------------------------
# DATA DUMP FOR TABLE: org_criminosa
# ------------------------------------------------------------


# ------------------------------------------------------------
# DATA DUMP FOR TABLE: permissions
# ------------------------------------------------------------

INSERT INTO
  `permissions` (`id`, `name`, `steam`, `license`, `permission`)
VALUES
  (
    54,
    'Nerv',
    'steam:11000010b5232ae',
    'license:c83b60385bdb80069ad81adeffd7fb320f7a510f',
    'admin'
  );

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: phone_app_chat
# ------------------------------------------------------------


# ------------------------------------------------------------
# DATA DUMP FOR TABLE: phone_calls
# ------------------------------------------------------------


# ------------------------------------------------------------
# DATA DUMP FOR TABLE: phone_invoices
# ------------------------------------------------------------


# ------------------------------------------------------------
# DATA DUMP FOR TABLE: phone_messages
# ------------------------------------------------------------


# ------------------------------------------------------------
# DATA DUMP FOR TABLE: phone_tweets
# ------------------------------------------------------------


# ------------------------------------------------------------
# DATA DUMP FOR TABLE: phone_users_contacts
# ------------------------------------------------------------


# ------------------------------------------------------------
# DATA DUMP FOR TABLE: player_boats
# ------------------------------------------------------------


# ------------------------------------------------------------
# DATA DUMP FOR TABLE: player_contacts
# ------------------------------------------------------------

INSERT INTO
  `player_contacts` (`id`, `citizenid`, `name`, `number`, `iban`)
VALUES
  (
    12433,
    'FTB86373',
    'ZAID BLACK',
    '0635755750',
    'NL02QBUS6318447347'
  );
INSERT INTO
  `player_contacts` (`id`, `citizenid`, `name`, `number`, `iban`)
VALUES
  (12434, 'FTB86373', 'Kaan', '0652718098', '');
INSERT INTO
  `player_contacts` (`id`, `citizenid`, `name`, `number`, `iban`)
VALUES
  (12435, 'TPL08484', 'Jemile', '555220019823', '');
INSERT INTO
  `player_contacts` (`id`, `citizenid`, `name`, `number`, `iban`)
VALUES
  (12436, 'TPL08484', 'Teletabi', '22562625955', '');

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: player_houses
# ------------------------------------------------------------


# ------------------------------------------------------------
# DATA DUMP FOR TABLE: player_mails
# ------------------------------------------------------------

INSERT INTO
  `player_mails` (
    `id`,
    `citizenid`,
    `sender`,
    `subject`,
    `message`,
    `read`,
    `mailid`,
    `date`,
    `button`
  )
VALUES
  (
    67023,
    'LRP87077',
    'Central Judicial Collection Agency',
    'Automatic Collection',
    'Best sir Kaymak,<br /><br />The Central Judicial Collection Agency (CJIB) has charged the fines you received from the police.<br />There is <strong>€50</strong> deducted from your account.<br /><br />With kind regards,<br />Mr. I.K. Graai',
    0,
    851074,
    '2020-10-17 13:47:24',
    '[]'
  );
INSERT INTO
  `player_mails` (
    `id`,
    `citizenid`,
    `sender`,
    `subject`,
    `message`,
    `read`,
    `mailid`,
    `date`,
    `button`
  )
VALUES
  (
    67024,
    'DUK13299',
    'Pillbox',
    'Hospital Costs',
    'Dear sir Delemia,<br /><br />Hereby you will receive an e-mail with the costs of the last hospital visit..<br />The final costs have become: <strong>€2000</strong><br /><br />Much better desired!',
    0,
    865614,
    '2020-10-21 18:23:16',
    '[]'
  );
INSERT INTO
  `player_mails` (
    `id`,
    `citizenid`,
    `sender`,
    `subject`,
    `message`,
    `read`,
    `mailid`,
    `date`,
    `button`
  )
VALUES
  (
    67025,
    'LRP87077',
    'Central Judicial Collection Agency',
    'Automatic Collection',
    'Best sir Kaymak,<br /><br />The Central Judicial Collection Agency (CJIB) has charged the fines you received from the police.<br />There is <strong>€100</strong> deducted from your account.<br /><br />With kind regards,<br />Mr. I.K. Graai',
    0,
    334418,
    '2020-10-25 09:15:55',
    '[]'
  );

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: player_outfits
# ------------------------------------------------------------

INSERT INTO
  `player_outfits` (
    `id`,
    `citizenid`,
    `outfitname`,
    `model`,
    `skin`,
    `outfitId`
  )
VALUES
  (
    8970,
    'FTB86373',
    'Annam',
    '-1868718465',
    '{\"hair\":{\"texture\":0,\"defaultItem\":0,\"defaultTexture\":0,\"item\":0},\"arms\":{\"texture\":0,\"defaultItem\":0,\"defaultTexture\":0,\"item\":0},\"accessory\":{\"texture\":0,\"defaultItem\":0,\"defaultTexture\":0,\"item\":0},\"decals\":{\"texture\":0,\"defaultItem\":0,\"defaultTexture\":0,\"item\":0},\"t-shirt\":{\"texture\":0,\"defaultItem\":1,\"defaultTexture\":0,\"item\":1},\"hat\":{\"texture\":0,\"defaultItem\":-1,\"defaultTexture\":0,\"item\":-1},\"vest\":{\"texture\":0,\"defaultItem\":0,\"defaultTexture\":0,\"item\":0},\"bracelet\":{\"texture\":0,\"defaultItem\":-1,\"defaultTexture\":0,\"item\":-1},\"face\":{\"texture\":0,\"defaultItem\":0,\"defaultTexture\":0,\"item\":0},\"torso2\":{\"texture\":0,\"defaultItem\":0,\"defaultTexture\":0,\"item\":0},\"beard\":{\"texture\":1,\"defaultItem\":-1,\"defaultTexture\":1,\"item\":-1},\"watch\":{\"texture\":0,\"defaultItem\":-1,\"defaultTexture\":0,\"item\":-1},\"eyebrows\":{\"texture\":1,\"defaultItem\":-1,\"defaultTexture\":1,\"item\":-1},\"blush\":{\"texture\":1,\"defaultItem\":-1,\"defaultTexture\":1,\"item\":-1},\"shoes\":{\"texture\":0,\"defaultItem\":1,\"defaultTexture\":0,\"item\":1},\"glass\":{\"texture\":0,\"defaultItem\":0,\"defaultTexture\":0,\"item\":0},\"ageing\":{\"texture\":0,\"defaultItem\":-1,\"defaultTexture\":0,\"item\":-1},\"bag\":{\"texture\":0,\"defaultItem\":0,\"defaultTexture\":0,\"item\":0},\"mask\":{\"texture\":0,\"defaultItem\":0,\"defaultTexture\":0,\"item\":0},\"pants\":{\"texture\":0,\"defaultItem\":0,\"defaultTexture\":0,\"item\":0},\"ear\":{\"texture\":0,\"defaultItem\":-1,\"defaultTexture\":0,\"item\":-1},\"lipstick\":{\"texture\":1,\"defaultItem\":-1,\"defaultTexture\":1,\"item\":-1},\"makeup\":{\"texture\":1,\"defaultItem\":-1,\"defaultTexture\":1,\"item\":-1}}',
    'outfit-1-7986'
  );
INSERT INTO
  `player_outfits` (
    `id`,
    `citizenid`,
    `outfitname`,
    `model`,
    `skin`,
    `outfitId`
  )
VALUES
  (
    8971,
    'YFH94042',
    '',
    '1885233650',
    '{\"lipstick\":{\"defaultTexture\":1,\"texture\":1,\"defaultItem\":-1,\"item\":-1},\"decals\":{\"defaultTexture\":0,\"texture\":0,\"defaultItem\":0,\"item\":0},\"bag\":{\"defaultTexture\":0,\"texture\":0,\"defaultItem\":0,\"item\":0},\"shoes\":{\"defaultTexture\":0,\"texture\":0,\"defaultItem\":1,\"item\":1},\"t-shirt\":{\"defaultTexture\":0,\"texture\":0,\"defaultItem\":1,\"item\":1},\"ear\":{\"defaultTexture\":0,\"texture\":0,\"defaultItem\":-1,\"item\":-1},\"watch\":{\"defaultTexture\":0,\"texture\":0,\"defaultItem\":-1,\"item\":-1},\"accessory\":{\"defaultTexture\":0,\"texture\":0,\"defaultItem\":0,\"item\":0},\"face\":{\"defaultTexture\":0,\"texture\":0,\"defaultItem\":0,\"item\":0},\"eyebrows\":{\"defaultTexture\":1,\"texture\":1,\"defaultItem\":-1,\"item\":-1},\"mask\":{\"defaultTexture\":0,\"texture\":0,\"defaultItem\":0,\"item\":0},\"blush\":{\"defaultTexture\":1,\"texture\":1,\"defaultItem\":-1,\"item\":-1},\"hat\":{\"defaultTexture\":0,\"texture\":0,\"defaultItem\":-1,\"item\":-1},\"ageing\":{\"defaultTexture\":0,\"texture\":0,\"defaultItem\":-1,\"item\":-1},\"torso2\":{\"defaultTexture\":0,\"texture\":0,\"defaultItem\":0,\"item\":0},\"vest\":{\"defaultTexture\":0,\"texture\":0,\"defaultItem\":0,\"item\":0},\"glass\":{\"defaultTexture\":0,\"texture\":0,\"defaultItem\":0,\"item\":0},\"hair\":{\"defaultTexture\":0,\"texture\":0,\"defaultItem\":0,\"item\":0},\"arms\":{\"defaultTexture\":0,\"texture\":0,\"defaultItem\":0,\"item\":0},\"makeup\":{\"defaultTexture\":1,\"texture\":1,\"defaultItem\":-1,\"item\":-1},\"beard\":{\"defaultTexture\":1,\"texture\":1,\"defaultItem\":-1,\"item\":-1},\"bracelet\":{\"defaultTexture\":0,\"texture\":0,\"defaultItem\":-1,\"item\":-1},\"pants\":{\"defaultTexture\":0,\"texture\":0,\"defaultItem\":0,\"item\":0}}',
    'outfit-1-5855'
  );
INSERT INTO
  `player_outfits` (
    `id`,
    `citizenid`,
    `outfitname`,
    `model`,
    `skin`,
    `outfitId`
  )
VALUES
  (
    8973,
    'TPL08484',
    'Tip',
    '1885233650',
    '{\"hair\":{\"item\":52,\"defaultItem\":0,\"texture\":0,\"defaultTexture\":0},\"mask\":{\"item\":0,\"defaultItem\":0,\"texture\":0,\"defaultTexture\":0},\"eyebrows\":{\"item\":4,\"defaultItem\":-1,\"texture\":1,\"defaultTexture\":1},\"arms\":{\"item\":14,\"defaultItem\":0,\"texture\":0,\"defaultTexture\":0},\"makeup\":{\"item\":-1,\"defaultItem\":-1,\"texture\":1,\"defaultTexture\":1},\"lipstick\":{\"item\":-1,\"defaultItem\":-1,\"texture\":1,\"defaultTexture\":1},\"ear\":{\"item\":-1,\"defaultItem\":-1,\"texture\":0,\"defaultTexture\":0},\"glass\":{\"item\":5,\"defaultItem\":0,\"texture\":0,\"defaultTexture\":0},\"face\":{\"item\":6,\"defaultItem\":0,\"texture\":0,\"defaultTexture\":0},\"pants\":{\"item\":4,\"defaultItem\":0,\"texture\":0,\"defaultTexture\":0},\"beard\":{\"item\":11,\"defaultItem\":-1,\"texture\":1,\"defaultTexture\":1},\"t-shirt\":{\"item\":26,\"defaultItem\":1,\"texture\":0,\"defaultTexture\":0},\"torso2\":{\"item\":4,\"defaultItem\":0,\"texture\":3,\"defaultTexture\":0},\"bracelet\":{\"item\":-1,\"defaultItem\":-1,\"texture\":0,\"defaultTexture\":0},\"ageing\":{\"item\":-1,\"defaultItem\":-1,\"texture\":0,\"defaultTexture\":0},\"shoes\":{\"item\":15,\"defaultItem\":1,\"texture\":0,\"defaultTexture\":0},\"watch\":{\"item\":-1,\"defaultItem\":-1,\"texture\":0,\"defaultTexture\":0},\"accessory\":{\"item\":1,\"defaultItem\":0,\"texture\":0,\"defaultTexture\":0},\"bag\":{\"item\":0,\"defaultItem\":0,\"texture\":0,\"defaultTexture\":0},\"decals\":{\"item\":0,\"defaultItem\":0,\"texture\":0,\"defaultTexture\":0},\"vest\":{\"item\":0,\"defaultItem\":0,\"texture\":0,\"defaultTexture\":0},\"blush\":{\"item\":-1,\"defaultItem\":-1,\"texture\":1,\"defaultTexture\":1},\"hat\":{\"item\":-1,\"defaultItem\":-1,\"texture\":0,\"defaultTexture\":0}}',
    'outfit-9-4698'
  );

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: player_vehicles
# ------------------------------------------------------------


# ------------------------------------------------------------
# DATA DUMP FOR TABLE: player_warns
# ------------------------------------------------------------


# ------------------------------------------------------------
# DATA DUMP FOR TABLE: playerammo
# ------------------------------------------------------------


# ------------------------------------------------------------
# DATA DUMP FOR TABLE: playeritems
# ------------------------------------------------------------


# ------------------------------------------------------------
# DATA DUMP FOR TABLE: players
# ------------------------------------------------------------

INSERT INTO
  `players` (
    `#`,
    `citizenid`,
    `cid`,
    `steam`,
    `license`,
    `name`,
    `money`,
    `charinfo`,
    `firstname`,
    `lastname`,
    `job`,
    `gang`,
    `position`,
    `metadata`,
    `inventory`,
    `skills`,
    `zetony`,
    `last_updated`
  )
VALUES
  (
    0,
    'ZBX75995',
    1,
    'steam:11000010b5232ae',
    'license:c83b60385bdb80069ad81adeffd7fb320f7a510f',
    'Nerv',
    '{\"crypto\":0,\"cash\":254898,\"bank\":6060}',
    '{\"cid\":\"1\",\"lastname\":\"dene\",\"birthdate\":\"1980-05-05\",\"firstname\":\"dene\",\"nationality\":\"USA\",\"phone\":\"0688552517\",\"gender\":0,\"account\":\"NL08QBUS2812501516\",\"backstory\":\"placeholder backstory\"}',
    'dene',
    'dene',
    '{\"payment\":150,\"label\":\"Mechanic\",\"onduty\":false,\"name\":\"mechanic\"}',
    '{\"name\":\"geen\",\"label\":\"Geen Gang\"}',
    '{\"y\":182.5399932861328,\"z\":76.73632049560547,\"a\":40.274715423583987,\"x\":-812.22998046875}',
    '{\"status\":[],\"stress\":0,\"thirst\":69.60000000000002,\"inside\":{\"apartment\":[]},\"jailitems\":[],\"phone\":[],\"criminalrecord\":{\"hasRecord\":false},\"injail\":0,\"callsign\":\"NO CALLSIGN\",\"inlaststand\":false,\"licences\":{\"driver\":true,\"business\":false},\"fitbit\":[],\"hunger\":66.39999999999998,\"isdead\":false,\"fingerprint\":\"vV434V42DLx4315\",\"walletid\":\"QB-93527560\",\"ishandcuffed\":false,\"currentapartment\":\"apartment12649\",\"tracker\":false,\"armor\":0,\"craftingrep\":0,\"dealerrep\":0,\"commandbinds\":[],\"bloodtype\":\"AB-\",\"attachmentcraftingrep\":0,\"jobrep\":{\"trucker\":0,\"hotdog\":0,\"taxi\":0,\"tow\":0}}',
    '[{\"amount\":1,\"type\":\"item\",\"info\":{\"birthdate\":\"1980-05-05\",\"firstname\":\"dene\",\"lastname\":\"dene\",\"type\":\"A1-A2-A | AM-B | C1-C-CE\"},\"slot\":1,\"name\":\"driver_license\"},{\"amount\":1,\"type\":\"item\",\"info\":{\"citizenid\":\"ZBX75995\",\"lastname\":\"dene\",\"birthdate\":\"1980-05-05\",\"firstname\":\"dene\",\"gender\":0,\"nationality\":\"USA\"},\"slot\":2,\"name\":\"id_card\"},{\"amount\":1,\"type\":\"item\",\"info\":[],\"slot\":3,\"name\":\"phone\"},{\"amount\":1,\"type\":\"item\",\"info\":{\"birthdate\":\"1980-05-05\",\"firstname\":\"dene\",\"lastname\":\"dene\",\"type\":\"A1-A2-A | AM-B | C1-C-CE\"},\"slot\":4,\"name\":\"driver_license\"},{\"amount\":1,\"type\":\"item\",\"info\":{\"citizenid\":\"ZBX75995\",\"lastname\":\"dene\",\"birthdate\":\"1980-05-05\",\"firstname\":\"dene\",\"gender\":0,\"nationality\":\"USA\"},\"slot\":5,\"name\":\"id_card\"},{\"amount\":1,\"type\":\"item\",\"info\":[],\"slot\":6,\"name\":\"phone\"}]',
    '{\"Strength\":{\"Current\":8.199999999999996,\"Stat\":\"MP0_STRENGTH\",\"RemoveAmount\":-0.3},\"Driving\":{\"Current\":0,\"Stat\":\"MP0_DRIVING_ABILITY\",\"RemoveAmount\":-0.5},\"Shooting\":{\"Current\":0,\"Stat\":\"MP0_SHOOTING_ABILITY\",\"RemoveAmount\":-0.1},\"Wheelie\":{\"Current\":0,\"Stat\":\"MP0_WHEELIE_ABILITY\",\"RemoveAmount\":-0.2},\"Lung Capacity\":{\"Current\":0,\"Stat\":\"MP0_LUNG_CAPACITY\",\"RemoveAmount\":-0.1},\"Stamina\":{\"Current\":18.700000000000004,\"Stat\":\"MP0_STAMINA\",\"RemoveAmount\":-0.3}}',
    NULL,
    '2020-11-21 00:04:22'
  );

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: playerskins
# ------------------------------------------------------------

INSERT INTO
  `playerskins` (
    `id`,
    `citizenid`,
    `model`,
    `skin`,
    `active`,
    `tattoos`
  )
VALUES
  (
    43012,
    'LRP87077',
    '1885233650',
    '{\"shoes\":{\"texture\":0,\"defaultTexture\":0,\"item\":24,\"defaultItem\":1},\"bracelet\":{\"texture\":0,\"defaultTexture\":0,\"item\":-1,\"defaultItem\":-1},\"eyebrows\":{\"texture\":1,\"defaultTexture\":1,\"item\":-1,\"defaultItem\":-1},\"ear\":{\"texture\":0,\"defaultTexture\":0,\"item\":-1,\"defaultItem\":-1},\"makeup\":{\"texture\":1,\"defaultTexture\":1,\"item\":-1,\"defaultItem\":-1},\"lipstick\":{\"texture\":1,\"defaultTexture\":1,\"item\":-1,\"defaultItem\":-1},\"face\":{\"texture\":3,\"defaultTexture\":0,\"item\":2,\"defaultItem\":0},\"decals\":{\"texture\":0,\"defaultTexture\":0,\"item\":7,\"defaultItem\":0},\"ageing\":{\"texture\":0,\"defaultTexture\":0,\"item\":-1,\"defaultItem\":-1},\"accessory\":{\"texture\":0,\"defaultTexture\":0,\"item\":8,\"defaultItem\":0},\"pants\":{\"texture\":0,\"defaultTexture\":0,\"item\":97,\"defaultItem\":0},\"vest\":{\"texture\":0,\"defaultTexture\":0,\"item\":7,\"defaultItem\":0},\"torso2\":{\"texture\":0,\"defaultTexture\":0,\"item\":3,\"defaultItem\":0},\"bag\":{\"texture\":0,\"defaultTexture\":0,\"item\":0,\"defaultItem\":0},\"watch\":{\"texture\":0,\"defaultTexture\":0,\"item\":-1,\"defaultItem\":-1},\"arms\":{\"texture\":0,\"defaultTexture\":0,\"item\":4,\"defaultItem\":0},\"mask\":{\"texture\":0,\"defaultTexture\":0,\"item\":0,\"defaultItem\":0},\"hat\":{\"texture\":-1,\"defaultTexture\":0,\"item\":-1,\"defaultItem\":-1},\"blush\":{\"texture\":1,\"defaultTexture\":1,\"item\":-1,\"defaultItem\":-1},\"t-shirt\":{\"texture\":0,\"defaultTexture\":0,\"item\":56,\"defaultItem\":1},\"beard\":{\"texture\":1,\"defaultTexture\":1,\"item\":-1,\"defaultItem\":-1},\"hair\":{\"texture\":0,\"defaultTexture\":0,\"item\":0,\"defaultItem\":0},\"glass\":{\"texture\":0,\"defaultTexture\":0,\"item\":0,\"defaultItem\":0}}',
    1,
    '[{\"Count\":1,\"collection\":\"mpbeach_overlays\",\"nameHash\":\"MP_Bea_M_Head_000\"},{\"Count\":1,\"collection\":\"mpbiker_overlays\",\"nameHash\":\"MP_MP_Biker_Tat_057_M\"},{\"Count\":1,\"collection\":\"mpbiker_overlays\",\"nameHash\":\"MP_MP_Biker_Tat_007_M\"},{\"Count\":1,\"collection\":\"mpbiker_overlays\",\"nameHash\":\"MP_MP_Biker_Tat_009_M\"},{\"Count\":6,\"collection\":\"mpbiker_overlays\",\"nameHash\":\"MP_MP_Biker_Tat_038_M\"}]'
  );
INSERT INTO
  `playerskins` (
    `id`,
    `citizenid`,
    `model`,
    `skin`,
    `active`,
    `tattoos`
  )
VALUES
  (
    43014,
    'DUK13299',
    '-1667301416',
    '{\"t-shirt\":{\"item\":3,\"defaultItem\":1,\"defaultTexture\":0,\"texture\":0},\"makeup\":{\"item\":-1,\"defaultItem\":-1,\"defaultTexture\":1,\"texture\":1},\"shoes\":{\"item\":1,\"defaultItem\":1,\"defaultTexture\":0,\"texture\":0},\"beard\":{\"item\":-1,\"defaultItem\":-1,\"defaultTexture\":1,\"texture\":1},\"hair\":{\"item\":0,\"defaultItem\":0,\"defaultTexture\":0,\"texture\":0},\"glass\":{\"item\":5,\"defaultItem\":0,\"defaultTexture\":0,\"texture\":0},\"ear\":{\"item\":-1,\"defaultItem\":-1,\"defaultTexture\":0,\"texture\":0},\"blush\":{\"item\":-1,\"defaultItem\":-1,\"defaultTexture\":1,\"texture\":1},\"bracelet\":{\"item\":-1,\"defaultItem\":-1,\"defaultTexture\":0,\"texture\":0},\"hat\":{\"item\":-1,\"defaultItem\":-1,\"defaultTexture\":0,\"texture\":0},\"decals\":{\"item\":0,\"defaultItem\":0,\"defaultTexture\":0,\"texture\":0},\"face\":{\"item\":0,\"defaultItem\":0,\"defaultTexture\":0,\"texture\":0},\"watch\":{\"item\":-1,\"defaultItem\":-1,\"defaultTexture\":0,\"texture\":0},\"accessory\":{\"item\":0,\"defaultItem\":0,\"defaultTexture\":0,\"texture\":0},\"arms\":{\"item\":0,\"defaultItem\":0,\"defaultTexture\":0,\"texture\":0},\"mask\":{\"item\":0,\"defaultItem\":0,\"defaultTexture\":0,\"texture\":0},\"bag\":{\"item\":0,\"defaultItem\":0,\"defaultTexture\":0,\"texture\":0},\"vest\":{\"item\":0,\"defaultItem\":0,\"defaultTexture\":0,\"texture\":0},\"pants\":{\"item\":0,\"defaultItem\":0,\"defaultTexture\":0,\"texture\":0},\"torso2\":{\"item\":0,\"defaultItem\":0,\"defaultTexture\":0,\"texture\":0},\"lipstick\":{\"item\":-1,\"defaultItem\":-1,\"defaultTexture\":1,\"texture\":1},\"ageing\":{\"item\":-1,\"defaultItem\":-1,\"defaultTexture\":0,\"texture\":0},\"eyebrows\":{\"item\":-1,\"defaultItem\":-1,\"defaultTexture\":1,\"texture\":1}}',
    1,
    ''
  );
INSERT INTO
  `playerskins` (
    `id`,
    `citizenid`,
    `model`,
    `skin`,
    `active`,
    `tattoos`
  )
VALUES
  (
    43017,
    'YFH94042',
    '1885233650',
    '{\"beard\":{\"defaultTexture\":1,\"defaultItem\":-1,\"item\":-1,\"texture\":1},\"pants\":{\"defaultTexture\":0,\"defaultItem\":0,\"item\":0,\"texture\":0},\"bag\":{\"defaultTexture\":0,\"defaultItem\":0,\"item\":0,\"texture\":0},\"lipstick\":{\"defaultTexture\":1,\"defaultItem\":-1,\"item\":-1,\"texture\":1},\"t-shirt\":{\"defaultTexture\":0,\"defaultItem\":1,\"item\":1,\"texture\":0},\"mask\":{\"defaultTexture\":0,\"defaultItem\":0,\"item\":0,\"texture\":0},\"eyebrows\":{\"defaultTexture\":1,\"defaultItem\":-1,\"item\":-1,\"texture\":1},\"bracelet\":{\"defaultTexture\":0,\"defaultItem\":-1,\"item\":-1,\"texture\":0},\"blush\":{\"defaultTexture\":1,\"defaultItem\":-1,\"item\":-1,\"texture\":1},\"vest\":{\"defaultTexture\":0,\"defaultItem\":0,\"item\":0,\"texture\":0},\"arms\":{\"defaultTexture\":0,\"defaultItem\":0,\"item\":0,\"texture\":0},\"hair\":{\"defaultTexture\":0,\"defaultItem\":0,\"item\":0,\"texture\":0},\"glass\":{\"defaultTexture\":0,\"defaultItem\":0,\"item\":0,\"texture\":0},\"hat\":{\"defaultTexture\":0,\"defaultItem\":-1,\"item\":-1,\"texture\":0},\"torso2\":{\"defaultTexture\":0,\"defaultItem\":0,\"item\":0,\"texture\":0},\"accessory\":{\"defaultTexture\":0,\"defaultItem\":0,\"item\":0,\"texture\":0},\"shoes\":{\"defaultTexture\":0,\"defaultItem\":1,\"item\":1,\"texture\":0},\"ageing\":{\"defaultTexture\":0,\"defaultItem\":-1,\"item\":-1,\"texture\":0},\"ear\":{\"defaultTexture\":0,\"defaultItem\":-1,\"item\":-1,\"texture\":0},\"watch\":{\"defaultTexture\":0,\"defaultItem\":-1,\"item\":-1,\"texture\":0},\"decals\":{\"defaultTexture\":0,\"defaultItem\":0,\"item\":0,\"texture\":0},\"face\":{\"defaultTexture\":0,\"defaultItem\":0,\"item\":0,\"texture\":0},\"makeup\":{\"defaultTexture\":1,\"defaultItem\":-1,\"item\":-1,\"texture\":1}}',
    1,
    ''
  );
INSERT INTO
  `playerskins` (
    `id`,
    `citizenid`,
    `model`,
    `skin`,
    `active`,
    `tattoos`
  )
VALUES
  (
    43019,
    'FTB86373',
    '1885233650',
    '{\"lipstick\":{\"defaultTexture\":1,\"item\":-1,\"texture\":1,\"defaultItem\":-1},\"glass\":{\"defaultTexture\":0,\"item\":0,\"texture\":0,\"defaultItem\":0},\"bracelet\":{\"defaultTexture\":0,\"item\":-1,\"texture\":0,\"defaultItem\":-1},\"beard\":{\"defaultTexture\":1,\"item\":-1,\"texture\":1,\"defaultItem\":-1},\"ageing\":{\"defaultTexture\":0,\"item\":-1,\"texture\":0,\"defaultItem\":-1},\"accessory\":{\"defaultTexture\":0,\"item\":1,\"texture\":0,\"defaultItem\":0},\"torso2\":{\"defaultTexture\":0,\"item\":53,\"texture\":0,\"defaultItem\":0},\"makeup\":{\"defaultTexture\":1,\"item\":-1,\"texture\":1,\"defaultItem\":-1},\"shoes\":{\"defaultTexture\":0,\"item\":8,\"texture\":0,\"defaultItem\":1},\"watch\":{\"defaultTexture\":0,\"item\":-1,\"texture\":0,\"defaultItem\":-1},\"decals\":{\"defaultTexture\":0,\"item\":7,\"texture\":0,\"defaultItem\":0},\"hat\":{\"defaultTexture\":0,\"item\":119,\"texture\":0,\"defaultItem\":-1},\"blush\":{\"defaultTexture\":1,\"item\":-1,\"texture\":1,\"defaultItem\":-1},\"face\":{\"defaultTexture\":0,\"item\":7,\"texture\":0,\"defaultItem\":0},\"eyebrows\":{\"defaultTexture\":1,\"item\":-1,\"texture\":1,\"defaultItem\":-1},\"arms\":{\"defaultTexture\":0,\"item\":17,\"texture\":0,\"defaultItem\":0},\"bag\":{\"defaultTexture\":0,\"item\":2,\"texture\":0,\"defaultItem\":0},\"hair\":{\"defaultTexture\":0,\"item\":0,\"texture\":0,\"defaultItem\":0},\"ear\":{\"defaultTexture\":0,\"item\":-1,\"texture\":0,\"defaultItem\":-1},\"mask\":{\"defaultTexture\":0,\"item\":56,\"texture\":1,\"defaultItem\":0},\"t-shirt\":{\"defaultTexture\":0,\"item\":58,\"texture\":0,\"defaultItem\":1},\"pants\":{\"defaultTexture\":0,\"item\":4,\"texture\":2,\"defaultItem\":0},\"vest\":{\"defaultTexture\":0,\"item\":5,\"texture\":0,\"defaultItem\":0}}',
    1,
    ''
  );
INSERT INTO
  `playerskins` (
    `id`,
    `citizenid`,
    `model`,
    `skin`,
    `active`,
    `tattoos`
  )
VALUES
  (
    43020,
    'ULS88307',
    '1885233650',
    '{\"mask\":{\"item\":0,\"texture\":0,\"defaultItem\":0,\"defaultTexture\":0},\"beard\":{\"item\":-1,\"texture\":1,\"defaultItem\":-1,\"defaultTexture\":1},\"blush\":{\"item\":-1,\"texture\":1,\"defaultItem\":-1,\"defaultTexture\":1},\"ageing\":{\"item\":-1,\"texture\":0,\"defaultItem\":-1,\"defaultTexture\":0},\"bag\":{\"item\":0,\"texture\":0,\"defaultItem\":0,\"defaultTexture\":0},\"t-shirt\":{\"item\":1,\"texture\":0,\"defaultItem\":1,\"defaultTexture\":0},\"arms\":{\"item\":0,\"texture\":0,\"defaultItem\":0,\"defaultTexture\":0},\"makeup\":{\"item\":-1,\"texture\":1,\"defaultItem\":-1,\"defaultTexture\":1},\"face\":{\"item\":0,\"texture\":0,\"defaultItem\":0,\"defaultTexture\":0},\"vest\":{\"item\":0,\"texture\":0,\"defaultItem\":0,\"defaultTexture\":0},\"torso2\":{\"item\":0,\"texture\":0,\"defaultItem\":0,\"defaultTexture\":0},\"decals\":{\"item\":0,\"texture\":0,\"defaultItem\":0,\"defaultTexture\":0},\"watch\":{\"item\":-1,\"texture\":0,\"defaultItem\":-1,\"defaultTexture\":0},\"accessory\":{\"item\":0,\"texture\":0,\"defaultItem\":0,\"defaultTexture\":0},\"bracelet\":{\"item\":-1,\"texture\":0,\"defaultItem\":-1,\"defaultTexture\":0},\"eyebrows\":{\"item\":-1,\"texture\":1,\"defaultItem\":-1,\"defaultTexture\":1},\"ear\":{\"item\":-1,\"texture\":0,\"defaultItem\":-1,\"defaultTexture\":0},\"hair\":{\"item\":0,\"texture\":0,\"defaultItem\":0,\"defaultTexture\":0},\"pants\":{\"item\":0,\"texture\":0,\"defaultItem\":0,\"defaultTexture\":0},\"glass\":{\"item\":0,\"texture\":0,\"defaultItem\":0,\"defaultTexture\":0},\"hat\":{\"item\":-1,\"texture\":0,\"defaultItem\":-1,\"defaultTexture\":0},\"shoes\":{\"item\":1,\"texture\":0,\"defaultItem\":1,\"defaultTexture\":0},\"lipstick\":{\"item\":-1,\"texture\":1,\"defaultItem\":-1,\"defaultTexture\":1}}',
    1,
    ''
  );
INSERT INTO
  `playerskins` (
    `id`,
    `citizenid`,
    `model`,
    `skin`,
    `active`,
    `tattoos`
  )
VALUES
  (
    43021,
    'NGR07907',
    '1885233650',
    '{\"beard\":{\"texture\":1,\"defaultTexture\":1,\"defaultItem\":-1,\"item\":-1},\"blush\":{\"texture\":1,\"defaultTexture\":1,\"defaultItem\":-1,\"item\":-1},\"shoes\":{\"texture\":0,\"defaultTexture\":0,\"defaultItem\":1,\"item\":10},\"ageing\":{\"texture\":0,\"defaultTexture\":0,\"defaultItem\":-1,\"item\":-1},\"pants\":{\"texture\":0,\"defaultTexture\":0,\"defaultItem\":0,\"item\":10},\"face\":{\"texture\":4,\"defaultTexture\":0,\"defaultItem\":0,\"item\":10},\"watch\":{\"texture\":0,\"defaultTexture\":0,\"defaultItem\":-1,\"item\":-1},\"accessory\":{\"texture\":0,\"defaultTexture\":0,\"defaultItem\":0,\"item\":0},\"ear\":{\"texture\":0,\"defaultTexture\":0,\"defaultItem\":-1,\"item\":-1},\"glass\":{\"texture\":0,\"defaultTexture\":0,\"defaultItem\":0,\"item\":0},\"bracelet\":{\"texture\":0,\"defaultTexture\":0,\"defaultItem\":-1,\"item\":-1},\"torso2\":{\"texture\":0,\"defaultTexture\":0,\"defaultItem\":0,\"item\":4},\"hair\":{\"texture\":0,\"defaultTexture\":0,\"defaultItem\":0,\"item\":0},\"makeup\":{\"texture\":1,\"defaultTexture\":1,\"defaultItem\":-1,\"item\":-1},\"decals\":{\"texture\":0,\"defaultTexture\":0,\"defaultItem\":0,\"item\":0},\"hat\":{\"texture\":0,\"defaultTexture\":0,\"defaultItem\":-1,\"item\":-1},\"mask\":{\"texture\":0,\"defaultTexture\":0,\"defaultItem\":0,\"item\":0},\"t-shirt\":{\"texture\":0,\"defaultTexture\":0,\"defaultItem\":1,\"item\":4},\"lipstick\":{\"texture\":1,\"defaultTexture\":1,\"defaultItem\":-1,\"item\":-1},\"bag\":{\"texture\":0,\"defaultTexture\":0,\"defaultItem\":0,\"item\":0},\"arms\":{\"texture\":0,\"defaultTexture\":0,\"defaultItem\":0,\"item\":19},\"vest\":{\"texture\":0,\"defaultTexture\":0,\"defaultItem\":0,\"item\":0},\"eyebrows\":{\"texture\":1,\"defaultTexture\":1,\"defaultItem\":-1,\"item\":-1}}',
    1,
    ''
  );
INSERT INTO
  `playerskins` (
    `id`,
    `citizenid`,
    `model`,
    `skin`,
    `active`,
    `tattoos`
  )
VALUES
  (
    43022,
    'IHN96025',
    '1885233650',
    '{\"bag\":{\"defaultItem\":0,\"item\":0,\"texture\":0,\"defaultTexture\":0},\"t-shirt\":{\"defaultItem\":1,\"item\":7,\"texture\":0,\"defaultTexture\":0},\"blush\":{\"defaultItem\":-1,\"item\":-1,\"texture\":1,\"defaultTexture\":1},\"bracelet\":{\"defaultItem\":-1,\"item\":-1,\"texture\":0,\"defaultTexture\":0},\"lipstick\":{\"defaultItem\":-1,\"item\":-1,\"texture\":1,\"defaultTexture\":1},\"face\":{\"defaultItem\":0,\"item\":2,\"texture\":0,\"defaultTexture\":0},\"arms\":{\"defaultItem\":0,\"item\":0,\"texture\":0,\"defaultTexture\":0},\"ageing\":{\"defaultItem\":-1,\"item\":-1,\"texture\":0,\"defaultTexture\":0},\"makeup\":{\"defaultItem\":-1,\"item\":-1,\"texture\":1,\"defaultTexture\":1},\"pants\":{\"defaultItem\":0,\"item\":0,\"texture\":0,\"defaultTexture\":0},\"shoes\":{\"defaultItem\":1,\"item\":1,\"texture\":0,\"defaultTexture\":0},\"hat\":{\"defaultItem\":-1,\"item\":-1,\"texture\":0,\"defaultTexture\":0},\"eyebrows\":{\"defaultItem\":-1,\"item\":-1,\"texture\":1,\"defaultTexture\":1},\"accessory\":{\"defaultItem\":0,\"item\":0,\"texture\":0,\"defaultTexture\":0},\"glass\":{\"defaultItem\":0,\"item\":0,\"texture\":0,\"defaultTexture\":0},\"watch\":{\"defaultItem\":-1,\"item\":-1,\"texture\":0,\"defaultTexture\":0},\"ear\":{\"defaultItem\":-1,\"item\":-1,\"texture\":0,\"defaultTexture\":0},\"mask\":{\"defaultItem\":0,\"item\":0,\"texture\":0,\"defaultTexture\":0},\"torso2\":{\"defaultItem\":0,\"item\":11,\"texture\":0,\"defaultTexture\":0},\"decals\":{\"defaultItem\":0,\"item\":0,\"texture\":0,\"defaultTexture\":0},\"vest\":{\"defaultItem\":0,\"item\":0,\"texture\":0,\"defaultTexture\":0},\"beard\":{\"defaultItem\":-1,\"item\":-1,\"texture\":1,\"defaultTexture\":1},\"hair\":{\"defaultItem\":0,\"item\":0,\"texture\":0,\"defaultTexture\":0}}',
    1,
    ''
  );
INSERT INTO
  `playerskins` (
    `id`,
    `citizenid`,
    `model`,
    `skin`,
    `active`,
    `tattoos`
  )
VALUES
  (
    43023,
    'OEA13112',
    '1885233650',
    '{\"arms\":{\"item\":8,\"texture\":0,\"defaultItem\":0,\"defaultTexture\":0},\"decals\":{\"item\":0,\"texture\":0,\"defaultItem\":0,\"defaultTexture\":0},\"vest\":{\"item\":0,\"texture\":0,\"defaultItem\":0,\"defaultTexture\":0},\"hair\":{\"item\":0,\"texture\":0,\"defaultItem\":0,\"defaultTexture\":0},\"eyebrows\":{\"item\":-1,\"texture\":1,\"defaultItem\":-1,\"defaultTexture\":1},\"face\":{\"item\":0,\"texture\":0,\"defaultItem\":0,\"defaultTexture\":0},\"watch\":{\"item\":-1,\"texture\":0,\"defaultItem\":-1,\"defaultTexture\":0},\"accessory\":{\"item\":0,\"texture\":0,\"defaultItem\":0,\"defaultTexture\":0},\"pants\":{\"item\":0,\"texture\":0,\"defaultItem\":0,\"defaultTexture\":0},\"bracelet\":{\"item\":-1,\"texture\":0,\"defaultItem\":-1,\"defaultTexture\":0},\"ear\":{\"item\":-1,\"texture\":0,\"defaultItem\":-1,\"defaultTexture\":0},\"makeup\":{\"item\":-1,\"texture\":1,\"defaultItem\":-1,\"defaultTexture\":1},\"mask\":{\"item\":0,\"texture\":0,\"defaultItem\":0,\"defaultTexture\":0},\"hat\":{\"item\":-1,\"texture\":0,\"defaultItem\":-1,\"defaultTexture\":0},\"t-shirt\":{\"item\":15,\"texture\":0,\"defaultItem\":1,\"defaultTexture\":0},\"glass\":{\"item\":0,\"texture\":0,\"defaultItem\":0,\"defaultTexture\":0},\"shoes\":{\"item\":1,\"texture\":0,\"defaultItem\":1,\"defaultTexture\":0},\"beard\":{\"item\":-1,\"texture\":1,\"defaultItem\":-1,\"defaultTexture\":1},\"bag\":{\"item\":0,\"texture\":0,\"defaultItem\":0,\"defaultTexture\":0},\"torso2\":{\"item\":8,\"texture\":0,\"defaultItem\":0,\"defaultTexture\":0},\"lipstick\":{\"item\":-1,\"texture\":1,\"defaultItem\":-1,\"defaultTexture\":1},\"blush\":{\"item\":-1,\"texture\":1,\"defaultItem\":-1,\"defaultTexture\":1},\"ageing\":{\"item\":9,\"texture\":0,\"defaultItem\":-1,\"defaultTexture\":0}}',
    1,
    ''
  );
INSERT INTO
  `playerskins` (
    `id`,
    `citizenid`,
    `model`,
    `skin`,
    `active`,
    `tattoos`
  )
VALUES
  (
    43025,
    'UCU66269',
    '1885233650',
    '{\"beard\":{\"defaultTexture\":1,\"texture\":1,\"defaultItem\":-1,\"item\":-1},\"blush\":{\"defaultTexture\":1,\"texture\":1,\"defaultItem\":-1,\"item\":-1},\"watch\":{\"defaultTexture\":0,\"texture\":0,\"defaultItem\":-1,\"item\":-1},\"ageing\":{\"defaultTexture\":0,\"texture\":0,\"defaultItem\":-1,\"item\":-1},\"pants\":{\"defaultTexture\":0,\"texture\":0,\"defaultItem\":0,\"item\":0},\"face\":{\"defaultTexture\":0,\"texture\":0,\"defaultItem\":0,\"item\":0},\"mask\":{\"defaultTexture\":0,\"texture\":0,\"defaultItem\":0,\"item\":0},\"hat\":{\"defaultTexture\":0,\"texture\":0,\"defaultItem\":-1,\"item\":-1},\"ear\":{\"defaultTexture\":0,\"texture\":0,\"defaultItem\":-1,\"item\":-1},\"glass\":{\"defaultTexture\":0,\"texture\":0,\"defaultItem\":0,\"item\":0},\"accessory\":{\"defaultTexture\":0,\"texture\":0,\"defaultItem\":0,\"item\":0},\"torso2\":{\"defaultTexture\":0,\"texture\":0,\"defaultItem\":0,\"item\":0},\"hair\":{\"defaultTexture\":0,\"texture\":0,\"defaultItem\":0,\"item\":0},\"arms\":{\"defaultTexture\":0,\"texture\":0,\"defaultItem\":0,\"item\":0},\"decals\":{\"defaultTexture\":0,\"texture\":0,\"defaultItem\":0,\"item\":0},\"shoes\":{\"defaultTexture\":0,\"texture\":0,\"defaultItem\":1,\"item\":1},\"makeup\":{\"defaultTexture\":1,\"texture\":1,\"defaultItem\":-1,\"item\":-1},\"t-shirt\":{\"defaultTexture\":0,\"texture\":0,\"defaultItem\":1,\"item\":2},\"lipstick\":{\"defaultTexture\":1,\"texture\":1,\"defaultItem\":-1,\"item\":-1},\"bag\":{\"defaultTexture\":0,\"texture\":0,\"defaultItem\":0,\"item\":0},\"bracelet\":{\"defaultTexture\":0,\"texture\":0,\"defaultItem\":-1,\"item\":-1},\"vest\":{\"defaultTexture\":0,\"texture\":0,\"defaultItem\":0,\"item\":0},\"eyebrows\":{\"defaultTexture\":1,\"texture\":1,\"defaultItem\":-1,\"item\":-1}}',
    1,
    ''
  );
INSERT INTO
  `playerskins` (
    `id`,
    `citizenid`,
    `model`,
    `skin`,
    `active`,
    `tattoos`
  )
VALUES
  (
    43028,
    'TPL08484',
    '1885233650',
    '{\"accessory\":{\"defaultTexture\":0,\"texture\":0,\"item\":1,\"defaultItem\":0},\"mask\":{\"defaultTexture\":0,\"texture\":0,\"item\":0,\"defaultItem\":0},\"makeup\":{\"defaultTexture\":1,\"texture\":1,\"item\":-1,\"defaultItem\":-1},\"lipstick\":{\"defaultTexture\":1,\"texture\":1,\"item\":-1,\"defaultItem\":-1},\"glass\":{\"defaultTexture\":0,\"texture\":0,\"item\":5,\"defaultItem\":0},\"hat\":{\"defaultTexture\":0,\"texture\":0,\"item\":-1,\"defaultItem\":-1},\"blush\":{\"defaultTexture\":1,\"texture\":1,\"item\":-1,\"defaultItem\":-1},\"face\":{\"defaultTexture\":0,\"texture\":0,\"item\":6,\"defaultItem\":0},\"decals\":{\"defaultTexture\":0,\"texture\":0,\"item\":0,\"defaultItem\":0},\"watch\":{\"defaultTexture\":0,\"texture\":0,\"item\":-1,\"defaultItem\":-1},\"hair\":{\"defaultTexture\":0,\"texture\":0,\"item\":52,\"defaultItem\":0},\"vest\":{\"defaultTexture\":0,\"texture\":0,\"item\":0,\"defaultItem\":0},\"ageing\":{\"defaultTexture\":0,\"texture\":0,\"item\":-1,\"defaultItem\":-1},\"bag\":{\"defaultTexture\":0,\"texture\":0,\"item\":0,\"defaultItem\":0},\"shoes\":{\"defaultTexture\":0,\"texture\":0,\"item\":15,\"defaultItem\":1},\"arms\":{\"defaultTexture\":0,\"texture\":0,\"item\":14,\"defaultItem\":0},\"ear\":{\"defaultTexture\":0,\"texture\":0,\"item\":-1,\"defaultItem\":-1},\"bracelet\":{\"defaultTexture\":0,\"texture\":0,\"item\":-1,\"defaultItem\":-1},\"torso2\":{\"defaultTexture\":0,\"texture\":3,\"item\":4,\"defaultItem\":0},\"t-shirt\":{\"defaultTexture\":0,\"texture\":0,\"item\":26,\"defaultItem\":1},\"beard\":{\"defaultTexture\":1,\"texture\":1,\"item\":11,\"defaultItem\":-1},\"eyebrows\":{\"defaultTexture\":1,\"texture\":1,\"item\":4,\"defaultItem\":-1},\"pants\":{\"defaultTexture\":0,\"texture\":0,\"item\":4,\"defaultItem\":0}}',
    1,
    ''
  );
INSERT INTO
  `playerskins` (
    `id`,
    `citizenid`,
    `model`,
    `skin`,
    `active`,
    `tattoos`
  )
VALUES
  (
    43029,
    'RKB90005',
    '1885233650',
    '{\"pants\":{\"defaultTexture\":0,\"item\":0,\"defaultItem\":0,\"texture\":0},\"glass\":{\"defaultTexture\":0,\"item\":0,\"defaultItem\":0,\"texture\":0},\"makeup\":{\"defaultTexture\":1,\"item\":-1,\"defaultItem\":-1,\"texture\":1},\"mask\":{\"defaultTexture\":0,\"item\":0,\"defaultItem\":0,\"texture\":0},\"hat\":{\"defaultTexture\":0,\"item\":-1,\"defaultItem\":-1,\"texture\":0},\"eyebrows\":{\"defaultTexture\":1,\"item\":-1,\"defaultItem\":-1,\"texture\":1},\"ageing\":{\"defaultTexture\":0,\"item\":-1,\"defaultItem\":-1,\"texture\":0},\"lipstick\":{\"defaultTexture\":1,\"item\":-1,\"defaultItem\":-1,\"texture\":1},\"t-shirt\":{\"defaultTexture\":0,\"item\":1,\"defaultItem\":1,\"texture\":0},\"arms\":{\"defaultTexture\":0,\"item\":0,\"defaultItem\":0,\"texture\":0},\"accessory\":{\"defaultTexture\":0,\"item\":0,\"defaultItem\":0,\"texture\":0},\"decals\":{\"defaultTexture\":0,\"item\":0,\"defaultItem\":0,\"texture\":0},\"blush\":{\"defaultTexture\":1,\"item\":-1,\"defaultItem\":-1,\"texture\":1},\"bracelet\":{\"defaultTexture\":0,\"item\":-1,\"defaultItem\":-1,\"texture\":0},\"bag\":{\"defaultTexture\":0,\"item\":0,\"defaultItem\":0,\"texture\":0},\"hair\":{\"defaultTexture\":0,\"item\":0,\"defaultItem\":0,\"texture\":0},\"torso2\":{\"defaultTexture\":0,\"item\":0,\"defaultItem\":0,\"texture\":0},\"ear\":{\"defaultTexture\":0,\"item\":-1,\"defaultItem\":-1,\"texture\":0},\"watch\":{\"defaultTexture\":0,\"item\":-1,\"defaultItem\":-1,\"texture\":0},\"vest\":{\"defaultTexture\":0,\"item\":0,\"defaultItem\":0,\"texture\":0},\"shoes\":{\"defaultTexture\":0,\"item\":1,\"defaultItem\":1,\"texture\":0},\"face\":{\"defaultTexture\":0,\"item\":2,\"defaultItem\":0,\"texture\":0},\"beard\":{\"defaultTexture\":1,\"item\":-1,\"defaultItem\":-1,\"texture\":1}}',
    1,
    ''
  );
INSERT INTO
  `playerskins` (
    `id`,
    `citizenid`,
    `model`,
    `skin`,
    `active`,
    `tattoos`
  )
VALUES
  (
    43030,
    'MHS13929',
    '1885233650',
    '{\"makeup\":{\"defaultTexture\":1,\"texture\":1,\"item\":-1,\"defaultItem\":-1},\"torso2\":{\"defaultTexture\":0,\"texture\":0,\"item\":10,\"defaultItem\":0},\"face\":{\"defaultTexture\":0,\"texture\":0,\"item\":0,\"defaultItem\":0},\"glass\":{\"defaultTexture\":0,\"texture\":0,\"item\":0,\"defaultItem\":0},\"blush\":{\"defaultTexture\":1,\"texture\":1,\"item\":-1,\"defaultItem\":-1},\"t-shirt\":{\"defaultTexture\":0,\"texture\":0,\"item\":4,\"defaultItem\":1},\"beard\":{\"defaultTexture\":1,\"texture\":1,\"item\":-1,\"defaultItem\":-1},\"watch\":{\"defaultTexture\":0,\"texture\":0,\"item\":-1,\"defaultItem\":-1},\"shoes\":{\"defaultTexture\":0,\"texture\":0,\"item\":10,\"defaultItem\":1},\"arms\":{\"defaultTexture\":0,\"texture\":0,\"item\":1,\"defaultItem\":0},\"ageing\":{\"defaultTexture\":0,\"texture\":0,\"item\":-1,\"defaultItem\":-1},\"hair\":{\"defaultTexture\":0,\"texture\":0,\"item\":0,\"defaultItem\":0},\"decals\":{\"defaultTexture\":0,\"texture\":0,\"item\":0,\"defaultItem\":0},\"accessory\":{\"defaultTexture\":0,\"texture\":0,\"item\":0,\"defaultItem\":0},\"eyebrows\":{\"defaultTexture\":1,\"texture\":1,\"item\":-1,\"defaultItem\":-1},\"bracelet\":{\"defaultTexture\":0,\"texture\":0,\"item\":-1,\"defaultItem\":-1},\"lipstick\":{\"defaultTexture\":1,\"texture\":1,\"item\":-1,\"defaultItem\":-1},\"pants\":{\"defaultTexture\":0,\"texture\":0,\"item\":10,\"defaultItem\":0},\"hat\":{\"defaultTexture\":0,\"texture\":0,\"item\":-1,\"defaultItem\":-1},\"bag\":{\"defaultTexture\":0,\"texture\":0,\"item\":0,\"defaultItem\":0},\"vest\":{\"defaultTexture\":0,\"texture\":0,\"item\":0,\"defaultItem\":0},\"mask\":{\"defaultTexture\":0,\"texture\":0,\"item\":0,\"defaultItem\":0},\"ear\":{\"defaultTexture\":0,\"texture\":0,\"item\":-1,\"defaultItem\":-1}}',
    1,
    ''
  );
INSERT INTO
  `playerskins` (
    `id`,
    `citizenid`,
    `model`,
    `skin`,
    `active`,
    `tattoos`
  )
VALUES
  (
    43031,
    'SWS16905',
    '1885233650',
    '{\"eyebrows\":{\"defaultItem\":-1,\"texture\":1,\"item\":-1,\"defaultTexture\":1},\"arms\":{\"defaultItem\":0,\"texture\":0,\"item\":0,\"defaultTexture\":0},\"hair\":{\"defaultItem\":0,\"texture\":0,\"item\":0,\"defaultTexture\":0},\"decals\":{\"defaultItem\":0,\"texture\":0,\"item\":0,\"defaultTexture\":0},\"torso2\":{\"defaultItem\":0,\"texture\":0,\"item\":0,\"defaultTexture\":0},\"hat\":{\"defaultItem\":-1,\"texture\":0,\"item\":-1,\"defaultTexture\":0},\"face\":{\"defaultItem\":0,\"texture\":0,\"item\":1,\"defaultTexture\":0},\"shoes\":{\"defaultItem\":1,\"texture\":0,\"item\":1,\"defaultTexture\":0},\"watch\":{\"defaultItem\":-1,\"texture\":0,\"item\":-1,\"defaultTexture\":0},\"bracelet\":{\"defaultItem\":-1,\"texture\":0,\"item\":-1,\"defaultTexture\":0},\"accessory\":{\"defaultItem\":0,\"texture\":0,\"item\":0,\"defaultTexture\":0},\"beard\":{\"defaultItem\":-1,\"texture\":1,\"item\":-1,\"defaultTexture\":1},\"ear\":{\"defaultItem\":-1,\"texture\":0,\"item\":-1,\"defaultTexture\":0},\"glass\":{\"defaultItem\":0,\"texture\":0,\"item\":0,\"defaultTexture\":0},\"pants\":{\"defaultItem\":0,\"texture\":0,\"item\":0,\"defaultTexture\":0},\"lipstick\":{\"defaultItem\":-1,\"texture\":1,\"item\":-1,\"defaultTexture\":1},\"bag\":{\"defaultItem\":0,\"texture\":0,\"item\":0,\"defaultTexture\":0},\"blush\":{\"defaultItem\":-1,\"texture\":1,\"item\":-1,\"defaultTexture\":1},\"t-shirt\":{\"defaultItem\":1,\"texture\":0,\"item\":1,\"defaultTexture\":0},\"ageing\":{\"defaultItem\":-1,\"texture\":0,\"item\":-1,\"defaultTexture\":0},\"makeup\":{\"defaultItem\":-1,\"texture\":1,\"item\":-1,\"defaultTexture\":1},\"mask\":{\"defaultItem\":0,\"texture\":0,\"item\":0,\"defaultTexture\":0},\"vest\":{\"defaultItem\":0,\"texture\":0,\"item\":0,\"defaultTexture\":0}}',
    1,
    ''
  );
INSERT INTO
  `playerskins` (
    `id`,
    `citizenid`,
    `model`,
    `skin`,
    `active`,
    `tattoos`
  )
VALUES
  (
    43032,
    'YVB96377',
    '1885233650',
    '{\"face\":{\"texture\":0,\"defaultTexture\":0,\"defaultItem\":0,\"item\":3},\"lipstick\":{\"texture\":1,\"defaultTexture\":1,\"defaultItem\":-1,\"item\":-1},\"pants\":{\"texture\":0,\"defaultTexture\":0,\"defaultItem\":0,\"item\":0},\"bracelet\":{\"texture\":0,\"defaultTexture\":0,\"defaultItem\":-1,\"item\":-1},\"mask\":{\"texture\":0,\"defaultTexture\":0,\"defaultItem\":0,\"item\":0},\"t-shirt\":{\"texture\":0,\"defaultTexture\":0,\"defaultItem\":1,\"item\":19},\"eyebrows\":{\"texture\":1,\"defaultTexture\":1,\"defaultItem\":-1,\"item\":-1},\"bag\":{\"texture\":0,\"defaultTexture\":0,\"defaultItem\":0,\"item\":0},\"blush\":{\"texture\":1,\"defaultTexture\":1,\"defaultItem\":-1,\"item\":-1},\"makeup\":{\"texture\":1,\"defaultTexture\":1,\"defaultItem\":-1,\"item\":-1},\"decals\":{\"texture\":0,\"defaultTexture\":0,\"defaultItem\":0,\"item\":0},\"accessory\":{\"texture\":0,\"defaultTexture\":0,\"defaultItem\":0,\"item\":0},\"torso2\":{\"texture\":0,\"defaultTexture\":0,\"defaultItem\":0,\"item\":4},\"watch\":{\"texture\":0,\"defaultTexture\":0,\"defaultItem\":-1,\"item\":-1},\"arms\":{\"texture\":0,\"defaultTexture\":0,\"defaultItem\":0,\"item\":12},\"ear\":{\"texture\":0,\"defaultTexture\":0,\"defaultItem\":-1,\"item\":-1},\"glass\":{\"texture\":0,\"defaultTexture\":0,\"defaultItem\":0,\"item\":0},\"hat\":{\"texture\":0,\"defaultTexture\":0,\"defaultItem\":-1,\"item\":-1},\"ageing\":{\"texture\":0,\"defaultTexture\":0,\"defaultItem\":-1,\"item\":-1},\"hair\":{\"texture\":0,\"defaultTexture\":0,\"defaultItem\":0,\"item\":0},\"beard\":{\"texture\":1,\"defaultTexture\":1,\"defaultItem\":-1,\"item\":-1},\"vest\":{\"texture\":0,\"defaultTexture\":0,\"defaultItem\":0,\"item\":0},\"shoes\":{\"texture\":0,\"defaultTexture\":0,\"defaultItem\":1,\"item\":1}}',
    1,
    ''
  );
INSERT INTO
  `playerskins` (
    `id`,
    `citizenid`,
    `model`,
    `skin`,
    `active`,
    `tattoos`
  )
VALUES
  (
    43033,
    'HCA16181',
    '1885233650',
    '{\"blush\":{\"defaultTexture\":1,\"defaultItem\":-1,\"item\":-1,\"texture\":1},\"hair\":{\"defaultTexture\":0,\"defaultItem\":0,\"item\":0,\"texture\":0},\"face\":{\"defaultTexture\":0,\"defaultItem\":0,\"item\":0,\"texture\":0},\"mask\":{\"defaultTexture\":0,\"defaultItem\":0,\"item\":0,\"texture\":0},\"pants\":{\"defaultTexture\":0,\"defaultItem\":0,\"item\":0,\"texture\":0},\"hat\":{\"defaultTexture\":0,\"defaultItem\":-1,\"item\":-1,\"texture\":0},\"vest\":{\"defaultTexture\":0,\"defaultItem\":0,\"item\":0,\"texture\":0},\"eyebrows\":{\"defaultTexture\":1,\"defaultItem\":-1,\"item\":-1,\"texture\":1},\"arms\":{\"defaultTexture\":0,\"defaultItem\":0,\"item\":0,\"texture\":0},\"decals\":{\"defaultTexture\":0,\"defaultItem\":0,\"item\":0,\"texture\":0},\"bracelet\":{\"defaultTexture\":0,\"defaultItem\":-1,\"item\":-1,\"texture\":0},\"lipstick\":{\"defaultTexture\":1,\"defaultItem\":-1,\"item\":-1,\"texture\":1},\"accessory\":{\"defaultTexture\":0,\"defaultItem\":0,\"item\":0,\"texture\":0},\"watch\":{\"defaultTexture\":0,\"defaultItem\":-1,\"item\":-1,\"texture\":0},\"ear\":{\"defaultTexture\":0,\"defaultItem\":-1,\"item\":-1,\"texture\":0},\"glass\":{\"defaultTexture\":0,\"defaultItem\":0,\"item\":0,\"texture\":0},\"torso2\":{\"defaultTexture\":0,\"defaultItem\":0,\"item\":0,\"texture\":0},\"bag\":{\"defaultTexture\":0,\"defaultItem\":0,\"item\":0,\"texture\":0},\"beard\":{\"defaultTexture\":1,\"defaultItem\":-1,\"item\":-1,\"texture\":1},\"shoes\":{\"defaultTexture\":0,\"defaultItem\":1,\"item\":1,\"texture\":0},\"t-shirt\":{\"defaultTexture\":0,\"defaultItem\":1,\"item\":1,\"texture\":0},\"makeup\":{\"defaultTexture\":1,\"defaultItem\":-1,\"item\":-1,\"texture\":1},\"ageing\":{\"defaultTexture\":0,\"defaultItem\":-1,\"item\":-1,\"texture\":0}}',
    1,
    ''
  );
INSERT INTO
  `playerskins` (
    `id`,
    `citizenid`,
    `model`,
    `skin`,
    `active`,
    `tattoos`
  )
VALUES
  (
    43034,
    'NUS45975',
    '1885233650',
    '{\"blush\":{\"item\":-1,\"texture\":1,\"defaultItem\":-1,\"defaultTexture\":1},\"beard\":{\"item\":-1,\"texture\":1,\"defaultItem\":-1,\"defaultTexture\":1},\"ageing\":{\"item\":-1,\"texture\":0,\"defaultItem\":-1,\"defaultTexture\":0},\"accessory\":{\"item\":0,\"texture\":0,\"defaultItem\":0,\"defaultTexture\":0},\"ear\":{\"item\":-1,\"texture\":0,\"defaultItem\":-1,\"defaultTexture\":0},\"torso2\":{\"item\":0,\"texture\":0,\"defaultItem\":0,\"defaultTexture\":0},\"face\":{\"item\":0,\"texture\":0,\"defaultItem\":0,\"defaultTexture\":0},\"pants\":{\"item\":0,\"texture\":0,\"defaultItem\":0,\"defaultTexture\":0},\"lipstick\":{\"item\":-1,\"texture\":1,\"defaultItem\":-1,\"defaultTexture\":1},\"shoes\":{\"item\":1,\"texture\":0,\"defaultItem\":1,\"defaultTexture\":0},\"bracelet\":{\"item\":-1,\"texture\":0,\"defaultItem\":-1,\"defaultTexture\":0},\"arms\":{\"item\":0,\"texture\":0,\"defaultItem\":0,\"defaultTexture\":0},\"eyebrows\":{\"item\":-1,\"texture\":1,\"defaultItem\":-1,\"defaultTexture\":1},\"watch\":{\"item\":-1,\"texture\":0,\"defaultItem\":-1,\"defaultTexture\":0},\"glass\":{\"item\":0,\"texture\":0,\"defaultItem\":0,\"defaultTexture\":0},\"makeup\":{\"item\":-1,\"texture\":1,\"defaultItem\":-1,\"defaultTexture\":1},\"t-shirt\":{\"item\":1,\"texture\":0,\"defaultItem\":1,\"defaultTexture\":0},\"mask\":{\"item\":0,\"texture\":0,\"defaultItem\":0,\"defaultTexture\":0},\"vest\":{\"item\":0,\"texture\":0,\"defaultItem\":0,\"defaultTexture\":0},\"decals\":{\"item\":0,\"texture\":0,\"defaultItem\":0,\"defaultTexture\":0},\"bag\":{\"item\":0,\"texture\":0,\"defaultItem\":0,\"defaultTexture\":0},\"hat\":{\"item\":-1,\"texture\":0,\"defaultItem\":-1,\"defaultTexture\":0},\"hair\":{\"item\":0,\"texture\":0,\"defaultItem\":0,\"defaultTexture\":0}}',
    1,
    '[{\"nameHash\":\"MP_Bea_M_Head_000\",\"collection\":\"mpbeach_overlays\",\"Count\":1},{\"nameHash\":\"MP_Bea_M_Head_001\",\"collection\":\"mpbeach_overlays\",\"Count\":1}]'
  );
INSERT INTO
  `playerskins` (
    `id`,
    `citizenid`,
    `model`,
    `skin`,
    `active`,
    `tattoos`
  )
VALUES
  (
    43035,
    'ZBX75995',
    '1885233650',
    '{\"torso2\":{\"defaultTexture\":0,\"item\":0,\"texture\":0,\"defaultItem\":0},\"hair\":{\"defaultTexture\":0,\"item\":0,\"texture\":0,\"defaultItem\":0},\"bag\":{\"defaultTexture\":0,\"item\":0,\"texture\":0,\"defaultItem\":0},\"lipstick\":{\"defaultTexture\":1,\"item\":-1,\"texture\":1,\"defaultItem\":-1},\"bracelet\":{\"defaultTexture\":0,\"item\":-1,\"texture\":0,\"defaultItem\":-1},\"decals\":{\"defaultTexture\":0,\"item\":0,\"texture\":0,\"defaultItem\":0},\"pants\":{\"defaultTexture\":0,\"item\":0,\"texture\":0,\"defaultItem\":0},\"beard\":{\"defaultTexture\":1,\"item\":-1,\"texture\":1,\"defaultItem\":-1},\"face\":{\"defaultTexture\":0,\"item\":0,\"texture\":0,\"defaultItem\":0},\"ear\":{\"defaultTexture\":0,\"item\":-1,\"texture\":0,\"defaultItem\":-1},\"makeup\":{\"defaultTexture\":1,\"item\":-1,\"texture\":1,\"defaultItem\":-1},\"t-shirt\":{\"defaultTexture\":0,\"item\":1,\"texture\":0,\"defaultItem\":1},\"eyebrows\":{\"defaultTexture\":1,\"item\":-1,\"texture\":1,\"defaultItem\":-1},\"glass\":{\"defaultTexture\":0,\"item\":0,\"texture\":0,\"defaultItem\":0},\"watch\":{\"defaultTexture\":0,\"item\":-1,\"texture\":0,\"defaultItem\":-1},\"arms\":{\"defaultTexture\":0,\"item\":0,\"texture\":0,\"defaultItem\":0},\"mask\":{\"defaultTexture\":0,\"item\":0,\"texture\":0,\"defaultItem\":0},\"ageing\":{\"defaultTexture\":0,\"item\":-1,\"texture\":0,\"defaultItem\":-1},\"blush\":{\"defaultTexture\":1,\"item\":-1,\"texture\":1,\"defaultItem\":-1},\"vest\":{\"defaultTexture\":0,\"item\":0,\"texture\":0,\"defaultItem\":0},\"accessory\":{\"defaultTexture\":0,\"item\":0,\"texture\":0,\"defaultItem\":0},\"hat\":{\"defaultTexture\":0,\"item\":-1,\"texture\":0,\"defaultItem\":-1},\"shoes\":{\"defaultTexture\":0,\"item\":1,\"texture\":0,\"defaultItem\":1}}',
    1,
    '[{\"collection\":\"mpbeach_overlays\",\"nameHash\":\"MP_Bea_M_Head_000\",\"Count\":1}]'
  );

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: queue
# ------------------------------------------------------------


# ------------------------------------------------------------
# DATA DUMP FOR TABLE: savedobjects
# ------------------------------------------------------------


# ------------------------------------------------------------
# DATA DUMP FOR TABLE: stashitems
# ------------------------------------------------------------


# ------------------------------------------------------------
# DATA DUMP FOR TABLE: stashitemsnew
# ------------------------------------------------------------

INSERT INTO
  `stashitemsnew` (`id`, `stash`, `items`)
VALUES
  (
    2109,
    'policestash_LRP87077',
    '{\"2\":{\"label\":\"Walther P99 AS\",\"name\":\"weapon_pistol\",\"unique\":true,\"type\":\"weapon\",\"amount\":1,\"weight\":1000,\"useable\":false,\"image\":\"pistol.png\",\"slot\":2,\"info\":{\"attachments\":[{\"component\":\"COMPONENT_AT_PI_FLSH\",\"label\":\"Flashlight\"}],\"ammo\":0,\"serie\":\"78wPd5aK051hMiP\"}},\"4\":{\"label\":\"Pump Shotgun\",\"name\":\"weapon_pumpshotgun\",\"unique\":true,\"type\":\"weapon\",\"amount\":1,\"weight\":3800,\"useable\":false,\"image\":\"pumpshotgun.png\",\"slot\":4,\"info\":{\"attachments\":[{\"component\":\"COMPONENT_AT_AR_FLSH\",\"label\":\"Flashlight\"}],\"ammo\":0,\"serie\":\"54oIb2hD423OExM\"}}}'
  );
INSERT INTO
  `stashitemsnew` (`id`, `stash`, `items`)
VALUES
  (2110, 'apartment36432', '[]');
INSERT INTO
  `stashitemsnew` (`id`, `stash`, `items`)
VALUES
  (
    2111,
    'apartment58618',
    '{\"1\":{\"amount\":9,\"type\":\"item\",\"useable\":true,\"label\":\"Joint\",\"unique\":false,\"slot\":1,\"image\":\"joint.png\",\"name\":\"joint\",\"info\":[],\"weight\":0},\"3\":{\"amount\":1,\"type\":\"item\",\"useable\":true,\"label\":\"Cleaning Kit\",\"unique\":false,\"slot\":3,\"image\":\"cleaningkit.png\",\"name\":\"cleaningkit\",\"info\":[],\"weight\":250},\"4\":{\"amount\":1,\"type\":\"item\",\"useable\":true,\"label\":\"Repairkit\",\"unique\":false,\"slot\":4,\"image\":\"repairkit.png\",\"name\":\"repairkit\",\"info\":[],\"weight\":2500},\"5\":{\"amount\":19,\"type\":\"item\",\"useable\":false,\"label\":\"Steel\",\"unique\":false,\"slot\":5,\"image\":\"steel.png\",\"name\":\"steel\",\"info\":\"\",\"weight\":100},\"6\":{\"amount\":8,\"type\":\"item\",\"useable\":false,\"label\":\"Emerald\",\"unique\":false,\"slot\":6,\"image\":\"emerald.png\",\"name\":\"emerald\",\"info\":\"\",\"weight\":1000},\"7\":{\"amount\":1,\"type\":\"item\",\"useable\":true,\"label\":\"Walking Stick\",\"unique\":false,\"slot\":7,\"image\":\"walkstick.png\",\"name\":\"walkstick\",\"info\":[],\"weight\":1000},\"8\":{\"amount\":22,\"type\":\"item\",\"useable\":false,\"label\":\"Iron\",\"unique\":false,\"slot\":8,\"image\":\"ironplate.png\",\"name\":\"iron\",\"info\":\"\",\"weight\":100},\"9\":{\"amount\":1,\"type\":\"weapon\",\"useable\":false,\"label\":\"Carbine Rifle\",\"unique\":true,\"slot\":9,\"image\":\"carbinerifle.png\",\"name\":\"weapon_carbinerifle\",\"info\":{\"ammo\":0,\"serie\":\"02vUR2tP579NOjJ\"},\"weight\":4000},\"10\":{\"amount\":1,\"type\":\"weapon\",\"useable\":false,\"label\":\"Walther P99 AS\",\"unique\":true,\"slot\":10,\"image\":\"pistol.png\",\"name\":\"weapon_pistol\",\"info\":{\"ammo\":4,\"serie\":\"70dvs1Hd428zMxW\"},\"weight\":1000},\"11\":{\"amount\":1,\"type\":\"item\",\"useable\":true,\"label\":\"Radio\",\"unique\":true,\"slot\":11,\"image\":\"radio.png\",\"name\":\"radio\",\"info\":[],\"weight\":2000},\"36\":{\"amount\":1,\"type\":\"item\",\"useable\":true,\"label\":\"Binoculars\",\"unique\":false,\"slot\":36,\"image\":\"binoculars.png\",\"name\":\"binoculars\",\"info\":[],\"weight\":600}}'
  );
INSERT INTO
  `stashitemsnew` (`id`, `stash`, `items`)
VALUES
  (
    2112,
    'policestash_FTB86373',
    '[{\"amount\":10,\"type\":\"item\",\"useable\":false,\"label\":\"10k Chain\",\"unique\":false,\"slot\":1,\"image\":\"10kgoldchain.png\",\"name\":\"10kgoldchain\",\"info\":\"\",\"weight\":2000},{\"amount\":1,\"type\":\"item\",\"useable\":true,\"label\":\"Id Card\",\"unique\":true,\"slot\":2,\"image\":\"id_card.png\",\"name\":\"id_card\",\"info\":{\"firstname\":\"Sercoo\",\"lastname\":\"Aticoo\",\"nationality\":\"US\",\"birthdate\":\"1990-08-24\",\"gender\":0,\"citizenid\":\"FTB86373\"},\"weight\":0},{\"amount\":1,\"type\":\"item\",\"useable\":false,\"label\":\"Toolkit\",\"unique\":false,\"slot\":3,\"image\":\"screwdriverset.png\",\"name\":\"screwdriverset\",\"info\":[],\"weight\":1000}]'
  );
INSERT INTO
  `stashitemsnew` (`id`, `stash`, `items`)
VALUES
  (
    2113,
    'apartment37400',
    '[{\"amount\":1,\"type\":\"item\",\"useable\":true,\"label\":\"Id Card\",\"unique\":true,\"slot\":1,\"image\":\"id_card.png\",\"name\":\"id_card\",\"info\":{\"firstname\":\"Amingo\",\"gender\":0,\"nationality\":\"US\",\"birthdate\":\"1998-08-26\",\"lastname\":\"Adelsa\",\"citizenid\":\"NGR07907\"},\"weight\":0}]'
  );
INSERT INTO
  `stashitemsnew` (`id`, `stash`, `items`)
VALUES
  (2114, 'apartment39726', '[]');
INSERT INTO
  `stashitemsnew` (`id`, `stash`, `items`)
VALUES
  (2115, 'policeevidence3', '[]');
INSERT INTO
  `stashitemsnew` (`id`, `stash`, `items`)
VALUES
  (2116, 'apartment39213', '[]');
INSERT INTO
  `stashitemsnew` (`id`, `stash`, `items`)
VALUES
  (2117, 'apartment18330', '[]');

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: t1ger_druglabs
# ------------------------------------------------------------


# ------------------------------------------------------------
# DATA DUMP FOR TABLE: trunkitems
# ------------------------------------------------------------


# ------------------------------------------------------------
# DATA DUMP FOR TABLE: trunkitemsnew
# ------------------------------------------------------------


# ------------------------------------------------------------
# DATA DUMP FOR TABLE: twitter_accounts
# ------------------------------------------------------------


# ------------------------------------------------------------
# DATA DUMP FOR TABLE: twitter_likes
# ------------------------------------------------------------


# ------------------------------------------------------------
# DATA DUMP FOR TABLE: twitter_tweets
# ------------------------------------------------------------


# ------------------------------------------------------------
# DATA DUMP FOR TABLE: user_convictions
# ------------------------------------------------------------


# ------------------------------------------------------------
# DATA DUMP FOR TABLE: user_mdt
# ------------------------------------------------------------

INSERT INTO
  `user_mdt` (
    `id`,
    `char_id`,
    `notes`,
    `mugshot_url`,
    `fingerprint`
  )
VALUES
  (
    1,
    'LRP87077',
    '',
    'https://steamuserimages-a.akamaihd.net/ugc/773989831368666354/2AB8E4659A58B33CC80DE2152FB026021C2DA558/?imw=512&&ima=fit&impolicy=Letterbox&imcolor=%23000000&letterbox=false',
    ''
  );

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: vrp_banco
# ------------------------------------------------------------


# ------------------------------------------------------------
# DATA DUMP FOR TABLE: vrp_cet
# ------------------------------------------------------------


# ------------------------------------------------------------
# DATA DUMP FOR TABLE: vrp_concessionaria
# ------------------------------------------------------------

INSERT INTO
  `vrp_concessionaria` (
    `id`,
    `modelo`,
    `nome`,
    `preco`,
    `quantidade`,
    `descricao`,
    `tipo`,
    `img`
  )
VALUES
  (6, 't20', 'T20', 600000, 499, '', 'carro', '');

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: vrp_gunshop
# ------------------------------------------------------------

INSERT INTO
  `vrp_gunshop` (
    `id`,
    `id_dono`,
    `nome`,
    `preco`,
    `a_venda`,
    `estoque`,
    `cofre`,
    `cofreLimite`
  )
VALUES
  (
    5,
    0,
    'Loja de Armas (Praça)',
    1250000,
    1,
    '{\"WEAPON_PISTOL\":{\"descricao\":\"Aqui vai a descricao da arma selecionada\",\"nome\":\"Pistola\",\"img\":\"https://vignette.wikia.nocookie.net/gtawiki/images/d/d3/Pistol.50-GTAVPC-HUD.png/revision/latest?cb=20150419121107\",\"quantidade\":90,\"preco\":1000},\"WEAPON_CARBINERIFLE\":{\"descricao\":\"Aqui vai a descricao da arma selecionada\",\"nome\":\"Carbine Rifle\",\"img\":\"https://vignette.wikia.nocookie.net/gtawiki/images/7/7a/CarbineRifle-GTAVPC-HUD.png/revision/latest/scale-to-width-down/185?cb=20150419121949\",\"quantidade\":70,\"preco\":25000},\"WEAPON_COMBATPISTOL\":{\"descricao\":\"Aqui vai a descricao da arma selecionada\",\"nome\":\"Combat Pistol\",\"img\":\"https://vignette.wikia.nocookie.net/gtawiki/images/0/0c/Pistol50-GTAV-HUD.png/revision/latest?cb=20140823221130\",\"quantidade\":80,\"preco\":1500},\"WEAPON_ASSAULTRIFLE\":{\"descricao\":\"Aqui vai a descricao da arma selecionada\",\"nome\":\"Assault Rifle\",\"img\":\"https://i.imgur.com/IUEUsJk.png\",\"quantidade\":60,\"preco\":35000}}',
    0,
    500000
  );
INSERT INTO
  `vrp_gunshop` (
    `id`,
    `id_dono`,
    `nome`,
    `preco`,
    `a_venda`,
    `estoque`,
    `cofre`,
    `cofreLimite`
  )
VALUES
  (
    6,
    0,
    'Loja de Armas (Praça 2)',
    1958000,
    1,
    '{\"WEAPON_PISTOL\":{\"descricao\":\"Aqui vai a descricao da arma selecionada\",\"nome\":\"Pistola\",\"img\":\"https://vignette.wikia.nocookie.net/gtawiki/images/d/d3/Pistol.50-GTAVPC-HUD.png/revision/latest?cb=20150419121107\",\"quantidade\":99,\"preco\":1000}}',
    0,
    500000
  );

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: vrp_homes_permissions
# ------------------------------------------------------------


# ------------------------------------------------------------
# DATA DUMP FOR TABLE: vrp_imobiliaria
# ------------------------------------------------------------

INSERT INTO
  `vrp_imobiliaria` (`id`, `nome`, `preco`, `img`, `categoria`, `a_venda`)
VALUES
  (
    5,
    'Mansão 2',
    685200,
    'https://upload.wikimedia.org/wikipedia/commons/6/6a/Aon_Center_LA.jpg',
    'casa',
    1
  );
INSERT INTO
  `vrp_imobiliaria` (`id`, `nome`, `preco`, `img`, `categoria`, `a_venda`)
VALUES
  (
    6,
    'Mansão 1',
    958000,
    'https://upload.wikimedia.org/wikipedia/commons/6/6a/Aon_Center_LA.jpg',
    'casa',
    1
  );

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: vrp_mercado
# ------------------------------------------------------------

INSERT INTO
  `vrp_mercado` (
    `id`,
    `id_dono`,
    `nome`,
    `preco`,
    `a_venda`,
    `estoque`,
    `cofre`,
    `cofreLimite`
  )
VALUES
  (
    9,
    0,
    'Mercado (Praça 2)',
    1958000,
    1,
    '{\"cafe\":{\"preco\":1000,\"quantidade\":99}}',
    0,
    200000
  );
INSERT INTO
  `vrp_mercado` (
    `id`,
    `id_dono`,
    `nome`,
    `preco`,
    `a_venda`,
    `estoque`,
    `cofre`,
    `cofreLimite`
  )
VALUES
  (
    10,
    1,
    'Mercado (Praça)',
    1250000,
    0,
    '{\"relogio\":{\"preco\":1000,\"desc\":\"TestedOtesTE811\",\"category\":\"vestuario\",\"quantidade\":90},\"brigadeiro\":{\"preco\":1000,\"desc\":\"TestedOtesTE7111\",\"category\":\"lanches\",\"quantidade\":90},\"mochila\":{\"preco\":1000,\"desc\":\"TestedOtesTE151\",\"category\":\"vestuario\",\"quantidade\":90},\"tortademaca\":{\"preco\":1000,\"desc\":\"TestedOtesTE7111\",\"category\":\"lanches\",\"quantidade\":90},\"colete\":{\"preco\":1000,\"desc\":\"TestedOtesTE811\",\"category\":\"vestuario\",\"quantidade\":90},\"perfume\":{\"preco\":1000,\"desc\":\"TestedOtesTE811\",\"category\":\"vestuario\",\"quantidade\":90},\"fertilizante\":{\"preco\":1000,\"desc\":\"TestedOtesTE141\",\"category\":\"trabalho\",\"quantidade\":90},\"ferramenta\":{\"preco\":1000,\"desc\":\"TestedOtesTE141\",\"category\":\"trabalho\",\"quantidade\":90},\"bolodecenoura\":{\"preco\":1000,\"desc\":\"TestedOtesTE7111\",\"category\":\"lanches\",\"quantidade\":90},\"computador\":{\"preco\":1000,\"desc\":\"TestedOtesTE911\",\"category\":\"comunicação\",\"quantidade\":90},\"biscoito\":{\"preco\":1000,\"desc\":\"TestedOtesTE911\",\"category\":\"lanches\",\"quantidade\":90},\"mochila3\":{\"preco\":1000,\"desc\":\"TestedOtesTE171\",\"category\":\"vestuario\",\"quantidade\":90},\"etiqueta\":{\"preco\":1000,\"desc\":\"TestedOtesTE131\",\"category\":\"trabalho\",\"quantidade\":90},\"tortadenozes\":{\"preco\":1000,\"desc\":\"TestedOtesTE7111\",\"category\":\"lanches\",\"quantidade\":90},\"caldo\":{\"preco\":1000,\"desc\":\"TestedOtesTE111\",\"category\":\"lanches\",\"quantidade\":90},\"mascara\":{\"preco\":1000,\"desc\":\"TestedOtesTE811\",\"category\":\"vestuario\",\"quantidade\":90},\"absinto\":{\"preco\":1000,\"desc\":\"TestedOtesTE511\",\"category\":\"bebidas\",\"quantidade\":90},\"garrafavazia\":{\"preco\":1000,\"desc\":\"TestedOtesTE141\",\"category\":\"trabalho\",\"quantidade\":90},\"cafe\":{\"preco\":1000,\"desc\":\"TestedOtesTE111\",\"category\":\"bebidas\",\"quantidade\":90},\"sorvete\":{\"preco\":1000,\"desc\":\"TestedOtesTE7111\",\"category\":\"lanches\",\"quantidade\":90},\"furadeira\":{\"preco\":1000,\"desc\":\"TestedOtesTE911\",\"category\":\"comunicação\",\"quantidade\":90},\"hamburger\":{\"preco\":1000,\"desc\":\"TestedOtesTE7111\",\"category\":\"lanches\",\"quantidade\":90},\"mochila2\":{\"preco\":1000,\"desc\":\"TestedOtesTE161\",\"category\":\"vestuario\",\"quantidade\":90},\"whisky\":{\"preco\":1000,\"desc\":\"TestedOtesTE411\",\"category\":\"bebidas\",\"quantidade\":90},\"pendrive\":{\"preco\":1000,\"desc\":\"TestedOtesTE911\",\"category\":\"comunicação\",\"quantidade\":90},\"caixa\":{\"preco\":1000,\"desc\":\"TestedOtesTE141\",\"category\":\"trabalho\",\"quantidade\":90},\"vodka\":{\"preco\":1000,\"desc\":\"TestedOtesTE311\",\"category\":\"bebidas\",\"quantidade\":90},\"isca\":{\"preco\":1000,\"desc\":\"TestedOtesTE141\",\"category\":\"trabalho\",\"quantidade\":90},\"adubo\":{\"preco\":1000,\"desc\":\"TestedOtesTE181\",\"category\":\"trabalho\",\"quantidade\":90},\"suco\":{\"preco\":1000,\"desc\":\"TestedOtesTE211\",\"category\":\"bebidas\",\"quantidade\":90},\"serra\":{\"preco\":1000,\"desc\":\"TestedOtesTE911\",\"category\":\"comunicação\",\"quantidade\":90},\"bolodequeijo\":{\"preco\":1000,\"desc\":\"TestedOtesTE7111\",\"category\":\"lanches\",\"quantidade\":90},\"agua\":{\"preco\":1000,\"desc\":\"TestedOtesTE121\",\"category\":\"bebidas\",\"quantidade\":90},\"cha\":{\"preco\":1000,\"desc\":\"TestedOtesTE611\",\"category\":\"bebidas\",\"quantidade\":90}}',
    0,
    200000
  );

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: vrp_organizacoes
# ------------------------------------------------------------


# ------------------------------------------------------------
# DATA DUMP FOR TABLE: vrp_srv_data
# ------------------------------------------------------------

INSERT INTO
  `vrp_srv_data` (`dkey`, `dvalue`)
VALUES
  ('a_venda:u1', '{\"t20\":true}');
INSERT INTO
  `vrp_srv_data` (`dkey`, `dvalue`)
VALUES
  (
    'chest:fixed:Teste 1',
    '{\"colete\":{\"amount\":8},\"agua\":{\"amount\":8}}'
  );
INSERT INTO
  `vrp_srv_data` (`dkey`, `dvalue`)
VALUES
  (
    'chest:u1veh_t20',
    '{\"colete\":{\"amount\":3},\"agua\":{\"amount\":5}}'
  );
INSERT INTO
  `vrp_srv_data` (`dkey`, `dvalue`)
VALUES
  ('concessionaria:banco', '90000');
INSERT INTO
  `vrp_srv_data` (`dkey`, `dvalue`)
VALUES
  ('ems:init', 'true');
INSERT INTO
  `vrp_srv_data` (`dkey`, `dvalue`)
VALUES
  ('policia:init', 'true');

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: vrp_user_data
# ------------------------------------------------------------

INSERT INTO
  `vrp_user_data` (`user_id`, `dkey`, `dvalue`)
VALUES
  (
    1,
    'currentCharacterMode',
    '{\"lips\":0,\"skinColor\":6,\"chinShape\":0,\"beardModel\":-1,\"beardColor\":0,\"eyebrowsColor\":0,\"chinWidth\":0,\"shapeMix\":0.05,\"ageingModel\":-1,\"chinLength\":0,\"frecklesModel\":-1,\"secondHairColor\":0,\"noseHeight\":0,\"noseWidth\":0,\"complexionModel\":-1,\"eyebrowsHeight\":0,\"blemishesModel\":-1,\"noseTip\":0,\"sundamageModel\":-1,\"fathersID\":0,\"noseLength\":0,\"cheeksWidth\":0,\"noseBridge\":0,\"chestModel\":-1,\"noseShift\":0,\"eyesColor\":0,\"firstHairColor\":0,\"jawHeight\":0,\"neckWidth\":0,\"blushModel\":-1,\"lipstickModel\":-1,\"chinPosition\":0,\"blushColor\":0,\"cheekboneHeight\":0,\"mothersID\":21,\"lipstickColor\":0,\"makeupModel\":-1,\"eyebrowsWidth\":0,\"cheekboneWidth\":0,\"jawWidth\":0,\"chestColor\":0,\"eyebrowsModel\":0,\"hairModel\":4}'
  );
INSERT INTO
  `vrp_user_data` (`user_id`, `dkey`, `dvalue`)
VALUES
  (
    1,
    'vRP:datatable',
    '{\"health\":400,\"position\":{\"y\":-1371.761962890625,\"x\":91.17394256591797,\"z\":29.34151458740234},\"armor\":90,\"hunger\":83.0261632590911,\"thirst\":68.45232651818209,\"emServico\":\"Nenhum\",\"groups\":{\"LSPD\":true,\"admin\":true,\"user\":true},\"in_coma\":false,\"inventory\":{\"colete\":{\"amount\":3},\"agua\":{\"amount\":4}},\"weapons\":{\"GADGET_PARACHUTE\":{\"ammo\":0},\"WEAPON_PISTOL\":{\"ammo\":0},\"WEAPON_COMBATPISTOL\":{\"ammo\":0},\"WEAPON_CARBINERIFLE\":{\"ammo\":0},\"WEAPON_ASSAULTRIFLE\":{\"ammo\":0}},\"gaptitudes\":{\"exp\":{\"level\":5}},\"customization\":{\"1\":[-1,0,2],\"2\":[4,0,0],\"3\":[15,0,2],\"4\":[61,0,2],\"5\":[0,0,0],\"6\":[16,0,2],\"7\":[-1,0,2],\"8\":[15,0,2],\"9\":[-1,0,2],\"10\":[-1,0,2],\"11\":[104,0,2],\"12\":[0,0,0],\"13\":[0,2,0],\"14\":[0,0,255],\"15\":[0,2,100],\"16\":[0,2,1],\"17\":[0,0,0],\"18\":[33554944,2,0],\"19\":[33685506,2,0],\"20\":[33686018,2,9],\"0\":[0,0,0],\"p0\":[-1,0],\"p1\":[9,0],\"p3\":[-1,0],\"p2\":[-1,0],\"p5\":[-1,0],\"p4\":[-1,0],\"p10\":[-1,0],\"modelhash\":1885233650,\"p8\":[-1,0],\"p9\":[-1,0],\"p6\":[-1,0],\"p7\":[-1,0]}}'
  );
INSERT INTO
  `vrp_user_data` (`user_id`, `dkey`, `dvalue`)
VALUES
  (1, 'vRP:spawnController', '2');
INSERT INTO
  `vrp_user_data` (`user_id`, `dkey`, `dvalue`)
VALUES
  (
    1,
    'vRP:tattoos:L1',
    '{\"MP_MP_Stunt_tat_003_F\":\"mpstunt_overlays\",\"MP_MP_ImportExport_Tat_008_M\":\"mpimportexport_overlays\",\"MP_Gunrunning_Tattoo_004_M\":\"mpgunrunning_overlays\",\"MP_MP_Biker_Tat_000_F\":\"mpbiker_overlays\",\"MP_MP_ImportExport_Tat_002_M\":\"mpimportexport_overlays\",\"MP_LUXE_TAT_006_M\":\"mpluxe_overlays\",\"MP_MP_Stunt_tat_002_F\":\"mpstunt_overlays\"}'
  );

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: vrp_user_homes
# ------------------------------------------------------------


# ------------------------------------------------------------
# DATA DUMP FOR TABLE: vrp_user_identities
# ------------------------------------------------------------

INSERT INTO
  `vrp_user_identities` (
    `user_id`,
    `age`,
    `name`,
    `firstname`,
    `carma`,
    `phone`,
    `registration`,
    `foto`
  )
VALUES
  (
    1,
    20,
    'Felipe',
    'QR',
    0,
    '372-8711',
    '472SZA',
    'http://painelcontabil.com.br/contador/painel/img/login.png'
  );

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: vrp_user_ids
# ------------------------------------------------------------

INSERT INTO
  `vrp_user_ids` (`identifier`, `user_id`)
VALUES
  ('discord:378676803822157824', 1);
INSERT INTO
  `vrp_user_ids` (`identifier`, `user_id`)
VALUES
  ('fivem:1270794', 1);
INSERT INTO
  `vrp_user_ids` (`identifier`, `user_id`)
VALUES
  (
    'license:1fa014c53786b33e82857e9a55b7df5af562c4cc',
    1
  );
INSERT INTO
  `vrp_user_ids` (`identifier`, `user_id`)
VALUES
  ('live:844425075704654', 1);
INSERT INTO
  `vrp_user_ids` (`identifier`, `user_id`)
VALUES
  ('xbl:2535430977604886', 1);

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: vrp_user_moneys
# ------------------------------------------------------------

INSERT INTO
  `vrp_user_moneys` (`user_id`, `wallet`, `bank`)
VALUES
  (1, 49990900, 1000);

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: vrp_user_vehicles
# ------------------------------------------------------------

INSERT INTO
  `vrp_user_vehicles` (
    `user_id`,
    `vehicle`,
    `state`,
    `placa`,
    `tipo`,
    `img`,
    `motor`,
    `lataria`,
    `gasolina`,
    `custom`,
    `bau`,
    `bauLimite`,
    `ipva`
  )
VALUES
  (
    1,
    't20',
    0,
    '29TZP597',
    'carro',
    '',
    '963',
    '877',
    '96',
    '{\"colour\":{\"wheel\":0,\"secondary\":0,\"pearlescent\":0,\"primary\":0}}',
    '{\"agua\":{\"amount\":2},\"colete\":{\"amount\":3}}',
    50,
    1612483036
  );

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: vrp_users
# ------------------------------------------------------------

INSERT INTO
  `vrp_users` (`id`, `last_login`, `whitelisted`, `banned`)
VALUES
  (1, '10:53:40 22/03/2021', 1, 0);

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: whitelist
# ------------------------------------------------------------


/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
