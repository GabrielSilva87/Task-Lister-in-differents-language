package main

import (
	"fmt"
	"strings"
)

func main() {
	var tasks []string
	var choice string

	for {
		fmt.Println("\nMenu:")
		fmt.Println("1. Adicionar Tarefa")
		fmt.Println("2. Remover Tarefa")
		fmt.Println("3. Mostrar Tarefas")
		fmt.Println("4. Sair")
		fmt.Print("Escolha uma opção: ")
		fmt.Scanln(&choice)

		switch choice {
		case "1":
			var task string
			fmt.Print("Digite a tarefa: ")
			fmt.Scanln(&task)
			if strings.TrimSpace(task) != "" {
				tasks = append(tasks, task)
				fmt.Println("Tarefa adicionada.")
			} else {
				fmt.Println("A tarefa não pode ser vazia.")
			}
		case "2":
			if len(tasks) == 0 {
				fmt.Println("Nenhuma tarefa para remover.")
				continue
			}
			fmt.Println("Tarefas:")
			for i, t := range tasks {
				fmt.Printf("%d. %s\n", i+1, t)
			}
			var index int
			fmt.Print("Digite o número da tarefa a ser removida: ")
			fmt.Scanln(&index)
			if index > 0 && index <= len(tasks) {
				removedTask := tasks[index-1]
				tasks = append(tasks[:index-1], tasks[index:]...)
				fmt.Printf("Tarefa \"%s\" removida.\n", removedTask)
			} else {
				fmt.Println("Índice inválido.")
			}
		case "3":
			if len(tasks) == 0 {
				fmt.Println("Nenhuma tarefa na lista.")
			} else {
				fmt.Println("Tarefas:")
				for i, t := range tasks {
					fmt.Printf("%d. %s\n", i+1, t)
				}
			}
		case "4":
			fmt.Println("Saindo...")
			return
		default:
			fmt.Println("Opção inválida. Tente novamente.")
		}
	}
}