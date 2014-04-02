-- phpMyAdmin SQL Dump
-- version 3.5.8.2
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Loomise aeg: Aprill 02, 2014 kell 03:17 PM
-- Serveri versioon: 5.5.35-log
-- PHP versioon: 5.3.28

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Andmebaas: `np10124_po`
--

-- --------------------------------------------------------

--
-- Tabeli struktuur tabelile `users_fb`
--

DROP TABLE IF EXISTS `users_fb`;
CREATE TABLE IF NOT EXISTS `users_fb` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `username` varchar(60) COLLATE utf8_bin NOT NULL,
  `name` varchar(60) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=21 ;

--
-- Andmete tõmmistamine tabelile `users_fb`
--

INSERT INTO `users_fb` (`id`, `uid`, `username`, `name`) VALUES
(7, 54, 'rain.oksvort', 'Rain Oksvort'),
(8, 55, 'rain.oksvort', 'Rain Oksvort'),
(9, 56, 'rain.oksvort', 'Rain Oksvort'),
(10, 57, 'rain.oksvort', 'Rain Oksvort'),
(11, 58, 'rain.oksvort', 'Rain Oksvort'),
(12, 59, 'rain.oksvort', 'Rain Oksvort'),
(13, 60, 'rain.oksvort', 'Rain Oksvort'),
(14, 61, 'rain.oksvort', 'Rain Oksvort'),
(15, 62, 'rain.oksvort', 'Rain Oksvort'),
(16, 63, 'rain.oksvort', 'Rain Oksvort'),
(17, 64, 'rain.oksvort', 'Rain Oksvort'),
(18, 65, 'rain.oksvort', 'Rain Oksvort'),
(19, 66, 'peeter.reissar', 'Peeter Robert Reissar'),
(20, 69, 'stenver', 'Stenver Jerkku');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
