<?php

require_once __DIR__ . '/../database/Connection.php';

abstract class DatabaseRepoConnections
{
    protected PDO $CONFIGURATOR_DB;

    public function __construct()
    {
        $this->CONFIGURATOR_DB = Database::getConnection('pcConfigurator');
    }

    protected function bindAndExecute(PDOStatement $pdo, array $variables): void
    {
        foreach ($variables as $key => $value) {

            $charset = match (true) {
                is_int($value) => PDO::PARAM_INT,
                is_bool($value) => PDO::PARAM_BOOL,
                is_null($value) => PDO::PARAM_NULL,
                default => PDO::PARAM_STR,
            };

            $pdo->bindValue($key, $value, $charset);
        }

        $pdo->execute();
    }
}