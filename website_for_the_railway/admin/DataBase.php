<?php

$servername = "localhost";
$username = "root";
$password = "";
$dbname = "wokzal";

/*Переменные для запросов*/
ini_set('display_errors', 'Off');
$travel_id = $_POST["travel_id"];

ini_set('display_errors', 'Off');
$train_id = $_POST["train_id"];

ini_set('display_errors', 'Off');
$id_group_wagon = $_POST["id_group_wagon"];

ini_set('display_errors', 'Off');
$id_locomotive = $_POST["id_locomotive"];

ini_set('display_errors', 'Off');
$id_wagon = $_POST["id_wagon"];

ini_set('display_errors', 'Off');
$SQL_area = $_POST["SQL"];

/*Для всавки таблицы wagon*/ 
ini_set('display_errors', 'Off');
$serial_numbe = $_POST["serial_numbe"];
ini_set('display_errors', 'Off');
$type_wag = $_POST["type_wag"];
ini_set('display_errors', 'Off');
$number_seats = $_POST["number_seats"];
ini_set('display_errors', 'Off');
$manufacrure = $_POST["manufacrure"];
ini_set('display_errors', 'Off');
$year_prod = $_POST["year_prod"];

/*Для всавки таблицы locomotiv*/ 
ini_set('display_errors', 'Off');
$type_loc = $_POST["type_loc"];
ini_set('display_errors', 'Off');
$number_section = $_POST["number_section"];

/*Для всавки таблицы group wagon*/ 
ini_set('display_errors', 'Off');
$id_train = $_POST["id_train"];
ini_set('display_errors', 'Off');
$count_wagon = $_POST["count_wagon"];

/*Для всавки таблицы station*/ 
ini_set('display_errors', 'Off');
$name_station = $_POST["name_station"];

/*Для всавки таблицы travel*/ 
ini_set('display_errors', 'Off');
$id_station = $_POST["id_station"];
ini_set('display_errors', 'Off');
$time_arrival = $_POST["time_arrival"];
ini_set('display_errors', 'Off');
$time_departure = $_POST["time_departure"];
ini_set('display_errors', 'Off');
$data_arrival = $_POST["data_arrival"];
ini_set('display_errors', 'Off');
$data_departure = $_POST["data_departure"];

$conn = mysqli_connect($servername, $username, $password, $dbname);

if ($conn == false)
{
    echo "Ошибка подключения";
}
?>
