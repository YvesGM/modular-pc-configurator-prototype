<?php

spl_autoload_register(function ($class) {

    $baseDir = __DIR__ . '/';

    $paths = [
        'database/',
        'repositories/',
        'repositories/compatibility/',
        'repositories/components/',
        'repositories/pricing/',
        'services/',
        'controllers/',
        'components/'
    ];

    foreach ($paths as $path) {

        $file = $baseDir . $path . $class . '.php';

        if (file_exists($file)) {
            require_once $file;
            return;
        }
    }
});