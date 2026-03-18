<?php

require_once __DIR__ . '/../repositories/ConfiguratorRepository.php';

class PricingService extends ConfiguratorRepository
{

    public function __construct()
    {
        parent::__construct();
    }

    public function calculateConfigurationPrice(
        array $componentIds,
        string $targetCurrency = 'EUR',
        ?string $promoCode = null
    ): array {
        $components = $this->componentsRepository->getComponentsByMultipleIds($componentIds);

        $netPrice = 0;
        $totalPrice = 0;

        foreach ($components as $component) {

            $net = (float) $component['net_price'];

            $taxRate = $this->taxRepository->getTaxRateByClass(
                (int) $component['tax_class_id']
            );

            $total = $this->taxRepository->applyTax($net, $taxRate);

            // Currency conversion
            $total = $this->currencyRepository->convertCurrency(
                $total,
                $this->currencyRepository->getCurrencyCodeById($component['currency_id']),
                $targetCurrency
            );

            $netPrice += $net;
            $totalPrice += $total;
        }

        // Promotion
        if ($promoCode) {
            $promotion = $this->promotionsRepository->getPromotionByCode($promoCode);

            if ($promotion) {
                $totalPrice = $this->promotionsRepository->applyPromotion($totalPrice, $promotion);
            }
        }

        return [
            'net_total' => $netPrice,
            'gross_total' => $totalPrice,
            'currency' => $targetCurrency
        ];
    }
}