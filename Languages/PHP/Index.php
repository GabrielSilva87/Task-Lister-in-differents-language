<?php
session_start();

if (!isset($_SESSION['tasks'])) {
    $_SESSION['tasks'] = [];
}

if (isset($_POST['add_task'])) {
    $task = trim($_POST['task']);
    if (!empty($task)) {
        $_SESSION['tasks'][] = $task;
    }
}

if (isset($_POST['remove_task'])) {
    $task_index = $_POST['task_index'];
    if (isset($_SESSION['tasks'][$task_index])) {
        unset($_SESSION['tasks'][$task_index]);
        $_SESSION['tasks'] = array_values($_SESSION['tasks']);
    }
}
?>

<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Listador de Tarefas</title>
    <style>
        body { font-family: Arial, sans-serif; }
        .task-list { margin-top: 20px; }
        .task-item { display: flex; justify-content: space-between; }
        .task-item button { margin-left: 10px; }
    </style>
</head>
<body>
    <h1>Listador de Tarefas</h1>
    <form method="POST">
        <input type="text" name="task" placeholder="Digite uma nova tarefa" required>
        <button type="submit" name="add_task">Adicionar</button>
    </form>

    <div class="task-list">
        <h2>Tarefas:</h2>
        <?php if (empty($_SESSION['tasks'])): ?>
            <p>Nenhuma tarefa encontrada.</p>
        <?php else: ?>
            <ul>
                <?php foreach ($_SESSION['tasks'] as $index => $task): ?>
                    <li class="task-item">
                        <?php echo htmlspecialchars($task); ?>
                        <form method="POST" style="display:inline;">
                            <input type="hidden" name="task_index" value="<?php echo $index; ?>">
                            <button type="submit" name="remove_task">Remover</button>
                        </form>
                    </li>
                <?php endforeach; ?>
            </ul>
        <?php endif; ?>
    </div>
</body>
</html>