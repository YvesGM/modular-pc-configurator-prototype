<?php

require_once __DIR__ . '/../repositories/ConfiguratorRepository.php';

abstract class ConfiguratorService extends ConfiguratorRepository
{
    protected CompatibilityService $compatibilityService;
    // protected PricingService $pricingService;

    public function __construct()
    {
        $this->compatibilityService = new CompatibilityService();
        // $this->pricingService = new PricingService();
    }
}