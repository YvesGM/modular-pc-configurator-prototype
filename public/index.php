<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>Modular PC Configurator</title>

</head>

<body>

    <!-- COMPONENT REPOSITORY -->
    <?php
    require_once __DIR__ . '/../src/autoload.php';

    $components = new ComponentsRepository();
    $componentService = new ComponentService();
    $attributes = new CompAttributesRepository();
    $types = new CompTypeRepository();
    $categories = new CompCategoryRepository();

    // Components
    $all = $components->getAllComponents();
    $byId = $components->getComponentById(10);
    $byMultiId = $components->getComponentsByMultipleIds([30, 15, 20, 18]);
    $byType = $components->getComponentsByType('motherboard');
    $byCat = $components->getComponentsByCategory('core_components');

    // Attributes
    $attrOfComp = $attributes->getComponentAttributes(20);
    $compAttrMap = $attributes->mappedComponentAttributes(20);
    $compAndAttr = $componentService->getComponentWithAttributes(20);
    $attrDef = $attributes->getAllAttributes();

    // Types
    $ctype = $types->getAllComponentTypes();
    $tcat = $types->getTypesByCategory('system_components');

    // Categories
    $allCat = $categories->getAllComponentCategories();



    // COMPATIBILITY
    $compatibilityRepo = new CompatibilityRepository();
    $compatibilityService = new CompatibilityService();

    // Repositories
    $allRules = $compatibilityRepo->getAllRules();
    $compTypeRules = $compatibilityRepo->getRulesForComponentType('cpu');
    $rulesBetweenTypes = $compatibilityRepo->getRulesBetweenComponentTypes('cpu', 'motherboard');
    $rulesForAttribute = $compatibilityRepo->getRulesForComponentAttribute('memory_type');
    $rulesByOperator = $compatibilityRepo->getRulesByOperator('less_equal');

    // Services
    // $validate = $compatibilityService->validateComponents('cpu', 'motherboard');

    echo "<pre>";
    print_r($byCat);
    ?>

</body>

</html>