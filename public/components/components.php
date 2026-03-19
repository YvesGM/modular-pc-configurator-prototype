<?php

require_once __DIR__ . '/../../src/repositories/components/ComponentsRepository.php';
require_once __DIR__ . '/../../src/services/ComponentsService.php';

header('Content-Type: application/json');

try {

    $service = new ComponentsService();

    $repo = new ComponentsRepository();
    $baseComponents = $repo->getAllComponents();

    $components = [];

    foreach ($baseComponents as $comp) {
        $components[] = $service->getComponentWithAttributes($comp['id']);
    }

    echo json_encode([
        'status' => 'success',
        'data' => $components
    ]);

} catch (Exception $e) {

    http_response_code(500);

    echo json_encode([
        'status' => 'error',
        'message' => $e->getMessage()
    ]);
}