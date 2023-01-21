<?php
include "DataBase.php";
$result = mysqli_query($conn, "SELECT * FROM station");
?>
<?php
if (isset($_POST['send_station'])){
    $sql="INSERT INTO station (id_station, name_station) VALUES (NULL, '$name_station')";
    echo $sql;
    mysqli_query($conn, $sql);
}
?>
<?php
mysqli_close($conn);
header("Location: NewStation.php")
?>