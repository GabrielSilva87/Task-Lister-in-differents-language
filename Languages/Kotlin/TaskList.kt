fun main() {
    val tarefas = mutableListOf<String>()

    while (true) {
        println("\nEscolha uma opção:")
        println("1. Adicionar tarefa")
        println("2. Listar tarefas")
        println("3. Remover tarefa")
        println("4. Sair")

        val opcao = readLine()

        when (opcao) {
            "1" -> {
                println("Digite a tarefa a ser adicionada:")
                val tarefa = readLine()
                if (tarefa != null && tarefa.isNotBlank()) {
                    tarefas.add(tarefa)
                    println("Tarefa adicionada: $tarefa")
                } else {
                    println("Tarefa inválida.")
                }
            }
            "2" -> {
                if (tarefas.isEmpty()) {
                    println("Nenhuma tarefa na lista.")
                } else {
                    println("Lista de Tarefas:")
                    tarefas.forEach { tarefa -> println("- $tarefa") }
                }
            }
            "3" -> {
                println("Digite a tarefa a ser removida:")
                val tarefa = readLine()
                if (tarefa != null && tarefas.remove(tarefa)) {
                    println("Tarefa removida: $tarefa")
                } else {
                    println("Tarefa não encontrada: $tarefa")
                }
            }
            "4" -> {
                println("Saindo...")
                return
            }
            else -> {
                println("Opção inválida. Tente novamente.")
            }
        }
    }
}