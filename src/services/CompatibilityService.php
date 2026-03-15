<?php

require_once __DIR__ . '/../repositories/compatibility/CompatibilityRepository.php';
require_once __DIR__ . '/ComponentService.php';
class CompatibilityService
{
    private CompatibilityRepository $compatibilityRepository;
    private ComponentService $componentService;
    public function __construct()
    {
        $this->compatibilityRepository = new CompatibilityRepository();
        $this->componentService = new ComponentService();
    }

    public function validateComponents(int $componentAId, int $componentBId): array
    {
        $componentA = $this->componentService->getComponentWithAttributes($componentAId);
        $componentB = $this->componentService->getComponentWithAttributes($componentBId);

        $ctypeA = $componentA['component_type'];
        $ctypeB = $componentB['component_type'];
    

        $rulesBetweenCTypes = $this->compatibilityRepository->getRulesBetweenComponentTypes($ctypeA, $ctypeB);

        $results = [];

        foreach ($rulesBetweenCTypes as $cTypeRule) {

            if ($cTypeRule['type_a_name'] == $componentA['component_type']) {

                $valueA = $componentA['attributes'][$cTypeRule['attribute_a']] ?? null;
                $valueB = $componentB['attributes'][$cTypeRule['attribute_b']] ?? null;

            } else {

                $valueA = $componentB['attributes'][$cTypeRule['attribute_a']] ?? null;
                $valueB = $componentA['attributes'][$cTypeRule['attribute_b']] ?? null;

            };

            $passed = $this->evaluateRule(
                $cTypeRule['rule_type'],
                $valueA,
                $valueB
            );

            $results[] = [
                'rule_id' => $cTypeRule['id'],
                'description' => $cTypeRule['description'],
                'value_a' => $valueA,
                'value_b' => $valueB,
                'passed' => $passed
            ];
        }

        return [
            'is_compatible' => !in_array(false, array_column($results, 'passed')),
            'rules_checked' => $results
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