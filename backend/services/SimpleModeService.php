<?php

require_once __DIR__ . '/ConfiguratorService.php';
require_once __DIR__ . '/ComponentsService.php';
require_once __DIR__ . '/CompatibilityService.php';

class SimpleModeService
{
    private ConfiguratorService $configuratorService;
    private ComponentsService $componentsService;
    private CompatibilityService $compatibilityService;

    public function __construct()
    {
        $this->configuratorService = new ConfiguratorService();
        $this->componentsService = new ComponentsService();
        $this->compatibilityService = new CompatibilityService();
    }

    public function generate(array $input): array
    {
        $useCase = strtolower(trim((string) ($input['useCase'] ?? 'gaming')));
        $budget = isset($input['budget']) && $input['budget'] !== ''
            ? (float) $input['budget']
            : null;

        $components = $this->componentsService->getAllComponentsWithAttributes();
        $groupedComponents = $this->groupComponentsByType($components);

        $selected = [];

        $budgetPlan = $this->getBudgetPlan($useCase, $budget);

        $selected['cpu'] = $this->pickCompatibleCandidate(
            $groupedComponents['cpu'] ?? [],
            $selected,
            fn(array $component) => $this->scoreCPU($component, $useCase, $budgetPlan['cpu'])
        );

        $selected['motherboard'] = $this->pickCompatibleCandidate(
            $groupedComponents['motherboard'] ?? [],
            $selected,
            fn(array $component) => $this->scoreMotherboard($component, $selected['cpu'] ?? null, $budgetPlan['motherboard'])
        );

        $selected['ram'] = $this->pickCompatibleCandidate(
            $groupedComponents['ram'] ?? [],
            $selected,
            fn(array $component) => $this->scoreRAM($component, $useCase, $budgetPlan['ram'])
        );

        $selected['gpu'] = $this->pickCompatibleCandidate(
            $groupedComponents['gpu'] ?? [],
            $selected,
            fn(array $component) => $this->scoreGPU($component, $useCase, $budgetPlan['gpu'])
        );

        $selected['ssd'] = $this->pickCompatibleCandidate(
            $groupedComponents['ssd'] ?? [],
            $selected,
            fn(array $component) => $this->scoreStorage($component, true, $budgetPlan['storage'])
        );

        if (!$selected['ssd']) {
            $selected['hdd'] = $this->pickCompatibleCandidate(
                $groupedComponents['hdd'] ?? [],
                $selected,
                fn(array $component) => $this->scoreStorage($component, false, $budgetPlan['storage'])
            );
        }

        $selected['case'] = $this->pickCompatibleCandidate(
            $groupedComponents['case'] ?? [],
            $selected,
            fn(array $component) => $this->scoreCase($component, $budgetPlan['case'])
        );

        $psuPool = array_merge(
            $groupedComponents['atx_power_supply'] ?? [],
            $groupedComponents['sfx_power_supply'] ?? []
        );

        $selected['power_supply'] = $this->pickCompatibleCandidate(
            $psuPool,
            $selected,
            fn(array $component) => $this->scorePSU($component, $budgetPlan['psu'])
        );

        $selected['air_cooler'] = $this->pickCompatibleCandidate(
            $groupedComponents['air_cooler'] ?? [],
            $selected,
            fn(array $component) => $this->scoreCooler($component, false, $budgetPlan['cooler'])
        );

        if (!$selected['air_cooler']) {
            $selected['liquid_cooler'] = $this->pickCompatibleCandidate(
                $groupedComponents['liquid_cooler'] ?? [],
                $selected,
                fn(array $component) => $this->scoreCooler($component, true, $budgetPlan['cooler'])
            );
        }

        $selected = array_filter($selected, fn($component) => is_array($component) && isset($component['id']));

        $componentIds = array_map(
            fn(array $component) => (int) $component['id'],
            array_values($selected)
        );

        if (empty($componentIds)) {
            throw new Exception("(Simple mode could not build a configuration)");
        }

        return $this->configuratorService->buildConfiguration($componentIds);
    }

    private function groupComponentsByType(array $components): array
    {
        $grouped = [];

        foreach ($components as $component) {
            $type = $component['component_type'] ?? null;

            if (!$type) {
                continue;
            }

            if (!isset($grouped[$type])) {
                $grouped[$type] = [];
            }

            $grouped[$type][] = $component;
        }

        return $grouped;
    }

    private function getBudgetPlan(string $useCase, ?float $budget): array
    {
        if ($budget === null || $budget <= 0) {
            return [
                'cpu' => null,
                'motherboard' => null,
                'ram' => null,
                'gpu' => null,
                'storage' => null,
                'case' => null,
                'psu' => null,
                'cooler' => null,
            ];
        }

        return match ($useCase) {
            'office' => [
                'cpu' => $budget * 0.22,
                'motherboard' => $budget * 0.12,
                'ram' => $budget * 0.12,
                'gpu' => $budget * 0.18,
                'storage' => $budget * 0.12,
                'case' => $budget * 0.08,
                'psu' => $budget * 0.08,
                'cooler' => $budget * 0.08,
            ],
            'workstation' => [
                'cpu' => $budget * 0.28,
                'motherboard' => $budget * 0.12,
                'ram' => $budget * 0.15,
                'gpu' => $budget * 0.25,
                'storage' => $budget * 0.08,
                'case' => $budget * 0.05,
                'psu' => $budget * 0.04,
                'cooler' => $budget * 0.03,
            ],
            default => [
                'cpu' => $budget * 0.24,
                'motherboard' => $budget * 0.12,
                'ram' => $budget * 0.12,
                'gpu' => $budget * 0.30,
                'storage' => $budget * 0.08,
                'case' => $budget * 0.06,
                'psu' => $budget * 0.05,
                'cooler' => $budget * 0.03,
            ],
        };
    }

    private function pickCompatibleCandidate(array $pool, array $selected, callable $scoreFn): ?array
    {
        if (empty($pool)) {
            return null;
        }

        usort($pool, function (array $a, array $b) use ($scoreFn) {
            return $scoreFn($b) <=> $scoreFn($a);
        });

        foreach ($pool as $candidate) {
            if ($this->isCompatibleWithSelection($candidate, $selected)) {
                return $candidate;
            }
        }

        return null;
    }

    private function isCompatibleWithSelection(array $candidate, array $selected): bool
    {
        foreach ($selected as $existing) {
            if (!is_array($existing) || !isset($existing['id'])) {
                continue;
            }

            $result = $this->compatibilityService->validateComponents(
                (int) $candidate['id'],
                (int) $existing['id']
            );

            if (!$result['is_compatible']) {
                return false;
            }
        }

        return true;
    }

    private function getAttr(array $component, string $key): mixed
    {
        $value = $component['attributes'][$key] ?? null;

        if (is_array($value)) {
            return $value[0] ?? null;
        }

        return $value;
    }

    private function getNumericAttr(array $component, string $key): float
    {
        $value = $this->getAttr($component, $key);

        if ($value === null || $value === '') {
            return 0.0;
        }

        return (float) $value;
    }

    private function priceScore(array $component, ?float $targetBudget): int
    {
        $price = (float) $component['net_price'];

        if ($targetBudget === null || $targetBudget <= 0) {
            return (int) round($price);
        }

        if ($price <= $targetBudget) {
            return (int) round(100000 - abs($targetBudget - $price));
        }

        return (int) round(1000 - (($price - $targetBudget) * 100));
    }

    private function scoreCPU(array $cpu, string $useCase, ?float $targetBudget): int
    {
        $score = $this->priceScore($cpu, $targetBudget);

        $cores = (int) $this->getNumericAttr($cpu, 'cores');
        $threads = (int) $this->getNumericAttr($cpu, 'threads');
        $boost = $this->getNumericAttr($cpu, 'boost_clock');

        $score += $cores * 40;
        $score += $threads * 20;
        $score += (int) round($boost * 10);

        if ($useCase === 'gaming') {
            $score += $cores >= 6 ? 300 : 0;
            $score += $boost >= 4.5 ? 250 : 0;
        }

        if ($useCase === 'workstation') {
            $score += $cores * 60;
            $score += $threads * 30;
        }

        return $score;
    }

    private function scoreMotherboard(array $board, ?array $cpu, ?float $targetBudget): int
    {
        $score = $this->priceScore($board, $targetBudget);

        $ramSlots = (int) $this->getNumericAttr($board, 'ram_slots');
        $score += $ramSlots * 40;

        if ($cpu) {
            $cpuSocket = (string) $this->getAttr($cpu, 'socket');
            $boardSocket = (string) $this->getAttr($board, 'socket');

            if ($cpuSocket !== '' && $cpuSocket === $boardSocket) {
                $score += 1000;
            }
        }

        return $score;
    }

    private function scoreRAM(array $ram, string $useCase, ?float $targetBudget): int
    {
        $score = $this->priceScore($ram, $targetBudget);

        $capacity = (int) $this->getNumericAttr($ram, 'capacity');
        $modules = (int) $this->getNumericAttr($ram, 'modules');
        $speed = (int) $this->getNumericAttr($ram, 'speed');

        $score += $capacity * 50;
        $score += $speed;
        $score += $modules === 2 ? 150 : 0;

        if ($useCase === 'workstation') {
            $score += $capacity >= 32 ? 400 : 0;
        } else {
            $score += $capacity >= 16 ? 250 : 0;
        }

        return $score;
    }

    private function scoreGPU(array $gpu, string $useCase, ?float $targetBudget): int
    {
        $score = $this->priceScore($gpu, $targetBudget);

        $vram = (int) $this->getNumericAttr($gpu, 'vram');
        $length = (int) $this->getNumericAttr($gpu, 'gpu_length');

        $score += $vram * 70;
        $score += $length > 0 ? 25 : 0;

        if ($useCase === 'gaming') {
            $score += $vram >= 8 ? 350 : 0;
        }

        if ($useCase === 'workstation') {
            $score += $vram >= 12 ? 400 : 0;
        }

        return $score;
    }

    private function scoreStorage(array $storage, bool $preferSsd, ?float $targetBudget): int
    {
        $score = $this->priceScore($storage, $targetBudget);

        $capacity = (int) $this->getNumericAttr($storage, 'capacity');
        $score += $capacity * 2;

        if ($preferSsd) {
            $score += 500;
        }

        return $score;
    }

    private function scoreCase(array $case, ?float $targetBudget): int
    {
        $score = $this->priceScore($case, $targetBudget);

        $maxGpuLength = (int) $this->getNumericAttr($case, 'max_gpu_length');
        $driveBays = (int) $this->getNumericAttr($case, 'drive_bays');

        $score += $maxGpuLength;
        $score += $driveBays * 20;

        return $score;
    }

    private function scorePSU(array $psu, ?float $targetBudget): int
    {
        $score = $this->priceScore($psu, $targetBudget);

        $wattage = (int) $this->getNumericAttr($psu, 'wattage');
        $score += $wattage;

        return $score;
    }

    private function scoreCooler(array $cooler, bool $isLiquid, ?float $targetBudget): int
    {
        $score = $this->priceScore($cooler, $targetBudget);

        if ($isLiquid) {
            $score += 50;
        } else {
            $score += 100;
        }

        return $score;
    }
}