<?php

require_once __DIR__ . '/../DatabaseRepoConnections.php';

class ComponentsRepository extends DatabaseRepoConnections
{
    // All Compontents
    public function getAllComponents(): array
    {
        $allComponents = $this->CONFIGURATOR_DB->query("
            SELECT
                c.*,
                ct.name AS component_type,
                cc.name AS component_category
            FROM components c
            JOIN component_types ct ON c.type_id = ct.id
            JOIN component_categories cc ON ct.category_id = cc.id
        ");

        return $allComponents->fetchAll();
    }

    // Components by ID
    public function getComponentById(int $componentId): array
    {   

        if ($componentId <= 0) {
            throw new Exception("(The Component ID cannot be 0 or negative! [$componentId])");
        };

        $selectedComponent = $this->CONFIGURATOR_DB->prepare("
            SELECT 
                c.id,
                c.name,
                c.brand,
                c.model,
                c.net_price,
                c.currency_id,
                c.tax_class_id,
                c.description,
                c.created_at,
                c.updated_at,
                ct.name AS component_type,
                cc.name AS component_category,
                c.type_id,
                cc.id AS category_id
            FROM components c
            JOIN component_types ct ON c.type_id = ct.id
            JOIN component_categories cc ON ct.category_id = cc.id
            WHERE c.id = :id
        ");

        $this->bindAndExecute($selectedComponent, [
            'id' => $componentId
        ]);

        $fetchedComponent = $selectedComponent->fetch();

        if (empty($fetchedComponent)) {
            throw new Exception(
                "(There is no existing Component with the ID: [$componentId])"
            );
        };

        return $fetchedComponent;
    }

    // Components by multiple ID`s
    public function getComponentsByMultipleIds(array $componentIds): array
    {
        if (empty($componentIds)) {
            throw new Exception("(No Id`s selected!)");
        }

        foreach ($componentIds as $id) {
            if (!is_int($id) || $id <= 0) {
                throw new Exception(
                    "(All component IDs must be positive integers)");
            }
        }

        $selectedIds = implode(',', array_fill(0, count($componentIds), '?'));
        $selectedComponents = $this->CONFIGURATOR_DB->prepare("
            SELECT 
                c.*,
                ct.name AS component_type,
                cc.name AS component_category
            FROM components c
            JOIN component_types ct ON c.type_id = ct.id
            JOIN component_categories cc ON ct.category_id = cc.id
            WHERE c.id IN ($selectedIds)
        ");
        $selectedComponents->execute($componentIds);
        $fetchedComponents = $selectedComponents->fetchAll();

        if (empty($fetchedComponents)) {
            throw new Exception(
                "(No components found for all IDs: (" . implode(', ', $componentIds) . "))"
            );
        }

        if (count($fetchedComponents) < count($componentIds)) {
            $foundIds = array_column($fetchedComponents, 'id');
            $missingIds = array_diff($componentIds, $foundIds);

            if (count($missingIds) > 0) {
                throw new Exception(
                    "(Ids: " . "(" . implode(', ', $missingIds) . ")" . " not found!)"
                );
            }
        }

        return $fetchedComponents;
    }

    // Components by Type
    public function getComponentsByType(string $componentType): array
    {
        if ($componentType === "") {
            throw new Exception("(No Type value selected!)");
        }
        
        $selectedType = $this->CONFIGURATOR_DB->prepare("
            SELECT 
                c.*,
                ct.name AS components_type,
                cc.name AS component_category
            FROM components c
            JOIN component_types ct ON c.type_id = ct.id
            JOIN component_categories cc ON ct.category_id = cc.id
            WHERE ct.name = :components_type
        ");

        $this->bindAndExecute($selectedType, [
            ':components_type' => $componentType
        ]);

        $fetchedComponents = $selectedType->fetchAll();

        if (empty($fetchedComponents)) {
            throw new Exception(
                "(There is no existing Component-Type like: $componentType)"
            );
        }

        return $fetchedComponents;
    }

    // Components by Category
    public function getComponentsByCategory(string $componentCategory): array
    {
        if ($componentCategory === "") {
            throw new Exception("(No Category value selected!)");
        }

        $selectedCategory = $this->CONFIGURATOR_DB->prepare("
            SELECT 
                c.*,
                ct.name AS component_type,
                cc.name AS component_category
            FROM components c
            JOIN component_types ct ON c.type_id = ct.id
            JOIN component_categories cc ON ct.category_id = cc.id
            WHERE cc.name = :components_category
        ");

        $this->bindAndExecute($selectedCategory, [
            ':components_category' => $componentCategory
        ]);

        $fetchedComponents = $selectedCategory->fetchAll();

        if (empty($fetchedComponents)) {
            throw new Exception(
                "(There are no components for $componentCategory or it`s not existing!)"
            );
        }

        return $fetchedComponents;
    }
}