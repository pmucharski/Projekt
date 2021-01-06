-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Czas generowania: 06 Sty 2021, 13:55
-- Wersja serwera: 10.4.17-MariaDB
-- Wersja PHP: 8.0.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Baza danych: `hotel`
--

DELIMITER $$
--
-- Procedury
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `procedura1` (IN `cena_od` FLOAT, IN `cena_do` FLOAT)  SELECT `id_rezerwacji`, `kwota_zl`
FROM platnosci
WHERE kwota_zl >= cena_od AND kwota_zl <= cena_do
ORDER BY kwota_zl$$

--
-- Funkcje
--
CREATE DEFINER=`root`@`localhost` FUNCTION `PelneImie` (`imie` VARCHAR(50), `nazwisko` VARCHAR(50)) RETURNS VARCHAR(50) CHARSET utf8mb4 RETURN CONCAT(imie, ' ', nazwisko)$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `goscie`
--

CREATE TABLE `goscie` (
  `id_goscia` int(11) NOT NULL,
  `imie` varchar(50) DEFAULT NULL,
  `nazwisko` varchar(50) DEFAULT NULL,
  `adres_zamieszkania` varchar(50) DEFAULT NULL,
  `kod_pocztowy` varchar(50) DEFAULT NULL,
  `Miasto` varchar(50) DEFAULT NULL,
  `Kraj` varchar(50) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `nr_telefonu` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Zrzut danych tabeli `goscie`
--

INSERT INTO `goscie` (`id_goscia`, `imie`, `nazwisko`, `adres_zamieszkania`, `kod_pocztowy`, `Miasto`, `Kraj`, `email`, `nr_telefonu`) VALUES
(1, 'Patryk', 'Mucharski', 'Jasna 14', '19-322', 'Warszawa', 'Polska', 'asdklh@wp.pl', '362472763'),
(2, 'Paweł', 'Kasjan', 'Jasianowo', '32-242', 'Lublin', 'Polska', 'asdaih@wp.pl', '372647268'),
(3, 'Kamil', 'Żywna', 'Olsza 12', '32-421', 'Kraków', 'Polska', 'asdkl@wp.pl', '374628495'),
(4, 'Daniel', 'Ostapowicz', 'Krótka 15', '49-213', 'Olsztyn', 'Polska', 'askjdhk@wp.pl', '384758472'),
(5, 'Konrad', 'Pachucki', 'Towarowa 18', '32-321', 'Toruń', 'Polska', 'kjasfdh@wp.pl', '84736475'),
(6, 'Michał', 'Filutowski', 'Gruba 11', '31-321', 'Ełk', 'Polska', 'aslkdnj@wp.pl', '874653672'),
(7, 'Mateusz', 'Kamiński', 'Pantoflowa 12', '34-623', 'Giżycko', 'Polska', 'asdkhn@wp.pl', '875647589'),
(8, 'Karol', 'Łukasiewicz', 'Piwna 18', '95-423', 'Elbląg', 'Polska', 'asdkn@wp.pl', '765482754'),
(9, 'Marta', 'Rogowska', 'Towarowa 1', '51-232', 'Katowice', 'Polska', 'askdfhn@wp.pl', '172364782'),
(10, 'Karolina', 'Róg', 'Piękna 19', '41-432', 'Szczecin', 'Polska', 'askdjn@wp.pl', '876475827'),
(11, 'Kacper', 'Sieńko', 'Kalinowo', '31-512', 'Białystok', 'Polska', 'asdkn@wp.pl', '4752837485'),
(12, 'Kuba', 'Zakrzewski', 'Hoża 29', '09-232', 'Gołdap', 'Polska', 'asdkn@wp.pl', '89167236'),
(13, 'Tadeusz', 'Kościouszko', 'Kręta 12', '32-321', 'Tokio', 'Japonia', 'asdj@wp.pl', '372636232'),
(14, 'Marta', 'Leń', 'Jasna 22', '32-434', 'Lublin', 'Polska', 'asdhn@wp.pl', '7832647264'),
(15, 'Mateusz', 'Ostapowicz', 'Polna 32', '23-234', 'Kraków', 'Polska', 'ajksdn@wp.pl', '283712387'),
(16, 'Angelika', 'Mróz', 'Cicha 21', '32-412', 'Gdańsk', 'Polska', 'asdj@wp.pl', '327632718'),
(17, 'Gabrysia', 'Wróblewska', 'Rajdowa 22', '23-233', 'Sopot', 'Polska', 'asdh@wp.pl', '32786323'),
(18, 'Kamil', 'Niedzielko', 'Igłowa 23', '32-342', 'Suwałki', 'Polska', 'askdjn@wp.pl', '37253762'),
(19, 'Paweł', 'Roz', 'Kiła 23', '32-324', 'Ełk', 'Polska', 'ioakshdnj@wp.pl', '273678684'),
(20, 'Patryk', 'Kojot', 'Leśna 32', '44-343', 'Gdynia', 'Polska', 'aksdn@wp.pl', '478634433');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `platnosci`
--

CREATE TABLE `platnosci` (
  `id_rezerwacji` int(11) NOT NULL,
  `id_goscia` int(11) DEFAULT NULL,
  `ilosc_gosci` decimal(10,0) DEFAULT NULL,
  `kwota_zl` float NOT NULL,
  `czy_zaplacil` varchar(50) DEFAULT NULL,
  `data_platnosci` datetime DEFAULT NULL,
  `rezygnacja` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Zrzut danych tabeli `platnosci`
--

INSERT INTO `platnosci` (`id_rezerwacji`, `id_goscia`, `ilosc_gosci`, `kwota_zl`, `czy_zaplacil`, `data_platnosci`, `rezygnacja`) VALUES
(1, 1, '2', 150, 'zaplacono', '2021-01-01 11:12:35', NULL),
(2, 2, '2', 200, 'zaplacono', '2021-01-02 11:12:35', NULL),
(3, 20, '2', 360, 'zaplacono', '2020-12-31 11:12:35', 'rezygnacja'),
(4, 3, '1', 80, 'oczekiwanie', NULL, NULL),
(5, 4, '8', 180, 'zaplacono', '2021-01-03 11:12:35', NULL),
(6, 5, '2', 450, 'zaplacono', '2020-12-16 11:12:35', 'rezygnacja'),
(7, 6, '2', 150, 'oczekiwanie', NULL, NULL),
(8, 17, '2', 300, 'zaplacono', '2021-01-04 11:12:35', NULL),
(9, 11, '8', 180, 'zaplacono', '2021-01-02 11:12:35', NULL),
(10, 18, '2', 200, 'zaplacono', '2020-12-08 11:12:35', NULL),
(11, 7, '1', 80, 'zaplacono', '2020-12-10 11:12:35', NULL),
(12, 8, '8', 360, 'oczekiwanie', NULL, NULL),
(13, 9, '2', 100, 'zaplacono', '2020-12-31 11:12:35', NULL),
(14, 10, '1', 80, 'zaplacono', '2020-12-30 11:12:35', NULL),
(15, 12, '1', 160, 'zaplacono', '2020-12-29 11:12:35', 'rezygnacja'),
(16, 13, '2', 100, 'oczekiwanie', NULL, NULL),
(17, 14, '8', 180, 'zaplacono', '2021-01-03 11:12:35', NULL),
(18, 15, '1', 80, 'zaplacono', '2021-01-06 12:09:54', NULL);

--
-- Wyzwalacze `platnosci`
--
DELIMITER $$
CREATE TRIGGER `data_platnosci` BEFORE INSERT ON `platnosci` FOR EACH ROW SET NEW.data_platnosci = now()
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `pokoje`
--

CREATE TABLE `pokoje` (
  `nr_pokoju` int(11) NOT NULL,
  `typ_pokoju` varchar(50) DEFAULT NULL,
  `cena_za_noc` decimal(10,0) DEFAULT NULL,
  `max_il_osob` int(11) DEFAULT NULL,
  `czy_wolny` varchar(50) DEFAULT NULL,
  `pop_max_il_osob` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Zrzut danych tabeli `pokoje`
--

INSERT INTO `pokoje` (`nr_pokoju`, `typ_pokoju`, `cena_za_noc`, `max_il_osob`, `czy_wolny`, `pop_max_il_osob`) VALUES
(1, 'Pokój double-double', '150', 4, 'zarezerwowany', 0),
(2, 'Pokój dwuosobowy z 1 łóżkiem', '100', 2, 'zarezerwowany', 0),
(3, 'Pokój dwuosobowy z 2 łóżkami ', '120', 2, 'zarezerwowany', 0),
(4, 'Pokój jednoosobowy', '80', 1, 'zarezerwowany', 0),
(5, 'Pokój rodzinny', '180', 9, 'zarezerwowany', 8),
(6, 'Pokój double-double', '150', 4, 'zarezerwowany', 0),
(7, 'Pokój dwuosobowy z 1 łóżkiem', '100', 2, 'niezarezerwowany', 0),
(8, 'Pokój dwuosobowy z 2 łóżkami ', '120', 2, 'niezarezerwowany', 0),
(9, 'Pokój jednoosobowy', '80', 1, 'niezarezerwowany', 0),
(10, 'Pokój rodzinny', '180', 8, 'zarezerwowany', 0),
(11, 'Pokój double-double', '150', 4, 'zarezerwowany', 0),
(12, 'Pokój dwuosobowy z 1 łóżkiem', '100', 2, 'zarezerwowany', 0),
(13, 'Pokój dwuosobowy z 2 łóżkami ', '120', 2, 'niezarezerwowany', 0),
(14, 'Pokój jednoosobowy', '80', 1, 'zarezerwowany', 0),
(15, 'Pokój rodzinny', '180', 8, 'zarezerwowany', 0),
(16, 'Pokój double-double', '150', 4, 'zarezerwowany', 0),
(17, 'Pokój dwuosobowy z 1 łóżkiem', '100', 2, 'zarezerwowany', 0),
(18, 'Pokój dwuosobowy z 2 łóżkami ', '120', 2, 'niezarezerwowany', 0),
(19, 'Pokój jednoosobowy', '80', 1, 'zarezerwowany', 0),
(20, 'Pokój rodzinny', '180', 8, 'zarezerwowany', 0),
(21, 'Pokój double-double', '150', 4, 'niezarezerwowany', 0),
(22, 'Pokój dwuosobowy z 1 łóżkiem', '100', 2, 'zarezerwowany', 0),
(23, 'Pokój jednoosobowy', '80', 1, 'zarezerwowany', 0),
(24, 'Pokój jednoosobowy', '80', 1, 'zarezerwowany', 0),
(25, 'Pokój dwuosobowy z 1 łóżkiem', '100', 2, 'niezarezerwowany', 0),
(26, 'Pokój dwuosobowy z 1 łóżkiem', '120', 2, 'niezarezerwowany', 0),
(27, 'Pokój dwuosobowy z 2 łóżkami ', '120', 2, 'niezarezerwowany', 0),
(28, 'Pokój rodzinny', '180', 8, 'niezarezerwowany', 0),
(29, 'Pokój jednoosobowy', '80', 1, 'zarezerwowany', 0),
(30, 'Pokój double-double', '150', 4, 'niezarezerwowany', 0);

--
-- Wyzwalacze `pokoje`
--
DELIMITER $$
CREATE TRIGGER `modyfikacja` BEFORE UPDATE ON `pokoje` FOR EACH ROW IF NEW.max_il_osob!=OLD.max_il_osob THEN
SET NEW.pop_max_il_osob = OLD.max_il_osob;
END IF
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `rezerwacje`
--

CREATE TABLE `rezerwacje` (
  `id_rezerwacji` int(11) NOT NULL,
  `data_zakwaterowania` date DEFAULT NULL,
  `data_wykwaterowania` date DEFAULT NULL,
  `nr_pokoju` int(11) DEFAULT NULL,
  `id_goscia` int(11) DEFAULT NULL,
  `ile_nocy` int(11) DEFAULT NULL,
  `typ_pokoju` varchar(50) DEFAULT NULL,
  `data_rezerwacji` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Zrzut danych tabeli `rezerwacje`
--

INSERT INTO `rezerwacje` (`id_rezerwacji`, `data_zakwaterowania`, `data_wykwaterowania`, `nr_pokoju`, `id_goscia`, `ile_nocy`, `typ_pokoju`, `data_rezerwacji`) VALUES
(1, '2021-01-10', '2021-01-11', 1, 1, 1, 'Pokój double-double', '2021-01-01'),
(2, '2021-01-11', '2021-01-13', 2, 2, 2, 'Pokój dwuosobowy z 1 łóżkiem', '2021-01-02'),
(3, '2021-01-12', '2021-01-15', 3, 20, 3, 'Pokój dwuosobowy z 2 łóżkami ', '2020-12-31'),
(4, '2021-01-07', '2021-01-08', 4, 3, 1, 'Pokój jednoosobowy', '2021-01-04'),
(5, '2021-01-28', '2021-01-29', 5, 4, 1, 'Pokój rodzinny', '2021-01-03'),
(6, '2021-01-19', '2021-01-22', 6, 5, 3, 'Pokój double-double', '2020-12-16'),
(7, '2021-01-29', '2021-01-30', 11, 6, 1, 'Pokój double-double', '2021-01-05'),
(8, '2021-02-17', '2021-02-19', 16, 17, 2, 'Pokój double-double', '2021-01-04'),
(9, '2021-02-22', '2021-02-23', 10, 11, 1, 'Pokój rodzinny', '2021-01-02'),
(10, '2021-03-01', '2021-03-03', 12, 18, 2, 'Pokój dwuosobowy z 1 łóżkiem', '2020-12-08'),
(11, '2021-02-10', '2021-02-11', 14, 7, 1, 'Pokój jednoosobowy', '2020-12-10'),
(12, '2021-02-18', '2021-02-20', 15, 8, 2, 'Pokój rodzinny', '2021-01-03'),
(13, '2021-02-15', '2021-02-16', 17, 9, 1, 'Pokój dwuosobowy z 1 łóżkiem', '2020-12-31'),
(14, '2021-01-15', '2021-01-16', 24, 10, 1, 'Pokój jednoosobowy', '2020-12-30'),
(15, '2021-02-02', '2021-02-05', 23, 12, 3, 'Pokój jednoosobowy', '2020-12-29'),
(16, '2021-03-14', '2021-03-15', 22, 13, 1, 'Pokój dwuosobowy z 1 łóżkiem', '2021-01-01'),
(17, '2021-01-06', '2021-01-07', 20, 14, 1, 'Pokój rodzinny', '2021-01-03'),
(18, '2021-03-10', '2021-03-12', 19, 15, 2, 'Pokój jednoosobowy', '2021-01-03');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `rezygnacje`
--

CREATE TABLE `rezygnacje` (
  `id_rezerwacji` int(11) NOT NULL,
  `data_zakwaterowania` date DEFAULT NULL,
  `data_wykwaterowania` date DEFAULT NULL,
  `nr_pokoju` int(11) DEFAULT NULL,
  `id_goscia` int(11) DEFAULT NULL,
  `ile_nocy` int(11) DEFAULT NULL,
  `data_rezerwacji` date DEFAULT NULL,
  `data_rezygnacji` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Zrzut danych tabeli `rezygnacje`
--

INSERT INTO `rezygnacje` (`id_rezerwacji`, `data_zakwaterowania`, `data_wykwaterowania`, `nr_pokoju`, `id_goscia`, `ile_nocy`, `data_rezerwacji`, `data_rezygnacji`) VALUES
(3, '2021-01-12', '2021-01-15', 3, 20, 3, '2020-12-31', '2021-01-02 12:01:38'),
(6, '2021-01-11', '2021-01-13', 6, 5, 3, '2020-12-16', '2021-01-01 12:09:05'),
(15, '2021-01-02', '2021-01-05', 23, 12, 1, '2020-12-29', '2021-01-01 12:11:02');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `typy_pokoi`
--

CREATE TABLE `typy_pokoi` (
  `typ_pokoju` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Zrzut danych tabeli `typy_pokoi`
--

INSERT INTO `typy_pokoi` (`typ_pokoju`) VALUES
('Pokój double-double'),
('Pokój dwuosobowy z 1 łóżkiem'),
('Pokój dwuosobowy z 2 łóżkami '),
('Pokój jednoosobowy'),
('Pokój rodzinny');

-- --------------------------------------------------------

--
-- Zastąpiona struktura widoku `zapytanie_1`
-- (Zobacz poniżej rzeczywisty widok)
--
CREATE TABLE `zapytanie_1` (
`typ_pokoju` varchar(50)
,`nr_pokoju` int(11)
,`max_il_osob` int(11)
);

-- --------------------------------------------------------

--
-- Zastąpiona struktura widoku `zapytanie_2`
-- (Zobacz poniżej rzeczywisty widok)
--
CREATE TABLE `zapytanie_2` (
`imie` varchar(50)
,`nazwisko` varchar(50)
,`data_rezerwacji` date
);

-- --------------------------------------------------------

--
-- Zastąpiona struktura widoku `zapytanie_3`
-- (Zobacz poniżej rzeczywisty widok)
--
CREATE TABLE `zapytanie_3` (
`imie` varchar(50)
,`nazwisko` varchar(50)
,`kwota_zl` float
,`czy_zaplacil` varchar(50)
,`rezygnacja` varchar(10)
);

-- --------------------------------------------------------

--
-- Zastąpiona struktura widoku `zapytanie_4`
-- (Zobacz poniżej rzeczywisty widok)
--
CREATE TABLE `zapytanie_4` (
`imie` varchar(50)
,`nazwisko` varchar(50)
,`adres_zamieszkania` varchar(50)
,`data_zakwaterowania` date
,`data_wykwaterowania` date
);

-- --------------------------------------------------------

--
-- Zastąpiona struktura widoku `zapytanie_5`
-- (Zobacz poniżej rzeczywisty widok)
--
CREATE TABLE `zapytanie_5` (
`imie` varchar(50)
,`nazwisko` varchar(50)
,`nr_telefonu` varchar(50)
,`rezygnacja` varchar(10)
);

-- --------------------------------------------------------

--
-- Zastąpiona struktura widoku `zapytanie_6`
-- (Zobacz poniżej rzeczywisty widok)
--
CREATE TABLE `zapytanie_6` (
`Liczba_nieoplaconych_rezerwacji` bigint(21)
);

-- --------------------------------------------------------

--
-- Zastąpiona struktura widoku `zapytanie_7`
-- (Zobacz poniżej rzeczywisty widok)
--
CREATE TABLE `zapytanie_7` (
`ilosc_gosci_na_2021r` decimal(32,0)
);

-- --------------------------------------------------------

--
-- Zastąpiona struktura widoku `zapytanie_8`
-- (Zobacz poniżej rzeczywisty widok)
--
CREATE TABLE `zapytanie_8` (
`typ_pokoju` varchar(50)
,`cena_za_noc` decimal(10,0)
,`czy_wolny` varchar(50)
);

-- --------------------------------------------------------

--
-- Zastąpiona struktura widoku `zapytanie_9`
-- (Zobacz poniżej rzeczywisty widok)
--
CREATE TABLE `zapytanie_9` (
`typ_pokoju` varchar(50)
,`ilosc_wolnych_pokoi` bigint(21)
);

-- --------------------------------------------------------

--
-- Zastąpiona struktura widoku `zapytanie_10`
-- (Zobacz poniżej rzeczywisty widok)
--
CREATE TABLE `zapytanie_10` (
`id_goscia` int(11)
,`nr_pokoju` int(11)
);

-- --------------------------------------------------------

--
-- Struktura widoku `zapytanie_1`
--
DROP TABLE IF EXISTS `zapytanie_1`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `zapytanie_1`  AS SELECT `pokoje`.`typ_pokoju` AS `typ_pokoju`, `pokoje`.`nr_pokoju` AS `nr_pokoju`, `pokoje`.`max_il_osob` AS `max_il_osob` FROM `pokoje` WHERE `pokoje`.`czy_wolny` = 'niezarezerwowany' ;

-- --------------------------------------------------------

--
-- Struktura widoku `zapytanie_2`
--
DROP TABLE IF EXISTS `zapytanie_2`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `zapytanie_2`  AS SELECT DISTINCT `goscie`.`imie` AS `imie`, `goscie`.`nazwisko` AS `nazwisko`, `rezerwacje`.`data_rezerwacji` AS `data_rezerwacji` FROM (`goscie` join `rezerwacje`) WHERE `goscie`.`id_goscia` = `rezerwacje`.`id_goscia` AND month(`rezerwacje`.`data_rezerwacji`) = 12 ;

-- --------------------------------------------------------

--
-- Struktura widoku `zapytanie_3`
--
DROP TABLE IF EXISTS `zapytanie_3`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `zapytanie_3`  AS SELECT `goscie`.`imie` AS `imie`, `goscie`.`nazwisko` AS `nazwisko`, `platnosci`.`kwota_zl` AS `kwota_zl`, `platnosci`.`czy_zaplacil` AS `czy_zaplacil`, `platnosci`.`rezygnacja` AS `rezygnacja` FROM (`goscie` join `platnosci`) WHERE `goscie`.`id_goscia` = `platnosci`.`id_goscia` AND `platnosci`.`rezygnacja` is not null ;

-- --------------------------------------------------------

--
-- Struktura widoku `zapytanie_4`
--
DROP TABLE IF EXISTS `zapytanie_4`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `zapytanie_4`  AS SELECT `goscie`.`imie` AS `imie`, `goscie`.`nazwisko` AS `nazwisko`, `goscie`.`adres_zamieszkania` AS `adres_zamieszkania`, `rezerwacje`.`data_zakwaterowania` AS `data_zakwaterowania`, `rezerwacje`.`data_wykwaterowania` AS `data_wykwaterowania` FROM (`goscie` join `rezerwacje` on(`goscie`.`id_goscia` = `rezerwacje`.`id_goscia`)) WHERE `goscie`.`adres_zamieszkania` like 'k%' ORDER BY `goscie`.`nazwisko` ASC, `goscie`.`imie` ASC, `goscie`.`adres_zamieszkania` ASC, `rezerwacje`.`data_zakwaterowania` ASC, `rezerwacje`.`data_wykwaterowania` ASC ;

-- --------------------------------------------------------

--
-- Struktura widoku `zapytanie_5`
--
DROP TABLE IF EXISTS `zapytanie_5`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `zapytanie_5`  AS SELECT `goscie`.`imie` AS `imie`, `goscie`.`nazwisko` AS `nazwisko`, `goscie`.`nr_telefonu` AS `nr_telefonu`, `platnosci`.`rezygnacja` AS `rezygnacja` FROM (`goscie` left join `platnosci` on(`goscie`.`id_goscia` = `platnosci`.`id_goscia`)) ORDER BY `platnosci`.`rezygnacja` ASC ;

-- --------------------------------------------------------

--
-- Struktura widoku `zapytanie_6`
--
DROP TABLE IF EXISTS `zapytanie_6`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `zapytanie_6`  AS SELECT count(0) AS `Liczba_nieoplaconych_rezerwacji` FROM `platnosci` WHERE `platnosci`.`czy_zaplacil` like 'oczekiwanie' ;

-- --------------------------------------------------------

--
-- Struktura widoku `zapytanie_7`
--
DROP TABLE IF EXISTS `zapytanie_7`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `zapytanie_7`  AS SELECT sum(`platnosci`.`ilosc_gosci`) AS `ilosc_gosci_na_2021r` FROM (`platnosci` join `rezerwacje`) WHERE year(`rezerwacje`.`data_rezerwacji`) = 2021 ;

-- --------------------------------------------------------

--
-- Struktura widoku `zapytanie_8`
--
DROP TABLE IF EXISTS `zapytanie_8`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `zapytanie_8`  AS SELECT DISTINCT `pokoje`.`typ_pokoju` AS `typ_pokoju`, `pokoje`.`cena_za_noc` AS `cena_za_noc`, `pokoje`.`czy_wolny` AS `czy_wolny` FROM `pokoje` WHERE `pokoje`.`cena_za_noc` between 90 and 140 ;

-- --------------------------------------------------------

--
-- Struktura widoku `zapytanie_9`
--
DROP TABLE IF EXISTS `zapytanie_9`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `zapytanie_9`  AS SELECT `pokoje`.`typ_pokoju` AS `typ_pokoju`, count(0) AS `ilosc_wolnych_pokoi` FROM `pokoje` WHERE `pokoje`.`czy_wolny` = 'niezarezerwowany' GROUP BY `pokoje`.`typ_pokoju` ;

-- --------------------------------------------------------

--
-- Struktura widoku `zapytanie_10`
--
DROP TABLE IF EXISTS `zapytanie_10`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `zapytanie_10`  AS SELECT `rezerwacje`.`id_goscia` AS `id_goscia`, `rezerwacje`.`nr_pokoju` AS `nr_pokoju` FROM `rezerwacje` WHERE `rezerwacje`.`id_goscia` in (select `goscie`.`id_goscia` from `goscie` where `goscie`.`Kraj` not like 'POLSKA') ;

--
-- Indeksy dla zrzutów tabel
--

--
-- Indeksy dla tabeli `goscie`
--
ALTER TABLE `goscie`
  ADD PRIMARY KEY (`id_goscia`);

--
-- Indeksy dla tabeli `platnosci`
--
ALTER TABLE `platnosci`
  ADD PRIMARY KEY (`id_rezerwacji`),
  ADD KEY `id_goscia` (`id_goscia`);

--
-- Indeksy dla tabeli `pokoje`
--
ALTER TABLE `pokoje`
  ADD PRIMARY KEY (`nr_pokoju`),
  ADD KEY `typ_pokoju` (`typ_pokoju`);

--
-- Indeksy dla tabeli `rezerwacje`
--
ALTER TABLE `rezerwacje`
  ADD PRIMARY KEY (`id_rezerwacji`),
  ADD KEY `nr_pokoju` (`nr_pokoju`),
  ADD KEY `id_goscia` (`id_goscia`),
  ADD KEY `rezerwacje_ibfk_3` (`typ_pokoju`);

--
-- Indeksy dla tabeli `rezygnacje`
--
ALTER TABLE `rezygnacje`
  ADD PRIMARY KEY (`id_rezerwacji`),
  ADD KEY `nr_pokoju` (`nr_pokoju`),
  ADD KEY `id_goscia` (`id_goscia`);

--
-- Indeksy dla tabeli `typy_pokoi`
--
ALTER TABLE `typy_pokoi`
  ADD PRIMARY KEY (`typ_pokoju`);

--
-- Ograniczenia dla zrzutów tabel
--

--
-- Ograniczenia dla tabeli `platnosci`
--
ALTER TABLE `platnosci`
  ADD CONSTRAINT `platnosci_ibfk_1` FOREIGN KEY (`id_rezerwacji`) REFERENCES `rezerwacje` (`id_rezerwacji`),
  ADD CONSTRAINT `platnosci_ibfk_2` FOREIGN KEY (`id_goscia`) REFERENCES `goscie` (`id_goscia`);

--
-- Ograniczenia dla tabeli `pokoje`
--
ALTER TABLE `pokoje`
  ADD CONSTRAINT `pokoje_ibfk_1` FOREIGN KEY (`typ_pokoju`) REFERENCES `typy_pokoi` (`typ_pokoju`);

--
-- Ograniczenia dla tabeli `rezerwacje`
--
ALTER TABLE `rezerwacje`
  ADD CONSTRAINT `rezerwacje_ibfk_1` FOREIGN KEY (`nr_pokoju`) REFERENCES `pokoje` (`nr_pokoju`),
  ADD CONSTRAINT `rezerwacje_ibfk_2` FOREIGN KEY (`id_goscia`) REFERENCES `goscie` (`id_goscia`),
  ADD CONSTRAINT `rezerwacje_ibfk_3` FOREIGN KEY (`typ_pokoju`) REFERENCES `pokoje` (`typ_pokoju`);

--
-- Ograniczenia dla tabeli `rezygnacje`
--
ALTER TABLE `rezygnacje`
  ADD CONSTRAINT `rezygnacje_ibfk_1` FOREIGN KEY (`id_rezerwacji`) REFERENCES `rezerwacje` (`id_rezerwacji`),
  ADD CONSTRAINT `rezygnacje_ibfk_2` FOREIGN KEY (`nr_pokoju`) REFERENCES `pokoje` (`nr_pokoju`),
  ADD CONSTRAINT `rezygnacje_ibfk_3` FOREIGN KEY (`id_goscia`) REFERENCES `goscie` (`id_goscia`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
