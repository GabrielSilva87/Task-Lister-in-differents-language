import javafx.application.Application
import javafx.scene.Scene
import javafx.scene.control.*
import javafx.scene.layout.VBox
import javafx.stage.Stage

class TaskListApp : Application() {
    private val tarefas = mutableListOf<String>()
    private lateinit var taskInput: TextField
    private lateinit var taskListView: ListView<String>

    override fun start(primaryStage: Stage) {
        taskInput = TextField()
        taskInput.promptText = "Digite uma nova tarefa"

        val addButton = Button("Adicionar Tarefa")
        addButton.setOnAction { addTask() }

        taskListView = ListView()

        val removeButton = Button("Remover Tarefa")
        removeButton.setOnAction { removeTask() }

        val layout = VBox(10.0, taskInput, addButton, taskListView, removeButton)
        val scene = Scene(layout, 300.0, 400.0)

        primaryStage.title = "Listador de Tarefas"
        primaryStage.scene = scene
        primaryStage.show()
    }

    private fun addTask() {
        val task = taskInput.text
        if (task.isNotBlank()) {
            tarefas.add(task)
            taskListView.items.add(task)
            taskInput.clear()
        } else {
            showAlert("Tarefa inválida", "Por favor, digite uma tarefa válida.")
        }
    }

    private fun removeTask() {
        val selectedTask = taskListView.selectionModel.selectedItem
        if (selectedTask != null) {
            tarefas.remove(selectedTask)
            taskListView.items.remove(selectedTask)
        } else {
            showAlert("Seleção inválida", "Por favor, selecione uma tarefa para remover.")
        }
    }

    private fun showAlert(title: String, message: String) {
        val alert = Alert(Alert.AlertType.INFORMATION)
        alert.title = title
        alert.headerText = null
        alert.contentText = message
        alert.showAndWait()
    }
}

fun main() {
    Application.launch(TaskListApp::class.java)
}