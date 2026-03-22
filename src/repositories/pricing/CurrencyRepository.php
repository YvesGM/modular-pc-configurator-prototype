<?php

require_once __DIR__ . '/../DatabaseRepoConnections.php';

class CurrencyRepository extends DatabaseRepoConnections
{

    public function getAllCurrencies(): array
    {
        $currencyDBData = $this->CONFIGURATOR_DB->query("
        SELECT
            cur.*
        FROM currencies cur
    ");

        return $currencyDBData->fetchAll();
    }

    public function getCurrencyById(int $id): array {
        if ($id <= 0) {
            throw new Exception("(Currency ID cannot be 0 or negative! [$id])");
        }

        $currencyDBData = $this->CONFIGURATOR_DB->prepare("
            SELECT
                cur.*
            FROM currencies cur
            WHERE id = :id
        ");

        $this->bindAndExecute($currencyDBData, [
            ':id' => $id
        ]);

        $currencySymbol = $currencyDBData->fetch();

        if (!$currencySymbol) {
            throw new Exception("(No currency found for ID: [$id])");
        }
        return $currencySymbol;
    }

    public function getCurrencyByCode(string $code): array
    {
        $currencyDBData = $this->CONFIGURATOR_DB->prepare("
        Select
            cur.*
        FROM currencies cur WHERE code = :code 
    ");

        $this->bindAndExecute($currencyDBData, [
            ":code" => $code
        ]);

        return $currencyDBData->fetch();
    }

    public function getCurrencyCodeById(int $id): string
    {
        if ($id <= 0) {
            throw new Exception("(Currency ID cannot be 0 or negative! [$id])");
        }

        $selectedComponentCurrency = $this->CONFIGURATOR_DB->prepare("
        SELECT 
            cur.code
        FROM currencies cur
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