:- use_module(library(pce)).

:- dynamic tarefa/1.

inicializar :-
    new(Frame, frame('Listador de Tarefas')),
    send(Frame, size, size(400, 300)),
    send(Frame, open),

    new(Lista, text_area),
    send(Lista, size, size(380, 200)),
    send(Frame, display, Lista, point(10, 10)),

    new(Entrada, text_item('')),
    send(Frame, display, Entrada, point(10, 220)),

    new(BotaoAdicionar, button('Adicionar', message(@prolog, adicionar_tarefa, Entrada, Lista))),
    send(Frame, display, BotaoAdicionar, point(300, 220)),

    new(BotaoRemover, button('Remover', message(@prolog, remover_tarefa, Lista))),
    send(Frame, display, BotaoRemover, point(10, 250)),

    new(BotaoSair, button('Sair', message(Frame, destroy))),
    send(Frame, display, BotaoSair, point(300, 250)).

adicionar_tarefa(Entrada, Lista) :-
    get(Entrada, value, Tarefa),
    Tarefa \= '',
    assertz(tarefa(Tarefa)),
    atualizar_lista(Lista).

remover_tarefa(Lista) :-
    get(Lista, selection, Tarefa),
    Tarefa \= '',
    retract(tarefa(Tarefa)),
    atualizar_lista(Lista).

atualizar_lista(Lista) :-
    findall(T, tarefa(T), Tarefas),
    atomic_list_concat(Tarefas, '\n', Texto),
    send(Lista, clear),
    send(Lista, append, Texto).

:- inicializar.