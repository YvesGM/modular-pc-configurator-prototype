<?php
$env = parse_ini_file(__DIR__ . '/.env');

if (!$env) {
    die("ENV file not found or invalid");
}

$host = $env["DB_HOST"] ?? null;
$user = $env["DB_USER"] ?? null;
$password = $env["DB_PASS"] ?? null;
$dbname = $env["DB_NAME"] ?? null;

return [ 
    'pcConfigurator' => [
        'db_host' => 'localhost',
        'db_name' => 'modular-pc-configurator',
        'db_user' => 'root',
        'db_password' => '',
        'db_charset' => 'utf8mb4'
    ],

    'allInklDB' => [
        'db_host' => $host,
        'db_name' => $dbname,
        'db_user' => $user,
        'db_password' => $password,
        'db_charset' => 'utf8mb4'
    ]
];