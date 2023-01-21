<?php
include "DataBase.php";
$result = mysqli_query($conn, "SELECT * FROM `договоры`");
?>
<?php
if (isset($_POST['send_doc'])){
    mysqli_query($conn, "INSERT INTO `договоры` (`ID_клиента`, `ID_дилера`, `ID_машины`, `Дата_продажи`, `Цена_продажи`, `Примечания`) VALUES ('$id_client', '$id_diler', '$id_avto', '$data_doc', '$price', '$prim')");
}
?>
<?php
mysqli_close($conn);
header("Location: ChanDoc.php");
?>
