<!DOCTYPE html>
<html lang="en">
<head>
    <?php include "head.html";?>
</head>
<body>
    <?php include "header.html";?>

<form class="form_changes_sql_area" action="LocalSQL.php" method="POST">
    <h1 class="form__title">Выполнить запрос</h1>
    <div class="form__group">
        <textarea class="form__input_area" placeholder=" " type="text" name="SQL"></textarea>
        <label class="form__label">Запрос</label>
    </div>
    <button class="form__button" type="submit" name="send_SQL">Выполнить</button>
</form>

</body>
<?php include "scripts.php";?>
</html>
