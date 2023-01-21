<?php
include "DataBase.php";

$result = mysqli_query($conn, "SELECT * FROM `договоры`");
?>
<?php
if (isset($_POST['delete_doc'])){
    mysqli_query($conn, "DELETE FROM `договоры` WHERE `договоры`.`ID_договора` = '$id_doc'");
}
?>
<?php
mysqli_close($conn);
header("Location: LocalDoc.php");
?>
