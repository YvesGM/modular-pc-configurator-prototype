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

        <div class="configurator">
            <div class="mode_switch">
                <button id="expert-btn">Expert Mode</button>
                <button id="simple-btn">Simple Mode</button>
            </div>
            <div>
                <label for="component-container">Components</label>
                <div class="component_container" id="component-container"></div>
                <hr>
                <h3>Selected Components</h3>
                <div id="selected-container" class="selected_container"></div>
            </div>

            <button onclick="sendConfig()">Check Configuration</button>

        </div>

        <div id="output" class="output_box"></div>

    </main>

    <footer>

    </footer>

    <script type="module" src="assets/js/configurator/init.js"></script>
    <script type="module" src="assets/js/configurator/api/sendConfig.js"></script>

</body>

</html>