<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">

    <title>PC Configurator</title>

    <link rel="stylesheet" href="assets/css/style.css">
    <link rel="stylesheet" href="assets/css/layout/header.css">
    <link rel="stylesheet" href="assets/css/layout/main.css">
    <link rel="stylesheet" href="assets/css/layout/footer.css">
    <link rel="stylesheet" href="assets/css/ui/buttons.css">
</head>

<body>

    <header>
        <h1>PC Configurator</h1>
    </header>

    <main>

        <div class="configurator" id="configurator">
        </div>

        <div id="output" class="output_box"></div>

    </main>

    <footer>

    </footer>

    <script type="module" src="frontend/init/initializeConfigurator.js"></script>
    <script type="module" src="frontend/expert-mode/api/results/sendConfig.js"></script>

</body>

</html>