<?php
include "DataBase.php";

$result = mysqli_query($conn, "SELECT * FROM wagon");
?>
<?php
if (isset($_POST['delete_wagon'])){
    mysqli_query($conn, "DELETE FROM wagon WHERE wagon.id_wagon = '$id_wagon' ");
}
?>
<?php
mysqli_close($conn);
header("Location: wagon.php");
?>