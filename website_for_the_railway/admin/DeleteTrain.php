<?php
include "DataBase.php";

$result = mysqli_query($conn, "SELECT * FROM train");
$delete ="DELETE FROM train WHERE train.id_train = '$train_id'";
?>
<?php
if (isset($_POST['delete_train'])){
    mysqli_query($conn, $delete);
    echo $delete;
}
?>
<?php
mysqli_close($conn);
header("Location: train.php");
?>