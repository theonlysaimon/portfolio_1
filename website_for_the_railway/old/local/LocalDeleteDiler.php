<?php
include "DataBase.php";

$result = mysqli_query($conn, "SELECT * FROM `дилеры`");
?>
<?php
if (isset($_POST['delete_dil'])){
    mysqli_query($conn, "DELETE FROM `дилеры` WHERE `дилеры`.`ID_дилера` = '$id_diler' ");
}
?>
<?php
mysqli_close($conn);
header("Location: LocalFirstDiler.php");
?>
