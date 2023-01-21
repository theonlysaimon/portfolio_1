<?php
include "DataBase.php";

$result = mysqli_query($conn, "SELECT * FROM group_wagon");
?>
<?php
if (isset($_POST['delete_group'])){
    mysqli_query($conn, "DELETE FROM group_wagon WHERE group_wagon.id_group_wagon = '$id_group_wagon' ");
}
?>
<?php
mysqli_close($conn);
header("Location: group_wagon.php");
?>