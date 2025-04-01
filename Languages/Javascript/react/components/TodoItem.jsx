import React from 'react';

function TodoItem({ item, setTodos }) {
    const handleDelete = () => {
        setTodos((prevTodos) => prevTodos.filter((todo) => todo.id !== item.id));
    };

    return (
        <li>
            {item.text}
            <button onClick={handleDelete}>Remover</button>
        </li>
    );
}

export default TodoItem;