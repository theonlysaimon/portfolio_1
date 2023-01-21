<!DOCTYPE html>
<html lang="en">
<head>
<?php include "head.html";?>
</head>
<body>
<?php include "header.html";?>

<?php
include "DataBase.php";
$result = mysqli_query($conn, "SELECT * FROM locomotive");
?>

<form class="form_changes" action="SQLTrain.php" method="POST">
    <h1 class="form__title">Добавить локомотив для поезда</h1>
    <div class="form__group">
        <select class="form__input_src" name="id_locomotive">

            <option selected disabled></option>
            <?php
            while ($row = $result->fetch_assoc())
            {?>
                <option name="id_locomotive" value=<?php echo $row["id_locomotive"]?>><?php echo $row["type_loc"]. " - " . $row["id_locomotive"]. "; производитель: " . $row["manufacrure"]. "; год: " . $row["year_prod"]  ?></option>
            <?php
            }?>
        </select>
        <label class="form__label">Локомотив</label>
    </div>
    <button class="form__button" type="submit" name="send_train">Добавить</button>
</form>
</body>
<?php include "scripts.php";?>
</html>