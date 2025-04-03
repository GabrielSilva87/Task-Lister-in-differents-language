import scala.collection.mutable.ListBuffer
import scala.io.StdIn._

object TaskList {
  def main(args: Array[String]): Unit = {
    val tasks = ListBuffer[String]()
    var running = true

    while (running) {
      println("\nListador de Tarefas")
      println("1. Adicionar Tarefa")
      println("2. Remover Tarefa")
      println("3. Listar Tarefas")
      println("4. Sair")
      print("Escolha uma opção: ")

      val choice = readLine()

      choice match {
        case "1" =>
          print("Digite a tarefa: ")
          val task = readLine()
          if (task.nonEmpty) {
            tasks += task
            println(s"Tarefa '$task' adicionada.")
          } else {
            println("Tarefa não pode ser vazia.")
          }

        case "2" =>
          println("Tarefas:")
          tasks.zipWithIndex.foreach { case (task, index) => println(s"$index: $task") }
          print("Digite o número da tarefa a ser removida: ")
          val indexToRemove = readLine().toInt
          if (indexToRemove >= 0 && indexToRemove < tasks.length) {
            val removedTask = tasks.remove(indexToRemove)
            println(s"Tarefa '$removedTask' removida.")
          } else {
            println("Índice inválido.")
          }

        case "3" =>
          println("Tarefas:")
          if (tasks.isEmpty) {
            println("Nenhuma tarefa encontrada.")
          } else {
            tasks.zipWithIndex.foreach { case (task, index) => println(s"$index: $task") }
          }

        case "4" =>
          running = false
          println("Saindo do listador de tarefas.")

        case _ =>
          println("Opção inválida. Tente novamente.")
      }
    }
  }
}