const taskInput = document.getElementById('taskInput');
const addButton = document.getElementById('addButton');
const taskList = document.getElementById('taskList');

addButton.addEventListener('click', () => {
    const taskText = taskInput.value.trim();
    if (taskText) {
        const listItem = document.createElement('li');
        listItem.className = 'task-item';
        listItem.innerHTML = `
            ${taskText}
            <button class="removeButton">Remover</button>
        `;
        taskList.appendChild(listItem);
        taskInput.value = '';

        const removeButton = listItem.querySelector('.removeButton');
        removeButton.addEventListener('click', () => {
            taskList.removeChild(listItem);
        });
    } else {
        alert('Por favor, digite uma tarefa válida.');
    }
});