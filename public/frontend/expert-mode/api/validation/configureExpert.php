<?php

require_once __DIR__ . '../../../../../backend/services/ConfiguratorService.php';

header('Content-Type: application/json');

try {
    $input = json_decode(file_get_contents("php://input"), true);

    if ($input === null) {
        throw new Exception("Invalid JSON");
    }

    $componentIds = $input['componentIds'] ?? [];
    $currency = $input['currency'] ?? 'EUR';
    $promoCode = $input['promoCode'] ?? null;

    $controller = new ConfiguratorController();

    $result = $controller->buildConfiguration(
        $componentIds,
        $currency,
        $promoCode
    );

    echo json_encode([
        'status' => 'success',
        'data' => $result
    ]);

} catch (Exception $e) {

    http_response_code(400);

    echo json_encode([
        'status' => 'error',
        'message' => $e->getMessage()
    ]);
}