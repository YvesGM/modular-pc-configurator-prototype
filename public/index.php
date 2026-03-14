<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>Modular PC Configurator</title>

</head>

<body>

    <?php
    require_once __DIR__ . '/../src/database/Connection.php';

    $pcConfDB = Database::getConnection('pcConfigurator');
    $testDB = Database::getConnection('testDatabase');

    if ($pcConfDB instanceof PDO) {
        echo "pcConfigurator Database connected successfully <br>";
    }
    if ($testDB instanceof PDO) {
        echo "testDatabase Database connected successfully";
    }
    ?>

</body>

</html>