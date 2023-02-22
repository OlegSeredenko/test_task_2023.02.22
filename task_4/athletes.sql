-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Фев 22 2023 г., 14:18
-- Версия сервера: 8.0.30
-- Версия PHP: 7.2.34

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `athletes`
--

-- --------------------------------------------------------

--
-- Структура таблицы `athletesData`
--

DROP TABLE IF EXISTS `athletesData`;
CREATE TABLE `athletesData` (
  `Id` int UNSIGNED NOT NULL,
  `Fullname` varchar(255) DEFAULT NULL,
  `Email` varchar(255) DEFAULT NULL,
  `PhoneNumber` varchar(20) DEFAULT NULL,
  `Birthday` date DEFAULT NULL,
  `Age` tinyint UNSIGNED DEFAULT NULL,
  `TimeInsert` datetime DEFAULT NULL,
  `Passport` tinyint UNSIGNED DEFAULT NULL,
  `PlaceCompetition` smallint UNSIGNED DEFAULT NULL,
  `Biography` text,
  `VideoPresentation` longblob
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `athletesData`
--

INSERT INTO `athletesData` (`Id`, `Fullname`, `Email`, `PhoneNumber`, `Birthday`, `Age`, `TimeInsert`, `Passport`, `PlaceCompetition`, `Biography`, `VideoPresentation`) VALUES
(1, 'Иванов Иван Иванович', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2, 'Петров Петр Петрович', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(3, 'Федоров Федр Федорович', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(4, 'Денисенко Денис Денисович', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(5, 'Егоров Егор Егорович', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(6, 'Алексеенко Алексей Алексевич', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(7, 'Александров Александр Александрович', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `competitions`
--

DROP TABLE IF EXISTS `competitions`;
CREATE TABLE `competitions` (
  `Id` int NOT NULL,
  `Name` varchar(255) DEFAULT NULL,
  `Id_athletes` int UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `competitions`
--

INSERT INTO `competitions` (`Id`, `Name`, `Id_athletes`) VALUES
(1, 'run 100 metr', 1),
(2, 'run 100 metr', 2),
(3, 'run 100 metr', 3),
(4, 'run 100 metr', 4),
(5, 'run 100 metr', 5),
(6, 'run 200 metr', 1),
(7, 'run 200 metr', 2),
(8, 'run 200 metr', 3),
(9, 'run 200 metr', 4),
(10, 'run 400 metr', 1),
(11, 'run 400 metr', 2),
(12, 'run 400 metr', 3),
(13, 'run 400 metr', 4),
(14, 'jump', 1),
(15, 'jump', 2),
(16, 'jump', 3),
(17, 'jump', 4),
(18, 'running with obstacles', 2),
(19, 'running with obstacles', 3),
(20, 'running with obstacles', 4),
(21, 'strength exercises', 7),
(22, 'strength exercises', 6),
(23, 'strength exercises', 5),
(24, 'strength exercises', 4),
(25, 'strength exercises', 3),
(26, 'stretching', 7),
(27, 'stretching', 6),
(28, 'stretching', 5),
(29, 'stretching', 4);

-- --------------------------------------------------------

--
-- Структура таблицы `results`
--

DROP TABLE IF EXISTS `results`;
CREATE TABLE `results` (
  `Id` int NOT NULL,
  `Id_competition` int DEFAULT NULL,
  `Place` int UNSIGNED DEFAULT NULL,
  `Id_athlete` int UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `winners`
--

DROP TABLE IF EXISTS `winners`;
CREATE TABLE `winners` (
  `Id` int NOT NULL,
  `Result` int DEFAULT NULL,
  `Athlete` int UNSIGNED DEFAULT NULL,
  `Competition` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `athletesData`
--
ALTER TABLE `athletesData`
  ADD PRIMARY KEY (`Id`);

--
-- Индексы таблицы `competitions`
--
ALTER TABLE `competitions`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `Id_athletes` (`Id_athletes`);

--
-- Индексы таблицы `results`
--
ALTER TABLE `results`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `Id_competition` (`Id_competition`),
  ADD KEY `Id_athlete` (`Id_athlete`);

--
-- Индексы таблицы `winners`
--
ALTER TABLE `winners`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `Result` (`Result`),
  ADD KEY `Athlete` (`Athlete`),
  ADD KEY `Competition` (`Competition`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `athletesData`
--
ALTER TABLE `athletesData`
  MODIFY `Id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT для таблицы `competitions`
--
ALTER TABLE `competitions`
  MODIFY `Id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT для таблицы `results`
--
ALTER TABLE `results`
  MODIFY `Id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `winners`
--
ALTER TABLE `winners`
  MODIFY `Id` int NOT NULL AUTO_INCREMENT;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `competitions`
--
ALTER TABLE `competitions`
  ADD CONSTRAINT `competitions_ibfk_1` FOREIGN KEY (`Id_athletes`) REFERENCES `athletesData` (`Id`);

--
-- Ограничения внешнего ключа таблицы `results`
--
ALTER TABLE `results`
  ADD CONSTRAINT `results_ibfk_1` FOREIGN KEY (`Id_competition`) REFERENCES `competitions` (`Id`),
  ADD CONSTRAINT `results_ibfk_2` FOREIGN KEY (`Id_athlete`) REFERENCES `athletesData` (`Id`);

--
-- Ограничения внешнего ключа таблицы `winners`
--
ALTER TABLE `winners`
  ADD CONSTRAINT `winners_ibfk_1` FOREIGN KEY (`Result`) REFERENCES `results` (`Id`),
  ADD CONSTRAINT `winners_ibfk_2` FOREIGN KEY (`Athlete`) REFERENCES `athletesData` (`Id`),
  ADD CONSTRAINT `winners_ibfk_3` FOREIGN KEY (`Competition`) REFERENCES `competitions` (`Id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
