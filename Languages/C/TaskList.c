#include <stdio.h>
#include <string.h>

#define MAX_TASKS 100
#define TASK_LENGTH 256

int main() {
    char tasks[MAX_TASKS][TASK_LENGTH];
    int task_count = 0;
    char input[TASK_LENGTH];

    while (1) {
        printf("Insira uma tarefa (ou 'sair' para finalizar): ");
        fgets(input, TASK_LENGTH, stdin);
        input[strcspn(input, "\n")] = 0;

        if (strcmp(input, "sair") == 0) {
            break;
        }

        if (task_count < MAX_TASKS) {
            strcpy(tasks[task_count], input);
            task_count++;
        } else {
            printf("Limite de tarefas atingido!\n");
        }
    }

    printf("\nLista de Tarefas:\n");
    for (int i = 0; i < task_count; i++) {
        printf("%d: %s\n", i + 1, tasks[i]);
    }

    return 0;
}