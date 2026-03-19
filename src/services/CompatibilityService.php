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

            if (
                in_array('gpu_length', [$TypeRule['attribute_a_name'], $TypeRule['attribute_b_name']]) &&
                in_array('max_gpu_length', [$TypeRule['attribute_a_name'], $TypeRule['attribute_b_name']])
            ) {

                // 🔥 Werte korrekt zuordnen – egal in welcher Reihenfolge
                if ($TypeRule['attribute_a_name'] === 'gpu_length') {
                    $gpu = $valueA;
                    $case = $valueB;
                } else {
                    $gpu = $valueB;
                    $case = $valueA;
                }

                $gpu = is_array($gpu) ? $gpu[0] : $gpu;
                $case = is_array($case) ? $case[0] : $case;

                $passed = (float) $gpu <= (float) $case;

            } else {

                $passed = $this->evaluateRule(
                    $TypeRule['rule_type'],
                    is_array($valueA) ? $valueA[0] : $valueA,
                    is_array($valueB) ? $valueB[0] : $valueB
                );
            }
            ;

            $validated[] = [
                'rule_id' => $TypeRule['id'],
                'description' => $TypeRule['description'],
                'component_a_id' => $componentAId,
                'component_b_id' => $componentBId,
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

            case 'greater_equal':
                return (float) $valueA >= (float) $valueB;

            case 'less_equal':
                return (float) $valueA <= (float) $valueB;

            default:
                throw new Exception("Unknown compatibility operator: $operator");
        }
    }

    private function compareEqual($valueA, $valueB): bool
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

    private function parseList($value): array
    {
        if (is_array($value)) {
            return $value;
        }

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