<?php
include "DataBase.php";
$result = mysqli_query($conn, "SELECT * FROM travel");
?>
<?php
if (isset($_POST['send_travel'])){
    $sql="INSERT INTO travel (id_travel, station_id, train_id, time_arrival, time_departure, data_arrival, data_departure) VALUES (NULL, '$id_station', '$train_id', '$time_arrival', '$time_departure', '$data_arrival', '$data_departure');";
    echo $sql;
    
    mysqli_query($conn, $sql);
}
?>
<?php

mysqli_close($conn);
header("Location: NewTravel.php")
?>