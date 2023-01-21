<?php
include "DataBase.php";
$result = mysqli_query($conn, "SELECT * FROM `дилеры`");
?>
<?php
if (isset($_POST['send_dil'])){
    mysqli_query($conn, "INSERT INTO `дилеры` (`Фамилия`, `Имя`,`Отчество`,`Фотография`, `Домашний_адрес`,`Телефон`) VALUES ('$famil_dil', '$name_dil','$otch_dil', '$id_photo', '$adreshome','$phonediler')");
}
?>
<?php
mysqli_close($conn);
header("Location: ChanDiler.php");
?>
