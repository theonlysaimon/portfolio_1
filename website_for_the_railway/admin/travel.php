<?php
include "DataBase.php";
mysqli_query($conn, "USE wokzal");
mysqli_query($conn, "CREATE TEMPORARY TABLE table_next_travel ( id int(10) unsigned NOT NULL AUTO_INCREMENT, travel_id varchar(255) NOT NULL, arrival_time text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL, depart_time text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL, count_wagon text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL, wag_type varchar(15) NOT NULL, namber_s int(10) NOT NULL, st_name text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL, arrival_data date NOT NULL, departure_data date NOT NULL, PRIMARY KEY (id) ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci AUTO_INCREMENT=1");
mysqli_query($conn, "USE wokzal");
mysqli_query($conn, "INSERT INTO table_next_travel(travel_id,arrival_time,depart_time,count_wagon,wag_type,namber_s,st_name,arrival_data,departure_data) SELECT id_travel, time_arrival, time_departure, group_wagon.count_wagon, wagon.type_wag, wagon.number_seats, station.name_station, travel.data_arrival, travel.data_departure FROM travel INNER JOIN group_wagon ON travel.train_id = group_wagon.train_id INNER JOIN wagon ON group_wagon.wagon_id = wagon.id_wagon INNER JOIN station ON travel.station_id = station.id_station");
mysqli_query($conn, "USE wokzal");
$result = mysqli_query($conn, "SELECT travel_id,arrival_time,depart_time,st_name,arrival_data,departure_data, GROUP_CONCAT(count_wagon SEPARATOR ', ') AS count_wagon, GROUP_CONCAT(namber_s SEPARATOR ', ') AS namber_s, GROUP_CONCAT(wag_type SEPARATOR ', ') AS wag_type FROM table_next_travel GROUP BY travel_id,arrival_time,depart_time,st_name,arrival_data,departure_data");

?>
<!DOCTYPE html>
<html lang="en">
<head>
    <?php include "head.html";?>
</head>
<body>
<?php include "header.html";?>
<section class="section">
    <div class ="container-travel">
        <div class = "row">

            <?php
            while ($row = $result->fetch_assoc())
            {?>
                <div class = "col-md-6-travel">
                    <div class="main-iner">
                        <div class="row">
                            <div class="col-4-travel">
                                <div class="image">
                                    <img src="../img/travel.png", alt="">
                                </div>
                            </div>
                            <div class="col-8-travel">
                                <div class="iner-titel">
                                    <h5>
                                        <?php echo $row["st_name"]?>
                                    </h5>
                                </div>
                                <div class="iner-text-travel">
                                    <p>
                                        <?php
                                        echo "Время прибытия: " . $row["arrival_time"] . "<br> Время отправления: " . $row["depart_time"] . "<br>  Дата прибытия: " . $row["arrival_data"]. "<br>Дата отправления: " . $row["departure_data"]. "<br> Классы вагонов: " . $row["wag_type"]. "<br> Число мест (соответ.): " . $row["namber_s"]. "<br> Число вагонов (соответ.): " . $row["count_wagon"];
                                        ?>
                                    </p>
                                </div>
                                <div class="iner-ancro">
                                    <form class="form_changes_2" action="DeleteTravel.php" method="POST">
                                        <input class="form__input_2" placeholder=" " type="text" name="travel_id"
                                                value="<?php echo $row['travel_id'];  ?>">
                                        <button class="form__button_2" type="submit" name="delete_travel">Удалить</button>
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