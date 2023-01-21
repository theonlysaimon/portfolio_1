<!DOCTYPE html>
<html lang="en">
<head>
<?php include "head.html";?>
</head>
<body>
<?php include "header.html";?>

<form class="form_changes" action="SQLwagon.php" method="POST">
    <h1 class="form__title">Добавить вагон</h1>

    <div class="form__group">
        <input class="form__input" placeholder=" " type="text" name="serial_numbe">
        <label class="form__label">Серийный номер</label>
    </div>
    <div class="form__group">
        <input class="form__input" placeholder=" " type="text" name="type_wag">
        <label class="form__label">Тип вагона</label>
    </div>
    <div class="form__group">
        <input class="form__input" placeholder=" " type="text" name="number_seats">
        <label class="form__label">Число мест</label>
    </div>
    <div class="form__group">
        <input class="form__input" placeholder=" " type="text" name="manufacrure">
        <label class="form__label">Производитель</label>
    </div>
    <div class="form__group">
        <input class="form__input" placeholder=" " type="text" name="year_prod">
        <label class="form__label">Год производства</label>
    </div>
    <button class="form__button" type="submit" name="send_wagon">Добавить</button>
</form>
</body>
<?php include "scripts.php";?>
</html>