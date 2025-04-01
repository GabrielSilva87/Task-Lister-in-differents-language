#!/bin/bash

TAREFAS_FILE="tarefas.txt"

adicionar_tarefa() {
    echo "- [ ] $1" >> "$TAREFAS_FILE"
    echo "Tarefa adicionada: $1"
}

listar_tarefas() {
    if [ -f "$TAREFAS_FILE" ]; then
        echo "Lista de Tarefas:"
        cat "$TAREFAS_FILE"
    else
        echo "Nenhuma tarefa encontrada."
    fi
}

concluir_tarefa() {
    sed -i "${1}s/\[ \]/[x]/" "$TAREFAS_FILE"
    echo "Tarefa $1 marcada como concluída."
}

if [ ! -f "$TAREFAS_FILE" ]; then
    touch "$TAREFAS_FILE"
fi

while true; do
    echo "Escolha uma opção:"
    echo "1. Adicionar tarefa"
    echo "2. Listar tarefas"
    echo "3. Concluir tarefa"
    echo "4. Sair"
    read -p "Opção: " opcao

    case $opcao in
        1)
            read -p "Digite a tarefa: " tarefa
            adicionar_tarefa "$tarefa"
            ;;
        2)
            listar_tarefas
            ;;
        3)
            read -p "Digite o número da tarefa a ser concluída: " numero
            concluir_tarefa "$numero"
            ;;
        4)
            echo "Saindo..."
            exit 0
            ;;
        *)
            echo "Opção inválida. Tente novamente."
            ;;
    esac
done