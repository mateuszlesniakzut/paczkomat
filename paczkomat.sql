-- phpMyAdmin SQL Dump
-- version 4.9.5
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jun 18, 2021 at 01:52 PM
-- Server version: 5.7.24
-- PHP Version: 7.4.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `io`
--

-- --------------------------------------------------------

--
-- Table structure for table `opłata`
--

CREATE TABLE `opłata` (
  `ID_opłata_PK` int(11) NOT NULL,
  `Dzień` int(11) NOT NULL,
  `Miesiąc` int(11) NOT NULL,
  `Rok` int(11) NOT NULL,
  `ID_zamówienie_FK` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `opłata`
--

INSERT INTO `opłata` (`ID_opłata_PK`, `Dzień`, `Miesiąc`, `Rok`, `ID_zamówienie_FK`) VALUES
(1, 10, 2, 2021, 1),
(2, 13, 1, 2021, 2),
(3, 4, 3, 2021, 3);

-- --------------------------------------------------------

--
-- Table structure for table `użytkownik`
--

CREATE TABLE `użytkownik` (
  `ID_użytkownik_PK` int(11) NOT NULL,
  `Login` varchar(30) NOT NULL,
  `Hasło` varchar(30) NOT NULL,
  `Uprawnienia_admin` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `użytkownik`
--

INSERT INTO `użytkownik` (`ID_użytkownik_PK`, `Login`, `Hasło`, `Uprawnienia_admin`) VALUES
(1, 'Jan', 'Kowalski', 1);

-- --------------------------------------------------------

--
-- Table structure for table `zamówienie`
--

CREATE TABLE `zamówienie` (
  `ID_zamówienie_PK` int(11) NOT NULL,
  `Kwota` float NOT NULL,
  `Czy_wymaga_mrożenia` tinyint(1) NOT NULL,
  `Czy_wymaga_chłodzenia` tinyint(1) NOT NULL,
  `ID_opłata_FK` int(11) DEFAULT NULL,
  `Numer_telefonu` int(11) NOT NULL,
  `Kod_odbioru` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `zamówienie`
--

INSERT INTO `zamówienie` (`ID_zamówienie_PK`, `Kwota`, `Czy_wymaga_mrożenia`, `Czy_wymaga_chłodzenia`, `ID_opłata_FK`, `Numer_telefonu`, `Kod_odbioru`) VALUES
(1, 100, 1, 1, 1, 500500500, 123456),
(2, 20, 0, 0, 2, 650650650, 112233),
(3, 50, 0, 1, 3, 676767676, 676767),
(4, 100, 1, 1, NULL, 600600600, 123456);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `opłata`
--
ALTER TABLE `opłata`
  ADD PRIMARY KEY (`ID_opłata_PK`),
  ADD KEY `zamówienie_opłacone` (`ID_zamówienie_FK`);

--
-- Indexes for table `użytkownik`
--
ALTER TABLE `użytkownik`
  ADD PRIMARY KEY (`ID_użytkownik_PK`);

--
-- Indexes for table `zamówienie`
--
ALTER TABLE `zamówienie`
  ADD PRIMARY KEY (`ID_zamówienie_PK`),
  ADD KEY `opłata_zamówienia` (`ID_opłata_FK`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `opłata`
--
ALTER TABLE `opłata`
  MODIFY `ID_opłata_PK` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `użytkownik`
--
ALTER TABLE `użytkownik`
  MODIFY `ID_użytkownik_PK` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `zamówienie`
--
ALTER TABLE `zamówienie`
  MODIFY `ID_zamówienie_PK` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `opłata`
--
ALTER TABLE `opłata`
  ADD CONSTRAINT `zamówienie_opłacone` FOREIGN KEY (`ID_zamówienie_FK`) REFERENCES `zamówienie` (`ID_zamówienie_PK`);

--
-- Constraints for table `zamówienie`
--
ALTER TABLE `zamówienie`
  ADD CONSTRAINT `opłata_zamówienia` FOREIGN KEY (`ID_opłata_FK`) REFERENCES `opłata` (`ID_opłata_PK`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
