import com.jfoenix.controls.JFXButton;
import com.jfoenix.controls.JFXListView;
import com.jfoenix.controls.JFXTextField;
import javafx.application.Application;
import javafx.collections.FXCollections;
import javafx.collections.ObservableList;
import javafx.scene.Scene;
import javafx.scene.layout.VBox;
import javafx.stage.Stage;

public class TaskListApp extends Application {
    private ObservableList<String> tasks;

    public static void main(String[] args) {
        launch(args);
    }

    @Override
    public void start(Stage primaryStage) {
        primaryStage.setTitle("Listador de Tarefas");

        tasks = FXCollections.observableArrayList();
        JFXListView<String> taskListView = new JFXListView<>(tasks);
        JFXTextField taskInput = new JFXTextField();
        taskInput.setPromptText("Digite uma nova tarefa");
        JFXButton addButton = new JFXButton("Adicionar");

        addButton.setOnAction(e -> {
            String task = taskInput.getText();
            if (!task.isEmpty()) {
                tasks.add(task);
                taskInput.clear();
            }
        });

        VBox layout = new VBox(10, taskInput, addButton, taskListView);
        Scene scene = new Scene(layout, 300, 250);
        primaryStage.setScene(scene);
        primaryStage.show();
    }
}