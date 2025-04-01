10 DIM TAREFAS(100)
20 CONTADOR = 0
30 PRINT "Listador de Tarefas"
40 PRINT "1. Adicionar Tarefa"
50 PRINT "2. Listar Tarefas"
60 PRINT "3. Sair"
70 INPUT "Escolha uma opção (1-3): ", OPCAO
80 IF OPCAO = 1 THEN GOTO 100
90 IF OPCAO = 2 THEN GOTO 200
100 IF OPCAO = 3 THEN END
110 PRINT "Opção inválida. Tente novamente."
120 GOTO 30
100
110 IF CONTADOR >= 100 THEN PRINT "Lista de tarefas cheia!" : GOTO 30
120 INPUT "Digite a tarefa: ", TAREFAS(CONTADOR)
130 CONTADOR = CONTADOR + 1
140 PRINT "Tarefa adicionada com sucesso!"
150 GOTO 30
200
210 IF CONTADOR = 0 THEN PRINT "Nenhuma tarefa adicionada." : GOTO 30
220 PRINT "Lista de Tarefas:"
230 FOR I = 0 TO CONTADOR - 1
240   PRINT I + 1; ". "; TAREFAS(I)
250 NEXT I
260 GOTO 30