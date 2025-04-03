import dlangui.application;
import dlangui.controls;
import dlangui.layout;
import dlangui.window;
import std.array;
import std.string;

class TaskListApp {
    private string[] tasks;
    private ListBox taskListBox;
    private TextEdit taskInput;

    this() {
        tasks = [];
        initUI();
    }

    void initUI() {
        auto app = Application();
        auto window = Window("Listador de Tarefas", 400, 300);
        window.setLayout(new VBoxLayout());

        taskInput = new TextEdit();
        taskInput.setPlaceholder("Digite a tarefa...");
        window.add(taskInput);

        auto addButton = new Button("Adicionar");
        addButton.onClick = { addTask(); };
        window.add(addButton);

        taskListBox = new ListBox();
        window.add(taskListBox);

        auto removeButton = new Button("Remover");
        removeButton.onClick = { removeTask(); };
        window.add(removeButton);

        window.show();
        app.run();
    }

    void addTask() {
        auto task = taskInput.text.strip();
        if (!task.empty) {
            tasks ~= task;
            taskListBox.addItem(task);
            taskInput.text = "";
        }
    }

    void removeTask() {
        auto selectedIndex = taskListBox.selectedIndex;
        if (selectedIndex >= 0) {
            tasks.remove(selectedIndex);
            taskListBox.removeItem(selectedIndex);
        }
    }
}

void main() {
    new TaskListApp();
}