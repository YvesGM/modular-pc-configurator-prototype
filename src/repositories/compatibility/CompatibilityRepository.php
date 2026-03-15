<?php

require_once __DIR__ . '/../DatabaseRepoConnections.php';

class CompatibilityRepository extends DatabaseRepoConnections
{
    // Get All Compatibility Rules
    public function getAllRules(): array
    {
        $allCompatibilityRules = $this->CONFIGURATOR_DB->query("
            SELECT 
                cr.id,
                cr.description,
                ctA.name AS type_a_name,
                ctB.name AS type_b_name,
                cr.component_type_a AS type_a_id,
                cr.component_type_b AS type_b_id,
                adA.attribute_name AS attribute_a_name,
                adB.attribute_name AS attribute_b_name,
                cr.attribute_a AS attribute_a_id,
                cr.attribute_b AS attribute_b_id,
                cr.rule_type,
                cr.created_at,
                cr.updated_at
            FROM compatibility_rules cr
            JOIN component_types ctA ON cr.component_type_a = ctA.id
            JOIN component_types ctB ON cr.component_type_b = ctB.id
            JOIN attribute_definitions adA ON cr.attribute_a = adA.id
            JOIN attribute_definitions adB ON cr.attribute_b = adB.id
        ");

        return $allCompatibilityRules->fetchAll();
    }

    public function getRulesForComponentType(string $componentTypeName): array
    {
        $selectedRules = $this->CONFIGURATOR_DB->prepare("
            SELECT 
                cr.id,
                cr.description,
                ctA.name AS type_a_name,
                ctB.name AS type_b_name,
                cr.component_type_a AS type_a_id,
                cr.component_type_b AS type_b_id,
                adA.attribute_name AS attribute_a_name,
                adB.attribute_name AS attribute_b_name,
                cr.attribute_a AS attribute_a_id,
                cr.attribute_b AS attribute_b_id,
                cr.rule_type,
                cr.created_at,
                cr.updated_at
            FROM compatibility_rules cr
            JOIN component_types ctA ON cr.component_type_a = ctA.id
            JOIN component_types ctB ON cr.component_type_b = ctB.id
            JOIN attribute_definitions adA ON cr.attribute_a = adA.id
            JOIN attribute_definitions adB ON cr.attribute_b = adB.id
            WHERE ctA.name = :typeNameA
               OR ctB.name = :typeNameB
        ");

        $this->bindAndExecute($selectedRules, [
            ':typeNameA' => $componentTypeName,
            ':typeNameB' => $componentTypeName
        ]);

        $fetchedRules = $selectedRules->fetchAll();

        if (empty($fetchedRules)) {
            throw new Exception(
                "(No rules for Component Type: [$componentTypeName] found!)"
            );
        }

        return $fetchedRules;
    }

    public function getRulesBetweenComponentTypes(string $typeNameA, string $typeNameB): array
    {
        if (empty($typeNameA) || empty($typeNameB)) {
            throw new Exception("(Both or one Type is not selected!)");
        }

        $typeAId = $this->getTypeId($typeNameA);
        $typeBId = $this->getTypeId($typeNameB);

        $selectedRules = $this->CONFIGURATOR_DB->prepare("
            SELECT
                cr.id,
                cr.description,
                ctA.name AS type_a_name,
                ctB.name AS type_b_name,
                cr.component_type_a AS type_a_id,
                cr.component_type_b AS type_b_id,
                adA.attribute_name AS attribute_a_name,
                adB.attribute_name AS attribute_b_name,
                cr.attribute_a AS attribute_a_id,
                cr.attribute_b AS attribute_b_id,
                cr.rule_type,
                cr.created_at,
                cr.updated_at
            FROM compatibility_rules cr
            JOIN component_types ctA ON cr.component_type_a = ctA.id
            JOIN component_types ctB ON cr.component_type_b = ctB.id
            JOIN attribute_definitions adA ON cr.attribute_a = adA.id
            JOIN attribute_definitions adB ON cr.attribute_b = adB.id
            WHERE 
                (cr.component_type_a = :typeIdA1 AND cr.component_type_b = :typeIdB1)
            OR
                (cr.component_type_a = :typeIdB2 AND cr.component_type_b = :typeIdA2)
        ");

        $this->bindAndExecute($selectedRules, [
            ':typeIdA1' => $typeAId,
            ':typeIdB1' => $typeBId,
            ':typeIdB2' => $typeBId,
            ':typeIdA2' => $typeAId
        ]);
        $fetchedRules = $selectedRules->fetchAll();

        if (empty($fetchedRules)) {
            throw new Exception(
                "(No rules for combination of Component Type: [$typeNameA] and [$typeNameB] found!)"
            );
        }

        return $fetchedRules;
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

        $fetchedId = $selectedTypeId->fetch();

        if (!$fetchedId) {
            throw new Exception("Component type '$typeName' not found.");
        }

        return (int) $fetchedId['id'];
    }

    public function getRulesForComponentAttribute($attributeName): array
    {

        if (!is_string($attributeName)) {
            throw new Exception("(Attribute value have to be a string!)");
        }

        if (empty($attributeName)) {
            throw new Exception("(No selected Attribute!)");
        }

        $selectedRules = $this->CONFIGURATOR_DB->prepare("
            SELECT 
                cr.id,
                cr.description,
                ctA.name AS type_a_name,
                ctB.name AS type_b_name,
                cr.component_type_a AS type_a_id,
                cr.component_type_b AS type_b_id,
                adA.attribute_name AS attribute_a_name,
                adB.attribute_name AS attribute_b_name,
                cr.attribute_a AS attribute_a_id,
                cr.attribute_b AS attribute_b_id,
                cr.rule_type,
                cr.created_at,
                cr.updated_at
            FROM compatibility_rules cr
            JOIN component_types ctA ON cr.component_type_a = ctA.id
            JOIN component_types ctB ON cr.component_type_b = ctB.id
            JOIN attribute_definitions adA ON cr.attribute_a = adA.id
            JOIN attribute_definitions adB ON cr.attribute_b = adB.id
            WHERE adA.attribute_name = :attrNameA
               OR adB.attribute_name = :attrNameB
        ");

        $this->bindAndExecute($selectedRules, [
            ':attrNameA' => $attributeName,
            ':attrNameB' => $attributeName
        ]);

        return $selectedRules->fetchAll();
    }

    public function getRulesByOperator(string $operator): array
    {
        $selectedOperator = $this->CONFIGURATOR_DB->prepare("
            SELECT 
                cr.id,
                cr.description,
                ctA.name AS type_a_name,
                ctB.name AS type_b_name,
                cr.component_type_a AS type_a_id,
                cr.component_type_b AS type_b_id,
                adA.attribute_name AS attribute_a_name,
                adB.attribute_name AS attribute_b_name,
                cr.attribute_a AS attribute_a_id,
                cr.attribute_b AS attribute_b_id,
                cr.rule_type,
                cr.created_at,
                cr.updated_at
            FROM compatibility_rules cr
            JOIN component_types ctA ON cr.component_type_a = ctA.id
            JOIN component_types ctB ON cr.component_type_b = ctB.id
            JOIN attribute_definitions adA ON cr.attribute_a = adA.id
            JOIN attribute_definitions adB ON cr.attribute_b = adB.id
            WHERE rule_type = :operator
        ");

        $this->bindAndExecute($selectedOperator, [
            ':operator' => $operator
        ]);

        return $selectedOperator->fetchAll();
    }
}