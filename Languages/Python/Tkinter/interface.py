import tkinter as tk
from tkinter import messagebox

class TaskListApp:
    def __init__(self, root):
        self.root = root
        self.root.title("Listador de Tarefas")
        
        self.tasks = []
        
        self.task_entry = tk.Entry(root, width=40)
        self.task_entry.pack(pady=10)
        
        self.add_task_button = tk.Button(root, text="Adicionar Tarefa", command=self.add_task)
        self.add_task_button.pack(pady=5)
        
        self.remove_task_button = tk.Button(root, text="Remover Tarefa", command=self.remove_task)
        self.remove_task_button.pack(pady=5)
        
        self.task_listbox = tk.Listbox(root, width=50, height=10)
        self.task_listbox.pack(pady=10)
        
    def add_task(self):
        task = self.task_entry.get()
        if task:
            self.tasks.append(task)
            self.update_task_listbox()
            self.task_entry.delete(0, tk.END)
        else:
            messagebox.showwarning("Aviso", "Por favor, insira uma tarefa.")
    
    def remove_task(self):
        try:
            selected_task_index = self.task_listbox.curselection()[0]
            del self.tasks[selected_task_index]
            self.update_task_listbox()
        except IndexError:
            messagebox.showwarning("Aviso", "Por favor, selecione uma tarefa para remover.")
    
    def update_task_listbox(self):
        self.task_listbox.delete(0, tk.END)
        for task in self.tasks:
            self.task_listbox.insert(tk.END, task)

if __name__ == "__main__":
    root = tk.Tk()
    app = TaskListApp(root)
    root.mainloop()