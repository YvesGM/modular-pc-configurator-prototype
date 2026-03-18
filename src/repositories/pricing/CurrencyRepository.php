<?php

require_once __DIR__ . '/../DatabaseRepoConnections.php';

class CurrencyRepository extends DatabaseRepoConnections {

 public function getAllCurrencies(): array
 {
    $allCurrencies = $this->CONFIGURATOR_DB->query("
        SELECT
            cur.*
        FROM currencies cur
    ");

    return $allCurrencies->fetchAll();
 }

 public function getCurrencyByCode(string $code): array
 {
    $selectedCurCodes = $this->CONFIGURATOR_DB->prepare("
        Select
            curC.*
        FROM currencies curC WHERE code = :code 
    ");

    $this->bindAndExecute($selectedCurCodes, [
        ":code"=> $code
    ]);

    return $selectedCurCodes->fetch();
 }

 public function convertCurrency(float $amount, string $from, string $to): float
 {
    $fromCur = $this->getCurrencyByCode($from);
    $toCur = $this->getCurrencyByCode($to);

    $baseAmount = $amount / $fromCur['exchange_rate'];
    return $baseAmount * $toCur['exchange_rate'];
 }

}