<?php
include "DataBase.php";
$result = mysqli_query($conn, "SELECT * FROM `клиенты`");
?>
<?php
if (isset($_POST['delete'])){
    mysqli_query($conn, "DELETE FROM `клиенты` WHERE `клиенты`.`ID_клиента` = '$id_client' ");
}
?>
<?php
mysqli_close($conn);
header("Location: LocalFirstCustomers.php");
?>
