#include <iostream>
#include <vector>
#include <string>

class TaskManager {
private:
    std::vector<std::string> tasks;

public:
    void addTask(const std::string& task) {
        tasks.push_back(task);
        std::cout << "Tarefa adicionada: " << task << std::endl;
    }

    void removeTask(int index) {
        if (index >= 0 && index < tasks.size()) {
            std::cout << "Tarefa removida: " << tasks[index] << std::endl;
            tasks.erase(tasks.begin() + index);
        } else {
            std::cout << "Índice inválido." << std::endl;
        }
    }

    void listTasks() const {
        if (tasks.empty()) {
            std::cout << "Nenhuma tarefa encontrada." << std::endl;
        } else {
            std::cout << "Tarefas:" << std::endl;
            for (size_t i = 0; i < tasks.size(); ++i) {
                std::cout << i << ": " << tasks[i] << std::endl;
            }
        }
    }
};

int main() {
    TaskManager taskManager;
    int choice;
    std::string input;

    while (true) {
        std::cout << "\n1. Adicionar Tarefa\n2. Remover Tarefa\n3. Listar Tarefas\n4. Sair" << std::endl;
        std::cout << "Escolha uma opção: ";
        std::cin >> choice;
        std::cin.ignore(); // Limpar o buffer do cin

        switch (choice) {
            case 1:
                std::cout << "Digite a tarefa: ";
                std::getline(std::cin, input);
                taskManager.addTask(input);
                break;
            case 2:
                std::cout << "Digite o índice da tarefa a ser removida: ";
                int index;
                std::cin >> index;
                taskManager.removeTask(index);
                break;
            case 3:
                taskManager.listTasks();
                break;
            case 4:
                std::cout << "Saindo..." << std::endl;
                return 0;
            default:
                std::cout << "Opção inválida. Tente novamente." << std::endl;
                break;
        }
    }

    return 0;
}