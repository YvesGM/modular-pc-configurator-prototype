<?php

header("Content-Type: application/json");

require_once __DIR__ . '/../src/services/SimpleModeService.php';

try {
    $input = json_decode(file_get_contents("php://input"), true);

    if ($input === null) {
        throw new Exception("Invalid JSON");
    }

    $service = new SimpleModeService();
    $result = $service->generate($input);

    echo json_encode([
        "status" => 'success',
        "data" => $result
    ]);

} catch (Exception $e) {
    http_response_code(400);

    echo json_encode([
        "status" => 'error',
        "message" => $e->getMessage()
    ]);
}