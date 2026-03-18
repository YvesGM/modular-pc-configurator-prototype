<?php

require_once __DIR__ . '/../repositories/ConfiguratorRepository.php';

class ComponentsService extends ConfiguratorRepository
{
    public function __construct()
    {
        parent::__construct();
    }

    public function getComponentWithAttributes(int $componentId): array
    {
        $selectedComponent = $this->componentsRepository->getComponentById($componentId);
        $selectedComponent['attributes'] = $this->compAttributesRepository->mappedComponentAttributes($componentId);

        return $selectedComponent;
    }
}