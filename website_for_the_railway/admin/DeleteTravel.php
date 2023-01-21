<?php
include "DataBase.php";

$result = mysqli_query($conn, "SELECT * FROM travel");
?>
<?php
if (isset($_POST['delete_travel'])){
    mysqli_query($conn, "DELETE FROM travel WHERE travel.id_travel = '$travel_id' ");
}
?>
<?php
mysqli_close($conn);
header("Location: travel.php");
?>