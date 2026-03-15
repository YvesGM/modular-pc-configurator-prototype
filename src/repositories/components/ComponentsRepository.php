<?php

require_once __DIR__ . '/../ConfiguratorRepository.php';

class ComponentsRepository extends ConfiguratorRepository
{
    // All Compontents
    public function getAllComponents(): array
    {
        $allComponents = $this->CONFIGURATOR_DB->query("
            SELECT
                c.*,
                ct.name AS component_type
            FROM components c
            JOIN component_types ct ON c.type_id = ct.id
        ");

        return $allComponents->fetchAll();
    }

    // Components by ID
    public function getComponentById(int $componentId): array
    {   

        if (!is_int($componentId) || $componentId <= 0) {
            throw new Exception("The Component ID must be positive integers");
        };

        $currentComponent = $this->CONFIGURATOR_DB->prepare("
            SELECT 
                c.*,
                ct.name AS component_type
            FROM components c
            JOIN component_types ct ON c.type_id = ct.id
            WHERE c.id = :id
        ");

        $currentComponent->execute([
            'id' => $componentId
        ]);

        $fetchedComponent = $currentComponent->fetch();

        if (empty($fetchedComponent)) {
            throw new Exception(
                "There is no existing Component with the ID: ($componentId)"
            );
        };

        return $fetchedComponent;
    }

    // Components by multiple ID`s
    public function getComponentsByMultipleIds(array $componentIds): array
    {
        if (empty($componentIds)|| !is_array($componentIds) ) {
            throw new Exception("There is no array or array is empty");
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
                "No components found for all IDs: " . implode(', ', $componentIds)
            );
        }

        if (count($fetchedComponents) < count($componentIds)) {
            $foundIds = array_column($fetchedComponents, 'id');
            $missingIds = array_diff($componentIds, $foundIds);

            if (count($missingIds) > 0) {
                throw new Exception(
                    "Ids: " . "(".implode(', ', $missingIds).")" . " not found"
                );
            }
        }

        return $fetchedComponents;
    }

    // Components by Type
    public function getComponentsByType($componentType): array
    {
        if (!is_string($componentType)) {
            throw new Exception("Component Type has to be a string");
        }

        if ($componentType === "") {
            throw new Exception("No Type value selected!");
        }
        
        $selectedType = $this->CONFIGURATOR_DB->prepare("
            SELECT 
                c.*,
                ct.name AS components_type
            FROM components c
            JOIN component_types ct ON c.type_id = ct.id
            WHERE ct.name = :components_type
        ");

        $selectedType->execute([
            ':components_type' => $componentType
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
    public function getComponentsByCategory($componentCategory): array
    {
        if (!is_string($componentCategory)) {
            throw new Exception("Component Category has to be a string");
        }

        if ($componentCategory === "") {
            throw new Exception("No Category value selected!");
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

        $selectedCategory->execute([
            ':components_category' => $componentCategory
        ]);

        $fetchedComponents = $selectedCategory->fetchAll();

        if (empty($fetchedComponents)) {
            throw new Exception(
                "There are no components for $componentCategory or it`s not existing!"
            );
        }

        return $fetchedComponents;
    }
}