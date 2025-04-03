use gtk::prelude::*;
use gtk::{Button, Entry, ListBox, ListBoxRow, Window, WindowType};
use std::cell::RefCell;
use std::rc::Rc;

struct TaskList {
    tasks: Rc<RefCell<Vec<String>>>,
    list_box: ListBox,
}

impl TaskList {
    fn new(list_box: ListBox) -> Self {
        TaskList {
            tasks: Rc::new(RefCell::new(Vec::new())),
            list_box,
        }
    }

    fn add_task(&self, task: String) {
        self.tasks.borrow_mut().push(task.clone());
        self.update_list();
    }

    fn remove_task(&self, index: usize) {
        self.tasks.borrow_mut().remove(index);
        self.update_list();
    }

    fn update_list(&self) {
        self.list_box.foreach(|child| self.list_box.remove(child));
        for (index, task) in self.tasks.borrow().iter().enumerate() {
            let row = ListBoxRow::new();
            let label = gtk::Label::new(Some(task));
            let remove_button = Button::with_label("Remover");

            let task_clone = self.tasks.clone();
            remove_button.connect_clicked(move |_| {
                task_clone.borrow_mut().remove(index);
                task_clone.borrow().update_list();
            });

            let hbox = gtk::Box::new(gtk::Orientation::Horizontal, 5);
            hbox.pack_start(&label, true, true, 0);
            hbox.pack_start(&remove_button, false, false, 0);
            row.add(&hbox);
            self.list_box.add(&row);
        }
        self.list_box.show_all();
    }
}

fn main() {
    gtk::init().expect("Failed to initialize GTK.");

    let window = Window::new(WindowType::Toplevel);
    window.set_title("Listador de Tarefas");
    window.set_default_size(300, 400);

    let vbox = gtk::Box::new(gtk::Orientation::Vertical, 5);
    let entry = Entry::new();
    let add_button = Button::with_label("Adicionar Tarefa");
    let list_box = ListBox::new();

    let task_list = TaskList::new(list_box.clone());

    add_button.connect_clicked({
        let task_list = task_list.tasks.clone();
        let entry = entry.clone();
        move |_| {
            let task = entry.get_text().unwrap_or_default();
            if !task.is_empty() {
                task_list.add_task(task.to_string());
                entry.set_text("");
            }
        }
    });

    vbox.pack_start(&entry, false, false, 0);
    vbox.pack_start(&add_button, false, false, 0);
    vbox.pack_start(&list_box, true, true, 0);

    window.add(&vbox);
    window.show_all();

    window.connect_delete_event(|_, _| {
        gtk::main_quit();
        Inhibit(false)
    });

    gtk::main();
}