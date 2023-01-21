<?php
include "DataBase.php";
$result = mysqli_query($conn, "SELECT group_wagon.id_group_wagon, locomotive.serial_numbe, type_loc, type_wag, count_wagon, number_seats FROM train INNER JOIN locomotive ON locomotive.id_locomotive = train.locomotive_id INNER JOIN group_wagon ON group_wagon.train_id = train.id_train INNER JOIN wagon ON wagon.id_wagon = group_wagon.wagon_id");

?>
<!DOCTYPE html>
<html lang="en">
<head>
    <?php include "head.html";?>
</head>
<body>
<?php include "header.html";?>
<section class="section">
    <div class ="container-group">
        <div class = "row">

            <?php
            while ($row = $result->fetch_assoc())
            {?>
                <div class = "col-md-6-group">
                    <div class="main-iner">
                        <div class="row">
                            <div class="col-8-group">
                                <div class="iner-titel">
                                    <h5>
                                        <?php echo "Серия: " . $row["serial_numbe"].", ID_". $row["id_group_wagon"] ?>
                                    </h5>
                                </div>
                                <div class="iner-text">
                                    <p>
                                        <?php
                                        echo "Тип локомотива: " . $row["type_loc"] . "<br> Тип вагона: " . $row["type_wag"] . "<br> Число вагонов: " . $row["count_wagon"]. "<br> Число мест: " . $row["number_seats"];
                                        ?>
                                    </p>
                                </div>
                                <div class="iner-ancro">
                                    <form class="form_changes_2" action="DeleteGroup.php" method="POST">
                                        <input class="form__input_2" placeholder=" " type="text" name="id_group_wagon"
                                                value="<?php echo $row['id_group_wagon'];  ?>">
                                        <button class="form__button_2" type="submit" name="delete_group">Удалить</button>
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