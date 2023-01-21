-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Янв 21 2023 г., 00:28
-- Версия сервера: 8.0.24
-- Версия PHP: 8.0.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `1`
--
CREATE DATABASE IF NOT EXISTS `1` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci;
USE `1`;

-- --------------------------------------------------------

--
-- Структура таблицы `group_wagon`
--

CREATE TABLE `group_wagon` (
  `id_group_wagon` int NOT NULL,
  `train_id` int NOT NULL,
  `wagon_id` int NOT NULL,
  `count_wagon` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `group_wagon`
--

INSERT INTO `group_wagon` (`id_group_wagon`, `train_id`, `wagon_id`, `count_wagon`) VALUES
(1, 1, 1, 5),
(2, 1, 2, 3),
(3, 1, 3, 1),
(4, 2, 5, 4),
(5, 2, 4, 5),
(6, 2, 6, 3),
(7, 3, 7, 6),
(8, 3, 2, 10),
(9, 4, 8, 4),
(10, 4, 4, 8),
(11, 5, 3, 4),
(12, 5, 6, 10);

-- --------------------------------------------------------

--
-- Структура таблицы `locomotive`
--

CREATE TABLE `locomotive` (
  `id_locomotive` int NOT NULL,
  `serial_numbe` int NOT NULL,
  `type_loc` varchar(15) NOT NULL,
  `number_section` int NOT NULL,
  `manufacrure` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `year_prod` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `locomotive`
--

INSERT INTO `locomotive` (`id_locomotive`, `serial_numbe`, `type_loc`, `number_section`, `manufacrure`, `year_prod`) VALUES
(1, 145680, 'тепловоз', 1, 'Новочеркасский электровозостроительный завод', 1985),
(2, 145684, 'электровоз', 1, 'Брянский машиностроительный завод', 2005),
(3, 245684, 'электровоз', 1, 'Уральский завод железнодорожного машиностроения', 2015),
(4, 255684, 'тепловоз', 1, 'Новочеркасский электровозостроительный завод', 2000),
(5, 245684, 'тепловоз', 1, 'Уральский завод железнодорожного машиностроения', 2008);

-- --------------------------------------------------------

--
-- Структура таблицы `station`
--

CREATE TABLE `station` (
  `id_station` int NOT NULL,
  `name_station` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `station`
--

INSERT INTO `station` (`id_station`, `name_station`) VALUES
(12, 'Самара - Калининград'),
(13, 'Самара - Москва');

-- --------------------------------------------------------

--
-- Структура таблицы `train`
--

CREATE TABLE `train` (
  `id_train` int NOT NULL,
  `locomotive_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `train`
--

INSERT INTO `train` (`id_train`, `locomotive_id`) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5);

-- --------------------------------------------------------

--
-- Структура таблицы `travel`
--

CREATE TABLE `travel` (
  `id_travel` int NOT NULL,
  `station_id` int NOT NULL,
  `train_id` int NOT NULL,
  `time_arrival` text NOT NULL,
  `time_departure` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `data_arrival` date NOT NULL,
  `data_departure` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `travel`
--

INSERT INTO `travel` (`id_travel`, `station_id`, `train_id`, `time_arrival`, `time_departure`, `data_arrival`, `data_departure`) VALUES
(6, 12, 1, '12:34', '13:06', '2021-11-19', '2021-11-19'),
(7, 13, 2, '12:43', '12:53', '2021-11-16', '2021-11-16');

-- --------------------------------------------------------

--
-- Структура таблицы `wagon`
--

CREATE TABLE `wagon` (
  `id_wagon` int NOT NULL,
  `serial_numbe` int NOT NULL,
  `type_wag` varchar(15) NOT NULL,
  `number_seats` int NOT NULL,
  `manufacrure` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `year_prod` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `wagon`
--

INSERT INTO `wagon` (`id_wagon`, `serial_numbe`, `type_wag`, `number_seats`, `manufacrure`, `year_prod`) VALUES
(1, 241345, 'плацкарт', 54, 'НЕВЗ', 2020),
(2, 241600, 'купе', 26, 'НЕВЗ', 2020),
(3, 241678, 'люкс', 12, 'НЕВЗ', 2005),
(4, 241432, 'купе', 26, 'Воткинский', 1992),
(5, 241156, 'плацкарт', 54, 'Воткинский', 2010),
(6, 241980, 'купе', 26, 'Воткинский', 2010),
(7, 241793, 'плацкарт', 54, 'Воткинский', 2001),
(8, 241222, 'плацкарт', 54, 'Воткинский', 2005);

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `group_wagon`
--
ALTER TABLE `group_wagon`
  ADD PRIMARY KEY (`id_group_wagon`),
  ADD KEY `fk_train_id` (`train_id`),
  ADD KEY `fk_wagon_id` (`wagon_id`);

--
-- Индексы таблицы `locomotive`
--
ALTER TABLE `locomotive`
  ADD PRIMARY KEY (`id_locomotive`);

--
-- Индексы таблицы `station`
--
ALTER TABLE `station`
  ADD PRIMARY KEY (`id_station`);

--
-- Индексы таблицы `train`
--
ALTER TABLE `train`
  ADD PRIMARY KEY (`id_train`),
  ADD KEY `fk_locomotive_id` (`locomotive_id`);

--
-- Индексы таблицы `travel`
--
ALTER TABLE `travel`
  ADD PRIMARY KEY (`id_travel`),
  ADD KEY `id_start_st` (`station_id`),
  ADD KEY `id_train` (`train_id`);

--
-- Индексы таблицы `wagon`
--
ALTER TABLE `wagon`
  ADD PRIMARY KEY (`id_wagon`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `group_wagon`
--
ALTER TABLE `group_wagon`
  MODIFY `id_group_wagon` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT для таблицы `locomotive`
--
ALTER TABLE `locomotive`
  MODIFY `id_locomotive` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT для таблицы `station`
--
ALTER TABLE `station`
  MODIFY `id_station` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT для таблицы `train`
--
ALTER TABLE `train`
  MODIFY `id_train` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT для таблицы `travel`
--
ALTER TABLE `travel`
  MODIFY `id_travel` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT для таблицы `wagon`
--
ALTER TABLE `wagon`
  MODIFY `id_wagon` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `group_wagon`
--
ALTER TABLE `group_wagon`
  ADD CONSTRAINT `group_wagon_ibfk_1` FOREIGN KEY (`train_id`) REFERENCES `train` (`id_train`),
  ADD CONSTRAINT `group_wagon_ibfk_2` FOREIGN KEY (`wagon_id`) REFERENCES `wagon` (`id_wagon`);

--
-- Ограничения внешнего ключа таблицы `train`
--
ALTER TABLE `train`
  ADD CONSTRAINT `train_ibfk_1` FOREIGN KEY (`locomotive_id`) REFERENCES `locomotive` (`id_locomotive`);

--
-- Ограничения внешнего ключа таблицы `travel`
--
ALTER TABLE `travel`
  ADD CONSTRAINT `travel_ibfk_1` FOREIGN KEY (`station_id`) REFERENCES `station` (`id_station`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `travel_ibfk_3` FOREIGN KEY (`train_id`) REFERENCES `train` (`id_train`) ON DELETE RESTRICT ON UPDATE RESTRICT;
--
-- База данных: `ilidar`
--
CREATE DATABASE IF NOT EXISTS `ilidar` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci;
USE `ilidar`;

-- --------------------------------------------------------

--
-- Структура таблицы `client`
--

CREATE TABLE `client` (
  `id клиента` int NOT NULL,
  `ФИО` varchar(30) NOT NULL,
  `Телефон` int NOT NULL,
  `Эл.Адрес` varchar(30) NOT NULL,
  `Адрес` text NOT NULL,
  `Тема` text NOT NULL,
  `Сообщение` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `obrabotka_zayavok`
--

CREATE TABLE `obrabotka_zayavok` (
  `id sotrydnika` int NOT NULL,
  `id клиента` int NOT NULL,
  `Дата заявки` date NOT NULL,
  `Сообщение` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `price list`
--

CREATE TABLE `price list` (
  `id` int NOT NULL,
  `Тип номера` varchar(30) NOT NULL,
  `Категория номера` varchar(30) NOT NULL,
  `Колличество свободных номеров` int NOT NULL,
  `Характеристика номера` text NOT NULL,
  `Цена в сутки на 1 чел` int NOT NULL,
  `Цена в сутки на 2 чел` int NOT NULL,
  `Цена доп.места` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `projivaushie`
--

CREATE TABLE `projivaushie` (
  `id` int NOT NULL,
  `id_sotrudnika` int NOT NULL,
  `ФИО` text NOT NULL,
  `Дата заезда` date NOT NULL,
  `Дата выезда` date NOT NULL,
  `Категория номера` varchar(30) NOT NULL,
  `Номер комнаты` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `sotrudniki`
--

CREATE TABLE `sotrudniki` (
  `id sotrydnika` int NOT NULL,
  `ФИО` text NOT NULL,
  `Дата рождения` date NOT NULL,
  `Должность` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `client`
--
ALTER TABLE `client`
  ADD PRIMARY KEY (`id клиента`);

--
-- Индексы таблицы `obrabotka_zayavok`
--
ALTER TABLE `obrabotka_zayavok`
  ADD PRIMARY KEY (`id sotrydnika`),
  ADD KEY `id клиента` (`id клиента`);

--
-- Индексы таблицы `price list`
--
ALTER TABLE `price list`
  ADD PRIMARY KEY (`id`),
  ADD KEY `Категория номера` (`Категория номера`);

--
-- Индексы таблицы `projivaushie`
--
ALTER TABLE `projivaushie`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_sotrudnika` (`id_sotrudnika`),
  ADD KEY `Категория номера` (`Категория номера`);

--
-- Индексы таблицы `sotrudniki`
--
ALTER TABLE `sotrudniki`
  ADD KEY `id sotrydnika` (`id sotrydnika`);

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `client`
--
ALTER TABLE `client`
  ADD CONSTRAINT `client_ibfk_1` FOREIGN KEY (`id клиента`) REFERENCES `obrabotka_zayavok` (`id клиента`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Ограничения внешнего ключа таблицы `projivaushie`
--
ALTER TABLE `projivaushie`
  ADD CONSTRAINT `projivaushie_ibfk_1` FOREIGN KEY (`Категория номера`) REFERENCES `price list` (`Категория номера`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Ограничения внешнего ключа таблицы `sotrudniki`
--
ALTER TABLE `sotrudniki`
  ADD CONSTRAINT `sotrudniki_ibfk_1` FOREIGN KEY (`id sotrydnika`) REFERENCES `projivaushie` (`id_sotrudnika`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `sotrudniki_ibfk_2` FOREIGN KEY (`id sotrydnika`) REFERENCES `obrabotka_zayavok` (`id sotrydnika`) ON DELETE RESTRICT ON UPDATE RESTRICT;
--
-- База данных: `lib`
--
CREATE DATABASE IF NOT EXISTS `lib` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci;
USE `lib`;
--
-- База данных: `olymp`
--
CREATE DATABASE IF NOT EXISTS `olymp` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci;
USE `olymp`;

-- --------------------------------------------------------

--
-- Структура таблицы `categories`
--

CREATE TABLE `categories` (
  `id` int NOT NULL,
  `name` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `categories`
--

INSERT INTO `categories` (`id`, `name`) VALUES
(1, 'Напитки'),
(2, 'Одежда'),
(3, 'Книги'),
(4, 'Аккумуляторы'),
(5, 'Документы'),
(6, 'Канцелярия'),
(7, 'Цветы'),
(8, 'Техника'),
(9, 'Мебель'),
(10, 'Инструменты'),
(11, 'Садоводство');

-- --------------------------------------------------------

--
-- Структура таблицы `employees`
--

CREATE TABLE `employees` (
  `id` int NOT NULL,
  `name` text NOT NULL,
  `categories` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `employees`
--

INSERT INTO `employees` (`id`, `name`, `categories`) VALUES
(1, 'Сотрудник1', '1,2,5'),
(2, 'Сотрудник2', '1,2,5'),
(3, 'Сотрудник3', '3,4,11'),
(4, 'Сотрудник4', '2,4,9'),
(5, 'Сотрудник5', '3,4,8'),
(6, 'Сотрудник6', '7,10');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `employees`
--
ALTER TABLE `employees`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT для таблицы `employees`
--
ALTER TABLE `employees`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- База данных: `test`
--
CREATE DATABASE IF NOT EXISTS `test` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci;
USE `test`;

-- --------------------------------------------------------

--
-- Структура таблицы `text`
--

CREATE TABLE `text` (
  `id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `text`
--

INSERT INTO `text` (`id`) VALUES
(19),
(20),
(21),
(22),
(23),
(24),
(25),
(26),
(27),
(28),
(29);

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `text`
--
ALTER TABLE `text`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `text`
--
ALTER TABLE `text`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;
--
-- База данных: `test_bd`
--
CREATE DATABASE IF NOT EXISTS `test_bd` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci;
USE `test_bd`;

-- --------------------------------------------------------

--
-- Структура таблицы `authors`
--

CREATE TABLE `authors` (
  `id_avtora` int NOT NULL,
  `FIO` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `god_rozdeniya` int NOT NULL,
  `god_smerti` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `authors`
--

INSERT INTO `authors` (`id_avtora`, `FIO`, `god_rozdeniya`, `god_smerti`) VALUES
(1, 'George Raymond Richard Martin', 1919, NULL),
(2, 'Joanne Rowling', 1965, NULL),
(3, 'John Ronald Reuel Tolkien', 1888, 1962),
(4, 'Fiodor Dostoyevsky', 1781, 1870),
(5, 'Thomas Mayne Reid', 1810, 1851);

-- --------------------------------------------------------

--
-- Структура таблицы `books`
--

CREATE TABLE `books` (
  `id_knigi` int NOT NULL,
  `id_avtora` int NOT NULL,
  `id_izdatelstva` int NOT NULL,
  `god_izdaniya` int NOT NULL,
  `nazvaniye` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `books`
--

INSERT INTO `books` (`id_knigi`, `id_avtora`, `id_izdatelstva`, `god_izdaniya`, `nazvaniye`) VALUES
(1, 1, 1, 2020, 'Game of Thrones'),
(2, 2, 2, 2019, 'Harry Potter and the Sorcerer Stone'),
(3, 3, 3, 1937, 'The Hobbit, or There and Back Again'),
(4, 4, 4, 1848, 'White nights'),
(5, 5, 5, 2003, 'Job: Witch');

-- --------------------------------------------------------

--
-- Структура таблицы `buyers`
--

CREATE TABLE `buyers` (
  `id_pokupatelya` int NOT NULL,
  `FIO` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `adress` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `phone` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `buyers`
--

INSERT INTO `buyers` (`id_pokupatelya`, `FIO`, `adress`, `phone`) VALUES
(56, 'Пучков И.В.', 'Самара', '8 927 774 32 23'),
(64, 'Сумин', 'nickita.smn2014@yandex.ru', '89277743119'),
(65, 'hikita', 'russianchannel22@gmail.com', '89277743119'),
(73, 'nickita.smn2014@yandex.ru', 'nickita.smn2014@yandex.ru', 'nickita.smn2014@yandex.ru'),
(74, 'nickita.smn2014@yandex.ru', 'nickita.smn2014@yandex.ru', 'nickita.smn2014@yandex.ru'),
(75, 'nickita.smn2014@yandex.ru', 'nickita.smn2014@yandex.ru', 'nickita.smn2014@yandex.ru'),
(76, 'nickita.smn2014@yandex.ru', '121212', 'nickita.smn2014@yandex.ru'),
(77, 'nickita.smn2014@yandex.ru', '121212', 'nickita.smn2014@yandex.ru'),
(78, 'nickita.smn2014@yandex.ru', '121212', 'nickita.smn2014@yandex.ru'),
(79, 'nickita.smn2014yandex.ru', '121212', 'nickita.smn2014'),
(80, 'nickita.smn2014yandex.ru', 'ddede', '342423432424'),
(81, 'nickita.smn2014yandex.ru', 'ddede', '342423432424'),
(82, 'nickita.smn2014yandex.ru', 'ddede', '342423432424'),
(83, 'nickita.smn2014yandex.ru', 'ddede', '342423432424'),
(84, 'nickita.smn2014yandex.ru', 'ddede', '342423432424'),
(85, 'nickita.smn2014yandex.ru', 'ddede', '342423432424'),
(86, 'nic', 'smr', '123'),
(87, 'nic', 'smr', '123'),
(88, 'nic', 'smr', '123'),
(89, 'nic', 'smr', '123'),
(90, 'nic', 'smr', '123'),
(91, 'nic', 'smr23', '123'),
(92, 'nic', 'smr23', '123'),
(93, 'nic', 'smr23', '123'),
(94, 'nic', 'smr23', '123'),
(95, 'nic', 'smr23', '123'),
(96, 'nic', 'smr23', '123'),
(97, 'nic', 'smr23', '123'),
(98, 'nic', 'smr23', '123'),
(99, 'nic', 'smr23', '123'),
(100, 'nic', 'smr23', '123'),
(101, 'nic', 'smr23', '123'),
(102, 'nic', 'smr23', '123'),
(103, 'nic', 'smr23', '123'),
(104, 'nic', 'smr23', '123'),
(105, 'nic', 'smr23', '123');

-- --------------------------------------------------------

--
-- Структура таблицы `orders`
--

CREATE TABLE `orders` (
  `id_zakaza` int NOT NULL,
  `kolichestvo` decimal(10,0) NOT NULL,
  `data_zakaza` date NOT NULL,
  `id_pokupatelya` int NOT NULL,
  `id_book` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

--
-- Дамп данных таблицы `orders`
--

INSERT INTO `orders` (`id_zakaza`, `kolichestvo`, `data_zakaza`, `id_pokupatelya`, `id_book`) VALUES
(14, '3', '2021-11-18', 91, 3);

-- --------------------------------------------------------

--
-- Структура таблицы `publishing_houses`
--

CREATE TABLE `publishing_houses` (
  `id_izdatelstva` int NOT NULL,
  `name` char(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `publishing_houses`
--

INSERT INTO `publishing_houses` (`id_izdatelstva`, `name`) VALUES
(1, 'LitRes'),
(2, 'Prosvesheniye'),
(3, 'AST'),
(4, 'World of Hobby'),
(5, 'Altapress');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `authors`
--
ALTER TABLE `authors`
  ADD PRIMARY KEY (`id_avtora`);

--
-- Индексы таблицы `books`
--
ALTER TABLE `books`
  ADD PRIMARY KEY (`id_knigi`),
  ADD KEY `bo_ind` (`id_izdatelstva`),
  ADD KEY `boo_ind` (`id_avtora`);

--
-- Индексы таблицы `buyers`
--
ALTER TABLE `buyers`
  ADD PRIMARY KEY (`id_pokupatelya`);

--
-- Индексы таблицы `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id_zakaza`),
  ADD KEY `ord_ind` (`id_pokupatelya`),
  ADD KEY `order_index` (`id_book`);

--
-- Индексы таблицы `publishing_houses`
--
ALTER TABLE `publishing_houses`
  ADD PRIMARY KEY (`id_izdatelstva`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `buyers`
--
ALTER TABLE `buyers`
  MODIFY `id_pokupatelya` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=106;

--
-- AUTO_INCREMENT для таблицы `orders`
--
ALTER TABLE `orders`
  MODIFY `id_zakaza` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `books`
--
ALTER TABLE `books`
  ADD CONSTRAINT `books_ibfk_1` FOREIGN KEY (`id_izdatelstva`) REFERENCES `publishing_houses` (`id_izdatelstva`),
  ADD CONSTRAINT `books_ibfk_2` FOREIGN KEY (`id_avtora`) REFERENCES `authors` (`id_avtora`);

--
-- Ограничения внешнего ключа таблицы `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`id_book`) REFERENCES `books` (`id_knigi`),
  ADD CONSTRAINT `orders_ibfk_3` FOREIGN KEY (`id_pokupatelya`) REFERENCES `buyers` (`id_pokupatelya`) ON DELETE RESTRICT ON UPDATE RESTRICT;
--
-- База данных: `tes_bd`
--
CREATE DATABASE IF NOT EXISTS `tes_bd` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci;
USE `tes_bd`;

-- --------------------------------------------------------

--
-- Структура таблицы `дилеры`
--

CREATE TABLE `дилеры` (
  `ID_дилера` int NOT NULL,
  `Фамилия` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `Имя` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `Отчество` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `Фотография` int NOT NULL,
  `Домашний_адрес` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `Телефон` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `дилеры`
--

INSERT INTO `дилеры` (`ID_дилера`, `Фамилия`, `Имя`, `Отчество`, `Фотография`, `Домашний_адрес`, `Телефон`) VALUES
(1, 'Чазов', 'Яков', 'Герасимович', 1, 'Россия, г. Долгопрудный, Хуторская ул., д. 13 кв.13', '+7 (961) 332-70-69'),
(2, 'Штельмах', 'Надежда', 'Викторовна', 2, 'Россия, г. Железногорск, Южная ул., д. 20 кв.26', '+7 (987) 605-23-51'),
(3, 'Лямина', 'Екатерина', 'Алексеевна', 3, 'Россия, г. Екатеринбург, Совхозная ул., д. 22 кв.9', '+7 (999) 250-91-51'),
(4, 'Апалков', 'Леонид', 'Феодосивич', 4, 'Россия, г. Элиста, Пионерская ул., д. 12 кв.16', '+7 (975) 639-86-17'),
(5, 'Килик', 'Людмила', 'Игнатьевна', 5, 'Россия, г. Казань, Солнечный пер., д. 17 кв.168', '+7 (969) 167-30-43'),
(6, 'Ерхов', 'Виктор', 'Себастьянов', 6, 'Россия, г. Воронеж, Новый пер., д. 20 кв.23', '+7 (982) 420-75-41'),
(7, 'Чернова', 'Галина', 'Георгьевна', 7, 'Россия, г. Самара, Рабочая ул., д. 21 кв.84', '+7 (983) 280-18-22'),
(8, 'Ханцева', 'Галина', 'Васильевна', 8, 'Россия, г. Киров, Зеленый пер., д. 4 кв.187', '+7 (933) 639-26-26'),
(9, 'Огурцов', 'Роман', 'Арсеньевич', 9, 'Россия, г. Хабаровск, 3 Марта ул., д. 2 кв.202', '+7 (916) 631-64-49'),
(10, 'Кондуров', 'Никифор', 'Никаноров', 10, 'Россия, г. Златоуст, Садовая ул., д. 1 кв.59', '+7 (970) 819-18-76');

-- --------------------------------------------------------

--
-- Структура таблицы `договоры`
--

CREATE TABLE `договоры` (
  `ID_договора` int NOT NULL,
  `ID_клиента` int NOT NULL,
  `ID_дилера` int NOT NULL,
  `ID_машины` int NOT NULL,
  `Дата_продажи` date NOT NULL,
  `Цена_продажи` decimal(15,2) NOT NULL,
  `Примечания` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `договоры`
--

INSERT INTO `договоры` (`ID_договора`, `ID_клиента`, `ID_дилера`, `ID_машины`, `Дата_продажи`, `Цена_продажи`, `Примечания`) VALUES
(1, 1, 1, 1, '2020-11-03', '569000.00', 'Отлично'),
(2, 2, 2, 2, '2020-11-01', '560000.00', 'Хорошая сделка'),
(3, 3, 3, 3, '2020-06-10', '569000.00', 'Первая покупка'),
(4, 4, 4, 4, '2020-08-25', '569000.00', 'Плохая сделка'),
(5, 5, 5, 5, '2020-10-29', '569000.00', 'Довольно дорого'),
(6, 6, 6, 6, '2020-11-03', '670000.00', 'Неплохой автомобиль'),
(7, 7, 7, 7, '2020-09-18', '569000.00', 'Автомобиль отличный'),
(8, 8, 8, 8, '2020-06-30', '569000.00', 'Мощный автомобиль'),
(9, 9, 9, 9, '2020-07-28', '569000.00', 'Великолепный автомобиль'),
(10, 10, 10, 10, '2019-09-17', '569000.00', 'Хороший автомобиль'),
(11, 4, 6, 3, '2020-10-25', '569000.00', 'Хороший продавец'),
(12, 2, 10, 8, '2020-11-05', '569000.00', 'Дорогой автомобиль, но мощный'),
(13, 9, 5, 3, '2020-11-07', '569000.00', 'Отличный автомобиль'),
(14, 5, 6, 6, '2020-10-07', '569000.00', 'Неплохой автомобиль'),
(15, 3, 7, 10, '2020-11-01', '569000.00', 'Новое авто'),
(16, 9, 3, 1, '2020-06-11', '569000.00', 'Красивый автомобиль'),
(17, 6, 7, 10, '2020-03-18', '569000.00', 'Нормальный автомобиль за свои деньги'),
(18, 8, 6, 5, '2020-11-24', '569000.00', 'Иномарка просто шикарная'),
(19, 6, 10, 3, '2020-08-08', '569000.00', 'Заказчик доволен'),
(20, 3, 8, 5, '2020-07-15', '569000.00', 'Вмятина на бампере');

-- --------------------------------------------------------

--
-- Структура таблицы `клиенты`
--

CREATE TABLE `клиенты` (
  `ID_клиента` int NOT NULL,
  `Фамилия` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `Имя` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `Отчество` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `Город` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `Адрес` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `Контактный_телефон` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `клиенты`
--

INSERT INTO `клиенты` (`ID_клиента`, `Фамилия`, `Имя`, `Отчество`, `Город`, `Адрес`, `Контактный_телефон`) VALUES
(1, 'Мартюшов', 'Савва', 'Ростиславович', 'Батайск', 'Сосновая ул., д. 11 кв.163', '+7 (987) 107-28-53'),
(2, 'Чекин', 'Петр', 'Ефремович', 'Миасс', 'Дзержинского ул., д. 10 кв.12', '+7 (932) 834-63-87'),
(3, 'Сухомлина', 'София', 'Трофимовна', 'Нижний Новгород', '17 Сентября ул., д. 9 кв.31', '+7 (946) 796-16-29'),
(4, 'Трошкин', 'Евгений', 'Васильевич', 'Новочебоксарск', 'Садовая ул., д. 3 кв.5', '+7 (921) 956-55-16'),
(5, 'Мамкин', 'Игнат', 'Давидович', 'Астрахань', 'Мирная ул., д. 2 кв.101', '+7 (932) 737-76-23'),
(6, 'Яимов', 'Кузьма', 'Витальевич', 'Старый Оскол', 'Колхозная ул., д. 11 кв.208', '+7 (918) 376-62-83'),
(7, 'Климова', 'Альбина', 'Альбина', 'Волгодонск', 'Чапаева ул., д. 23 кв.49', '+7 (975) 535-53-96'),
(8, 'Баушев', 'Василий', 'Михаилович', 'Астрахань', 'Партизанская ул., д. 25 кв.97', '+7 (994) 145-25-75'),
(9, 'Ягодина', 'Настасья', 'Якововна', 'Ставрополь', 'Новый пер., д. 21 кв.208', '+7 (998) 980-75-97'),
(10, 'Карасевич', 'Тамара', 'Трофимовна', 'Сургут', 'Радужная ул., д. 20 кв.87', '+7 (916) 484-36-25');

-- --------------------------------------------------------

--
-- Структура таблицы `автопарк`
--

CREATE TABLE `автопарк` (
  `ID_машины` int NOT NULL,
  `Регистрационный_номер` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `Марка_автомобиля` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `Дата_выпуска` date NOT NULL,
  `Фото_автомобиля` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `автопарк`
--

INSERT INTO `автопарк` (`ID_машины`, `Регистрационный_номер`, `Марка_автомобиля`, `Дата_выпуска`, `Фото_автомобиля`) VALUES
(1, 'Н 575 ОУ', 'Lexus', '2010-11-05', 11),
(2, 'Т 205 ЕР', 'Mazda', '2012-03-04', 12),
(3, 'С 533 СМ', 'Volvo', '2014-11-05', 13),
(4, 'К 992 МН', 'Toyota', '2017-09-03', 14),
(5, 'У 549 КТ', 'Ravon', '2019-09-04', 15),
(6, 'Е 093 ВВ', 'Chery', '2019-11-23', 16),
(7, 'А 222 СА', 'Hummer', '2018-11-02', 17),
(8, 'В 883 МН', 'Volvo', '2013-08-05', 18),
(9, 'Х 945 ХУ', 'Tesla', '2011-11-19', 19),
(10, 'О 122 ТН', 'Peugeot', '2014-01-08', 20);

-- --------------------------------------------------------

--
-- Структура таблицы `фотографии`
--

CREATE TABLE `фотографии` (
  `ID_фотографии` int NOT NULL,
  `Название` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `Путь_к_файлу` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `фотографии`
--

INSERT INTO `фотографии` (`ID_фотографии`, `Название`, `Путь_к_файлу`) VALUES
(1, 'Работник №1', 'img/avatar/ava_1.png'),
(2, 'Работник №2', 'img/avatar/ava_2.png'),
(3, 'Работник №3', 'img/avatar/ava_3.png'),
(4, 'Работник №4', 'img/avatar/ava_4.png'),
(5, 'Работник №5', 'img/avatar/ava_5.png'),
(6, 'Работник №6', 'img/avatar/ava_6.png'),
(7, 'Работник №7', 'img/avatar/ava_7.png'),
(8, 'Работник №8', 'img/avatar/ava_8.png'),
(9, 'Работник №9', 'img/avatar/ava_9.png'),
(10, 'Работник №10', 'img/avatar/ava_10.png'),
(11, 'Машина №1', 'img/cars/avto_1.png'),
(12, 'Машина №2', 'img/cars/avto_2.png'),
(13, 'Машина №3', 'img/cars/avto_3.png'),
(14, 'Машина №4', 'img/cars/avto_4.png'),
(15, 'Машина №5', 'img/cars/avto_5.png'),
(16, 'Машина №6', 'img/cars/avto_6.png'),
(17, 'Машина №7', 'img/cars/avto_7.png'),
(18, 'Машина №8', 'img/cars/avto_8.png'),
(19, 'Машина №9', 'img/cars/avto_9.png'),
(20, 'Машина №10', 'img/cars/avto_10.png');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `дилеры`
--
ALTER TABLE `дилеры`
  ADD PRIMARY KEY (`ID_дилера`),
  ADD KEY `Фотография` (`Фотография`);

--
-- Индексы таблицы `договоры`
--
ALTER TABLE `договоры`
  ADD PRIMARY KEY (`ID_договора`),
  ADD KEY `ID машины` (`ID_машины`),
  ADD KEY `ID дилера` (`ID_дилера`),
  ADD KEY `ID клиента` (`ID_клиента`);

--
-- Индексы таблицы `клиенты`
--
ALTER TABLE `клиенты`
  ADD PRIMARY KEY (`ID_клиента`);

--
-- Индексы таблицы `автопарк`
--
ALTER TABLE `автопарк`
  ADD PRIMARY KEY (`ID_машины`),
  ADD KEY `Фото автомобиля` (`Фото_автомобиля`);

--
-- Индексы таблицы `фотографии`
--
ALTER TABLE `фотографии`
  ADD PRIMARY KEY (`ID_фотографии`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `дилеры`
--
ALTER TABLE `дилеры`
  MODIFY `ID_дилера` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT для таблицы `договоры`
--
ALTER TABLE `договоры`
  MODIFY `ID_договора` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT для таблицы `клиенты`
--
ALTER TABLE `клиенты`
  MODIFY `ID_клиента` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=66;

--
-- AUTO_INCREMENT для таблицы `автопарк`
--
ALTER TABLE `автопарк`
  MODIFY `ID_машины` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT для таблицы `фотографии`
--
ALTER TABLE `фотографии`
  MODIFY `ID_фотографии` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `дилеры`
--
ALTER TABLE `дилеры`
  ADD CONSTRAINT `дилеры_ibfk_1` FOREIGN KEY (`Фотография`) REFERENCES `фотографии` (`ID_фотографии`);

--
-- Ограничения внешнего ключа таблицы `договоры`
--
ALTER TABLE `договоры`
  ADD CONSTRAINT `договоры_ibfk_1` FOREIGN KEY (`ID_машины`) REFERENCES `автопарк` (`ID_машины`),
  ADD CONSTRAINT `договоры_ibfk_2` FOREIGN KEY (`ID_дилера`) REFERENCES `дилеры` (`ID_дилера`),
  ADD CONSTRAINT `договоры_ibfk_3` FOREIGN KEY (`ID_клиента`) REFERENCES `клиенты` (`ID_клиента`);

--
-- Ограничения внешнего ключа таблицы `автопарк`
--
ALTER TABLE `автопарк`
  ADD CONSTRAINT `автопарк_ibfk_1` FOREIGN KEY (`Фото_автомобиля`) REFERENCES `фотографии` (`ID_фотографии`);
--
-- База данных: `wokzal`
--
CREATE DATABASE IF NOT EXISTS `wokzal` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci;
USE `wokzal`;

-- --------------------------------------------------------

--
-- Структура таблицы `group_wagon`
--

CREATE TABLE `group_wagon` (
  `id_group_wagon` int NOT NULL,
  `train_id` int NOT NULL,
  `wagon_id` int NOT NULL,
  `count_wagon` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `group_wagon`
--

INSERT INTO `group_wagon` (`id_group_wagon`, `train_id`, `wagon_id`, `count_wagon`) VALUES
(1, 1, 1, 5),
(2, 1, 2, 3),
(3, 1, 3, 1),
(4, 2, 5, 4),
(5, 2, 4, 5),
(6, 2, 6, 3),
(7, 3, 7, 6),
(8, 3, 2, 10),
(9, 4, 8, 4),
(10, 4, 4, 8),
(11, 5, 3, 4),
(12, 5, 6, 10),
(19, 2, 4, 4);

-- --------------------------------------------------------

--
-- Структура таблицы `locomotive`
--

CREATE TABLE `locomotive` (
  `id_locomotive` int NOT NULL,
  `serial_numbe` int NOT NULL,
  `type_loc` varchar(15) NOT NULL,
  `number_section` int NOT NULL,
  `manufacrure` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `year_prod` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `locomotive`
--

INSERT INTO `locomotive` (`id_locomotive`, `serial_numbe`, `type_loc`, `number_section`, `manufacrure`, `year_prod`) VALUES
(1, 145680, 'тепловоз', 1, 'Новочеркасский ЭЗ', 1985),
(2, 145684, 'электровоз', 1, 'Брянский МЗ', 2005),
(3, 245684, 'электровоз', 1, 'Уральский ЗЖМ', 2015),
(4, 255684, 'тепловоз', 1, 'Новочеркасский ЭЗ', 2000),
(5, 245684, 'тепловоз', 1, 'Уральский ЗЖМ', 2008);

-- --------------------------------------------------------

--
-- Структура таблицы `station`
--

CREATE TABLE `station` (
  `id_station` int NOT NULL,
  `name_station` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `station`
--

INSERT INTO `station` (`id_station`, `name_station`) VALUES
(12, 'Самара - Калининград'),
(13, 'Самара - Москва'),
(14, 'Курск - Владивосток'),
(15, 'Самара - Санкт-Петербург'),
(16, 'Уфа - Адлер'),
(17, 'Кисловодск - Орск'),
(18, 'Оренбург - Санкт-Петербург'),
(19, 'Махачкала - Тюмень'),
(20, 'Адлер - Красноярск'),
(21, 'Самара - Орск'),
(22, 'Новосибирск - Белгород'),
(23, 'Орск -Кисловодск'),
(24, 'Анапа - Томск'),
(25, 'Анапа -Тында');

-- --------------------------------------------------------

--
-- Структура таблицы `train`
--

CREATE TABLE `train` (
  `id_train` int NOT NULL,
  `locomotive_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `train`
--

INSERT INTO `train` (`id_train`, `locomotive_id`) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5);

-- --------------------------------------------------------

--
-- Структура таблицы `travel`
--

CREATE TABLE `travel` (
  `id_travel` int NOT NULL,
  `station_id` int NOT NULL,
  `train_id` int NOT NULL,
  `time_arrival` text NOT NULL,
  `time_departure` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `data_arrival` date NOT NULL,
  `data_departure` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `travel`
--

INSERT INTO `travel` (`id_travel`, `station_id`, `train_id`, `time_arrival`, `time_departure`, `data_arrival`, `data_departure`) VALUES
(10, 12, 3, '12 34', '14 34', '2021-11-17', '2021-11-17'),
(14, 15, 5, '12:33', '12:45', '2021-11-19', '2021-11-20'),
(15, 12, 1, '12:45', '12:34', '2021-11-21', '2021-11-20'),
(16, 14, 3, '09:25', '00:23', '2021-11-25', '2021-11-24'),
(17, 16, 1, '10:25', '00:56', '2021-11-26', '2021-11-25'),
(18, 19, 3, '12 34', '23 55', '2021-11-26', '2021-11-24'),
(19, 25, 3, '10:25', '00:56', '2021-11-27', '2021-11-24'),
(20, 17, 3, '09:45', '15:35', '2021-11-27', '2021-11-26'),
(21, 18, 1, '12:50', '00:35', '2021-11-29', '2021-11-28'),
(22, 19, 5, '08:45', '18:58', '2021-11-30', '2021-11-29'),
(23, 20, 3, '12:45', '00:23', '2021-12-01', '2021-11-30'),
(24, 21, 5, '12:50', '15:56', '2021-12-02', '2021-12-01'),
(25, 22, 3, '09:45', '00:23', '2021-11-27', '2021-11-26'),
(26, 23, 2, '12:45', '15:35', '2021-11-24', '2021-11-23'),
(28, 17, 5, '12:50', '00:23', '2022-04-02', '2022-04-02');

-- --------------------------------------------------------

--
-- Структура таблицы `wagon`
--

CREATE TABLE `wagon` (
  `id_wagon` int NOT NULL,
  `serial_numbe` int NOT NULL,
  `type_wag` varchar(15) NOT NULL,
  `number_seats` int NOT NULL,
  `manufacrure` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `year_prod` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `wagon`
--

INSERT INTO `wagon` (`id_wagon`, `serial_numbe`, `type_wag`, `number_seats`, `manufacrure`, `year_prod`) VALUES
(1, 241345, 'плацкарт', 54, 'НЕВЗ', 2020),
(2, 241600, 'купе', 26, 'НЕВЗ', 2020),
(3, 241678, 'люкс', 12, 'НЕВЗ', 2005),
(4, 241432, 'купе', 26, 'Воткинский', 1992),
(5, 241156, 'плацкарт', 54, 'Воткинский', 2010),
(6, 241980, 'купе', 26, 'Воткинский', 2010),
(7, 241793, 'плацкарт', 54, 'Воткинский', 2001),
(8, 241222, 'плацкарт', 54, 'Воткинский', 2005);

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `group_wagon`
--
ALTER TABLE `group_wagon`
  ADD PRIMARY KEY (`id_group_wagon`),
  ADD KEY `fk_train_id` (`train_id`),
  ADD KEY `fk_wagon_id` (`wagon_id`);

--
-- Индексы таблицы `locomotive`
--
ALTER TABLE `locomotive`
  ADD PRIMARY KEY (`id_locomotive`);

--
-- Индексы таблицы `station`
--
ALTER TABLE `station`
  ADD PRIMARY KEY (`id_station`);

--
-- Индексы таблицы `train`
--
ALTER TABLE `train`
  ADD PRIMARY KEY (`id_train`),
  ADD KEY `fk_locomotive_id` (`locomotive_id`);

--
-- Индексы таблицы `travel`
--
ALTER TABLE `travel`
  ADD PRIMARY KEY (`id_travel`),
  ADD KEY `id_start_st` (`station_id`),
  ADD KEY `id_train` (`train_id`);

--
-- Индексы таблицы `wagon`
--
ALTER TABLE `wagon`
  ADD PRIMARY KEY (`id_wagon`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `group_wagon`
--
ALTER TABLE `group_wagon`
  MODIFY `id_group_wagon` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT для таблицы `locomotive`
--
ALTER TABLE `locomotive`
  MODIFY `id_locomotive` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT для таблицы `station`
--
ALTER TABLE `station`
  MODIFY `id_station` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT для таблицы `train`
--
ALTER TABLE `train`
  MODIFY `id_train` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT для таблицы `travel`
--
ALTER TABLE `travel`
  MODIFY `id_travel` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT для таблицы `wagon`
--
ALTER TABLE `wagon`
  MODIFY `id_wagon` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `group_wagon`
--
ALTER TABLE `group_wagon`
  ADD CONSTRAINT `group_wagon_ibfk_1` FOREIGN KEY (`train_id`) REFERENCES `train` (`id_train`),
  ADD CONSTRAINT `group_wagon_ibfk_2` FOREIGN KEY (`wagon_id`) REFERENCES `wagon` (`id_wagon`);

--
-- Ограничения внешнего ключа таблицы `train`
--
ALTER TABLE `train`
  ADD CONSTRAINT `train_ibfk_1` FOREIGN KEY (`locomotive_id`) REFERENCES `locomotive` (`id_locomotive`);

--
-- Ограничения внешнего ключа таблицы `travel`
--
ALTER TABLE `travel`
  ADD CONSTRAINT `travel_ibfk_1` FOREIGN KEY (`station_id`) REFERENCES `station` (`id_station`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `travel_ibfk_3` FOREIGN KEY (`train_id`) REFERENCES `train` (`id_train`) ON DELETE RESTRICT ON UPDATE RESTRICT;
--
-- База данных: `yandex`
--
CREATE DATABASE IF NOT EXISTS `yandex` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci;
USE `yandex`;

-- --------------------------------------------------------

--
-- Структура таблицы `cities`
--

CREATE TABLE `cities` (
  `id` int NOT NULL,
  `name` text NOT NULL,
  `population` int NOT NULL,
  `founded` int NOT NULL,
  `country_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `cities`
--

INSERT INTO `cities` (`id`, `name`, `population`, `founded`, `country_id`) VALUES
(1, 'Пекин', 21893095, 473, 1),
(2, 'Вашингтон', 705749, 1790, 2);

-- --------------------------------------------------------

--
-- Структура таблицы `companies`
--

CREATE TABLE `companies` (
  `id` int NOT NULL,
  `name` text NOT NULL,
  `city_id` int NOT NULL,
  `revenue` int NOT NULL,
  `labors` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `companies`
--

INSERT INTO `companies` (`id`, `name`, `city_id`, `revenue`, `labors`) VALUES
(1, 'Перк', 1, 900000000, 1005),
(2, 'Трус', 1, 500000000, 1045),
(3, 'Кер', 1, 500000, 890),
(4, 'Керпин', 2, 900000000, 1050),
(5, 'Херпид', 2, 300000000, 1500),
(6, 'Тирп', 2, 500000, 450);

-- --------------------------------------------------------

--
-- Структура таблицы `countries`
--

CREATE TABLE `countries` (
  `id` int NOT NULL,
  `name` text NOT NULL,
  `population` int NOT NULL,
  `gdp` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `countries`
--

INSERT INTO `countries` (`id`, `name`, `population`, `gdp`) VALUES
(1, 'Китай', 1449670556, 24191),
(2, 'США', 333449281, 20894);

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `cities`
--
ALTER TABLE `cities`
  ADD PRIMARY KEY (`id`),
  ADD KEY `country_id` (`country_id`);

--
-- Индексы таблицы `companies`
--
ALTER TABLE `companies`
  ADD PRIMARY KEY (`id`),
  ADD KEY `city_id` (`city_id`);

--
-- Индексы таблицы `countries`
--
ALTER TABLE `countries`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `cities`
--
ALTER TABLE `cities`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `companies`
--
ALTER TABLE `companies`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT для таблицы `countries`
--
ALTER TABLE `countries`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `cities`
--
ALTER TABLE `cities`
  ADD CONSTRAINT `cities_ibfk_1` FOREIGN KEY (`country_id`) REFERENCES `countries` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Ограничения внешнего ключа таблицы `companies`
--
ALTER TABLE `companies`
  ADD CONSTRAINT `companies_ibfk_1` FOREIGN KEY (`city_id`) REFERENCES `cities` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
