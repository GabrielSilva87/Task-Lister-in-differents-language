use std::io;

struct TaskList {
    tasks: Vec<String>,
}

impl TaskList {
    fn new() -> TaskList {
        TaskList { tasks: Vec::new() }
    }

    fn add_task(&mut self, task: String) {
        self.tasks.push(task);
        println!("Tarefa adicionada.");
    }

    fn list_tasks(&self) {
        if self.tasks.is_empty() {
            println!("Nenhuma tarefa cadastrada.");
        } else {
            println!("Tarefas:");
            for (index, task) in self.tasks.iter().enumerate() {
                println!("{}: {}", index + 1, task);
            }
        }
    }

    fn remove_task(&mut self, index: usize) {
        if index < self.tasks.len() {
            let removed_task = self.tasks.remove(index);
            println!("Tarefa removida: '{}'", removed_task);
        } else {
            println!("Índice inválido.");
        }
    }
}

fn menu() {
    println!("\nListador de Tarefas");
    println!("1. Adicionar tarefa");
    println!("2. Listar tarefas");
    println!("3. Remover tarefa");
    println!("4. Sair");
    print!("Escolha uma opção: ");
}

fn main() {
    let mut task_list = TaskList::new();
    loop {
        menu();
        let mut option = String::new();
        io::stdin().read_line(&mut option).expect("Falha ao ler a entrada");
        let option: usize = option.trim().parse().expect("Por favor, insira um número válido");

        match option {
            1 => {
                let mut task = String::new();
                print!("Digite a descrição da tarefa: ");
                io::stdin().read_line(&mut task).expect("Falha ao ler a entrada");
                task_list.add_task(task.trim().to_string());
            }
            2 => task_list.list_tasks(),
            3 => {
                task_list.list_tasks();
                print!("Digite o número da tarefa a ser removida: ");
                let mut index = String::new();
                io::stdin().read_line(&mut index).expect("Falha ao ler a entrada");
                let index: usize = index.trim().parse().expect("Por favor, insira um número válido");
                task_list.remove_task(index - 1);
            }
            4 => {
                println!("Saindo...");
                break;
            }
            _ => println!("Opção inválida. Tente novamente."),
        }
    }
}