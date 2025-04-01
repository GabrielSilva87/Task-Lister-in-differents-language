def display_tasks(tasks):
    if not tasks:
        print("Nenhuma tarefa na lista.")
    else:
        print("Tarefas:")
        for index, task in enumerate(tasks, start=1):
            print(f"{index}. {task}")

def main():
    tasks = []
    while True:
        print("\nMenu:")
        print("1. Adicionar Tarefa")
        print("2. Remover Tarefa")
        print("3. Mostrar Tarefas")
        print("4. Sair")
        
        choice = input("Escolha uma opção: ")
        
        if choice == '1':
            task = input("Digite a tarefa: ")
            tasks.append(task)
            print("Tarefa adicionada.")
        elif choice == '2':
            display_tasks(tasks)
            try:
                task_index = int(input("Digite o número da tarefa a ser removida: ")) - 1
                if 0 <= task_index < len(tasks):
                    removed_task = tasks.pop(task_index)
                    print(f"Tarefa '{removed_task}' removida.")
                else:
                    print("Índice inválido.")
            except ValueError:
                print("Por favor, insira um número válido.")
        elif choice == '3':
            display_tasks(tasks)
        elif choice == '4':
            print("Saindo...")
            break
        else:
            print("Opção inválida. Tente novamente.")

if __name__ == "__main__":
    main()