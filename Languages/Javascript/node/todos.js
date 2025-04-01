const express = require('express');
const router = express.Router();

let todos = [];

router.get('/', (req, res) => {
    res.json(todos);
});

router.post('/', (req, res) => {
    const { text } = req.body;
    if (text) {
        const newTodo = { id: Date.now(), text, completed: false };
        todos.push(newTodo);
        res.status(201).json(newTodo);
    } else {
        res.status(400).json({ error: 'Texto da tarefa é obrigatório.' });
    }
});

router.delete('/:id', (req, res) => {
    const { id } = req.params;
    todos = todos.filter(todo => todo.id !== parseInt(id));
    res.status(204).send();
});

router.put('/:id', (req, res) => {
    const { id } = req.params;
    const { completed } = req.body;
    const todo = todos.find(todo => todo.id === parseInt(id));
    if (todo) {
        todo.completed = completed;
        res.json(todo);
    } else {
        res.status(404).json({ error: 'Tarefa não encontrada.' });
    }
});

module.exports = router;