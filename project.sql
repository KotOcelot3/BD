-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Окт 13 2023 г., 09:06
-- Версия сервера: 10.8.4-MariaDB
-- Версия PHP: 8.1.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `project`
--

-- --------------------------------------------------------

--
-- Структура таблицы `Diagnoses`
--

CREATE TABLE `Diagnoses` (
  `id` int(255) NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `Diagnoses`
--

INSERT INTO `Diagnoses` (`id`, `title`) VALUES
(1, 'test'),
(2, 'test');

-- --------------------------------------------------------

--
-- Структура таблицы `Doctors`
--

CREATE TABLE `Doctors` (
  `id` int(11) NOT NULL,
  `surname` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `spec` int(255) NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` text COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `Doctors`
--

INSERT INTO `Doctors` (`id`, `surname`, `spec`, `password`, `name`) VALUES
(1, 'test2', 1, 'test', 'test2'),
(2, 'test', 1, 'test', 'test'),
(3, 'ваыавыа', 1, '098f6bcd4621d373cade4e832627b4f6', 'авыа');

-- --------------------------------------------------------

--
-- Структура таблицы `Records`
--

CREATE TABLE `Records` (
  `id` int(11) NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `patient` int(255) NOT NULL,
  `doctor` int(255) NOT NULL,
  `diagnosis` int(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `Spec`
--

CREATE TABLE `Spec` (
  `id` int(11) NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `doctors` int(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `Spec`
--

INSERT INTO `Spec` (`id`, `title`, `doctors`) VALUES
(1, 'test2', NULL),
(2, 'test', NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `login` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(252) COLLATE utf8mb4_unicode_ci NOT NULL,
  `photo` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `users`
--

INSERT INTO `users` (`id`, `name`, `login`, `password`, `photo`) VALUES
(1, 'test', 'test', '098f6bcd4621d373cade4e832627b4f6', '16971742551670023946_kartinkin-net-p-flopa-koshka-pinterest-55.jpg'),
(2, 'Олег', 'OLEG', '098f6bcd4621d373cade4e832627b4f6', '1697174563Ocelot.jpg');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `Diagnoses`
--
ALTER TABLE `Diagnoses`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `Doctors`
--
ALTER TABLE `Doctors`
  ADD PRIMARY KEY (`id`),
  ADD KEY `spec` (`spec`);

--
-- Индексы таблицы `Records`
--
ALTER TABLE `Records`
  ADD PRIMARY KEY (`id`),
  ADD KEY `patient` (`patient`),
  ADD KEY `doctor` (`doctor`),
  ADD KEY `diagnosis` (`diagnosis`);

--
-- Индексы таблицы `Spec`
--
ALTER TABLE `Spec`
  ADD PRIMARY KEY (`id`),
  ADD KEY `doctors` (`doctors`);

--
-- Индексы таблицы `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `Diagnoses`
--
ALTER TABLE `Diagnoses`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `Doctors`
--
ALTER TABLE `Doctors`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `Records`
--
ALTER TABLE `Records`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT для таблицы `Spec`
--
ALTER TABLE `Spec`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `Doctors`
--
ALTER TABLE `Doctors`
  ADD CONSTRAINT `doctors_ibfk_1` FOREIGN KEY (`spec`) REFERENCES `Spec` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `Records`
--
ALTER TABLE `Records`
  ADD CONSTRAINT `records_ibfk_1` FOREIGN KEY (`diagnosis`) REFERENCES `Diagnosis` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `records_ibfk_2` FOREIGN KEY (`doctor`) REFERENCES `Doctor` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `records_ibfk_3` FOREIGN KEY (`patient`) REFERENCES `User` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `Spec`
--
ALTER TABLE `Spec`
  ADD CONSTRAINT `spec_ibfk_1` FOREIGN KEY (`doctors`) REFERENCES `Doctors` (`id`) ON DELETE SET NULL ON UPDATE SET NULL;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
