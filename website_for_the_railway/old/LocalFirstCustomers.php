<?php
include "DataBase.php";
$result = mysqli_query($conn, "SELECT * FROM travel JOIN station ON id_station = station_id");

?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, shrink-to-fit=no">
    <meta http-equiv="X-UA-Compatible" content="ie-edge">
    <link rel="shortcut icon" href="/img/ico.png" type="image/x-icon">
    <link rel="stylesheet" href="css/font-awesome.css" type="text/css">
    <link rel="stylesheet" href="css/style.css" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Cuprum" rel="stylesheet">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
    <title>Продажа автомобилей</title>
</head>
<body>
<header class="header">
    <nav class="dws-menu">
        <ul>
            <li><a href="index.html"><i class="fa fa-home"></i>Главная</a></li>
            <li><a href="#"><i class="fa fa-server"></i>Таблицы</a>
                <ul>
                    <li><a href="LocalFirstCustomers.php">Клиенты</a></li>
                    <li><a href="LocalFirstDiler.php">Дилеры</a></li>
                    <li><a href="LocalAvto.php">Машины</a></li>
                    <li><a href="LocalPhoto.php">Фотографии</a></li>
                    <li><a href="LocalDoc.php">Договоры</a></li>
                </ul>
            </li>
            <li><a href="#"><i class="fa fa-cogs"></i>Изменения</a>
                <ul>
                    <li><a href="AreaSQL.php">SQL запросы</a></li>
                    <li><a href="ChangesFirst.php">Добавить клиента</a></li>
                    <li><a href="ChanDiler.php">Добавить дилера</a></li>
                    <li><a href="ChanAvto.php">Добавить автомобиль</a></li>
                    <li><a href="ChanPhoto.php">Добавить фотографию</a></li>
                    <li><a href="ChanDoc.php">Заключить договор</a></li>
                </ul>
            </li>
        </ul>
    </nav>
</header>
<section class="section">
    <div class ="container">
        <div class = "row">

            <?php
            while ($row = $result->fetch_assoc())
            {?>
                <div class = "col-md-6">
                    <div class="main-iner">
                        <div class="row">
                            <div class="col-4">
                                <div class="image">
                                    <img src="img/travel.png", alt="">
                                </div>
                            </div>
                            <div class="col-8">
                                <div class="iner-titel">
                                    <h5>
                                        <?php echo $row["name_station"]?>
                                    </h5>
                                </div>
                                <div class="iner-text">
                                    <p>
                                        <?php
                                        echo "Время прибытия: " . $row["time_arrival"] . "<br> Время отправления: " . $row["time_departure"] . "<br> Дата отправления: " . $row["data_arrival"]. "<br> Дата прибытия: " . $row["data_departure"];
                                        ?>
                                    </p>
                                </div>
                                <div class="iner-ancro">
                                    <form class="form_changes_2" action="LocalDelete.php" method="POST">
                                        <input class="form__input_2" placeholder=" " type="text" name="ID_клиента"
                                               value="<?php echo $row['id_travel'];?>">
                                        <button class="form__button_2" type="submit" name="delete">Удалить</button>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <?php
            }
            ?>
        </div>
    </div>
</section>
<footer>

</footer>

<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
</body>
</html>
<?php
mysqli_close($conn);
?>
