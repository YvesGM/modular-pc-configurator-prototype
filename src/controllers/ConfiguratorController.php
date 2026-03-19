<?php

require_once __DIR__ . '/../services/ConfiguratorService.php';

class ConfiguratorController
{
    private ConfiguratorService $configurator;

    public function __construct()
    {
        $this->configurator = new ConfiguratorService();
    }

    public function buildConfiguration(
        array $componentIds,
        string $currency = 'EUR',
        ?string $promoCode = null
    ): array {
        return $this->configurator->buildConfiguration(
            $componentIds,
            $currency,
            $promoCode
        );
    }
}