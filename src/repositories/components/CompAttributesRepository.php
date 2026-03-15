<?php

require_once __DIR__ . '/../ConfiguratorRepository.php';

class CompAttributesRepository extends ConfiguratorRepository 
{
    public function __construct()
    {
        parent::__construct();
    }

    // Get all Attributes
    public function getAllAttributes(): array
    {
        $allAttributes = $this->CONFIGURATOR_DB->query("
            SELECT id, attribute_name, attribute_unit
            FROM attribute_definitions
        ");

        return $allAttributes->fetchAll();
    }

    // Attributes of an Component
    public function getComponentAttributes(int $componentId): array
    {
        $allAttributesOfComponent = $this->CONFIGURATOR_DB->prepare("
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
}