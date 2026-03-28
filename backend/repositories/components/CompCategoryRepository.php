<?php

require_once __DIR__ . '/../DatabaseRepoConnections.php';

class CompCategoryRepository extends DatabaseRepoConnections
{
    public function getAllComponentCategories(): array
    {
        $allCategories = $this->CONFIGURATOR_DB->query("
            SELECT 
                cc.*
            FROM component_categories cc
        ");

        return $allCategories->fetchAll();
    }
}