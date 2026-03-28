<?php

require_once __DIR__ . '/../DatabaseRepoConnections.php';

class PromotionsRepository extends DatabaseRepoConnections {

 public function getAllPromotions(): array
 {
    $allPromotions = $this->CONFIGURATOR_DB->query("
        SELECT
            p.*
        FROM promotions p
    ");

    return $allPromotions->fetchAll();
 }

 public function getPromotionByCode(string $code): ?array
    {
        $selectedPromotions = $this->CONFIGURATOR_DB->prepare("
            SELECT 
                p.* 
            FROM promotions p
            WHERE code = :code AND active = 1
        ");

        $this->bindAndExecute($selectedPromotions, [
            ':code' => $code
        ]);

        return $selectedPromotions->fetch() ?: null;
    }

    public function applyPromotion(float $basicPrice, array $promotion): float
    {
        if ($promotion['type'] === 'percentage') {
            return $basicPrice * (1 - ($promotion['value'] / 100));
        }

        if ($promotion['type'] === 'fixed') {
            return max(0, $basicPrice - $promotion['value']);
        }

        return $basicPrice;
    }

}