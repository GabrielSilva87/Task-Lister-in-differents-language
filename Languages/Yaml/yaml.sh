#!/bin/bash

ARQUIVO="tarefas.yaml"

criar_arquivo() {
    echo "tarefas:" > $ARQUIVO
    echo "  - id: 1" >> $ARQUIVO
    echo "    titulo: \"Comprar mantimentos\"" >> $ARQUIVO
    echo "    descricao: \"Comprar frutas, vegetais e laticínios para a semana.\"" >> $ARQUIVO
    echo "    status: \"pendente\"" >> $ARQUIVO
    echo "    data_vencimento: \"2023-10-15\"" >> $ARQUIVO
    echo "  - id: 2" >> $ARQUIVO
    echo "    titulo: \"Estudar para a prova de matemática\"" >> $ARQUIVO
    echo "    descricao: \"Revisar os tópicos de álgebra e geometria.\"" >> $ARQUIVO
    echo "    status: \"em andamento\"" >> $ARQUIVO
    echo "    data_vencimento: \"2023-10-20\"" >> $ARQUIVO
    echo "Arquivo $ARQUIVO criado com tarefas iniciais."
}

adicionar_tarefa() {
    echo "Digite o título da nova tarefa:"
    read TITULO
    echo "Digite a descrição da nova tarefa:"
    read DESCRICAO
    echo "Digite o status da nova tarefa (pendente, em andamento, concluída):"
    read STATUS
    echo "Digite a data de vencimento da nova tarefa (YYYY-MM-DD):"
    read DATA_VENCIMENTO

    ID=$(($(wc -l < $ARQUIVO) - 1))
    echo "  - id: $ID" >> $ARQUIVO
    echo "    titulo: \"$TITULO\"" >> $ARQUIVO
    echo "    descricao: \"$DESCRICAO\"" >> $ARQUIVO
    echo "    status: \"$STATUS\"" >> $ARQUIVO
    echo "    data_vencimento: \"$DATA_VENCIMENTO\"" >> $ARQUIVO
    echo "Nova tarefa adicionada ao arquivo $ARQUIVO."
}

exibir_tarefas() {
    echo "Conteúdo do arquivo $ARQUIVO:"
    cat $ARQUIVO
}

if [ ! -f $ARQUIVO ]; then
    criar_arquivo
fi

while true; do
    echo "Escolha uma opção:"
    echo "1. Adicionar nova tarefa"
    echo "2. Exibir tarefas"
    echo "3. Sair"
    read OPCAO

    case $OPCAO in
        1)
            adicionar_tarefa
            ;;
        2)
            exibir_tarefas
            ;;
        3)
            echo "Saindo..."
            break
            ;;
        *)
            echo "Opção inválida. Tente novamente."
            ;;
    esac
done