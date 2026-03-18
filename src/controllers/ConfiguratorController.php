<?php

require_once __DIR__ . '/../services/ConfiguratorService.php';

class ConfiguratorController
{
    private ConfiguratorService $configurator;

    public function __construct()
    {
        $this->configurator = new ConfiguratorService();
    }

    public function run(): void
    {
        try {

            // INPUT
            $componentIds = $_POST['componentIds'] ?? [];
            $currency = $_POST['currency'] ?? 'EUR';
            $promoCode = $_POST['promoCode'] ?? null;

            if (!is_array($componentIds)) {
                throw new Exception("(componentIds must be array)");
            }

            $result = $this->configurator->buildConfiguration(
                $componentIds,
                $currency,
                $promoCode
            );

            echo "<pre>";
            print_r($result);

        } catch (Exception $e) {

            echo "<pre>";
            echo "ERROR: " . $e->getMessage();
        }
    }
}