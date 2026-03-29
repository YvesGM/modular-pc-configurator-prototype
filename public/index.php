<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">

    <title>PC Configurator</title>

    <link rel="stylesheet" href="frontend/assets/css/layout.css">
    <link rel="stylesheet" href="frontend/assets/css/style.css">
    <link rel="stylesheet" href="frontend/assets/css/layout/header.css">
    <link rel="stylesheet" href="frontend/assets/css/layout/main.css">
    <link rel="stylesheet" href="frontend/assets/css/layout/footer.css">
    <link rel="stylesheet" href="frontend/assets/css/expert-mode/components-expert.css">
    <link rel="stylesheet" href="frontend/assets/css/expert-mode/selections-expert.css">
    <link rel="stylesheet" href="frontend/assets/css/expert-mode/results-expert.css">
    <link rel="stylesheet" href="frontend/assets/css/expert-mode/ui/buttons.css">
    <link rel="stylesheet" href="frontend/assets/css/expert-mode/ui/text.css">
</head>

<body>
    <div class="bg_body"></div>

        <header>
            <div class="header_container">
                <img class="header_logo" src="frontend/assets/img/logo.png">
            </div>
        </header>

        <main>

            <div class="configurator" id="configurator">
            </div>

        </main>

        <footer>

        </footer>

    <script type="module" src="frontend/init/initializeConfigurator.js"></script>
    <script type="module" src="frontend/expert-mode/api/results/sendConfig.js"></script>

</body>

</html>