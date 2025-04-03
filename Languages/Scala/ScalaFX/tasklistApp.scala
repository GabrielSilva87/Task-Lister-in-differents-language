import scalafx.application.JFXApp
import scalafx.scene.Scene
import scalafx.scene.control._
import scalafx.scene.layout._
import scalafx.collections.ObservableBuffer

object TaskListApp extends JFXApp {
  val tasks = ObservableBuffer[String]()

  val taskInput = new TextField()
  val addButton = new Button("Adicionar Tarefa")
  val taskListView = new ListView[String](tasks)

  addButton.onAction = _ => {
    val task = taskInput.text.value.trim
    if (task.nonEmpty) {
      tasks += task
      taskInput.clear()
    }
  }

  val layout = new VBox {
    spacing = 10
    padding = new javafx.geometry.Insets(10)
    children = Seq(
      new Label("Digite uma tarefa:"),
      taskInput,
      addButton,
      taskListView
    )
  }

  stage = new JFXApp.PrimaryStage {
    title = "Listador de Tarefas"
    scene = new Scene {
      root = layout
      minWidth = 300
      minHeight = 400
    }
  }
}