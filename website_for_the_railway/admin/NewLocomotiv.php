<!DOCTYPE html>
<html lang="en">
<head>
<?php include "head.html";?>
</head>
<body>
<?php include "header.html";?>

<form class="form_changes" action="SQLlocomotiv.php" method="POST">
    <h1 class="form__title">Добавить локомотив</h1>

    <div class="form__group">
        <input class="form__input" placeholder=" " type="text" name="serial_numbe">
        <label class="form__label">Серийный номер</label>
    </div>
    <div class="form__group">
        <input class="form__input" placeholder=" " type="text" name="type_loc">
        <label class="form__label">Тип локомотива</label>
    </div>
    <div class="form__group">
        <input class="form__input" placeholder=" " type="text" name="number_section">
        <label class="form__label">Номер секции</label>
    </div>
    <div class="form__group">
        <input class="form__input" placeholder=" " type="text" name="manufacrure">
        <label class="form__label">Производитель</label>
    </div>
    <div class="form__group">
        <input class="form__input" placeholder=" " type="text" name="year_prod">
        <label class="form__label">Год производства</label>
    </div>
    <button class="form__button" type="submit" name="send_loc">Добавить</button>
</form>
</body>
<?php include "scripts.php";?>
</html>