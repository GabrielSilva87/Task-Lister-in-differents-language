function listador_tarefas()
    tarefas = {}; 
    while true
        disp('Listador de Tarefas');
        disp('1. Adicionar tarefa');
        disp('2. Listar tarefas');
        disp('3. Remover tarefa');
        disp('4. Sair');
        opcao = input('Escolha uma opção: ');

        switch opcao
            case 1
                descricao = input('Digite a descrição da tarefa: ', 's');
                tarefas{end + 1} = descricao;  
                disp('Tarefa adicionada.');
            case 2
                if isempty(tarefas)
                    disp('Nenhuma tarefa cadastrada.');
                else
                    disp('Tarefas:');
                    for i = 1:length(tarefas)
                        fprintf('%d: %s\n', i, tarefas{i});
                    end
                end
            case 3
                if isempty(tarefas)
                    disp('Nenhuma tarefa para remover.');
                else
                    listar_tarefas(tarefas);
                    indice = input('Digite o número da tarefa a ser removida: ');
                    if indice >= 1 && indice <= length(tarefas)
                        tarefas(indice) = [];  
                        disp('Tarefa removida.');
                    else
                        disp('Índice inválido.');
                    end
                end
            case 4
                disp('Saindo...');
                return;
            otherwise
                disp('Opção inválida. Tente novamente.');
        end
    end
end

function listar_tarefas(tarefas)
    disp('Tarefas:');
    for i = 1:length(tarefas)
        fprintf('%d: %s\n', i, tarefas{i});
    end
end

listador_tarefas();