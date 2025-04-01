import React from 'react';
import TodoItem from './TodoItem';

function TodoList({ todos, setTodos }) {
    return (
        <ul>
            {todos.map((item) => (
                <TodoItem key={item.id} item={item} setTodos={setTodos} />
            ))}
        </ul>
    );
}

export default TodoList;