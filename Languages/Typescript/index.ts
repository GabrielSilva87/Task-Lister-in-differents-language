import inquirer from 'inquirer';
import fs from 'fs';

interface Task {
    id: number;
    title: string;
    description: string;
    status: 'pending' | 'in progress' | 'completed';
}

const tasks: Task[] = [];

const saveTasks = () => {
    fs.writeFileSync('tasks.json', JSON.stringify(tasks, null, 2));
};

const loadTasks = () => {
    if (fs.existsSync('tasks.json')) {
        const data = fs.readFileSync('tasks.json', 'utf-8');
        tasks.push(...JSON.parse(data));
    }
};

const addTask = async () => {
    const answers = await inquirer.prompt([
        { name: 'title', message: 'Task Title:', type: 'input' },
        { name: 'description', message: 'Task Description:', type: 'input' },
        { name: 'status', message: 'Task Status:', type: 'list', choices: ['pending', 'in progress', 'completed'] },
    ]);

    const newTask: Task = {
        id: tasks.length + 1,
        title: answers.title,
        description: answers.description,
        status: answers.status,
    };

    tasks.push(newTask);
    saveTasks();
    console.log('Task added successfully!');
};

const viewTasks = () => {
    if (tasks.length === 0) {
        console.log('No tasks available.');
    } else {
        console.log('Tasks:');
        tasks.forEach(task => {
            console.log(`ID: ${task.id}, Title: ${task.title}, Description: ${task.description}, Status: ${task.status}`);
        });
    }
};

const removeTask = async () => {
    const answers = await inquirer.prompt([
        { name: 'id', message: 'Enter the ID of the task to remove:', type: 'input' },
    ]);

    const taskId = parseInt(answers.id);
    const index = tasks.findIndex(task => task.id === taskId);

    if (index !== -1) {
        tasks.splice(index, 1);
        saveTasks();
        console.log('Task removed successfully!');
    } else {
        console.log('Task not found.');
    }
};

const main = async () => {
    loadTasks();

    while (true) {
        const answers = await inquirer.prompt([
            {
                name: 'action',
                message: 'Choose an action:',
                type: 'list',
                choices: ['Add Task', 'View Tasks', 'Remove Task', 'Exit'],
            },
        ]);

        switch (answers.action) {
            case 'Add Task':
                await addTask();
                break;
            case 'View Tasks':
                viewTasks();
                break;
            case 'Remove Task':
                await removeTask();
                break;
            case 'Exit':
                console.log('Goodbye!');
                return;
        }
    }
};

main();