let tasks = [];

function addTask(task) {
    if (task) {
        tasks.push({ text: task, completed: false });
    }
}

function removeTask(index) {
    if (index >= 0 && index < tasks.length) {
        tasks.splice(index, 1);
    }
}

function completeTask(index) {
    if (index >= 0 && index < tasks.length) {
        tasks[index].completed = true;
    }
}

function listTasks() {
    tasks.forEach((task, index) => {
        const status = task.completed ? "✔️" : "❌";
        console.log(`${index}: ${status} ${task.text}`);
    });
}

addTask("Estudar JavaScript");
addTask("Fazer compras");
addTask("Ler um livro");
listTasks();

completeTask(1);
listTasks();

removeTask(0);
listTasks();