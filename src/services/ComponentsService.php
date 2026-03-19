<?php

require_once __DIR__ . '/../repositories/ConfiguratorRepository.php';

class ComponentsService extends ConfiguratorRepository
{
    public function getComponentWithAttributes(int $componentId): array
    {
        $selectedComponent = $this->componentsRepository->getComponentById($componentId);

        $selectedComponent['attributes'] = $this->compAttributesRepository
            ->mappedComponentAttributes($componentId);

        return $selectedComponent;
    }

    public function getAllComponentsWithAttributes(): array
    {
        $allComponents = $this->componentsRepository->getAllComponents();

        $components = [];

        foreach ($allComponents as $component) {
            $components[] = $this->getComponentWithAttributes($component['id']);
        }

        return $components;
    }
}