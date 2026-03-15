<?php

require_once __DIR__ . '/../ConfiguratorRepository.php';

class CompCategoryRepository extends ConfiguratorRepository
{
    // Get all Component Categories
    public function getAllComponentCategories(): array
    {
        $allCategories = $this->CONFIGURATOR_DB->query("
            SELECT id, name, description
            FROM component_categories
        ");

        return $allCategories->fetchAll();
    }
}