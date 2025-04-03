-module(listador_tarefas).
-export([start/0, loop/1, add_task/2, list_tasks/1, remove_task/2]).

start() ->
    io:format("Bem-vindo ao Listador de Tarefas!~n"),
    loop([]).

loop(Tarefas) ->
    io:format("Escolha uma opção:~n"),
    io:format("1. Adicionar tarefa~n"),
    io:format("2. Listar tarefas~n"),
    io:format("3. Remover tarefa~n"),
    io:format("4. Sair~n"),
    Opcao = io:get_line("> "),
    OpcaoStr = string:trim(Opcao),

    case OpcaoStr of
        "1" ->
            {Tarefa, NovaTarefas} = add_task(Tarefas, io:get_line("Digite a tarefa: "));
            loop(NovaTarefas);
        "2" ->
            list_tasks(Tarefas),
            loop(Tarefas);
        "3" ->
            {TarefaRemover, NovaTarefas} = remove_task(Tarefas, io:get_line("Digite a tarefa a remover: "));
            loop(NovaTarefas);
        "4" ->
            io:format("Saindo...~n");
        _ ->
            io:format("Opção inválida. Tente novamente.~n"),
            loop(Tarefas)
    end.

add_task(Tarefas, Tarefa) ->
    TarefaStr = string:trim(Tarefa),
    {TarefaStr, [TarefaStr | Tarefas]}.

list_tasks([]) ->
    io:format("Nenhuma tarefa encontrada.~n");
list_tasks(Tarefas) ->
    io:format("Tarefas:~n"),
    lists:foreach(fun(T) -> io:format("- ~s~n", [T]) end, Tarefas).

remove_task(Tarefas, Tarefa) ->
    TarefaRemover = string:trim(Tarefa),
    if
        TarefaRemover == "" ->
            {TarefaRemover, Tarefas};
        TarefaRemover in Tarefas ->
            {TarefaRemover, lists:delete(TarefaRemover, Tarefas)};
        true ->
            io:format("Tarefa '~s' não encontrada.~n", [TarefaRemover]),
            {TarefaRemover, Tarefas}
    end.