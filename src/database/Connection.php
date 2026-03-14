<?php

class Database
{
    private static array $DBCONNECTIONS = [];

    public static function getConnection(string $db): PDO
    {

        if (!isset(self::$DBCONNECTIONS[$db])) {
            $dbConfig = require __DIR__ . '/../../config/db-config/DatabaseList.php';

            if (!isset($dbConfig[$db])) {
                throw new InvalidArgumentException("Database config '$db' not found");
            }

            $currentDatabase = $dbConfig[$db];
            $genericDsnConnection = "mysql:host={$currentDatabase['db_host']};dbname={$currentDatabase['db_name']};charset={$currentDatabase['db_charset']}";
            
            $handleDbConnectOptions = [
                PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION,
                PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_ASSOC,
                PDO::ATTR_EMULATE_PREPARES => false,
            ];

            self::$DBCONNECTIONS[$db] = new PDO(
                $genericDsnConnection,
                $currentDatabase['db_user'],
                $currentDatabase['db_password'],
                $handleDbConnectOptions,
            );
    
        };

        return self::$DBCONNECTIONS[$db];
    }

};