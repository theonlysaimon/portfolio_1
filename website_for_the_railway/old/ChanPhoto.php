<?php
include "DataBase.php";
$result = mysqli_query($conn, "SELECT * FROM `фотографии`");

?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, shrink-to-fit=no">
    <meta http-equiv="X-UA-Compatible" content="ie-edge">
    <link rel="shortcut icon" href="/img/ico.png" type="image/x-icon">
    <link rel="stylesheet" href="css/font-awesome.css" type="text/css">
    <link rel="stylesheet" href="css/style.css" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Cuprum" rel="stylesheet">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
    <title>Продажа автомобилей</title>
</head>
<body>
<header class="header">
    <nav class="dws-menu">
        <ul>
            <li><a href="index.html"><i class="fa fa-home"></i>Главная</a></li>
            <li><a href="#"><i class="fa fa-server"></i>Таблицы</a>
                <ul>
                    <li><a href="LocalFirstCustomers.php">Клиенты</a></li>
                    <li><a href="LocalFirstDiler.php">Дилеры</a></li>
                    <li><a href="LocalAvto.php">Машины</a></li>
                    <li><a href="LocalPhoto.php">Фотографии</a></li>
                    <li><a href="LocalDoc.php">Договоры</a></li>
                </ul>
            </li>
            <li><a href="#"><i class="fa fa-cogs"></i>Изменения</a>
                <ul>
                    <li><a href="AreaSQL.php">SQL запросы</a></li>
                    <li><a href="ChangesFirst.php">Добавить клиента</a></li>
                    <li><a href="ChanDiler.php">Добавить дилера</a></li>
                    <li><a href="ChanAvto.php">Добавить автомобиль</a></li>
                    <li><a href="ChanPhoto.php">Добавить фотографию</a></li>
                    <li><a href="ChanDoc.php">Заключить договор</a></li>
                </ul>
            </li>
        </ul>
    </nav>
</header>

<form class="form_changes" action="NewPhoto.php" method="POST">
    <h1 class="form__title">Добавить фотографию</h1>

    <div class="form__group">
        <input class="form__input" placeholder=" " type="text" name="Название">
        <label class="form__label">Название</label>
    </div>
    <div class="form__group">
        <input class="form__input" placeholder=" " type="text" name="Путь_к_файлу">
        <label class="form__label">Путь к файлу</label>
    </div>

    <button class="form__button" type="submit" name="send_dil">Добавить</button>
</form>

<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
</body>
</html>
