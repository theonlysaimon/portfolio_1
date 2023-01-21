<!DOCTYPE html>
<html lang="en">
<head>
<?php include "head.html";?>
</head>
<body>
<?php include "header.html";?>

<?php
include "DataBase.php";
$result_loc = mysqli_query($conn, "SELECT * FROM train INNER JOIN locomotive ON locomotive.id_locomotive = train.locomotive_id");
$result_wagon = mysqli_query($conn, "SELECT * FROM wagon");
?>

<form class="form_changes" action="SQLGroupWagon.php" method="POST">
    <h1 class="form__title">Добавить группу вагонов</h1>
    <div class="form__group">
        <select class="form__input_src" name="id_train">

            <option selected disabled></option>
            <?php
            while ($row = $result_loc->fetch_assoc())
            {?>
                <option name="id_train" value=<?php echo $row["id_train"]?>><?php echo $row["type_loc"]. " - " . $row["id_train"] ?></option>
            <?php
            }?>
        </select>
        <label class="form__label">Локомотив</label>
    </div>
    <div class="form__group">
        <select class="form__input_src" name="id_wagon">

            <option selected disabled></option>
            <?php
            while ($row = $result_wagon->fetch_assoc())
            {?>
                <option name="id_wagon" value=<?php echo $row["id_wagon"]?>><?php echo $row["type_wag"]. " - " . $row["number_seats"] ?></option>
            <?php
            }?>
        </select>
        <label class="form__label">Вагон</label>
    </div>
    <div class="form__group">
        <input class="form__input" placeholder=" " type="text" name="count_wagon">
        <label class="form__label">Количесвто вагонов</label>
    </div>
    <button class="form__button" type="submit" name="send_group">Добавить</button>
</form>
</body>
<?php include "scripts.php";?>
</html>