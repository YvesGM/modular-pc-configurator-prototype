<?php

require_once __DIR__ . '/../DatabaseRepoConnections.php';

class TaxRepository extends DatabaseRepoConnections
{
    public function getTaxRateByClass(int $taxClassId): float
    {
        $selectedTax = $this->CONFIGURATOR_DB->prepare("
            SELECT 
                tRate.rate
            FROM tax_rates tRate WHERE tRate.tax_class_id = :id
        ");

        $this->bindAndExecute($selectedTax, [
            ':id' => $taxClassId
        ]);

        $result = $selectedTax->fetch();

        return (float)$result['rate'];
    }

    public function applyTax(float $basicPrice, float $taxRate): float
    {
        return $basicPrice * (1 + ($taxRate / 100));
    }

    public function getTaxClasses(): array {
        $taxClasses = $this->CONFIGURATOR_DB->query("
            SELECT
                tc.*,
            FROM tax_classes tc
        ");

        return $taxClasses->fetchAll();
    }
}