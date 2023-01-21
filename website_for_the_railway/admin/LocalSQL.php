<?php
include "DataBase.php";

if (isset($_POST['send_SQL'])){
    $sql = mysqli_query($conn, "$SQL_area");
}
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <?php include "head.html";?>
</head>
<body>
<?php include "header.html";?>

<form class="form_changes_sql" method="POST">
    <h1 class="form__title_sql">Ваш запрос</h1>
    <div class="form__group_sql">
        <?php

        if ($sql > 0){
        while ($row = $sql->fetch_assoc())
        {?>
            <h5>
                <?php
                $json = json_encode($row, JSON_UNESCAPED_UNICODE);
                $delete_sql_0 = array("{","}");
                $delete_sql_1 = array(":");
                $delete_sql_3 = array(",");
                $res =  str_replace( $delete_sql_0,"",$json);
                $resu = str_replace( $delete_sql_1," = ",$res);
                $resul = str_replace( '"',"",$resu);
                $result = str_replace( $delete_sql_3,"&nbsp;&nbsp;&nbsp;&nbsp;",$resu);
                print_r($result);
                echo "<br>";
                ?>
            </h5>
            <br>
        <?php
        }
        }
        else {?>
            <h3>Ошибка запроса</h3>
        <?php
        }
        ?>
    </div>
</form>

</body>
<?php include "scripts.php";?>
</html>
<?php
mysqli_close($conn);
?>
