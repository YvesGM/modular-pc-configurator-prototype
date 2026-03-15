<?php

require_once __DIR__ . '/../database/Connection.php';

abstract class ConfiguratorRepository
{
    protected PDO $CONFIGURATOR_DB;

    public function __construct()
    {
        $this->CONFIGURATOR_DB = Database::getConnection('pcConfigurator');
    }

    protected function bindAndExecute(PDOStatement $pdo, array $variables): void
    {
        foreach ($variables as $key => $value) {
            
            $type = match (true) {
                is_int($value) => PDO::PARAM_INT,
                is_bool($value) => PDO::PARAM_BOOL,
                is_null($value) => PDO::PARAM_NULL,
                default => PDO::PARAM_STR,
            };
            
            $pdo->bindValue($key, $value, $type);
        }
        $pdo->execute();
    }
}