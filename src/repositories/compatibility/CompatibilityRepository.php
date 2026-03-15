<?php

require_once __DIR__ . '/../ConfiguratorRepository.php';

class CompatibilityRepository extends ConfiguratorRepository
{
    // Get All Compatibility Rules
    public function getAllRules(): array
    {
        $allCompatibilityRules = $this->CONFIGURATOR_DB->query("
            SELECT *
            FROM compatibility_rules
        ");

        return $allCompatibilityRules->fetchAll();
    }

    public function getRulesForComponentType(string $componentType): array
    {
        $selectedRules = $this->CONFIGURATOR_DB->prepare("
            SELECT cr.*
            FROM compatibility_rules cr
            JOIN component_types ctA ON cr.component_type_a = ctA.id
            JOIN component_types ctB ON cr.component_type_b = ctB.id
            WHERE ctA.name = :typeA
               OR ctB.name = :typeB
        ");

        $this->bindAndExecute($selectedRules, [
            ':typeA' => $componentType,
            ':typeB' => $componentType
        ]);

        return $selectedRules->fetchAll();
    }

    public function getRulesBetweenComponentTypes(string $typeA, string $typeB): array
    {
        $typeAId = $this->getTypeId($typeA);
        $typeBId = $this->getTypeId($typeB);

        $selectedRules = $this->CONFIGURATOR_DB->prepare("
                SELECT
                cr.id,
                cr.component_type_a,
                cr.component_type_b,
                ctA.name AS type_a_name,
                ctB.name AS type_b_name,
                adA.attribute_name AS attribute_a,
                adB.attribute_name AS attribute_b,
                cr.rule_type,
                cr.description
            FROM compatibility_rules cr
            JOIN component_types ctA ON cr.component_type_a = ctA.id
            JOIN component_types ctB ON cr.component_type_b = ctB.id
            JOIN attribute_definitions adA 
                ON cr.attribute_a = adA.id
            JOIN attribute_definitions adB 
                ON cr.attribute_b = adB.id
            WHERE 
                (cr.component_type_a = :typeA1 AND cr.component_type_b = :typeB1)
            OR
                (cr.component_type_a = :typeB2 AND cr.component_type_b = :typeA2)
        ");

        $this->bindAndExecute($selectedRules, [
            ':typeA1' => $typeAId,
            ':typeB1' => $typeBId,
            ':typeB2' => $typeBId,
            ':typeA2' => $typeAId
        ]);

        return $selectedRules->fetchAll();
    }

    private function getTypeId(string $typeName): int
    {
        $selectedTypeId = $this->CONFIGURATOR_DB->prepare("
            SELECT id
            FROM component_types
            WHERE name = :name
        ");

        $selectedTypeId->execute([
            ':name' => $typeName
        ]);

        $result = $selectedTypeId->fetch();

        if (!$result) {
            throw new Exception("Component type '$typeName' not found.");
        }

        return (int) $result['id'];
    }

    public function getRulesForComponentAttribute(string $attribute): array
    {
        $selectedRules = $this->CONFIGURATOR_DB->prepare("
            SELECT cr.* 
            FROM compatibility_rules cr
            JOIN attribute_definitions adA ON cr.attribute_a = adA.id
            JOIN attribute_definitions adB ON cr.attribute_b = adB.id
            WHERE adA.attribute_name = :attrA
               OR adB.attribute_name = :attrB
        ");

        $this->bindAndExecute($selectedRules, [
            ':attrA' => $attribute,
            ':attrB' => $attribute
        ]);

        return $selectedRules->fetchAll();
    }

    public function getRulesByOperator(string $operator): array
    {
        $selectedOperator = $this->CONFIGURATOR_DB->prepare("
            SELECT *
            FROM compatibility_rules
            WHERE rule_type = :operator
        ");

        $this->bindAndExecute($selectedOperator, [
            ':operator' => $operator
        ]);

        return $selectedOperator->fetchAll();
    }
}