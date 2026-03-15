<?php

require_once __DIR__ . '/../ConfiguratorRepository.php';

class ComponentsRepository extends ConfiguratorRepository
{
    // All Compontents
    public function getAllComponents(): array
    {
        $allComponents = $this->CONFIGURATOR_DB->query("
            SELECT
                c.id,
                c.name,
                c.brand,
                c.model,
                c.net_price,
                c.currency_id,
                c.description,
                c.created_at,
                c.updated_at,
                ct.name AS component_type
            FROM components c
            JOIN component_types ct ON c.type_id = ct.id
        ");

        return $allComponents->fetchAll();
    }

    // Components by ID
    public function getComponentById(int $componentId): array
    {
        $currentComponent = $this->CONFIGURATOR_DB->prepare("
            SELECT *
            FROM components
            WHERE id = :id
        ");

        $currentComponent->execute([
            'id' => $componentId
        ]);

        $fetchedComponents = $currentComponent->fetch();

        if (empty($fetchedComponents)) {
            throw new Exception(
                "There is no existing Component with the ID: ($componentId)"
            );
        }

        return $fetchedComponents;
    }

    // Components on multiple ID`s
    public function getComponentsByMultipleIds(array $componentIds): array
    {
        if (empty($componentIds)) {
            throw new Exception("Component IDs array cannot be empty");
        }
        foreach ($componentIds as $id) {
            if (!is_int($id) || $id <= 0) {
                throw new Exception("All component IDs must be positive integers");
            }
        }

        $idList = implode(',', array_fill(0, count($componentIds), '?'));
        $selectedComponents = $this->CONFIGURATOR_DB->prepare("
            SELECT *
            FROM components
            WHERE id IN ($idList)
        ");
        $selectedComponents->execute($componentIds);
        $fetchedComponents = $selectedComponents->fetchAll();

        if (empty($fetchedComponents)) {
            throw new Exception(
                "No components found for IDs: " . implode(', ', $componentIds)
            );
        }

        if (count($fetchedComponents) < count($componentIds)) {
            $foundIds = array_column($fetchedComponents, 'id');
            $missingIds = array_diff($componentIds, $foundIds);

            if (count($missingIds) > 0) {
                throw new Exception(
                    "Ids: " . implode(', ', $missingIds) . " not found"
                );
            }
        }

        return $fetchedComponents;
    }

    // Components by Type
    public function getComponentsByType(string $componentType): array
    {
        $selectedType = $this->CONFIGURATOR_DB->prepare("
            SELECT 
                c.id,
                c.name,
                c.brand,
                c.model,
                c.net_price,
                c.currency_id,
                c.description,
                c.created_at,
                c.updated_at
            FROM components c
            JOIN component_types ct ON c.type_id = ct.id
            WHERE ct.name = :type
        ");

        $selectedType->execute([
            'type' => $componentType
        ]);

        $fetchedComponents = $selectedType->fetchAll();

        if (empty($fetchedComponents)) {
            throw new Exception(
                "There is no existing Component-Type like: $componentType"
            );
        }

        return $fetchedComponents;
    }

    // Components by Category
    public function getComponentsByCategory(string $category): array
    {
        $selectedCategory = $this->CONFIGURATOR_DB->prepare("
            SELECT 
                c.id,
                c.name,
                c.brand,
                c.model,
                c.net_price,
                c.currency_id,
                c.description,
                c.created_at,
                c.updated_at,
                ct.name AS type,
                cc.name AS category
            FROM components c
            JOIN component_types ct ON c.type_id = ct.id
            JOIN component_categories cc ON ct.category_id = cc.id
            WHERE cc.name = :category
        ");

        $selectedCategory->execute([
            'category' => $category
        ]);

        $fetchedComponents = $selectedCategory->fetch();

        if (empty($fetchedComponents)) {
            throw new Exception(
                "There are no components for $category or it`s not existing!"
            );
        }

        return $fetchedComponents;
    }
}