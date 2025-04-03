import Foundation

class TaskManager {
    private var tasks: [Task] = []

    func addTask(title: String) {
        let newTask = Task(title: title, isCompleted: false)
        tasks.append(newTask)
    }

    func getTasks() -> [Task] {
        return tasks
    }

    func completeTask(at index: Int) {
        tasks[index].isCompleted = true
    }
}