import javax.swing.*
import java.awt.*
import java.awt.event.*

class Task {
    String description

    Task(String description) {
        this.description = description
    }

    String toString() {
        return description
    }
}

class TaskListApp {
    List<Task> tasks = []
    DefaultListModel<Task> taskListModel = new DefaultListModel<>()
    JList<Task> taskJList = new JList<>(taskListModel)

    TaskListApp() {
        JFrame frame = new JFrame("Listador de Tarefas")
        frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE)
        frame.setSize(400, 300)
        frame.setLayout(new BorderLayout())

        JPanel inputPanel = new JPanel()
        JTextField taskInput = new JTextField(20)
        JButton addButton = new JButton("Adicionar Tarefa")
        JButton removeButton = new JButton("Remover Tarefa")

        inputPanel.add(taskInput)
        inputPanel.add(addButton)
        inputPanel.add(removeButton)

        frame.add(inputPanel, BorderLayout.NORTH)
        frame.add(new JScrollPane(taskJList), BorderLayout.CENTER)

        addButton.addActionListener(new ActionListener() {
            @Override
            void actionPerformed(ActionEvent e) {
                String taskDescription = taskInput.getText().trim()
                if (!taskDescription.isEmpty()) {
                    Task newTask = new Task(taskDescription)
                    tasks << newTask
                    taskListModel.addElement(newTask)
                    taskInput.setText("")
                } else {
                    JOptionPane.showMessageDialog(frame, "Por favor, insira uma descrição da tarefa.", "Erro", JOptionPane.ERROR_MESSAGE)
                }
            }
        })

        removeButton.addActionListener(new ActionListener() {
            @Override
            void actionPerformed(ActionEvent e) {
                int selectedIndex = taskJList.getSelectedIndex()
                if (selectedIndex != -1) {
                    tasks.remove(selectedIndex)
                    taskListModel.remove(selectedIndex)
                } else {
                    JOptionPane.showMessageDialog(frame, "Selecione uma tarefa para remover.", "Erro", JOptionPane.ERROR_MESSAGE)
                }
            }
        })

        frame.setVisible(true)
    }
}

SwingUtilities.invokeLater {
    new TaskListApp()
}