<?php
include "DataBase.php";

$result = mysqli_query($conn, "SELECT * FROM `автопарк`");
?>
<?php
if (isset($_POST['delete_dil'])){
    mysqli_query($conn, "DELETE FROM `автопарк` WHERE `автопарк`.`ID_машины` = '$id_avto' ");
}
?>
<?php
mysqli_close($conn);
header("Location: LocalAvto.php");
?>
