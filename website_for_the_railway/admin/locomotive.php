<?php
include "DataBase.php";
$result = mysqli_query($conn, "SELECT * FROM locomotive");

?>
<!DOCTYPE html>
<html lang="en">
<head>
    <?php include "head.html";?>
</head>
<body>
<?php include "header.html";?>
<section class="section">
    <div class ="container-loc">
        <div class = "row">

            <?php
            while ($row = $result->fetch_assoc())
            {?>
                <div class = "col-md-6-loc">
                    <div class="main-iner">
                        <div class="row">
                            <div class="col-8-loc">
                                <div class="iner-titel">
                                    <h5>
                                        <?php echo "Серия: " . $row["serial_numbe"].", ID_". $row["id_locomotive"] ?>
                                    </h5>
                                </div>
                                <div class="iner-text">
                                    <p>
                                        <?php
                                        echo "Тип локомотива: " . $row["type_loc"] . "<br> Номер секции: " . $row["number_section"] . "<br> Производитель: " . $row["manufacrure"]. "<br> Год изготовления: " . $row["year_prod"];
                                        ?>
                                    </p>
                                </div>
                                <div class="iner-ancro">
                                    <form class="form_changes_2" action="DeleteLoc.php" method="POST">
                                        <input class="form__input_2" placeholder=" " type="text" name="id_locomotive"
                                                value="<?php echo $row['id_locomotive'];  ?>">
                                        <button class="form__button_2" type="submit" name="delete_loc">Удалить</button>
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