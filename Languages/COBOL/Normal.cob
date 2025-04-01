       IDENTIFICATION DIVISION.
       PROGRAM-ID. ListadorDeTarefas.

       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
           SELECT TAREFAS ASSIGN TO "tarefas.txt"
               ORGANIZATION IS LINE SEQUENTIAL.

       DATA DIVISION.
       FILE SECTION.
       FD  TAREFAS.
       01  TAREFA-REGISTRO.
           05  TAREFA-DESCRICAO  PIC X(100).

       WORKING-STORAGE SECTION.
       01  OPCAO                PIC 9.
       01  CONTADOR             PIC 9(3) VALUE 0.
       01  TAREFA-INPUT         PIC X(100).
       01  FIM                  PIC X VALUE 'N'.

       PROCEDURE DIVISION.
       MAIN-PROCEDURE.
           OPEN I-O TAREFAS
           PERFORM UNTIL FIM = 'S'
               DISPLAY "Listador de Tarefas"
               DISPLAY "1. Adicionar Tarefa"
               DISPLAY "2. Listar Tarefas"
               DISPLAY "3. Sair"
               DISPLAY "Escolha uma opção: "
               ACCEPT OPCAO

               EVALUATE OPCAO
                   WHEN 1
                       PERFORM ADICIONAR-TAREFA
                   WHEN 2
                       PERFORM LISTAR-TAREFAS
                   WHEN 3
                       MOVE 'S' TO FIM
                   WHEN OTHER
                       DISPLAY "Opção inválida. Tente novamente."
               END-EVALUATE
           END-PERFORM
           CLOSE TAREFAS
           STOP RUN.

       ADICIONAR-TAREFA.
           DISPLAY "Digite a descrição da tarefa: "
           ACCEPT TAREFA-INPUT
           MOVE TAREFA-INPUT TO TAREFA-DESCRICAO
           WRITE TAREFA-REGISTRO
           DISPLAY "Tarefa adicionada com sucesso!".

       LISTAR-TAREFAS.
           DISPLAY "Lista de Tarefas:"
           OPEN INPUT TAREFAS
           PERFORM UNTIL EOF
               READ TAREFAS INTO TAREFA-REGISTRO
                   AT END
                       MOVE 'Y' TO EOF
                   NOT AT END
                       DISPLAY TAREFA-DESCRICAO
               END-READ
           END-PERFORM
           CLOSE TAREFAS.

       END PROGRAM ListadorDeTarefas.