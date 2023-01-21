<?php
include "DataBase.php";
$result = mysqli_query($conn, "SELECT * FROM group_wagon");
?>
<?php
if (isset($_POST['send_group'])){
    $sql="INSERT INTO group_wagon (id_group_wagon, train_id, wagon_id, count_wagon) VALUES (NULL, '$id_train', '$id_wagon', '$count_wagon');";
    echo $sql;
    mysqli_query($conn, $sql);
}
?>
<?php
mysqli_close($conn);
header("Location: NewGroupWagon.php");
?>