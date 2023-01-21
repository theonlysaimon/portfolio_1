<?php
include "DataBase.php";
$result = mysqli_query($conn, "SELECT * FROM locomotive");
?>
<?php
if (isset($_POST['send_loc'])){
    $sql="INSERT INTO locomotive (serial_numbe, type_loc,number_section,manufacrure,year_prod) VALUES ('$serial_numbe', '$type_loc','$number_section','$manufacrure','$year_prod')";
    echo $sql;
    mysqli_query($conn, $sql);
}
?>
<?php
mysqli_close($conn);
header("Location: NewLocomotiv.php");
?>