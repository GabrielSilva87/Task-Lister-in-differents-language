import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;

public class TaskListApp {
    private List<String> tasks;
    private Scanner scanner;

    public TaskListApp() {
        tasks = new ArrayList<>();
        scanner = new Scanner(System.in);
    }

    public void showMenu() {
        System.out.println("Listador de Tarefas");
        System.out.println("1. Adicionar Tarefa");
        System.out.println("2. Listar Tarefas");
        System.out.println("3. Remover Tarefa");
        System.out.println("4. Sair");
        System.out.print("Escolha uma opção: ");
    }

    public void addTask() {
        System.out.print("Digite a tarefa: ");
        String task = scanner.nextLine();
        tasks.add(task);
        System.out.println("Tarefa adicionada: " + task);
    }

    public void listTasks() {
        if (tasks.isEmpty()) {
            System.out.println("Nenhuma tarefa encontrada.");
        } else {
            System.out.println("Tarefas:");
            for (int i = 0; i < tasks.size(); i++) {
                System.out.println((i + 1) + ". " + tasks.get(i));
            }
        }
    }

    public void removeTask() {
        System.out.print("Digite o número da tarefa a ser removida: ");
        int index = scanner.nextInt() - 1;
        scanner.nextLine(); // Limpar o buffer
        if (index >= 0 && index < tasks.size()) {
            String removedTask = tasks.remove(index);
            System.out.println("Tarefa removida: " + removedTask);
        } else {
            System.out.println("Índice inválido.");
        }
    }

    public static void main(String[] args) {
        TaskListApp app = new TaskListApp();
        boolean running = true;

        while (running) {
            app.showMenu();
            int choice = app.scanner.nextInt();
            app.scanner.nextLine(); // Limpar o buffer

            switch (choice) {
                case 1:
                    app.addTask();
                    break;
                case 2:
                    app.listTasks();
                    break;
                case 3:
                    app.removeTask();
                    break;
                case 4:
                    running = false;
                    System.out.println("Saindo...");
                    break;
                default:
                    System.out.println("Opção inválida. Tente novamente.");
                    break;
            }
        }

        app.scanner.close();
    }
}