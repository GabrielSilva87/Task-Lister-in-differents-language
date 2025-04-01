<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Testar API de Tarefas</title>
    <script>
        async function fetchTasks() {
            const response = await fetch('api.php');
            const tasks = await response.json();
            document.getElementById('taskList').innerHTML = JSON.stringify(tasks, null, 2);
        }

        async function addTask() {
            const task = document.getElementById('newTask').value;
            await fetch('api.php', {
                method: 'POST',
                headers: { 'Content-Type': 'application/json' },
                body: JSON.stringify({ task })
            });
            fetchTasks();
        }

        async function updateTask() {
            const index = document.getElementById('updateIndex').value;
            const task = document.getElementById('updateTask').value;
            await fetch('api.php', {
                method: 'PUT',
                headers: { 'Content-Type': 'application/json' },
                body: JSON.stringify({ index, task })
            });
            fetchTasks();
        }

        async function removeTask() {
            const index = document.getElementById('removeIndex').value;
            await fetch('api.php', {
                method: 'DELETE',
                headers: { 'Content-Type': 'application/json' },
                body: JSON.stringify({ index })
            });
            fetchTasks();
        }
    </script>
</head>
<body>
    <h1>Testar API de Tarefas</h1>
    <input type="text" id="newTask" placeholder="Nova tarefa">
    <button onclick="addTask()">Adicionar Tarefa</button>
    <br><br>
    <input type="text" id="updateIndex" placeholder="Índice da tarefa a atualizar">
    <input type="text" id="update