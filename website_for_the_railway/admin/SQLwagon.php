<?php
include "DataBase.php";
$result = mysqli_query($conn, "SELECT * FROM wagon");
?>
<?php
if (isset($_POST['send_wagon'])){
    $sql="INSERT INTO wagon (serial_numbe, type_wag,number_seats,manufacrure,year_prod) VALUES ('$serial_numbe', '$type_wag','$number_seats','$manufacrure','$year_prod')";
    echo $sql;
    mysqli_query($conn, $sql);
}
?>
<?php
mysqli_close($conn);
header("Location: NewWagon.php")
?>