<?php
include "DataBase.php";
$result = mysqli_query($conn, "SELECT * FROM `wagon`");

?>
<!DOCTYPE html>
<html lang="en">
<head>
    <?php include "head.html";?>
</head>
<body>
<?php include "header.html";?>
<section class="section">
    <div class ="container-wagon">
        <div class = "row">

            <?php
            while ($row = $result->fetch_assoc())
            {?>
                <div class = "col-md-6-wagon">
                    <div class="main-iner">
                        <div class="row">
                            <div class="col-8-wagon">
                                <div class="iner-titel">
                                    <h5>
                                        <?php echo "Серия: " . $row["serial_numbe"].", ID_". $row["id_wagon"] ?>
                                    </h5>
                                </div>
                                <div class="iner-text">
                                    <p>
                                        <?php
                                        echo "Тип вагона: " . $row["type_wag"] . "<br> Количесвто мест: " . $row["number_seats"] . "<br> Производитель: " . $row["manufacrure"]. "<br> Год изготовления: " . $row["year_prod"];
                                        ?>
                                    </p>
                                </div>
                                <div class="iner-ancro">
                                    <form class="form_changes_2" action="DeleteWagon.php" method="POST">
                                        <input class="form__input_2" placeholder=" " type="text" name="id_wagon"
                                                value="<?php echo $row['id_wagon'];  ?>">
                                        <button class="form__button_2" type="submit" name="delete_wagon">Удалить</button>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <?php
            }
            ?>
        </div>
    </div>
</section>
</body>
<?php include "scripts.php";?>
</html>
<?php
mysqli_close($conn);
?>