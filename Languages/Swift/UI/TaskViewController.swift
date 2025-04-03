import UIKit

class TaskViewController: UIViewController {
    var taskManager = TaskManager()
    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
    }

    @IBAction func addTaskButtonTapped(_ sender: UIButton) {
        let alert = UIAlertController(title: "Nova Tarefa", message: "Digite o título da tarefa", preferredStyle: .alert)
        alert.addTextField()
        alert.addAction(UIAlertAction(title: "Adicionar", style: .default, handler: { [weak self] _ in
            if let title = alert.textFields?.first?.text {
                self?.taskManager.addTask(title: title)
                self?.tableView.reloadData()
            }
        }))
        present(alert, animated: true)
    }
}

extension TaskViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return taskManager.getTasks().count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TaskCell", for: indexPath)
        let task = taskManager.getTasks()[indexPath.row]
        cell.textLabel?.text = task.title
        cell.accessoryType = task.isCompleted ? .checkmark : .none
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        taskManager.completeTask(at: indexPath.row)
        tableView.reloadRows(at: [indexPath], with: .automatic)
    }
}