-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Янв 09 2021 г., 20:25
-- Версия сервера: 10.3.22-MariaDB
-- Версия PHP: 7.1.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `врач_поликлиника`
--

-- --------------------------------------------------------

--
-- Структура таблицы `диагноз`
--

CREATE TABLE `диагноз` (
  `ID_диагноза` int(8) NOT NULL,
  `Код_диагноза` varchar(5) NOT NULL,
  `Диагноз` text NOT NULL,
  `ID_симптома_01` int(8) DEFAULT NULL,
  `ID_симптома_02` int(8) DEFAULT NULL,
  `ID_симптома_03` int(8) DEFAULT NULL,
  `ID_симптома_04` int(8) DEFAULT NULL,
  `ID_симптома_05` int(8) DEFAULT NULL,
  `ID_симптома_06` int(8) DEFAULT NULL,
  `ID_симптома_07` int(8) DEFAULT NULL,
  `ID_симптома_08` int(8) DEFAULT NULL,
  `ID_симптома_09` int(8) DEFAULT NULL,
  `ID_симптома_10` int(8) DEFAULT NULL,
  `ID_симптома_11` int(8) DEFAULT NULL,
  `ID_симптома_12` int(8) DEFAULT NULL,
  `ID_симптома_13` int(8) DEFAULT NULL,
  `ID_симптома_14` int(8) DEFAULT NULL,
  `ID_симптома_15` int(8) DEFAULT NULL,
  `ID_симптома_16` int(8) DEFAULT NULL,
  `ID_симптома_17` int(8) DEFAULT NULL,
  `ID_симптома_18` int(8) DEFAULT NULL,
  `ID_симптома_19` int(8) DEFAULT NULL,
  `ID_симптома_20` int(8) DEFAULT NULL,
  `ID_симптома_21` int(8) DEFAULT NULL,
  `ID_симптома_22` int(8) DEFAULT NULL,
  `ID_симптома_23` int(8) DEFAULT NULL,
  `ID_симптома_24` int(8) DEFAULT NULL,
  `ID_симптома_25` int(8) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `доступ_больничной_аптеке`
--

CREATE TABLE `доступ_больничной_аптеке` (
  `Статус` varchar(12) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `доступ_больничной_аптеке`
--

INSERT INTO `доступ_больничной_аптеке` (`Статус`) VALUES
('Отсутствует'),
('Присутствует');

-- --------------------------------------------------------

--
-- Структура таблицы `квалификация`
--

CREATE TABLE `квалификация` (
  `Квалификация` varchar(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `квалификация`
--

INSERT INTO `квалификация` (`Квалификация`) VALUES
('Вторая'),
('Первая'),
('Третья');

-- --------------------------------------------------------

--
-- Структура таблицы `пациент`
--

CREATE TABLE `пациент` (
  `ID_пациента` int(8) NOT NULL,
  `Фамилия` text NOT NULL,
  `Имя` text NOT NULL,
  `Отчество` text NOT NULL,
  `ОМС_серия` int(4) DEFAULT NULL,
  `ОМС_номер_нов` int(16) NOT NULL,
  `Дата_рождения` date NOT NULL,
  `Место_работы` text NOT NULL,
  `Дата_изменения` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `приём`
--

CREATE TABLE `приём` (
  `ID_приёма` int(8) NOT NULL,
  `ID_пациента` int(8) NOT NULL,
  `ID_врача` int(8) NOT NULL,
  `ID_диагноза` int(8) NOT NULL,
  `ID_статуса` int(8) NOT NULL,
  `Дата_приёма` date NOT NULL,
  `Врема_приёма` time NOT NULL,
  `Примечания` text DEFAULT NULL,
  `Дата_изменения` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `противопаказ_заболевания`
--

CREATE TABLE `противопаказ_заболевания` (
  `ID_противопоказан_заболевания` int(8) NOT NULL,
  `Код_диагноза` varchar(5) NOT NULL,
  `ID_акт_вещ` int(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `противопаказ_лекарств`
--

CREATE TABLE `противопаказ_лекарств` (
  `ID_противопоказания_лекарств` int(8) NOT NULL,
  `ID_акт_вещ_01` int(8) NOT NULL,
  `ID_акт_вещ_02` int(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `противопаказ_хз`
--

CREATE TABLE `противопаказ_хз` (
  `ID_прот_ХЗ` int(8) NOT NULL,
  `ID_ХЗ` int(8) NOT NULL,
  `ID_лекарства_витамин_01` int(8) NOT NULL,
  `ID_лекарства_витамин_02` int(8) NOT NULL,
  `ID_лекарства_витамин_03` int(8) NOT NULL,
  `ID_лекарства_витамин_04` int(8) NOT NULL,
  `ID_лекарства_витамин_05` int(8) NOT NULL,
  `ID_лекарства_витамин_06` int(8) NOT NULL,
  `ID_лекарства_витамин_07` int(8) NOT NULL,
  `ID_лекарства_витамин_08` int(8) NOT NULL,
  `ID_лекарства_витамин_09` int(8) NOT NULL,
  `ID_лекарства_витамин_10` int(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `актив_вещ`
--

CREATE TABLE `актив_вещ` (
  `ID_акт_вещ` int(8) NOT NULL,
  `Активное_вещество` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `врач`
--

CREATE TABLE `врач` (
  `ID_врача` int(8) NOT NULL,
  `Фамилия` text NOT NULL,
  `Имя` text NOT NULL,
  `Отчество` text NOT NULL,
  `Квалификация` varchar(6) DEFAULT NULL,
  `Дата_изменения` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `лекарства`
--

CREATE TABLE `лекарства` (
  `ID_лекарства_витамин` int(8) NOT NULL,
  `Торговое_название` text NOT NULL,
  `ID_акт_вещ` int(8) NOT NULL,
  `Дозировка` varchar(4) NOT NULL,
  `Форма_выпуска` text NOT NULL,
  `Доступ_больничной _аптеке` varchar(12) NOT NULL,
  `Цена` varchar(8) NOT NULL,
  `Код_диагноза_01` varchar(5) DEFAULT NULL,
  `Код_диагноза_02` varchar(5) DEFAULT NULL,
  `Код_диагноза_03` varchar(5) DEFAULT NULL,
  `Код_диагноза_04` varchar(5) DEFAULT NULL,
  `Код_диагноза_05` varchar(5) DEFAULT NULL,
  `Код_диагноза_06` varchar(5) DEFAULT NULL,
  `Код_диагноза_07` varchar(5) DEFAULT NULL,
  `Код_диагноза_08` varchar(5) DEFAULT NULL,
  `Код_диагноза_09` varchar(5) DEFAULT NULL,
  `Код_диагноза_10` varchar(5) DEFAULT NULL,
  `Код_диагноза_11` varchar(5) DEFAULT NULL,
  `Код_диагноза_12` varchar(5) DEFAULT NULL,
  `Код_диагноза_13` varchar(5) DEFAULT NULL,
  `Код_диагноза_14` varchar(5) DEFAULT NULL,
  `Код_диагноза_15` varchar(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `рекоменд_витамины`
--

CREATE TABLE `рекоменд_витамины` (
  `ID_рек_вит` int(8) NOT NULL,
  `ID_лекарства_витамин` int(8) NOT NULL,
  `ID_лекарства_витамин_рек` int(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `рецепт`
--

CREATE TABLE `рецепт` (
  `ID_рецепта` int(8) NOT NULL,
  `ID_пациента` int(8) NOT NULL,
  `ID_лекарства` int(8) NOT NULL,
  `Дата_назначения` date NOT NULL,
  `Длительность_приёма_дни` varchar(4) NOT NULL,
  `Дата_изменения` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `симптом`
--

CREATE TABLE `симптом` (
  `ID_симптома` int(8) NOT NULL,
  `Код_симптома` varchar(5) NOT NULL,
  `Симптом` text NOT NULL,
  `Тип` varchar(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `статус`
--

CREATE TABLE `статус` (
  `ID_статуса` int(8) NOT NULL,
  `Статус_приёма` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `типы`
--

CREATE TABLE `типы` (
  `Тип` varchar(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `типы`
--

INSERT INTO `типы` (`Тип`) VALUES
('Анализ'),
('Опрос'),
('Осмотр');

-- --------------------------------------------------------

--
-- Структура таблицы `хрон_забол_пац`
--

CREATE TABLE `хрон_забол_пац` (
  `ID_ХЗБ` int(8) NOT NULL,
  `ID_пациента` int(8) NOT NULL,
  `ID_ХЗ` int(8) NOT NULL,
  `Дата_изменения` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `хрон_заболевание`
--

CREATE TABLE `хрон_заболевание` (
  `ID_ХЗ` int(8) NOT NULL,
  `Код_ХЗ` varchar(5) NOT NULL,
  `Хрон_заболевание` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `диагноз`
--
ALTER TABLE `диагноз`
  ADD PRIMARY KEY (`ID_диагноза`),
  ADD KEY `ID_симптома_01` (`ID_симптома_01`),
  ADD KEY `диагноз_ibfk_10` (`ID_симптома_02`),
  ADD KEY `диагноз_ibfk_11` (`ID_симптома_03`),
  ADD KEY `диагноз_ibfk_12` (`ID_симптома_04`),
  ADD KEY `диагноз_ibfk_2` (`ID_симптома_05`),
  ADD KEY `диагноз_ibfk_3` (`ID_симптома_06`),
  ADD KEY `диагноз_ibfk_4` (`ID_симптома_07`),
  ADD KEY `диагноз_ibfk_5` (`ID_симптома_08`),
  ADD KEY `диагноз_ibfk_6` (`ID_симптома_09`),
  ADD KEY `диагноз_ibfk_7` (`ID_симптома_10`),
  ADD KEY `диагноз_ibfk_8` (`ID_симптома_11`),
  ADD KEY `диагноз_ibfk_9` (`ID_симптома_12`),
  ADD KEY `ID_симптома_13` (`ID_симптома_13`),
  ADD KEY `ID_симптома_14` (`ID_симптома_14`),
  ADD KEY `ID_симптома_15` (`ID_симптома_15`),
  ADD KEY `ID_симптома_16` (`ID_симптома_16`),
  ADD KEY `ID_симптома_17` (`ID_симптома_17`),
  ADD KEY `ID_симптома_18` (`ID_симптома_18`),
  ADD KEY `ID_симптома_19` (`ID_симптома_19`),
  ADD KEY `ID_симптома_20` (`ID_симптома_20`),
  ADD KEY `ID_симптома_21` (`ID_симптома_21`),
  ADD KEY `ID_симптома_22` (`ID_симптома_22`),
  ADD KEY `ID_симптома_23` (`ID_симптома_23`),
  ADD KEY `ID_симптома_24` (`ID_симптома_24`),
  ADD KEY `ID_симптома_25` (`ID_симптома_25`);

--
-- Индексы таблицы `доступ_больничной_аптеке`
--
ALTER TABLE `доступ_больничной_аптеке`
  ADD KEY `Статус` (`Статус`);

--
-- Индексы таблицы `квалификация`
--
ALTER TABLE `квалификация`
  ADD KEY `Квалификация` (`Квалификация`);

--
-- Индексы таблицы `пациент`
--
ALTER TABLE `пациент`
  ADD PRIMARY KEY (`ID_пациента`);

--
-- Индексы таблицы `приём`
--
ALTER TABLE `приём`
  ADD PRIMARY KEY (`ID_приёма`),
  ADD KEY `ID_пациента` (`ID_пациента`),
  ADD KEY `ID_врача` (`ID_врача`),
  ADD KEY `ID_статуса` (`ID_статуса`),
  ADD KEY `ID_диагноза` (`ID_диагноза`);

--
-- Индексы таблицы `противопаказ_заболевания`
--
ALTER TABLE `противопаказ_заболевания`
  ADD PRIMARY KEY (`ID_противопоказан_заболевания`),
  ADD KEY `ID_акт_вещ` (`ID_акт_вещ`);

--
-- Индексы таблицы `противопаказ_лекарств`
--
ALTER TABLE `противопаказ_лекарств`
  ADD PRIMARY KEY (`ID_противопоказания_лекарств`),
  ADD KEY `ID_акт_вещ_01` (`ID_акт_вещ_01`),
  ADD KEY `ID_акт_вещ_02` (`ID_акт_вещ_02`);

--
-- Индексы таблицы `противопаказ_хз`
--
ALTER TABLE `противопаказ_хз`
  ADD PRIMARY KEY (`ID_прот_ХЗ`),
  ADD KEY `ID_ХЗ` (`ID_ХЗ`),
  ADD KEY `ID_лекарства_витамин_01` (`ID_лекарства_витамин_01`),
  ADD KEY `ID_лекарства_витамин_02` (`ID_лекарства_витамин_02`),
  ADD KEY `ID_лекарства_витамин_03` (`ID_лекарства_витамин_03`),
  ADD KEY `ID_лекарства_витамин_04` (`ID_лекарства_витамин_04`),
  ADD KEY `ID_лекарства_витамин_05` (`ID_лекарства_витамин_05`),
  ADD KEY `ID_лекарства_витамин_06` (`ID_лекарства_витамин_06`),
  ADD KEY `ID_лекарства_витамин_07` (`ID_лекарства_витамин_07`),
  ADD KEY `ID_лекарства_витамин_08` (`ID_лекарства_витамин_08`),
  ADD KEY `ID_лекарства_витамин_09` (`ID_лекарства_витамин_09`),
  ADD KEY `ID_лекарства_витамин_10` (`ID_лекарства_витамин_10`);

--
-- Индексы таблицы `актив_вещ`
--
ALTER TABLE `актив_вещ`
  ADD PRIMARY KEY (`ID_акт_вещ`);

--
-- Индексы таблицы `врач`
--
ALTER TABLE `врач`
  ADD PRIMARY KEY (`ID_врача`),
  ADD KEY `Квалификация` (`Квалификация`);

--
-- Индексы таблицы `лекарства`
--
ALTER TABLE `лекарства`
  ADD PRIMARY KEY (`ID_лекарства_витамин`),
  ADD KEY `Доступ_больничной _аптеке` (`Доступ_больничной _аптеке`),
  ADD KEY `ID_акт_вещ` (`ID_акт_вещ`);

--
-- Индексы таблицы `рекоменд_витамины`
--
ALTER TABLE `рекоменд_витамины`
  ADD PRIMARY KEY (`ID_рек_вит`),
  ADD KEY `ID_лекарства_витамин` (`ID_лекарства_витамин`),
  ADD KEY `ID_лекарства_витамин_рек` (`ID_лекарства_витамин_рек`);

--
-- Индексы таблицы `рецепт`
--
ALTER TABLE `рецепт`
  ADD PRIMARY KEY (`ID_рецепта`),
  ADD KEY `ID_пациента` (`ID_пациента`),
  ADD KEY `ID_лекарства` (`ID_лекарства`);

--
-- Индексы таблицы `симптом`
--
ALTER TABLE `симптом`
  ADD PRIMARY KEY (`ID_симптома`),
  ADD KEY `Тип` (`Тип`);

--
-- Индексы таблицы `статус`
--
ALTER TABLE `статус`
  ADD PRIMARY KEY (`ID_статуса`);

--
-- Индексы таблицы `типы`
--
ALTER TABLE `типы`
  ADD KEY `Тип` (`Тип`);

--
-- Индексы таблицы `хрон_забол_пац`
--
ALTER TABLE `хрон_забол_пац`
  ADD PRIMARY KEY (`ID_ХЗБ`),
  ADD KEY `ID_пациента` (`ID_пациента`),
  ADD KEY `ID_ХЗ` (`ID_ХЗ`);

--
-- Индексы таблицы `хрон_заболевание`
--
ALTER TABLE `хрон_заболевание`
  ADD PRIMARY KEY (`ID_ХЗ`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `диагноз`
--
ALTER TABLE `диагноз`
  MODIFY `ID_диагноза` int(8) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `пациент`
--
ALTER TABLE `пациент`
  MODIFY `ID_пациента` int(8) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `приём`
--
ALTER TABLE `приём`
  MODIFY `ID_приёма` int(8) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `противопаказ_заболевания`
--
ALTER TABLE `противопаказ_заболевания`
  MODIFY `ID_противопоказан_заболевания` int(8) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `противопаказ_лекарств`
--
ALTER TABLE `противопаказ_лекарств`
  MODIFY `ID_противопоказания_лекарств` int(8) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `противопаказ_хз`
--
ALTER TABLE `противопаказ_хз`
  MODIFY `ID_прот_ХЗ` int(8) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `актив_вещ`
--
ALTER TABLE `актив_вещ`
  MODIFY `ID_акт_вещ` int(8) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `врач`
--
ALTER TABLE `врач`
  MODIFY `ID_врача` int(8) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `лекарства`
--
ALTER TABLE `лекарства`
  MODIFY `ID_лекарства_витамин` int(8) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `рекоменд_витамины`
--
ALTER TABLE `рекоменд_витамины`
  MODIFY `ID_рек_вит` int(8) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `рецепт`
--
ALTER TABLE `рецепт`
  MODIFY `ID_рецепта` int(8) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `симптом`
--
ALTER TABLE `симптом`
  MODIFY `ID_симптома` int(8) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `статус`
--
ALTER TABLE `статус`
  MODIFY `ID_статуса` int(8) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `хрон_забол_пац`
--
ALTER TABLE `хрон_забол_пац`
  MODIFY `ID_ХЗБ` int(8) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `хрон_заболевание`
--
ALTER TABLE `хрон_заболевание`
  MODIFY `ID_ХЗ` int(8) NOT NULL AUTO_INCREMENT;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `диагноз`
--
ALTER TABLE `диагноз`
  ADD CONSTRAINT `диагноз_ibfk_1` FOREIGN KEY (`ID_симптома_01`) REFERENCES `симптом` (`ID_симптома`),
  ADD CONSTRAINT `диагноз_ibfk_10` FOREIGN KEY (`ID_симптома_02`) REFERENCES `симптом` (`ID_симптома`),
  ADD CONSTRAINT `диагноз_ibfk_11` FOREIGN KEY (`ID_симптома_03`) REFERENCES `симптом` (`ID_симптома`),
  ADD CONSTRAINT `диагноз_ibfk_12` FOREIGN KEY (`ID_симптома_04`) REFERENCES `симптом` (`ID_симптома`),
  ADD CONSTRAINT `диагноз_ibfk_13` FOREIGN KEY (`ID_симптома_13`) REFERENCES `симптом` (`ID_симптома`),
  ADD CONSTRAINT `диагноз_ibfk_14` FOREIGN KEY (`ID_симптома_14`) REFERENCES `симптом` (`ID_симптома`),
  ADD CONSTRAINT `диагноз_ibfk_15` FOREIGN KEY (`ID_симптома_15`) REFERENCES `симптом` (`ID_симптома`),
  ADD CONSTRAINT `диагноз_ibfk_16` FOREIGN KEY (`ID_симптома_16`) REFERENCES `симптом` (`ID_симптома`),
  ADD CONSTRAINT `диагноз_ibfk_17` FOREIGN KEY (`ID_симптома_17`) REFERENCES `симптом` (`ID_симптома`),
  ADD CONSTRAINT `диагноз_ibfk_18` FOREIGN KEY (`ID_симптома_18`) REFERENCES `симптом` (`ID_симптома`),
  ADD CONSTRAINT `диагноз_ibfk_19` FOREIGN KEY (`ID_симптома_19`) REFERENCES `симптом` (`ID_симптома`),
  ADD CONSTRAINT `диагноз_ibfk_2` FOREIGN KEY (`ID_симптома_05`) REFERENCES `симптом` (`ID_симптома`),
  ADD CONSTRAINT `диагноз_ibfk_20` FOREIGN KEY (`ID_симптома_20`) REFERENCES `симптом` (`ID_симптома`),
  ADD CONSTRAINT `диагноз_ibfk_21` FOREIGN KEY (`ID_симптома_21`) REFERENCES `симптом` (`ID_симптома`),
  ADD CONSTRAINT `диагноз_ibfk_22` FOREIGN KEY (`ID_симптома_22`) REFERENCES `симптом` (`ID_симптома`),
  ADD CONSTRAINT `диагноз_ibfk_23` FOREIGN KEY (`ID_симптома_23`) REFERENCES `симптом` (`ID_симптома`),
  ADD CONSTRAINT `диагноз_ibfk_24` FOREIGN KEY (`ID_симптома_24`) REFERENCES `симптом` (`ID_симптома`),
  ADD CONSTRAINT `диагноз_ibfk_25` FOREIGN KEY (`ID_симптома_25`) REFERENCES `симптом` (`ID_симптома`),
  ADD CONSTRAINT `диагноз_ibfk_3` FOREIGN KEY (`ID_симптома_06`) REFERENCES `симптом` (`ID_симптома`),
  ADD CONSTRAINT `диагноз_ibfk_4` FOREIGN KEY (`ID_симптома_07`) REFERENCES `симптом` (`ID_симптома`),
  ADD CONSTRAINT `диагноз_ibfk_5` FOREIGN KEY (`ID_симптома_08`) REFERENCES `симптом` (`ID_симптома`),
  ADD CONSTRAINT `диагноз_ibfk_6` FOREIGN KEY (`ID_симптома_09`) REFERENCES `симптом` (`ID_симптома`),
  ADD CONSTRAINT `диагноз_ibfk_7` FOREIGN KEY (`ID_симптома_10`) REFERENCES `симптом` (`ID_симптома`),
  ADD CONSTRAINT `диагноз_ibfk_8` FOREIGN KEY (`ID_симптома_11`) REFERENCES `симптом` (`ID_симптома`),
  ADD CONSTRAINT `диагноз_ibfk_9` FOREIGN KEY (`ID_симптома_12`) REFERENCES `симптом` (`ID_симптома`);

--
-- Ограничения внешнего ключа таблицы `приём`
--
ALTER TABLE `приём`
  ADD CONSTRAINT `приём_ibfk_1` FOREIGN KEY (`ID_пациента`) REFERENCES `пациент` (`ID_пациента`),
  ADD CONSTRAINT `приём_ibfk_2` FOREIGN KEY (`ID_врача`) REFERENCES `врач` (`ID_врача`),
  ADD CONSTRAINT `приём_ibfk_3` FOREIGN KEY (`ID_статуса`) REFERENCES `статус` (`ID_статуса`),
  ADD CONSTRAINT `приём_ibfk_4` FOREIGN KEY (`ID_диагноза`) REFERENCES `диагноз` (`ID_диагноза`);

--
-- Ограничения внешнего ключа таблицы `противопаказ_заболевания`
--
ALTER TABLE `противопаказ_заболевания`
  ADD CONSTRAINT `противопаказ_заболевания_ibfk_1` FOREIGN KEY (`ID_акт_вещ`) REFERENCES `актив_вещ` (`ID_акт_вещ`);

--
-- Ограничения внешнего ключа таблицы `противопаказ_лекарств`
--
ALTER TABLE `противопаказ_лекарств`
  ADD CONSTRAINT `противопаказ_лекарств_ibfk_1` FOREIGN KEY (`ID_акт_вещ_01`) REFERENCES `актив_вещ` (`ID_акт_вещ`),
  ADD CONSTRAINT `противопаказ_лекарств_ibfk_2` FOREIGN KEY (`ID_акт_вещ_02`) REFERENCES `актив_вещ` (`ID_акт_вещ`);

--
-- Ограничения внешнего ключа таблицы `противопаказ_хз`
--
ALTER TABLE `противопаказ_хз`
  ADD CONSTRAINT `противопаказ_хз_ibfk_1` FOREIGN KEY (`ID_ХЗ`) REFERENCES `хрон_заболевание` (`ID_ХЗ`),
  ADD CONSTRAINT `противопаказ_хз_ibfk_10` FOREIGN KEY (`ID_лекарства_витамин_09`) REFERENCES `лекарства` (`ID_лекарства_витамин`),
  ADD CONSTRAINT `противопаказ_хз_ibfk_11` FOREIGN KEY (`ID_лекарства_витамин_10`) REFERENCES `лекарства` (`ID_лекарства_витамин`),
  ADD CONSTRAINT `противопаказ_хз_ibfk_2` FOREIGN KEY (`ID_лекарства_витамин_01`) REFERENCES `лекарства` (`ID_лекарства_витамин`),
  ADD CONSTRAINT `противопаказ_хз_ibfk_3` FOREIGN KEY (`ID_лекарства_витамин_02`) REFERENCES `лекарства` (`ID_лекарства_витамин`),
  ADD CONSTRAINT `противопаказ_хз_ibfk_4` FOREIGN KEY (`ID_лекарства_витамин_03`) REFERENCES `лекарства` (`ID_лекарства_витамин`),
  ADD CONSTRAINT `противопаказ_хз_ibfk_5` FOREIGN KEY (`ID_лекарства_витамин_04`) REFERENCES `лекарства` (`ID_лекарства_витамин`),
  ADD CONSTRAINT `противопаказ_хз_ibfk_6` FOREIGN KEY (`ID_лекарства_витамин_05`) REFERENCES `лекарства` (`ID_лекарства_витамин`),
  ADD CONSTRAINT `противопаказ_хз_ibfk_7` FOREIGN KEY (`ID_лекарства_витамин_06`) REFERENCES `лекарства` (`ID_лекарства_витамин`),
  ADD CONSTRAINT `противопаказ_хз_ibfk_8` FOREIGN KEY (`ID_лекарства_витамин_07`) REFERENCES `лекарства` (`ID_лекарства_витамин`),
  ADD CONSTRAINT `противопаказ_хз_ibfk_9` FOREIGN KEY (`ID_лекарства_витамин_08`) REFERENCES `лекарства` (`ID_лекарства_витамин`);

--
-- Ограничения внешнего ключа таблицы `врач`
--
ALTER TABLE `врач`
  ADD CONSTRAINT `врач_ibfk_1` FOREIGN KEY (`Квалификация`) REFERENCES `квалификация` (`Квалификация`);

--
-- Ограничения внешнего ключа таблицы `лекарства`
--
ALTER TABLE `лекарства`
  ADD CONSTRAINT `лекарства_ibfk_1` FOREIGN KEY (`Доступ_больничной _аптеке`) REFERENCES `доступ_больничной_аптеке` (`Статус`),
  ADD CONSTRAINT `лекарства_ibfk_2` FOREIGN KEY (`ID_акт_вещ`) REFERENCES `актив_вещ` (`ID_акт_вещ`);

--
-- Ограничения внешнего ключа таблицы `рекоменд_витамины`
--
ALTER TABLE `рекоменд_витамины`
  ADD CONSTRAINT `рекоменд_витамины_ibfk_1` FOREIGN KEY (`ID_лекарства_витамин`) REFERENCES `лекарства` (`ID_лекарства_витамин`),
  ADD CONSTRAINT `рекоменд_витамины_ibfk_2` FOREIGN KEY (`ID_лекарства_витамин_рек`) REFERENCES `лекарства` (`ID_лекарства_витамин`);

--
-- Ограничения внешнего ключа таблицы `рецепт`
--
ALTER TABLE `рецепт`
  ADD CONSTRAINT `рецепт_ibfk_1` FOREIGN KEY (`ID_пациента`) REFERENCES `пациент` (`ID_пациента`),
  ADD CONSTRAINT `рецепт_ibfk_2` FOREIGN KEY (`ID_лекарства`) REFERENCES `лекарства` (`ID_лекарства_витамин`);

--
-- Ограничения внешнего ключа таблицы `симптом`
--
ALTER TABLE `симптом`
  ADD CONSTRAINT `симптом_ibfk_1` FOREIGN KEY (`Тип`) REFERENCES `типы` (`Тип`);

--
-- Ограничения внешнего ключа таблицы `хрон_забол_пац`
--
ALTER TABLE `хрон_забол_пац`
  ADD CONSTRAINT `хрон_забол_пац_ibfk_1` FOREIGN KEY (`ID_пациента`) REFERENCES `пациент` (`ID_пациента`),
  ADD CONSTRAINT `хрон_забол_пац_ibfk_2` FOREIGN KEY (`ID_ХЗ`) REFERENCES `хрон_заболевание` (`ID_ХЗ`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
