<?php
include "DataBase.php";
$result = mysqli_query($conn, "SELECT * FROM `автопарк`");
?>
<?php
if (isset($_POST['send_dil'])){
    mysqli_query($conn, "INSERT INTO `автопарк` (`Регистрационный_номер`, `Марка_автомобиля`,`Дата_выпуска`,`Фото_автомобиля`) VALUES ('$nom', '$avto','$data', '$id_photo')");
}
?>
<?php
mysqli_close($conn);
header("Location: ChanAvto.php");
?>
