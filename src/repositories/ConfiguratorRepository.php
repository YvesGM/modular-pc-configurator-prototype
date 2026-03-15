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
        foreach ($variables as $name => $value) {
            $pdo->bindValue($name, $value, PDO::PARAM_STR);
        }
        $pdo->execute();
    }
}