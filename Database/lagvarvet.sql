-- phpMyAdmin SQL Dump
-- version 4.0.4
-- http://www.phpmyadmin.net
--
-- Värd: localhost
-- Skapad: 18 okt 2013 kl 08:38
-- Serverversion: 5.6.12-log
-- PHP-version: 5.4.16

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Databas: `lagvarvet`
--
CREATE DATABASE IF NOT EXISTS `lagvarvet` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `lagvarvet`;

-- --------------------------------------------------------

--
-- Tabellstruktur `feedpost`
--

CREATE TABLE IF NOT EXISTS `feedpost` (
  `dateofpost` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `poster` bigint(20) NOT NULL DEFAULT '0',
  `teamofpost` varchar(32) NOT NULL DEFAULT '',
  `textpost` varchar(8000) DEFAULT NULL,
  PRIMARY KEY (`dateofpost`,`poster`,`teamofpost`),
  KEY `poster` (`poster`),
  KEY `teamofpost` (`teamofpost`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumpning av Data i tabell `feedpost`
--

INSERT INTO `feedpost` (`dateofpost`, `poster`, `teamofpost`, `textpost`) VALUES
('0000-00-00 00:00:00', 8910152142, 'IxD Grupp 5', 'Hysén!! Vilken ängel'),
('0000-00-00 00:00:00', 8911232415, 'IxD Grupp 5', 'Idag gick det jäkligt bra!'),
('0000-00-00 00:00:00', 8912112242, 'IxD Grupp 5', 'Men de va la roligt då'),
('0000-00-00 00:00:00', 9003152142, 'IxD Grupp 5', 'AGGRESSION!'),
('0000-00-00 00:00:00', 9010242142, 'IxD Grupp 5', 'Laoshi');

-- --------------------------------------------------------

--
-- Tabellstruktur `league`
--

CREATE TABLE IF NOT EXISTS `league` (
  `title` varchar(32) NOT NULL DEFAULT '',
  `leagueinfo` varchar(1024) DEFAULT NULL,
  PRIMARY KEY (`title`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumpning av Data i tabell `league`
--

INSERT INTO `league` (`title`, `leagueinfo`) VALUES
('Chalmers-ligan', 'Chalmers-ligan!'),
('Stadskampen', 'Stadskampen!');

-- --------------------------------------------------------

--
-- Tabellstruktur `leaguemembers`
--

CREATE TABLE IF NOT EXISTS `leaguemembers` (
  `teamtitle` varchar(32) NOT NULL DEFAULT '',
  `leaguetitle` varchar(32) NOT NULL DEFAULT '',
  PRIMARY KEY (`teamtitle`,`leaguetitle`),
  KEY `leaguetitle` (`leaguetitle`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumpning av Data i tabell `leaguemembers`
--

INSERT INTO `leaguemembers` (`teamtitle`, `leaguetitle`) VALUES
('IxD Grupp 5', 'Chalmers-ligan'),
('Falköping', 'Stadskampen'),
('Göteborg', 'Stadskampen'),
('Skövde', 'Stadskampen');

-- --------------------------------------------------------

--
-- Tabellstruktur `result`
--

CREATE TABLE IF NOT EXISTS `result` (
  `checkpoint` int(11) NOT NULL,
  `timeresult` int(11) NOT NULL,
  `runnerpnr` bigint(20) NOT NULL,
  `points` int(11) DEFAULT NULL,
  PRIMARY KEY (`checkpoint`,`runnerpnr`),
  KEY `runnerpnr` (`runnerpnr`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumpning av Data i tabell `result`
--

INSERT INTO `result` (`checkpoint`, `timeresult`, `runnerpnr`, `points`) VALUES
(5, 5910, 1004005938, 0),
(5, 8123, 1123777130, 0),
(5, 7263, 1135679594, 0),
(5, 5825, 1330179376, 0),
(5, 7083, 1334781536, 0),
(5, 8212, 1335477475, 0),
(5, 5476, 1337208094, 0),
(5, 8173, 1581944009, 0),
(5, 7312, 1678869589, 0),
(5, 7552, 1732347098, 0),
(5, 7924, 1858599029, 0),
(5, 6790, 1997341984, 0),
(5, 8020, 2367189797, 0),
(5, 6694, 2549170561, 0),
(5, 8977, 2638795718, 0),
(5, 8695, 2650724177, 0),
(5, 7207, 2873866787, 0),
(5, 6346, 2910031320, 0),
(5, 6243, 3042101658, 0),
(5, 6753, 3153501347, 0),
(5, 8789, 3539278155, 0),
(5, 6537, 3627713605, 0),
(5, 7467, 3723614040, 0),
(5, 7257, 3797103827, 0),
(5, 8047, 3964981727, 0),
(5, 5917, 4033702013, 0),
(5, 6223, 4083492907, 0),
(5, 7218, 4233534078, 0),
(5, 6338, 4259630413, 0),
(5, 7332, 4321546739, 0),
(5, 6434, 4440180598, 0),
(5, 8861, 4503759592, 0),
(5, 7420, 4574287171, 0),
(5, 5592, 4610381963, 0),
(5, 6952, 4612616243, 0),
(5, 6860, 4754820676, 0),
(5, 6055, 4867180503, 0),
(5, 8844, 4994296187, 0),
(5, 5702, 5189826639, 0),
(5, 8090, 5310431292, 0),
(5, 7117, 5329252470, 0),
(5, 7481, 5402837382, 0),
(5, 6052, 5462513793, 0),
(5, 5479, 5552689144, 0),
(5, 8573, 5746380819, 0),
(5, 7060, 5862766151, 0),
(5, 8360, 5864323825, 0),
(5, 5650, 6126924847, 0),
(5, 5678, 6317531538, 0),
(5, 7266, 6429605379, 0),
(5, 5879, 6458015497, 0),
(5, 7242, 6547878894, 0),
(5, 7375, 6697004782, 0),
(5, 6390, 6708341442, 0),
(5, 8785, 6891800557, 0),
(5, 7757, 7006563087, 0),
(5, 6861, 7043685891, 0),
(5, 8882, 7119486655, 0),
(5, 6512, 7140196095, 0),
(5, 7298, 7166124678, 0),
(5, 6690, 7208581847, 0),
(5, 8790, 7259666988, 0),
(5, 5884, 7311584786, 0),
(5, 6097, 7484925001, 0),
(5, 7583, 7575884680, 0),
(5, 8966, 7607132521, 0),
(5, 8781, 7641761246, 0),
(5, 8004, 7657199713, 0),
(5, 5434, 7675871930, 0),
(5, 8604, 7874715997, 0),
(5, 8677, 7988350121, 0),
(5, 6607, 8078735551, 0),
(5, 7813, 8117678880, 0),
(5, 8861, 8145819887, 0),
(5, 6937, 8216285400, 0),
(5, 5510, 8238437317, 0),
(5, 6051, 8251721554, 0),
(5, 6706, 8320106231, 0),
(5, 7485, 8425580162, 0),
(5, 7020, 8448172560, 0),
(5, 6841, 8507026644, 0),
(5, 6091, 8604025824, 0),
(5, 8103, 8679117701, 0),
(5, 7135, 8743358548, 0),
(5, 7773, 8767076938, 0),
(5, 7887, 8892183016, 0),
(5, 5764, 8910152142, 0),
(5, 7947, 8911232415, 0),
(5, 7118, 8912112242, 0),
(5, 7453, 9003152142, 0),
(5, 6586, 9010242142, 0),
(5, 6864, 9103924884, 0),
(5, 6331, 9113239631, 0),
(5, 8341, 9297414688, 0),
(5, 6868, 9387041220, 0),
(5, 8695, 9454118782, 0),
(5, 8805, 9567067751, 0),
(5, 7828, 9655051875, 0),
(5, 5598, 9664686074, 0),
(5, 6075, 9669367805, 0),
(5, 8910, 9730587122, 0),
(5, 6506, 9735900227, 0),
(5, 7303, 9768047473, 0),
(5, 7235, 9823496926, 0);

-- --------------------------------------------------------

--
-- Tabellstruktur `runner`
--

CREATE TABLE IF NOT EXISTS `runner` (
  `pnr` bigint(20) NOT NULL DEFAULT '0',
  `username` varchar(16) NOT NULL,
  `userpw` varchar(16) NOT NULL,
  `firstname` varchar(64) NOT NULL,
  `lastname` varchar(64) NOT NULL,
  `userinfo` varchar(1024) DEFAULT NULL,
  `runnerid` int(11) DEFAULT NULL,
  `points` int(11) DEFAULT NULL,
  `city` varchar(64) DEFAULT NULL,
  `picture` varchar(256) DEFAULT NULL,
  PRIMARY KEY (`pnr`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `pnr` (`pnr`),
  UNIQUE KEY `runnerid` (`runnerid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumpning av Data i tabell `runner`
--

INSERT INTO `runner` (`pnr`, `username`, `userpw`, `firstname`, `lastname`, `userinfo`, `runnerid`, `points`, `city`, `picture`) VALUES
(1004005938, 'Grace', 'DNU64DII2DM', 'Grace', 'Osborne', 'fermentum vel, mauris. Integer', 46, 0, 'Göteborg', ''),
(1123777130, 'Camilla', 'NMC42MZY0MC', 'Camilla', 'Walsh', 'euismod et, commodo', 15, 0, 'Stockholm', ''),
(1135679594, 'Kendall', 'RWM08EPS9NL', 'Kendall', 'Mitchell', 'eu augue porttitor interdum. Sed auctor', 25, 0, 'Stockholm', ''),
(1330179376, 'Ignacia', 'DEI70EVL0UF', 'Ignacia', 'Dennis', 'mauris, aliquam eu,', 67, 0, 'Göteborg', ''),
(1334781536, 'Mason', 'AFR18YXL7ER', 'Mason', 'Browning', 'Sed nec metus facilisis lorem tristique aliquet. Phasellus fermentum convallis', 28, 0, 'Malmö', ''),
(1335477475, 'Hedley', 'LMK68SLQ3KV', 'Hedley', 'Day', 'in, hendrerit consectetuer, cursus et, magna. Praesent interdum', 75, 0, 'Göteborg', ''),
(1337208094, 'Colt', 'ZEX94CLD6JN', 'Colt', 'Ray', 'eu nulla at', 73, 0, 'Göteborg', ''),
(1581944009, 'Audrey', 'YFH82BOM5LK', 'Audrey', 'Berger', 'mus. Proin vel nisl.', 42, 0, 'Malmö', ''),
(1678869589, 'Camden', 'BZF24RWT9AW', 'Camden', 'Mcleod', 'dui, semper', 68, 0, 'Göteborg', ''),
(1732347098, 'Colleen', 'OBK63EJF0XK', 'Colleen', 'Sweet', 'dictum', 96, 0, 'Göteborg', ''),
(1858599029, 'Philip', 'XFZ70YFL4OJ', 'Philip', 'Pate', 'eu neque pellentesque massa lobortis ultrices. Vivamus', 34, 0, 'Malmö', ''),
(1997341984, 'Shafira', 'JQL11XTW5PH', 'Shafira', 'Velasquez', 'ipsum non arcu. Vivamus sit amet risus. Donec', 36, 0, 'Malmö', ''),
(2367189797, 'Kaden', 'FGP07JPJ9CQ', 'Kaden', 'Sanford', 'mus. Proin', 27, 0, 'Stockholm', ''),
(2549170561, 'Ava', 'IML47IIZ6MO', 'Ava', 'Cantrell', 'Vestibulum accumsan neque et nunc. Quisque ornare', 97, 0, 'Göteborg', ''),
(2638795718, 'Wing', 'PBM16OIF6LX', 'Wing', 'Odonnell', 'Donec', 71, 0, 'Göteborg', ''),
(2650724177, 'Rogan', 'SKJ64MUS6NW', 'Rogan', 'Sawyer', 'arcu. Aliquam ultrices iaculis odio. Nam interdum enim non nisi.', 58, 0, 'Göteborg', ''),
(2873866787, 'Nehru', 'IRA04JRR5OZ', 'Nehru', 'Swanson', 'Pellentesque', 3, 0, 'Stockholm', ''),
(2910031320, 'Amber', 'KPT30FKQ9EZ', 'Amber', 'Davenport', 'Proin non massa non ante', 12, 0, 'Stockholm', ''),
(3042101658, 'Karyn', 'MMK98NIN1TR', 'Karyn', 'Walter', 'Duis', 8, 0, 'Stockholm', ''),
(3153501347, 'Clayton', 'FIP73OIG8CJ', 'Clayton', 'Koch', 'adipiscing elit. Etiam laoreet, libero et tristique pellentesque, tellus sem', 22, 0, 'Stockholm', ''),
(3539278155, 'Tad', 'YED81WFW1FF', 'Tad', 'Kinney', 'luctus sit amet, faucibus ut, nulla. Cras', 33, 0, 'Malmö', ''),
(3627713605, 'Alexander', 'FEB83JYK7PQ', 'Alexander', 'Simmons', 'nec urna suscipit nonummy. Fusce fermentum fermentum', 30, 0, 'Malmö', ''),
(3723614040, 'Ori', 'YSW61SVC9UD', 'Ori', 'Knowles', 'Morbi non', 79, 0, 'Göteborg', ''),
(3797103827, 'Isaac', 'ZNS75GHR6SY', 'Isaac', 'Vargas', 'in, cursus et, eros. Proin ultrices.', 44, 0, 'Malmö', ''),
(3964981727, 'Britanni', 'HZE78APF0UD', 'Britanni', 'Morse', 'et netus et', 43, 0, 'Malmö', ''),
(4033702013, 'Iris', 'RYL13XFO0XU', 'Iris', 'Wilson', 'est, congue a, aliquet vel, vulputate', 77, 0, 'Göteborg', ''),
(4083492907, 'Patricia', 'NXZ16YQO0XH', 'Patricia', 'Hammond', 'lorem, luctus ut, pellentesque eget,', 59, 0, 'Göteborg', ''),
(4233534078, 'William', 'AZB78YQK5CY', 'William', 'Carlson', 'taciti sociosqu ad litora', 64, 0, 'Göteborg', ''),
(4259630413, 'Orla', 'EXS16AYU4WA', 'Orla', 'Todd', 'lectus pede et risus. Quisque libero lacus, varius et, euismod', 7, 0, 'Stockholm', ''),
(4321546739, 'Delilah', 'PKC03BFX7IB', 'Delilah', 'House', 'consequat dolor vitae', 47, 0, 'Göteborg', ''),
(4440180598, 'Yolanda', 'GVU43AFR4OW', 'Yolanda', 'Perry', 'convallis erat, eget tincidunt dui augue eu', 31, 0, 'Malmö', ''),
(4503759592, 'Germaine', 'IGM18OZR5KE', 'Germaine', 'Gordon', 'erat volutpat. Nulla dignissim. Maecenas', 60, 0, 'Göteborg', ''),
(4574287171, 'Drew', 'NVE35WVX9LR', 'Drew', 'Carey', 'in consequat enim diam vel', 63, 0, 'Göteborg', ''),
(4610381963, 'Richard', 'SWM34SUW4NW', 'Richard', 'Howell', 'enim mi tempor lorem, eget mollis', 87, 0, 'Göteborg', ''),
(4612616243, 'Howard', 'FJB42VRA8IE', 'Howard', 'Tyler', 'augue, eu tempor', 19, 0, 'Stockholm', ''),
(4754820676, 'Beau', 'GDL32YVZ3YR', 'Beau', 'Mercer', 'bibendum. Donec felis', 26, 0, 'Stockholm', ''),
(4867180503, 'Alexa', 'DMR04OOK6WP', 'Alexa', 'Schneider', 'sodales purus, in molestie tortor nibh sit amet orci. Ut', 23, 0, 'Stockholm', ''),
(4994296187, 'Lisandra', 'UCQ44JZC0KR', 'Lisandra', 'Fowler', 'sociis natoque penatibus et magnis', 48, 0, 'Göteborg', ''),
(5189826639, 'Cadman', 'DEK22GML7HB', 'Cadman', 'Mcguire', 'Sed et libero. Proin mi. Aliquam gravida', 14, 0, 'Stockholm', ''),
(5310431292, 'Shannon', 'QZC93FKM8VM', 'Shannon', 'Henderson', 'pede et risus. Quisque libero lacus, varius et, euismod', 65, 0, 'Göteborg', ''),
(5329252470, 'Katell', 'HDR15OBU3CC', 'Katell', 'Benson', 'Sed', 4, 0, 'Stockholm', ''),
(5402837382, 'Knox', 'LHT81ICU3EN', 'Knox', 'Hickman', 'lorem, eget mollis lectus pede et risus.', 85, 0, 'Göteborg', ''),
(5462513793, 'Emily', 'EAG21AEB6AY', 'Emily', 'Dickerson', 'id, libero. Donec consectetuer mauris', 95, 0, 'Göteborg', ''),
(5552689144, 'Dara', 'XOG92UZE2HR', 'Dara', 'Hill', 'Nunc ullamcorper, velit in aliquet lobortis, nisi nibh', 9, 0, 'Stockholm', ''),
(5746380819, 'Joan', 'YKT81MJQ2FW', 'Joan', 'Wallace', 'natoque penatibus et magnis dis', 81, 0, 'Göteborg', ''),
(5862766151, 'Tanya', 'CFY53TJH8HW', 'Tanya', 'Rodgers', 'leo. Morbi neque tellus, imperdiet non, vestibulum nec, euismod', 17, 0, 'Stockholm', ''),
(5864323825, 'Zephania', 'XGB82VQV2SE', 'Zephania', 'Craft', 'et magnis dis parturient montes, nascetur ridiculus', 39, 0, 'Malmö', ''),
(6126924847, 'Fitzgerald', 'GSA87ABW7XY', 'Fitzgerald', 'Tyson', 'sit amet risus. Donec egestas. Aliquam nec enim. Nunc ut', 92, 0, 'Göteborg', ''),
(6317531538, 'Brooke', 'OZF31HQP9SQ', 'Brooke', 'Pittman', 'et', 89, 0, 'Göteborg', ''),
(6429605379, 'Skyler', 'UMZ88YOE7NY', 'Skyler', 'Marsh', 'lacinia vitae, sodales at, velit. Pellentesque ultricies dignissim lacus.', 62, 0, 'Göteborg', ''),
(6458015497, 'Dieter', 'DKN72JGC6VF', 'Dieter', 'Gardner', 'Nulla semper tellus id nunc interdum feugiat. Sed nec metus', 18, 0, 'Stockholm', ''),
(6547878894, 'Cullen', 'GXQ63LYF1ZF', 'Cullen', 'Faulkner', 'natoque penatibus et magnis dis', 29, 0, 'Malmö', ''),
(6697004782, 'Rhonda', 'FSI49DUU9BD', 'Rhonda', 'Howard', 'sit amet orci. Ut sagittis', 98, 0, 'Göteborg', ''),
(6708341442, 'Adrienne', 'FMV67FLM1QW', 'Adrienne', 'Mckenzie', 'In nec orci. Donec nibh. Quisque nonummy ipsum', 37, 0, 'Malmö', ''),
(6891800557, 'Althea', 'EGT82HCK4DH', 'Althea', 'Dominguez', 'ut, molestie in, tempus eu, ligula. Aenean', 40, 0, 'Malmö', ''),
(7006563087, 'Aiko', 'IMQ03JHG5YL', 'Aiko', 'Carroll', 'vitae risus. Duis a mi fringilla mi lacinia mattis. Integer', 38, 0, 'Malmö', ''),
(7043685891, 'Lydia', 'GOG71GIK5LV', 'Lydia', 'Velasquez', 'Proin', 76, 0, 'Göteborg', ''),
(7119486655, 'Tara', 'JSV31UHC9BG', 'Tara', 'Mclean', 'mi enim, condimentum', 83, 0, 'Göteborg', ''),
(7140196095, 'Quincy', 'DIO18MBA2XP', 'Quincy', 'Sweeney', 'justo nec ante. Maecenas mi felis, adipiscing', 57, 0, 'Göteborg', ''),
(7166124678, 'Lani', 'ZSE20TBH2AO', 'Lani', 'Carroll', 'gravida. Praesent eu nulla at sem molestie sodales. Mauris', 55, 0, 'Göteborg', ''),
(7208581847, 'Ashely', 'COJ33HOV7JY', 'Ashely', 'Duncan', 'sem', 100, 0, 'Göteborg', ''),
(7259666988, 'Mona', 'ZCJ72HNK2PW', 'Mona', 'Benson', 'nec ligula consectetuer rhoncus. Nullam velit', 86, 0, 'Göteborg', ''),
(7311584786, 'Troy', 'NFP26KUQ0JO', 'Troy', 'Miller', 'non massa non ante bibendum ullamcorper. Duis', 10, 0, 'Stockholm', ''),
(7484925001, 'Nell', 'DHG40PXW7MV', 'Nell', 'Wade', 'risus. In', 82, 0, 'Göteborg', ''),
(7575884680, 'Hiroko', 'CVW29UOA3NH', 'Hiroko', 'Craft', 'scelerisque', 53, 0, 'Göteborg', ''),
(7607132521, 'Zelenia', 'DCR53WEF8YB', 'Zelenia', 'Vaughn', 'pellentesque a, facilisis non, bibendum sed, est.', 21, 0, 'Stockholm', ''),
(7641761246, 'Nevada', 'JLL96LZC1SP', 'Nevada', 'Reilly', 'Aliquam ornare, libero at', 11, 0, 'Stockholm', ''),
(7657199713, 'Carissa', 'SJF87PNP5DW', 'Carissa', 'Talley', 'Integer vitae nibh.', 93, 0, 'Göteborg', ''),
(7675871930, 'Anastasia', 'VUM12OSP9EV', 'Anastasia', 'Sykes', 'egestas rhoncus. Proin', 20, 0, 'Stockholm', ''),
(7874715997, 'Barclay', 'OKM26LGC5TW', 'Barclay', 'Rodriguez', 'tristique ac, eleifend vitae, erat. Vivamus nisi.', 49, 0, 'Göteborg', ''),
(7988350121, 'Ray', 'DJB14RMP1DU', 'Ray', 'Mcknight', 'Fusce aliquam, enim nec tempus scelerisque, lorem ipsum sodales', 99, 0, 'Göteborg', ''),
(8078735551, 'Casey', 'SGS99RUW8NG', 'Casey', 'Castro', 'rutrum lorem ac risus. Morbi metus.', 84, 0, 'Göteborg', ''),
(8117678880, 'James', 'WHU46JNX0SZ', 'James', 'Macdonald', 'dapibus', 69, 0, 'Göteborg', ''),
(8145819887, 'Trevor', 'QVR75ILH3TR', 'Trevor', 'Peck', 'risus. Donec nibh enim, gravida sit amet, dapibus id, blandit', 13, 0, 'Stockholm', ''),
(8216285400, 'Channing', 'CGF83XHC9HI', 'Channing', 'Sharp', 'et pede. Nunc sed orci lobortis augue scelerisque', 91, 0, 'Göteborg', ''),
(8238437317, 'Wendy', 'EDV62JPX3ZX', 'Wendy', 'Lucas', 'est arcu ac orci. Ut semper pretium neque. Morbi', 45, 0, 'Göteborg', ''),
(8251721554, 'Thomas', 'OLB99VKV1DU', 'Thomas', 'Faulkner', 'amet massa. Quisque porttitor eros nec tellus. Nunc lectus', 56, 0, 'Göteborg', ''),
(8320106231, 'Charde', 'VFD99LCT1ZA', 'Charde', 'Bailey', 'magna. Ut tincidunt orci', 51, 0, 'Göteborg', ''),
(8425580162, 'Gavin', 'KDM20TEN0JL', 'Gavin', 'Quinn', 'consectetuer rhoncus. Nullam', 35, 0, 'Malmö', ''),
(8448172560, 'Moses', 'YAD75HTZ8ZD', 'Moses', 'Dominguez', 'In', 1, 0, 'Stockholm', ''),
(8507026644, 'Gemma', 'WTP27QSQ9MJ', 'Gemma', 'Stokes', 'Vivamus rhoncus. Donec est.', 94, 0, 'Göteborg', ''),
(8604025824, 'Elton', 'FFH25YWX4FV', 'Elton', 'Rollins', 'nec enim. Nunc', 80, 0, 'Göteborg', ''),
(8679117701, 'Fulton', 'SKS89DMO3HK', 'Fulton', 'Levine', 'a neque. Nullam ut nisi a odio', 70, 0, 'Göteborg', ''),
(8743358548, 'Tana', 'YUC94OES9WW', 'Tana', 'Franklin', 'tellus. Phasellus elit', 41, 0, 'Malmö', ''),
(8767076938, 'Hope', 'INN06MCL3YK', 'Hope', 'Eaton', 'ut nisi a odio', 2, 0, 'Stockholm', ''),
(8892183016, 'Jasper', 'FNA60VVC1XG', 'Jasper', 'Obrien', 'Phasellus dapibus quam quis diam. Pellentesque', 6, 0, 'Stockholm', ''),
(8910152142, 'wiltord', 'pw', 'Viktor', 'Swantesson', 'hejhej det är jag som är Viktor', 23125, 0, 'Göteborg', 'viktor.jpg'),
(8911232415, 'friskydingo', 'pw', 'David', 'Eriksson', 'hejhej det är jag som är David', 23126, 0, 'Göteborg', 'david.jpg'),
(8912112242, 'ohls', 'pw', 'Martin', 'Ohls', 'hejhej det är jag som är Martin', 23128, 0, 'Göteborg', 'martin.jpg'),
(9003152142, 'daniel', 'pw', 'Daniel', 'Gunnarsson', 'hejhej det är jag som är Daniel', 23127, 0, 'Göteborg', 'daniel.jpg'),
(9010242142, 'victor', 'pw', 'Victor', 'Karlsson', 'hejhej det är jag som är Victor', 23124, 0, 'Göteborg', 'victor.jpg'),
(9103924884, 'Shana', 'OBR73XEY8HL', 'Shana', 'Stokes', 'diam lorem, auctor quis,', 16, 0, 'Stockholm', ''),
(9113239631, 'Gillian', 'JPU70GBO3HE', 'Gillian', 'Wall', 'odio. Etiam ligula tortor, dictum', 72, 0, 'Göteborg', ''),
(9297414688, 'Madison', 'EKF27UMQ8PP', 'Madison', 'Day', 'ornare', 74, 0, 'Göteborg', ''),
(9387041220, 'Rana', 'UCV68NGF7SO', 'Rana', 'Fry', 'Aliquam adipiscing lobortis risus. In mi pede, nonummy ut, molestie', 61, 0, 'Göteborg', ''),
(9454118782, 'Belle', 'SPX92BJT1WX', 'Belle', 'Porter', 'nibh vulputate mauris sagittis placerat. Cras dictum', 24, 0, 'Stockholm', ''),
(9567067751, 'Aladdin', 'HRW12ZCK8YG', 'Aladdin', 'Page', 'Sed', 52, 0, 'Göteborg', ''),
(9655051875, 'Abdul', 'EKD89HAV3OC', 'Abdul', 'Casey', 'Mauris non dui nec urna', 5, 0, 'Stockholm', ''),
(9664686074, 'Larissa', 'AAU77PHT6JM', 'Larissa', 'Alston', 'feugiat tellus lorem eu metus.', 88, 0, 'Göteborg', ''),
(9669367805, 'Kibo', 'FWT14IYL4OZ', 'Kibo', 'Bell', 'nec metus facilisis lorem tristique', 90, 0, 'Göteborg', ''),
(9730587122, 'Hedy', 'BDM07LPR7AI', 'Hedy', 'Graham', 'vel arcu. Curabitur ut odio vel est tempor', 78, 0, 'Göteborg', ''),
(9735900227, 'Caldwell', 'UEG73IPM8DC', 'Caldwell', 'Ford', 'nec, mollis vitae, posuere at, velit. Cras lorem lorem,', 66, 0, 'Göteborg', ''),
(9768047473, 'Kelly', 'HQD31JBW6VY', 'Kelly', 'Sutton', 'massa lobortis ultrices. Vivamus rhoncus.', 54, 0, 'Göteborg', ''),
(9823496926, 'Tamara', 'JNG41LQA6CH', 'Tamara', 'Gates', 'egestas blandit. Nam nulla magna,', 32, 0, 'Malmö', '');

-- --------------------------------------------------------

--
-- Tabellstruktur `team`
--

CREATE TABLE IF NOT EXISTS `team` (
  `title` varchar(32) NOT NULL DEFAULT '',
  `teaminfo` varchar(1024) DEFAULT NULL,
  `dateofcreation` char(8) DEFAULT NULL,
  `openteam` bit(1) NOT NULL,
  PRIMARY KEY (`title`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumpning av Data i tabell `team`
--

INSERT INTO `team` (`title`, `teaminfo`, `dateofcreation`, `openteam`) VALUES
('Adipiscing Enim Consulting', 'Payroll', '28082014', b'0'),
('At Risus Incorporated', 'Public Relations', '05012013', b'0'),
('Chalmers', 'Spring för Chalmers!', '01012014', b'1'),
('Dolor Sit Foundation', 'Asset Management', '14042013', b'0'),
('Donec LLC', 'Advertising', '30052014', b'0'),
('Dui Institute', 'Accounting', '11052014', b'0'),
('Enim Nunc Industries', 'Finances', '23052013', b'0'),
('Erat LLP', 'Asset Management', '26022013', b'0'),
('Falköping', 'Spring för Falköping!', '01012014', b'1'),
('Gais', 'Spring för Gais!', '01012014', b'1'),
('Göteborg', 'Spring för Göteborg!', '01012014', b'1'),
('GU', 'Spring för GU!', '01012014', b'1'),
('Hjärt-lungfonden', 'Spring för Hjärt-lungfonden!', '01012014', b'1'),
('IFK Göteborg', 'Spring för IFK!', '01012014', b'1'),
('In Consulting', 'Research and Development', '20102012', b'0'),
('IxD Grupp 5', 'Grupp 5', '10042013', b'0'),
('Malmö', 'Spring för Malmö!', '01012014', b'1'),
('Mattis Incorporated', 'Legal Department', '30112013', b'0'),
('Mi Pede Consulting', 'Asset Management', '16072014', b'0'),
('Natoque Penatibus Foundation', 'Public Relations', '24012013', b'0'),
('Orci Corporation', 'Finances', '26062014', b'0'),
('Pellentesque Company', 'Quality Assurance', '04042013', b'0'),
('Porttitor Eros Inc.', 'Accounting', '18122013', b'0'),
('Proin Consulting', 'Human Resources', '10052013', b'0'),
('Rädda Barnen', 'Spring för Rädda Barnen!', '01012014', b'1'),
('Rädda Joppe', 'Rädda Joppe, död eller levande!!', '01012014', b'1'),
('Risus Donec Inc.', 'Tech Support', '10122013', b'0'),
('Sed Foundation', 'Customer Relations', '11092013', b'0'),
('Sed LLP', 'Media Relations', '28092014', b'0'),
('Skövde', 'Spring för Skövde!', '01012014', b'1'),
('Sollicitudin Corporation', 'Media Relations', '05072014', b'0'),
('Stockholm', 'Spring för Stockholm!', '01012014', b'1'),
('Turpis Nec Mauris Institute', 'Public Relations', '28062014', b'0'),
('Vehicula Et Rutrum PC', 'Media Relations', '20012013', b'0'),
('Vel Est Foundation', 'Public Relations', '01012014', b'0'),
('Volutpat PC', 'Advertising', '20072014', b'0'),
('Volvo', 'Spring för Volvo!', '01012014', b'1'),
('Vulputate Posuere Institute', 'Customer Relations', '22052013', b'0');

-- --------------------------------------------------------

--
-- Tabellstruktur `teamsquad`
--

CREATE TABLE IF NOT EXISTS `teamsquad` (
  `runnerpnr` bigint(20) NOT NULL DEFAULT '0',
  `teamtitle` varchar(32) NOT NULL DEFAULT '',
  PRIMARY KEY (`runnerpnr`,`teamtitle`),
  KEY `teamtitle` (`teamtitle`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumpning av Data i tabell `teamsquad`
--

INSERT INTO `teamsquad` (`runnerpnr`, `teamtitle`) VALUES
(8911232415, 'Chalmers'),
(8912112242, 'Chalmers'),
(9003152142, 'Chalmers'),
(9010242142, 'Falköping'),
(8912112242, 'Gais'),
(8910152142, 'Göteborg'),
(8911232415, 'Göteborg'),
(8912112242, 'Göteborg'),
(9010242142, 'Göteborg'),
(9003152142, 'Hjärt-lungfonden'),
(8910152142, 'IxD Grupp 5'),
(8911232415, 'IxD Grupp 5'),
(8912112242, 'IxD Grupp 5'),
(9003152142, 'IxD Grupp 5'),
(9010242142, 'IxD Grupp 5'),
(8912112242, 'Rädda Barnen'),
(8911232415, 'Rädda Joppe'),
(8910152142, 'Skövde');

--
-- Restriktioner för dumpade tabeller
--

--
-- Restriktioner för tabell `feedpost`
--
ALTER TABLE `feedpost`
  ADD CONSTRAINT `feedpost_ibfk_1` FOREIGN KEY (`poster`) REFERENCES `runner` (`pnr`),
  ADD CONSTRAINT `feedpost_ibfk_2` FOREIGN KEY (`teamofpost`) REFERENCES `team` (`title`);

--
-- Restriktioner för tabell `leaguemembers`
--
ALTER TABLE `leaguemembers`
  ADD CONSTRAINT `leaguemembers_ibfk_1` FOREIGN KEY (`teamtitle`) REFERENCES `team` (`title`),
  ADD CONSTRAINT `leaguemembers_ibfk_2` FOREIGN KEY (`leaguetitle`) REFERENCES `league` (`title`);

--
-- Restriktioner för tabell `result`
--
ALTER TABLE `result`
  ADD CONSTRAINT `result_ibfk_1` FOREIGN KEY (`runnerpnr`) REFERENCES `runner` (`pnr`);

--
-- Restriktioner för tabell `teamsquad`
--
ALTER TABLE `teamsquad`
  ADD CONSTRAINT `teamsquad_ibfk_1` FOREIGN KEY (`runnerpnr`) REFERENCES `runner` (`pnr`),
  ADD CONSTRAINT `teamsquad_ibfk_2` FOREIGN KEY (`teamtitle`) REFERENCES `team` (`title`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
