-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Сен 30 2020 г., 21:15
-- Версия сервера: 10.3.22-MariaDB
-- Версия PHP: 7.1.33

--
-- База данных 
--  "Сотовый телефоны"
--
SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `сотовый телефоны`
--

-- --------------------------------------------------------

--
-- Структура таблицы `сотовые телефоны`
--

CREATE TABLE `сотовые телефоны` (
  `id` int(100) NOT NULL,
  `Модель` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `Цвет` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `Количество SIM карт` int(1) NOT NULL COMMENT 'шт.',
  `Диагональ экрана` float NOT NULL COMMENT 'дюймов',
  `Разрешение экрана` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `Тип аккумулятора` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `Ёмкость аккумулятора` int(4) NOT NULL COMMENT 'мАч',
  `Ширина` int(5) NOT NULL COMMENT 'мм',
  `Высота` int(5) NOT NULL COMMENT 'мм',
  `Толщина` int(5) NOT NULL COMMENT 'мм',
  `Вес` int(7) NOT NULL COMMENT 'гр',
  `Страна-изготовитель` text COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `сотовые телефоны`
--

INSERT INTO `сотовые телефоны` (`id`, `Модель`, `Цвет`, `Количество SIM карт`, `Диагональ экрана`, `Разрешение экрана`, `Тип аккумулятора`, `Ёмкость аккумулятора`, `Ширина`, `Высота`, `Толщина`, `Вес`, `Страна-изготовитель`) VALUES
(1, 'iPhone 11', 'Чёрный', 1, 6.1, '1792×828', 'Li-Ion', 3110, 76, 151, 8, 194, 'Китай'),
(3, 'OPPO A91', 'синий', 2, 6.4, '2400x1080', 'Li-polymer', 4025, 73, 160, 8, 172, 'Китай'),
(4, 'Honor 30S', 'серебристый', 2, 6.5, '2400x1080', 'Li-polymer', 4000, 75, 162, 9, 189, 'Китай'),
(5, 'Honor 20 Pro', 'розовый', 2, 6.26, '2340x1080', 'Li-polymer', 4000, 74, 155, 8, 182, 'Китай'),
(6, 'Samsung Galaxy M51', 'белый', 2, 6.67, '2400x1080', 'Li-polymer', 7000, 76, 164, 10, 213, 'Китай'),
(7, 'Samsung Galaxy A71', 'голубой', 2, 6.7, '2400x1080', 'Li-polymer', 4500, 76, 164, 8, 179, 'Китай'),
(8, 'Xiaomi Mi Note 10 Lite', 'белый', 2, 6.47, '2340x1080', 'Li-polymer', 5260, 74, 158, 10, 204, 'Китай'),
(9, 'iPhone 8', 'серебристый', 1, 4.7, '1334x750', 'Li-Ion', 1821, 67, 138, 7, 148, 'Китай'),
(10, 'iPhone SE 2020', 'белый', 1, 4.7, '1334x750', 'Li-Ion', 1821, 67, 138, 7, 148, 'Китай'),
(11, 'Huawei P20', 'чёрный', 2, 5.8, '2240x1080', 'Li-polymer', 3400, 71, 149, 8, 165, 'Китай'),
(12, 'Huawei P40', 'голубой', 2, 6.1, '2340x1080', 'Li-polymer', 3800, 71, 149, 9, 175, 'Китай'),
(13, 'realme X3 SuperZoom', 'белый', 2, 6.57, '2400x1080', 'Li-polymer', 4200, 76, 164, 9, 202, 'Китай'),
(14, 'Samsung Galaxy Note 10 Lite', 'белый', 2, 6.7, '2400x1080', 'Li-polymer', 4500, 76, 164, 9, 199, 'Китай'),
(15, 'Blackview BV9900 Pro', 'чёрный', 2, 5.84, '2280x1080', 'Li-polymer', 4380, 78, 157, 14, 195, 'Китай');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `сотовые телефоны`
--
ALTER TABLE `сотовые телефоны`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `сотовые телефоны`
--
ALTER TABLE `сотовые телефоны`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
