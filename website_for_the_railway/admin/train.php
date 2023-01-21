<?php
include "DataBase.php";
mysqli_query($conn, "USE wokzal");
mysqli_query($conn, "CREATE TEMPORARY TABLE table_train ( id int(10) unsigned NOT NULL AUTO_INCREMENT, train_id int(10) NOT NULL, numbe_serial text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL, loc_type text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL, year_prod_loc int(10) NOT NULL, wag_type varchar(15) NULL, wag_count int(10) NULL, seats_number int(10) NULL, year_prod_wag int(10) NULL, PRIMARY KEY (id) ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci AUTO_INCREMENT=1");
mysqli_query($conn, "USE wokzal");
mysqli_query($conn, "INSERT INTO table_train (train_id,numbe_serial,loc_type,year_prod_loc,wag_type,wag_count,seats_number,year_prod_wag) SELECT id_train, locomotive.serial_numbe, type_loc, locomotive.year_prod, type_wag, count_wagon, number_seats, wagon.year_prod FROM train INNER JOIN locomotive ON locomotive.id_locomotive = train.locomotive_id LEFT JOIN group_wagon ON group_wagon.train_id = train.id_train LEFT JOIN wagon ON wagon.id_wagon = group_wagon.wagon_id");
mysqli_query($conn, "USE wokzal");
$result = mysqli_query($conn, "SELECT DISTINCT train_id,numbe_serial,loc_type,year_prod_loc, GROUP_CONCAT(wag_type SEPARATOR ', ') AS wag_type, GROUP_CONCAT(wag_count SEPARATOR ', ') AS wag_count, GROUP_CONCAT(seats_number SEPARATOR ', ') AS seats_number, GROUP_CONCAT(year_prod_wag SEPARATOR ', ') AS year_prod_wag FROM table_train GROUP BY train_id,numbe_serial,loc_type,year_prod_loc");

?>
<!DOCTYPE html>
<html lang="en">
<head>
    <?php include "head.html";?>
</head>
<body>
<?php include "header.html";?>
<section class="section">
    <div class ="container-train">
        <div class = "row">

            <?php
            while ($row = $result->fetch_assoc())
            {?>
                <div class = "col-md-6-train">
                    <div class="main-iner">
                        <div class="row">
                            <div class="col-8-train">
                                <div class="iner-titel">
                                    <h5>
                                        <?php echo $row["numbe_serial"]?>
                                    </h5>
                                </div>
                                <div class="iner-text">
                                    <p>
                                        <?php
                                        echo "Тип локомотива: " . $row["loc_type"] . "<br> Год производства локомотива: " . $row["year_prod_loc"] . "<br> Тип вагона: " . $row["wag_type"]. "<br> Число вагонов (соответ.): " . $row["wag_count"]. "<br> Число мест (соответ.): " . $row["seats_number"]. "<br> Год производства вагона (соответ.): " . $row["year_prod_wag"];
                                        ?>
                                    </p>
                                </div>
                                <div class="iner-ancro">
                                    <form class="form_changes_2" action="DeleteTrain.php" method="POST">
                                        <input class="form__input_2" placeholder=" " type="text" name="train_id"
                                                value="<?php echo $row['train_id'];  ?>">
                                        <button class="form__button_2" type="submit" name="delete_train">Удалить</button>
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