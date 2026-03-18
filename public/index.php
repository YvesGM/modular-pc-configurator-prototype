<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>Modular PC Configurator</title>

</head>

<body>

    <?php
    require_once __DIR__ . '/../src/controllers/ConfiguratorController.php';

    $controller = new ConfiguratorController();

    $_POST = [
        'componentIds' => [1, 24, 80],
        'currency' => 'EUR',
        'promoCode' => null
    ];

    $controller->run();
    ?>

</body>

</html>