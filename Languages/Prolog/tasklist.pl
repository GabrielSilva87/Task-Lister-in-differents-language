:- dynamic tarefa/1.

inicializar :-
    writeln('Listador de Tarefas'),
    menu.

menu :-
    writeln('Escolha uma opção:'),
    writeln('1. Adicionar tarefa'),
    writeln('2. Listar tarefas'),
    writeln('3. Remover tarefa'),
    writeln('4. Sair'),
    read(Op),
    tratar_opcao(Op).

tratar_opcao(1) :-
    adicionar_tarefa,
    menu.
tratar_opcao(2) :-
    listar_tarefas,
    menu.
tratar_opcao(3) :-
    remover_tarefa,
    menu.
tratar_opcao(4) :-
    writeln('Saindo...').
tratar_opcao(_) :-
    writeln('Opção inválida. Tente novamente.'),
    menu.

adicionar_tarefa :-
    writeln('Digite a descrição da tarefa:'),
    read(Tarefa),
    assertz(tarefa(Tarefa)),
    writeln('Tarefa adicionada.').

listar_tarefas :-
    findall(T, tarefa(T), Tarefas),
    (   Tarefas = [] -> writeln('Nenhuma tarefa cadastrada.')
    ;   writeln('Tarefas:'),
        forall(member(T, Tarefas), writeln(T))
    ).

remover_tarefa :-
    writeln('Digite a descrição da tarefa a ser removida:'),
    read(Tarefa),
    (   retract(tarefa(Tarefa)) -> writeln('Tarefa removida.')
    ;   writeln('Tarefa não encontrada.')
    ).