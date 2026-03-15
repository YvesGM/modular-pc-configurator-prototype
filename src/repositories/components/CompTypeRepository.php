<?php

require_once __DIR__ . '/../ConfiguratorRepository.php';

class CompTypeRepository extends ConfiguratorRepository
{
    // All Component Types
    public function getAllComponentTypes(): array
    {
        $allComponentTypes = $this->CONFIGURATOR_DB->query("
            SELECT id, name, description
            FROM component_types
        ");

        return $allComponentTypes->fetchAll();
    }

    // Get Types by Category
    public function getTypesByCategory(string $category): array
    {
        $selectedCategoryTypes = $this->CONFIGURATOR_DB->prepare("
           SELECT ct.*
            FROM component_types ct
            JOIN component_categories cc
            ON ct.category_id = cc.id
            WHERE cc.name = :category
        ");

        $selectedCategoryTypes->execute([
            'category' => $category
        ]);

        return $selectedCategoryTypes->fetchAll();
    }
}