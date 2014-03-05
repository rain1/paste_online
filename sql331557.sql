-- phpMyAdmin SQL Dump
-- version 3.5.5
-- http://www.phpmyadmin.net
--
-- Host: sql3.freemysqlhosting.net
-- Loomise aeg: Märts 05, 2014 kell 01:48 PM
-- Serveri versioon: 5.5.35-0ubuntu0.12.04.2
-- PHP versioon: 5.3.28

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Andmebaas: `sql331557`
--

-- --------------------------------------------------------

--
-- Tabeli struktuur tabelile `sessions`
--

DROP TABLE IF EXISTS `sessions`;
CREATE TABLE IF NOT EXISTS `sessions` (
  `SessionID` varchar(15) COLLATE utf8_bin NOT NULL,
  `UserID` int(11) NOT NULL,
  `IPAddress` varchar(15) COLLATE utf8_bin NOT NULL,
  `UserAgent` text COLLATE utf8_bin NOT NULL,
  `Start` int(11) NOT NULL,
  `End` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Andmete tõmmistamine tabelile `sessions`
--

INSERT INTO `sessions` (`SessionID`, `UserID`, `IPAddress`, `UserAgent`, `Start`, `End`) VALUES
('I2*Be([fj0({mnJ', 1, '193.40.10.178', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:27.0) Gecko/20100101 Firefox/27.0', 1393968010, 1549488010),
('d/fhGgdvKBJrF98', 38, '193.40.10.178', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:27.0) Gecko/20100101 Firefox/27.0', 1394016552, 1549536552),
('gP3jUg49y*FTWA!', 1, '193.40.10.178', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:27.0) Gecko/20100101 Firefox/27.0', 1394017573, 1549537573),
('b7Aj/.+}5ZJ/cYa', 1, '193.40.10.178', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:27.0) Gecko/20100101 Firefox/27.0', 1394017703, 1549537703),
('5[BPSY0NAQ/AjAs', 38, '193.40.10.178', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:27.0) Gecko/20100101 Firefox/27.0', 1394017715, 1549537715),
('iIStHxcf,fD0wa.', 38, '193.40.10.178', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:27.0) Gecko/20100101 Firefox/27.0', 1394017717, 1549537717),
('abHxagCk9LE)!AT', 1, '193.40.10.178', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:27.0) Gecko/20100101 Firefox/27.0', 1394017723, 1549537723),
('HeJBG9GS5S(qx[&', 1, '193.40.10.178', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:27.0) Gecko/20100101 Firefox/27.0', 1394017867, 1549537867),
('jGZGLp+EY$!}L*2', 1, '193.40.10.178', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:27.0) Gecko/20100101 Firefox/27.0', 1394017976, 1549537976),
('@G)+lIxsf5rih-f', 1, '193.40.10.178', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:27.0) Gecko/20100101 Firefox/27.0', 1394018025, 1549538025),
('DFGgKddf/ta}9e.', 1, '193.40.10.178', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:27.0) Gecko/20100101 Firefox/27.0', 1394018143, 1549538143),
('SQ4%wZHluG&EOGD', 1, '193.40.10.178', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:27.0) Gecko/20100101 Firefox/27.0', 1394018183, 1549538183),
('x6Q&Sd4JjPHC/Rc', 38, '193.40.10.178', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:27.0) Gecko/20100101 Firefox/27.0', 1394018200, 1549538200),
('@jh8Dhdls.6H(Kg', 38, '193.40.10.178', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:27.0) Gecko/20100101 Firefox/27.0', 1394018201, 1549538201),
('jM/!)lfZudFFJ*s', 1, '193.40.10.178', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:27.0) Gecko/20100101 Firefox/27.0', 1394018208, 1549538208),
('axe,DxWkVjYOeIe', 1, '193.40.10.178', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:27.0) Gecko/20100101 Firefox/27.0', 1394018239, 1549538239),
('@TXoVxRjJWX/8AF', 38, '193.40.10.178', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:27.0) Gecko/20100101 Firefox/27.0', 1394018249, 1549538249),
('6R4{4o5xu6.G%+.', 38, '193.40.10.178', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:27.0) Gecko/20100101 Firefox/27.0', 1394018251, 1549538251),
('w{%X/CHdrA}nGhZ', 1, '193.40.10.178', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:27.0) Gecko/20100101 Firefox/27.0', 1394018255, 1549538255),
('PPKj5KK$W,0Pgb.', 1, '193.40.10.178', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:27.0) Gecko/20100101 Firefox/27.0', 1394018381, 1549538381),
('2F/Df}&X$ghSCIr', 1, '193.40.10.178', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:27.0) Gecko/20100101 Firefox/27.0', 1394018385, 1549538385),
('W/Bl[{{s[hT2smO', 1, '193.40.10.178', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:27.0) Gecko/20100101 Firefox/27.0', 1394018562, 1549538562),
('meRd2JDfi+SpJ2h', 1, '193.40.10.178', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:27.0) Gecko/20100101 Firefox/27.0', 1394018566, 1549538566),
('G8Bv(gVHd*%nMTS', 1, '193.40.10.178', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:27.0) Gecko/20100101 Firefox/27.0', 1394018680, 1549538680),
('H}En$T{HBreKUSs', 38, '193.40.10.178', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:27.0) Gecko/20100101 Firefox/27.0', 1394018774, 1549538774),
('}GYwU}c8h{tCUip', 38, '193.40.10.178', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:27.0) Gecko/20100101 Firefox/27.0', 1394018776, 1549538776),
('bJnS-/Myjb38QcG', 1, '193.40.10.178', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:27.0) Gecko/20100101 Firefox/27.0', 1394021282, 1549541282),
('WFY!Bl3DjDs*mGl', 38, '193.40.10.178', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:27.0) Gecko/20100101 Firefox/27.0', 1394021323, 1549541323),
('z4wC}iu%APv(M/g', 1, '193.40.10.178', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:27.0) Gecko/20100101 Firefox/27.0', 1394026809, 1549546809),
('!@H/A2Hq{yJZ$@&', 38, '193.40.10.178', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:27.0) Gecko/20100101 Firefox/27.0', 1394026892, 1549546892),
('!jaN4Q!wS28uLTc', 38, '193.40.10.178', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:27.0) Gecko/20100101 Firefox/27.0', 1394026893, 1549546893);

-- --------------------------------------------------------

--
-- Tabeli struktuur tabelile `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `UserID` int(11) NOT NULL AUTO_INCREMENT,
  `UserName` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `UserPassword` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `UserEmail` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `UserAvatar` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `UserJoinDate` int(11) DEFAULT NULL,
  `UserPostCount` int(11) DEFAULT NULL,
  `UserFounder` int(1) DEFAULT NULL,
  `UserAdmin` tinyint(1) NOT NULL,
  PRIMARY KEY (`UserID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=40 ;

--
-- Andmete tõmmistamine tabelile `users`
--

INSERT INTO `users` (`UserID`, `UserName`, `UserPassword`, `UserEmail`, `UserAvatar`, `UserJoinDate`, `UserPostCount`, `UserFounder`, `UserAdmin`) VALUES
(1, 'guest ', '', '', '', 1318617171, 0, 0, 0),
(2, 'Exabot', '', '', '', 0, 0, 0, 0),
(3, 'Googlebot', '', '', '', 0, 0, 0, 0),
(4, 'Yahoo', '', '', '', 0, 0, 0, 0),
(5, 'msnbot', '', '', '', 0, 0, 0, 0),
(6, 'setooz', '', '', '', 0, 0, 0, 0),
(7, 'DotBot', '', '', '', 0, 0, 0, 0),
(8, 'Cityreview', '', '', '', 0, 0, 0, 0),
(9, 'SurveyBot', '', '', '', 0, 0, 0, 0),
(10, 'Twiceler', '', '', '', 0, 0, 0, 0),
(11, 'AddMe', '', '', '', 0, 0, 0, 0),
(12, 'AppEngine-Google', '', '', '', 0, 0, 0, 0),
(13, 'Baiduspider', '', '', '', 0, 0, 0, 0),
(14, 'CatchBot', '', '', '', 0, 0, 0, 0),
(15, 'Comodo-Certificates-Spider', '', '', '', 0, 0, 0, 0),
(16, 'Content Crawler', '', '', '', 0, 0, 0, 0),
(17, 'DLE_Spider.exe', '', '', '', 0, 0, 0, 0),
(18, 'EC2LinkFinder', '', '', '', 0, 0, 0, 0),
(19, 'findfiles.net', '', '', '', 0, 0, 0, 0),
(20, 'findlinks', '', '', '', 0, 0, 0, 0),
(21, 'gold crawler', '', '', '', 0, 0, 0, 0),
(22, 'GSLFbot', '', '', '', 0, 0, 0, 0),
(23, 'ia_archiver', '', '', '', 0, 0, 0, 0),
(24, 'Jyxobot', '', '', '', 0, 0, 0, 0),
(25, 'libwww-perl', '', '', '', 0, 0, 0, 0),
(26, 'Mail.Ru', '', '', '', 0, 0, 0, 0),
(27, 'bingbot', '', '', '', 0, 0, 0, 0),
(28, 'DotBot', '', '', '', 0, 0, 0, 0),
(29, 'MJ12bot', '', '', '', 0, 0, 0, 0),
(30, 'NerdByNature', '', '', '', 0, 0, 0, 0),
(31, 'ScoutJet', '', '', '', 0, 0, 0, 0),
(32, 'SISTRIX', '', '', '', 0, 0, 0, 0),
(33, 'WBSearchBot', '', '', '', 0, 0, 0, 0),
(34, 'YandexBot', '', '', '', 0, 0, 0, 0),
(35, 'YandexFavicon', '', '', '', 0, 0, 0, 0),
(36, 'TwengaBot', '', '', '', 0, 0, 0, 0),
(37, 'Google', '', '', '', 0, 0, 0, 0),
(38, 'rain ', '23678db5efde9ab46bce8c23a6d91b50', 'a@a.com', 'test2', 1318617171, 0, 0, 0),
(39, 'test', '', 'test', '', 1373302916, 0, 0, 0);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
