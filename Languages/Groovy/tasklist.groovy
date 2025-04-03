class Task {
    String description

    Task(String description) {
        this.description = description
    }

    String toString() {
        return description
    }
}

class TaskList {
    List<Task> tasks = []

    void addTask(String description) {
        tasks << new Task(description)
        println "Tarefa adicionada: $description"
    }

    void removeTask(int index) {
        if (index >= 0 && index < tasks.size()) {
            println "Tarefa removida: ${tasks[index]}"
            tasks.remove(index)
        } else {
            println "Índice inválido!"
        }
    }

    void listTasks() {
        if (tasks.isEmpty()) {
            println "Nenhuma tarefa na lista."
        } else {
            println "Tarefas:"
            tasks.eachWithIndex { task, index ->
                println "${index + 1}: $task"
            }
        }
    }
}

def taskList = new TaskList()

while (true) {
    println "\nEscolha uma opção:"
    println "1. Adicionar tarefa"
    println "2. Listar tarefas"
    println "3. Remover tarefa"
    println "4. Sair"
    def choice = System.console().readLine()

    switch (choice) {
        case '1':
            println "Digite a descrição da tarefa:"
            def description = System.console().readLine()
            taskList.addTask(description)
            break
        case '2':
            taskList.listTasks()
            break
        case '3':
            println "Digite o número da tarefa a ser removida:"
            def index = System.console().readLine().toInteger() - 1
            taskList.removeTask(index)
            break
        case '4':
            println "Saindo..."
            return
        default:
            println "Opção inválida. Tente novamente."
    }
}