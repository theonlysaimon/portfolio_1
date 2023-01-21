<?php
include "DataBase.php";

$result = mysqli_query($conn, "SELECT * FROM locomotive");
?>
<?php
if (isset($_POST['delete_loc'])){
    mysqli_query($conn, "DELETE FROM locomotive WHERE locomotive.id_locomotive = '$id_locomotive' ");
}
?>
<?php
mysqli_close($conn);
header("Location: locomotive.php");
?>