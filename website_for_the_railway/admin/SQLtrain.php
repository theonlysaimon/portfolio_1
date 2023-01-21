<?php
include "DataBase.php";
$result = mysqli_query($conn, "SELECT * FROM train");
?>
<?php
if (isset($_POST['send_train'])){
    $sql="INSERT INTO train (id_train, locomotive_id) VALUES (NULL, '$id_locomotive')";
    echo $sql;
    mysqli_query($conn, $sql);
}
?>
<?php
mysqli_close($conn);
header("Location: NewTrain.php")
?>