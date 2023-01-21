<?php
include "DataBase.php";

$result = mysqli_query($conn, "SELECT * FROM `фотографии`");
?>
<?php
if (isset($_POST['delete_dil'])){
    mysqli_query($conn, "DELETE FROM `фотографии` WHERE `фотографии`.`ID_фотографии` = '$id_photo' ");
}
?>
<?php
mysqli_close($conn);
header("Location: LocalPhoto.php");
?>
