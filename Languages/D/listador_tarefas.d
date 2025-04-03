import std.stdio;
import std.array;
import std.string;

void main() {
    string[] tarefas;
    bool running = true;

    while (running) {
        writeln("Escolha uma opção:");
        writeln("1. Adicionar tarefa");
        writeln("2. Listar tarefas");
        writeln("3. Remover tarefa");
        writeln("4. Sair");

        int opcao = to!int(readln().strip());

        switch (opcao) {
            case 1:
                writeln("Digite a tarefa:");
                string tarefa = readln().strip();
                adicionarTarefa(tarefas, tarefa);
                break;
            case 2:
                listarTarefas(tarefas);
                break;
            case 3:
                writeln("Digite a tarefa a remover:");
                string tarefaRemover = readln().strip();
                removerTarefa(tarefas, tarefaRemover);
                break;
            case 4:
                writeln("Saindo...");
                running = false;
                break;
            default:
                writeln("Opção inválida. Tente novamente.");
        }
    }
}

void adicionarTarefa(ref string[] tarefas, string tarefa) {
    tarefas ~= tarefa;
    writeln("Tarefa '", tarefa, "' adicionada.");
}

void listarTarefas(string[] tarefas) {
    if (tarefas.length == 0) {
        writeln("Nenhuma tarefa encontrada.");
    } else {
        writeln("Tarefas:");
        foreach (tarefa; tarefas) {
            writeln("- ", tarefa);
        }
    }
}

void removerTarefa(ref string[] tarefas, string tarefa) {
    if (tarefa in tarefas) {
        tarefas.remove(tarefas.indexOf(tarefa));
        writeln("Tarefa '", tarefa, "' removida.");
    } else {
        writeln("Tarefa '", tarefa, "' não encontrada.");
    }
}