<?php

$servername = "localhost";
$username = "root";
$password = "";
$dbname = "tes_bd";

ini_set('display_errors', 'Off');
$famil = $_POST["Фамилия"];
ini_set('display_errors', 'Off');
$name = $_POST["Имя"];
ini_set('display_errors', 'Off');
$otch = $_POST["Отчество"];
ini_set('display_errors', 'Off');
$city = $_POST["Город"];
ini_set('display_errors', 'Off');
$adres = $_POST["Адрес"];
ini_set('display_errors', 'Off');
$phone = $_POST["Контактный_телефон"];

ini_set('display_errors', 'Off');
$id_client = $_POST["ID_клиента"];

ini_set('display_errors', 'Off');
$famil_dil = $_POST["Фамилия"];
ini_set('display_errors', 'Off');
$name_dil = $_POST["Имя"];
ini_set('display_errors', 'Off');
$otch_dil = $_POST["Отчество"];
ini_set('display_errors', 'Off');
$photo = $_POST["Фотография"];
ini_set('display_errors', 'Off');
$adreshome = $_POST["Домашний_адрес"];
ini_set('display_errors', 'Off');
$phonediler = $_POST["Телефон"];

ini_set('display_errors', 'Off');
$id_diler = $_POST["ID_дилера"];

ini_set('display_errors', 'Off');
$id_photo = $_POST["ID_фотографии"];

ini_set('display_errors', 'Off');
$SQL_area = $_POST["Запрос"];

ini_set('display_errors', 'Off');
$photo = $_POST["Путь_к_файлу"];

ini_set('display_errors', 'Off');
$nom = $_POST["Регистрационный_номер"];
ini_set('display_errors', 'Off');
$avto = $_POST["Марка_автомобиля"];
ini_set('display_errors', 'Off');
$data = $_POST["Дата_выпуска"];
ini_set('display_errors', 'Off');
$photo_avto = $_POST["Фото_автомобиля"];

ini_set('display_errors', 'Off');
$id_avto = $_POST["ID_машины"];

ini_set('display_errors', 'Off');
$id_doc = $_POST["ID_договора"];

ini_set('display_errors', 'Off');
$name_photo = $_POST["Название"];

ini_set('display_errors', 'Off');
$data_doc = $_POST["Дата_продажи"];
ini_set('display_errors', 'Off');
$price = $_POST["Цена_продажи"];
ini_set('display_errors', 'Off');
$prim = $_POST["Примечания"];


$conn = mysqli_connect($servername, $username, $password, $dbname);

if ($conn == false)
{
    echo "Ошибка подключения";
}
?>
