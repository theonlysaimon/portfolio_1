<?php
include "DataBase.php";
$result = mysqli_query($conn, "SELECT * FROM `клиенты`");
?>
<?php
if (isset($_POST['send'])){
    mysqli_query($conn, "INSERT INTO `клиенты` (`Фамилия`, `Имя`,`Отчество`,`Город`,`Адрес`,`Контактный_телефон`) VALUES ('$famil', '$name','$otch','$city','$adres','$phone')");
}
?>
<?php
mysqli_close($conn);
header("Location: ChangesFirst.php");
?>
