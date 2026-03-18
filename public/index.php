<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>Modular PC Configurator</title>

</head>

<body>

    <?php
    // COMPONENT REPOSITORY
    require_once __DIR__ . '/../src/autoload.php';

    $components = new ComponentsRepository();
    $componentsService = new ComponentsService();
    $attributes = new CompAttributesRepository();
    $types = new CompTypeRepository();
    $categories = new CompCategoryRepository();
    $promotions = new PromotionsRepository();
    $currencies = new CurrencyRepository();

    // Components
    $all = $components->getAllComponents();
    $byId = $components->getComponentById(21);
    $byMultiId = $components->getComponentsByMultipleIds([30, 15, 20, 18]);
    $byType = $components->getComponentsByType('motherboard');
    $byCat = $components->getComponentsByCategory('core_components');

    // Attributes
    $attrOfComp = $attributes->getComponentAttributes(20);
    $compAttrMap = $attributes->mappedComponentAttributes(21);
    $attrDef = $attributes->getAllAttributes();

    // Types
    $allCTypes = $types->getAllComponentTypes();
    $ctCat = $types->getTypesByCategory('system_components');

    // Categories
    $allCCat = $categories->getAllComponentCategories();

    // COMPATIBILITY REPOSITORY
    $compatibilityRepo = new CompatibilityRepository();
    $compatibilityService = new CompatibilityService();

    $allRules = $compatibilityRepo->getAllRules();
    $compTypeRules = $compatibilityRepo->getRulesForComponentType('cpu');
    $rulesBetweenTypes = $compatibilityRepo->getRulesBetweenComponentTypes('cpu', 'motherboard');
    $rulesForAttribute = $compatibilityRepo->getRulesForComponentAttribute('memory_type');
    $rulesByOperator = $compatibilityRepo->getRulesByOperator('less_equal');

    // PRICINGREPOSITORY
    $allCurrencies = $currencies->getAllCurrencies();
    $codeCurrencies = $currencies->getCurrencyByCode('USD');
    $convertCurrencies = $currencies->convertCurrency(10, 'USD', 'EUR');

    // COMPONENT SERVICES
    $compAndAttr = $componentsService->getComponentWithAttributes(21);
    $validateTrue = $compatibilityService->validateComponents(1, 18);
    $validateFalse = $compatibilityService->validateComponents(1, 20);

    echo "<pre>";
    print_r($compAndAttr);
    echo str_repeat('_', 100) . "<br>";
    print_r($validateTrue);
    print_r($validateFalse);
    echo str_repeat('_', 100) . "<br>";
    var_dump($validateTrue);
    var_dump($validateFalse);
    echo str_repeat('_', 100) . "<br>";
    print_r($codeCurrencies);
    ?>

</body>

</html>