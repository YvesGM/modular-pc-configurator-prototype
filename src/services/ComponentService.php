<?php
class ComponentService
{
    private ComponentsRepository $components;
    private CompAttributesRepository $attributes;

    public function __construct()
    {
        $this->components = new ComponentsRepository();
        $this->attributes = new CompAttributesRepository();
    }

    public function getComponentWithAttributes(int $componentId): array
    {
        $selectedComponent = $this->components->getComponentById($componentId);
        $selectedComponent['attributes'] = $this->attributes->mappedComponentAttributes($componentId);

        return $selectedComponent;
    }
}