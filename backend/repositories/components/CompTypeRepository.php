<?php

require_once __DIR__ . '/../DatabaseRepoConnections.php';

class CompTypeRepository extends DatabaseRepoConnections
{
    public function getAllComponentTypes(): array
    {
        $allComponentTypes = $this->CONFIGURATOR_DB->query("
            SELECT 
                ct.*,
                cc.name AS type_category
            FROM component_types ct
            JOIN component_categories cc ON ct.category_id = cc.id
        ");

        return $allComponentTypes->fetchAll();
    }

    public function getTypesByCategory(string $category): array
    {
        if (empty($category)) {
            throw new Exception("(No Category selected!)");
        }

        $selectedCategoryTypes = $this->CONFIGURATOR_DB->prepare("
            SELECT 
                ct.*,
                cc.name AS category
            FROM component_types ct
            JOIN component_categories cc ON ct.category_id = cc.id
            WHERE cc.name = :type_category
        ");

        $selectedCategoryTypes->execute([
            ':type_category' => $category
        ]);

        return $selectedCategoryTypes->fetchAll();
    }
}