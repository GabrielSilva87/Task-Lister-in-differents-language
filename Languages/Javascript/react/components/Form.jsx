import React, { useState } from 'react';

function Form({ setTodos }) {
    const [inputValue, setInputValue] = useState('');

    const handleSubmit = (event) => {
        event.preventDefault();
        if (inputValue) {
            setTodos((prevTodos) => [
                ...prevTodos,
                { text: inputValue, id: Date.now(), completed: false },
            ]);
            setInputValue('');
        }
    };

    return (
        <form onSubmit={handleSubmit}>
            <input
                type="text"
                value={inputValue}
                onChange={(e) => setInputValue(e.target.value)}
                placeholder="Adicione uma nova tarefa"
            />
            <button type="submit">Adicionar</button>
        </form>
    );
}

export default Form;