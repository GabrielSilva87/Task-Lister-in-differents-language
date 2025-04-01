<?php
header('Content-Type: application/json');
require 'tasks.php';

$requestMethod = $_SERVER['REQUEST_METHOD'];

switch ($requestMethod) {
    case 'GET':
        echo json_encode(getTasks());
        break;
    case 'POST':
        $data = json_decode(file_get_contents('php://input'), true);
        if (isset($data['task'])) {
            addTask($data['task']);
            echo json_encode(['message' => 'Tarefa adicionada com sucesso.']);
        } else {
            echo json_encode(['message' => 'Tarefa não fornecida.']);
        }
        break;
    case 'PUT':
        $data = json_decode(file_get_contents('php://input'), true);
        if (isset($data['index']) && isset($data['task'])) {
            updateTask($data['index'], $data['task']);
            echo json_encode(['message' => 'Tarefa atualizada com sucesso.']);
        } else {
            echo json_encode(['message' => 'Dados inválidos.']);
        }
        break;
    case 'DELETE':
        $data = json_decode(file_get_contents('php://input'), true);
        if (isset($data['index'])) {
            removeTask($data['index']);
            echo json_encode(['message' => 'Tarefa removida com sucesso.']);
        } else {
            echo json_encode(['message' => 'Índice não fornecido.']);
        }
        break;
    default:
        echo json_encode(['message' => 'Método não suportado.']);
        break;
}
?>