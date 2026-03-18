<?php

require_once __DIR__ . '/../repositories/ConfiguratorRepository.php';
require_once __DIR__ . '/ComponentsService.php';

class CompatibilityService extends ConfiguratorRepository
{
    private ComponentsService $componentsService;

    public function __construct()
    {
        parent::__construct();
        $this->componentsService = new ComponentsService();
    }

    public function validateComponents(int $componentAId, int $componentBId): array
    {
        $compAId = $this->componentsService->getComponentWithAttributes($componentAId);
        $compBId = $this->componentsService->getComponentWithAttributes($componentBId);

        $ctypeA = $compAId['component_type'];
        $ctypeB = $compBId['component_type'];


        $rulesBetweenTypes = $this->compatibilityRepository->getRulesBetweenComponentTypes($ctypeA, $ctypeB);
        if (empty($rulesBetweenTypes)) {
            return [
                'is_compatible' => true,
                'rules_checked' => []
            ];
        }
        
        $validated = [];

        foreach ($rulesBetweenTypes as $TypeRule) {

            if ($TypeRule['type_a_name'] == $compAId['component_type']) {

                $valueA = $compAId['attributes'][$TypeRule['attribute_a_name']] ?? null;
                $valueB = $compBId['attributes'][$TypeRule['attribute_b_name']] ?? null;

            } else {

                $valueA = $compBId['attributes'][$TypeRule['attribute_a_name']] ?? null;
                $valueB = $compAId['attributes'][$TypeRule['attribute_b_name']] ?? null;

            }
            ;

            $passed = $this->evaluateRule(
                $TypeRule['rule_type'],
                $valueA,
                $valueB
            );

            $validated[] = [
                'rule_id' => $TypeRule['id'],
                'description' => $TypeRule['description'],
                'value_a' => $valueA,
                'value_b' => $valueB,
                'passed' => $passed ? true : false
            ];
        }

        return [
            'is_compatible' => !in_array(false, array_column($validated, 'passed'), true),
            'rules_checked' => $validated
        ];
    }

    private function evaluateRule(string $operator, $valueA, $valueB): bool
    {
        if ($valueA === null || $valueB === null) {
            return false;
        }

        switch ($operator) {

            case 'equals':
                return $this->compareEqual($valueA, $valueB);

            case 'greater':
                return (float) $valueA >= (float) $valueB;

            case 'less':
                return (float) $valueA <= (float) $valueB;

            default:
                throw new Exception("Unknown compatibility operator: $operator");
        }
    }

    private function compareEqual(string $valueA, string $valueB): bool
    {
        $listA = $this->parseList($valueA);
        $listB = $this->parseList($valueB);

        foreach ($listA as $a) {
            foreach ($listB as $b) {
                if (trim($a) === trim($b)) {
                    return true;
                }
            }
        }

        return false;
    }

    private function parseList(string $value): array
    {
        if (str_contains($value, ',')) {
            return array_map('trim', explode(',', $value));
        }

        return [$value];
    }

    public function validateConfiguration(array $componentIds): array
    {
        $results = [];

        $count = count($componentIds);

        for ($i = 0; $i < $count; $i++) {

            for ($j = $i + 1; $j < $count; $j++) {

                $results[] = $this->validateComponents(
                    $componentIds[$i],
                    $componentIds[$j]
                );
            }
        }

        return $results;
    }
}