<?php

require_once __DIR__ . '/../DatabaseRepoConnections.php';

class CurrencyRepository extends DatabaseRepoConnections
{

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
            ":code" => $code
        ]);

        return $selectedCurCodes->fetch();
    }

    public function getCurrencyCodeById(int $id): string
    {
        if ($id <= 0) {
            throw new Exception("(Currency ID cannot be 0 or negative! [$id])");
        }

        $selectedComponentCurrency = $this->CONFIGURATOR_DB->prepare("
        SELECT code
        FROM currencies
        WHERE id = :id
    ");

        $this->bindAndExecute($selectedComponentCurrency, [
            ':id' => $id
        ]);

        $fetchedComponentCurrency = $selectedComponentCurrency->fetch();

        if (!$fetchedComponentCurrency) {
            throw new Exception("(No currency found for ID: [$id])");
        }

        return $fetchedComponentCurrency['code'];
    }

    public function convertCurrency(float $amount, string $from, string $to): float
    {

        $fromCur = $this->getCurrencyByCode($from);
        $toCur = $this->getCurrencyByCode($to);

        if (!$fromCur || !$toCur) {
            throw new Exception("Invalid currency conversion [$from → $to]");
        }

        $baseAmount = $amount / $fromCur['exchange_rate'];
        return $baseAmount * $toCur['exchange_rate'];
    }

}