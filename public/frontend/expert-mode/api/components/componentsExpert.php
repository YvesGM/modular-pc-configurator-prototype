<?php

require_once __DIR__ . '/../../../../../backend/services/ComponentsService.php';

header('Content-Type: application/json');

try {

    $componentsService = new ComponentsService();

    $components = $componentsService->getAllComponentsWithAttributes();

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