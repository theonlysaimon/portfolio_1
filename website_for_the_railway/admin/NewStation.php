<!DOCTYPE html>
<html lang="en">
<head>
<?php include "head.html";?>
</head>
<body>
<?php include "header.html";?>

<form class="form_changes" action="SQLstation.php" method="POST">
    <h1 class="form__title">Добавить маршрут следования</h1>

    <div class="form__group">
        <input class="form__input" placeholder=" " type="text" name="name_station">
        <label class="form__label">Маршрут (Откуда - Куда)</label>
    </div>
  
    <button class="form__button" type="submit" name="send_station">Добавить</button>
</form>
</body>
<?php include "scripts.php";?>
</html>