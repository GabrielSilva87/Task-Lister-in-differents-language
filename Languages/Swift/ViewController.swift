import Cocoa

class ViewController: NSViewController {
    @IBOutlet weak var taskTextField: NSTextField!
    @IBOutlet weak var taskTableView: NSTableView!

    var tasks: [String] = []

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func addTask(_ sender: NSButton) {
        let task = taskTextField.stringValue.trimmingCharacters(in: .whitespacesAndNewlines)
        if !task.isEmpty {
            tasks.append(task)
            taskTextField.stringValue = ""
            taskTableView.reloadData()
        }
    }

    @IBAction func removeTask(_ sender: NSButton) {
        let selectedRow = taskTableView.selectedRow
        if selectedRow >= 0 {
            tasks.remove(at: selectedRow)
            taskTableView.reloadData()
        }
    }
}

extension ViewController: NSTableViewDataSource, NSTableViewDelegate {
    func numberOfRows(in tableView: NSTableView) -> Int {
        return tasks.count
    }

    func tableView(_ tableView: NSTableView, viewFor tableColumn: NSTableColumn?, row: Int) -> NSView? {
        let task = tasks[row]
        let cellIdentifier = NSUser InterfaceItemIdentifier("TaskCell")

        if let cell = tableView.makeView(withIdentifier: cellIdentifier, owner: nil) as? NSTableCellView {
            cell.textField?.stringValue = task
            return cell
        }
        return nil
    }
}