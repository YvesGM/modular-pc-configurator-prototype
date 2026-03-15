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
    $attributes = new CompAttributesRepository();
    $types = new CompTypeRepository();
    $categories = new CompCategoryRepository();

    // Components
    $all = $components->getAllComponents();
    $byId = $components->getComponentById(10);
    $byMultiId = $components->getComponentsByMultipleIds([1, 15, 67, 100]);
    $byType = $components->getComponentsByType('gpu');
    $byCat = $components->getComponentsByCategory('system_components');

    // Attributes
    $attrOfComp = $attributes->getComponentAttributes(20);
    $compAttrMap = $attributes->mappedComponentAttributes(20);
    $compAndAttr = $attributes->getComponentWithAttributes(20);
    $attrDef = $attributes->getAllAttributes();

    // Types
    $ctype = $types->getAllComponentTypes();
    $tcat = $types->getTypesByCategory('system_components');

    // Categories
    $allCat = $categories->getAllComponentCategories();



    // COMPATIBILITY
    $compatibility = new CompatibilityRepository();

    $allRules = $compatibility->getAllRules();
    $compTypeRules = $compatibility->getRulesForComponentType('cpu');
    $rulesBetweenTypes = $compatibility->getRulesBetweenComponentTypes('cpu', 'motherboard');
    $rulesForAttribute = $compatibility->getRulesForComponentAttribute('memory_type');
    $rulesByOperator = $compatibility->getRulesByOperator('less_equal');

    echo "<pre>";
    print_r($rulesByOperator);
    ?>

</body>

</html>