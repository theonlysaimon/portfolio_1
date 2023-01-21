<!DOCTYPE html>
<html lang="en">
<head>
<?php include "head.html";?>
</head>
<body>
<?php include "header.html";?>

<?php
include "DataBase.php";
$result_station = mysqli_query($conn, "SELECT * FROM station");
mysqli_query($conn, "USE wokzal");
mysqli_query($conn, "CREATE TEMPORARY TABLE table_train ( id int(10) unsigned NOT NULL AUTO_INCREMENT, train_id int(10) NOT NULL, numbe_serial text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL, loc_type text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL, year_prod_loc int(10) NOT NULL, wag_type varchar(15) NULL, wag_count int(10) NULL, seats_number int(10) NULL, year_prod_wag int(10) NULL, PRIMARY KEY (id) ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci AUTO_INCREMENT=1");
mysqli_query($conn, "USE wokzal");
mysqli_query($conn, "INSERT INTO table_train (train_id,numbe_serial,loc_type,year_prod_loc,wag_type,wag_count,seats_number,year_prod_wag) SELECT id_train, locomotive.serial_numbe, type_loc, locomotive.year_prod, type_wag, count_wagon, number_seats, wagon.year_prod FROM train INNER JOIN locomotive ON locomotive.id_locomotive = train.locomotive_id LEFT JOIN group_wagon ON group_wagon.train_id = train.id_train LEFT JOIN wagon ON wagon.id_wagon = group_wagon.wagon_id");
mysqli_query($conn, "USE wokzal");
$result_train = mysqli_query($conn, "SELECT DISTINCT train_id,numbe_serial,loc_type,year_prod_loc, GROUP_CONCAT(wag_type SEPARATOR ', ') AS wag_type, GROUP_CONCAT(wag_count SEPARATOR ', ') AS wag_count, GROUP_CONCAT(seats_number SEPARATOR ', ') AS seats_number, GROUP_CONCAT(year_prod_wag SEPARATOR ', ') AS year_prod_wag FROM table_train GROUP BY train_id,numbe_serial,loc_type,year_prod_loc");
?>

<form class="form_changes" action="SQLtravel.php" method="POST" id="form">
    <h1 class="form__title">Добавить рейс</h1>
    <div class="form__group">
        <select class="form__input_src" name="train_id">

            <option selected disabled></option>
            <?php
            while ($row = $result_train->fetch_assoc())
            {?>
                <option name="train_id" value=<?php echo $row["train_id"]?>><?php echo $row["loc_type"] . " - год: " . $row["year_prod_loc"] . "; " . $row["wag_type"]. " - число: " . $row["wag_count"]. " - мест: " . $row["seats_number"]. " - год: " . $row["year_prod_wag"] ?></option>
            <?php
            }?>
        </select>
        <label class="form__label">Поезд</label>
    </div>
    <div class="form__group">
        <select class="form__input_src" name="id_station">

            <option selected disabled></option>
            <?php
            while ($row = $result_station->fetch_assoc())
            {?>
                <option name="id_station" value=<?php echo $row["id_station"]?>><?php echo $row["name_station"] ?></option>
            <?php
            }?>
        </select>
        <label class="form__label">Маршрут</label>
    </div>
    <div class="form__group">
        <input class="form__input" placeholder=" " type="text" name="time_departure" >
        <label class="form__label">Время отправления (чч:мм)</label>
    </div>
    <div class="form__group">
        <input class="form__input" placeholder=" " type="text" name="data_departure">
        <label class="form__label">Дата отправления</label>
    </div>
    <div class="form__group">
        <input class="form__input" placeholder=" " type="text" name="time_arrival">
        <label class="form__label">Время прибытия (чч:мм)</label>
    </div>
    <div class="form__group">
        <input class="form__input" placeholder=" " type="text" name="data_arrival">
        <label class="form__label">Дата прибытия</label>
    </div>    
    <button class="form__button" type="submit" name="send_travel">Добавить</button>
</form>

<?php include "scripts.php";?>
</body>
</html>