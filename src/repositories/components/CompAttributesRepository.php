<?php

require_once __DIR__ . '/../ConfiguratorRepository.php';

class CompAttributesRepository extends ConfiguratorRepository 
{
    private ComponentsRepository $components;
    public function __construct() {
        $this->components = new ComponentsRepository();
    }

    // Get all Attributes
    public function getAllAttributes(): array
    {
        $allAttributes = $this->components->CONFIGURATOR_DB->query("
            SELECT id, attribute_name, attribute_unit
            FROM attribute_definitions
        ");

        return $allAttributes->fetchAll();
    }

    // Attributes of an Component
    public function getComponentAttributes(int $componentId): array
    {
        $allAttributesOfComponent = $this->components->CONFIGURATOR_DB->prepare("
        SELECT 
            ad.attribute_name,
            ca.attribute_value
        FROM component_attributes ca
        JOIN attribute_definitions ad
            ON ca.attribute_id = ad.id
        WHERE ca.component_id = :componentId
    ");

        $allAttributesOfComponent->execute([
            'componentId' => $componentId
        ]);

        $fetchedAttributesOfComponent = $allAttributesOfComponent->fetchAll();
        if (empty($fetchedAttributesOfComponent)) {
            throw new Exception(
                "There are no attributes or components for ID: ($componentId)"
            );
        }

        return $fetchedAttributesOfComponent;
    }

    // Re-Mapping of Attribute
    public function mappedComponentAttributes(int $componentId): array
    {
        $selectedAttributes = $this->getComponentAttributes($componentId);
        $Attributes = [];

        foreach ($selectedAttributes as $singleAttribute) {
            $Attributes[$singleAttribute['attribute_name']] = $singleAttribute['attribute_value'];
        }

        return $Attributes;
    }

    // Component + Attribute
    public function getComponentWithAttributes(int $componentId): array|null
    {
        $selectedComponent = $this->components->getComponentById($componentId);
        $selectedComponent['attributes'] = $this->mappedComponentAttributes($componentId);

        return $selectedComponent;
    }
}