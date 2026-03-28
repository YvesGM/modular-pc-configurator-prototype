<?php

require_once __DIR__ . '/ComponentsService.php';
require_once __DIR__ . '/CompatibilityService.php';
require_once __DIR__ . '/PricingService.php';
require_once __DIR__ . '/../repositories/ConfiguratorRepository.php';

class ConfiguratorService extends ConfiguratorServiceBase
{
    public function __construct()
    {
        parent::__construct();
    }

    public function buildConfiguration(
        array $componentIds,
        string $currency = 'EUR',
        ?string $promoCode = null
    ): array {

        if (empty($componentIds)) {
            throw new Exception("(No components selected)");
        }

        $components = [];
        foreach ($componentIds as $id) {
            $components[] = $this->componentsService->getComponentWithAttributes($id);
        }

        $compatibilityChecks = $this->compatibilityService->validateConfiguration($componentIds);

        $isValid = true;
        foreach ($compatibilityChecks as $check) {
            if (!$check['is_compatible']) {
                $isValid = false;
                break;
            }
        }

        $pricing = $this->pricingService->calculateConfigurationPrice(
            $componentIds,
            $currency,
            $promoCode
        );

        return [
            'components' => $components,
            'compatibility' => [
                'is_valid' => $isValid,
                'checks' => $compatibilityChecks
            ],
            'pricing' => $pricing
        ];
    }
}

abstract class ConfiguratorServiceBase
{
    protected ComponentsService $componentsService;
    protected CompatibilityService $compatibilityService;
    protected PricingService $pricingService;

    public function __construct()
    {
        $this->compatibilityService = new CompatibilityService();
        $this->componentsService = new ComponentsService();
        $this->pricingService = new PricingService();
    }
}