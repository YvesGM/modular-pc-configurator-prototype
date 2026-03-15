<?php

require_once __DIR__ . '/../DatabaseRepoConnections.php';

class CompAttributesRepository extends DatabaseRepoConnections 
{
    // Get all Attributes
    public function getAllAttributes(): array
    {
        $allAttributes = $this->CONFIGURATOR_DB->query("
            SELECT 
                ad.* 
            FROM attribute_definitions ad
        ");

        return $allAttributes->fetchAll();
    }

    // Attributes of an Component
    public function getComponentAttributes(int $componentId): array
    {   
        if ($componentId <= 0) {
            throw new Exception("(The Component ID cannot be 0 or negative! [$componentId])");
        };

        $AttributesOfSelectedComponent = $this->CONFIGURATOR_DB->prepare("
        SELECT 
            ca.attribute_id,
            ad.attribute_name AS attribute_name,
            ca.attribute_value
        FROM component_attributes ca
        JOIN attribute_definitions ad ON ca.attribute_id = ad.id
        JOIN components c ON ca.component_id = c.id
        WHERE ca.component_id = :componentId
    ");

        $this->bindAndExecute($AttributesOfSelectedComponent, [
            ':componentId' => $componentId
        ]);

        $fetchedAttributesOfSelectedComponent = $AttributesOfSelectedComponent->fetchAll();
        
        if (empty($fetchedAttributesOfSelectedComponent)) {
            throw new Exception(
                "(There are no attributes or components for this ID [$componentId])"
            );
        }

        return $fetchedAttributesOfSelectedComponent;
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