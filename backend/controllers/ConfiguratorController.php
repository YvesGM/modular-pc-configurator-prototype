<?php

require_once __DIR__ . '/../services/ConfiguratorService.php';

class ConfiguratorController
{
    private ConfiguratorService $configuratorService;

    public function __construct()
    {
        $this->configuratorService = new ConfiguratorService();
    }

    public function buildConfiguration(
        array $componentIds,
        string $currency = 'EUR',
        ?string $promoCode = null
    ): array {
        return $this->configuratorService->buildConfiguration(
            $componentIds,
            $currency,
            $promoCode
        );
    }
}