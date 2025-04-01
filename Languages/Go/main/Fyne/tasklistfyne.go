package main

import (
	"fyne.io/fyne/v2/app"
	"fyne.io/fyne/v2/container"
	"fyne.io/fyne/v2/dialog"
	"fyne.io/fyne/v2/widget"
)

func main() {
	myApp := app.New()
	myWindow := myApp.NewWindow("Listador de Tarefas")

	tasks := []string{}
	taskList := widget.NewList(
		func() int {
			return len(tasks)
		},
		func() fyne.CanvasObject {
			return widget.NewLabel("")
		},
		func(i int, o fyne.CanvasObject) {
			o.(*widget.Label).SetText(tasks[i])
		})

	entry := widget.NewEntry()
	entry.SetPlaceHolder("Digite uma tarefa")

	addButton := widget.NewButton("Adicionar Tarefa", func() {
		task := entry.Text
		if task != "" {
			tasks = append(tasks, task)
			taskList.Refresh()
			entry.SetText("")
		} else {
			dialog.ShowInformation("Erro", "A tarefa não pode ser vazia.", myWindow)
		}
	})

	removeButton := widget.NewButton("Remover Tarefa", func() {
		selected := taskList.Selected
		if selected >= 0 && selected < len(tasks) {
			tasks = append(tasks[:selected], tasks[selected+1:]...)
			taskList.Refresh()
		} else {
			dialog.ShowInformation("Erro", "Selecione uma tarefa para remover.", myWindow)
		}
	})

	content := container.NewVBox(entry, addButton, removeButton, taskList)
	myWindow.SetContent(content)
	myWindow.Resize(fyne.NewSize(400, 300))
	myWindow.ShowAndRun()
}