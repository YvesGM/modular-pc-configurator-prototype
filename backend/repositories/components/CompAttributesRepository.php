<?php

require_once __DIR__ . '/../DatabaseRepoConnections.php';

class CompAttributesRepository extends DatabaseRepoConnections
{
    public function getAllAttributes(): array
    {
        $allAttributes = $this->CONFIGURATOR_DB->query("
            SELECT 
                ad.* 
            FROM attribute_definitions ad
        ");

        return $allAttributes->fetchAll();
    }

    public function getComponentAttributes(int $componentId): array
    {
        if ($componentId <= 0) {
            throw new Exception("(The Component ID cannot be 0 or negative! [$componentId])");
        }
        ;

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

        return $fetchedAttributesOfSelectedComponent ?? [];
    }

    public function mappedComponentAttributes(int $componentId): array
    {
        $selectedAttributes = $this->getComponentAttributes($componentId);
        $Attributes = [];

        foreach ($selectedAttributes as $singleAttribute) {

            $name = $singleAttribute['attribute_name'];
            $value = $singleAttribute['attribute_value'];

            if (isset($Attributes[$name])) {

                if (!is_array($Attributes[$name])) {
                    $Attributes[$name] = [$Attributes[$name]];
                }
                
                if (!in_array($value, $Attributes[$name])) {
                    $Attributes[$name][] = $value;
                }

            } else {
                $Attributes[$name] = $value;
            }
        }

        return $Attributes;
    }
}