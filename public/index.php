<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <title>PC Configurator</title>

    <link rel="stylesheet" href="assets/css/style.css">
</head>

<body>

    <div class="container">

        <h1>PC Configurator</h1>

        <div class="config-box">
            <label>Components</label>

            <div id="component-container"></div>

            <hr>

            <h3>Selected Components</h3>
            <div id="selected-container"></div>

            <br>

            <button onclick="sendConfig()">Check Configuration</button>
        </div>

        <div id="output" class="output-box"></div>

    </div>

    <script type="module" src="assets/js/configurator/components.js"></script>
    <script src="assets/js/configurator/api/sendConfig.js"></script>

</body>

</html>