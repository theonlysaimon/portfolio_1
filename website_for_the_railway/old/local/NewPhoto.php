<?php
include "DataBase.php";
$result = mysqli_query($conn, "SELECT * FROM `фотографии`");
?>
<?php
if (isset($_POST['send_dil'])){
    mysqli_query($conn, "INSERT INTO `фотографии` (`Название`, `Путь_к_файлу`) VALUES ('$name_photo', '$photo')");
}
?>
<?php
mysqli_close($conn);
header("Location: ChanPhoto.php");
?>
