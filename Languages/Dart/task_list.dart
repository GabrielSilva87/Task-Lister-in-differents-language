import 'dart:io';

void main() {
  List<String> tasks = [];
  while (true) {
    print('\nMenu:');
    print('1. Adicionar Tarefa');
    print('2. Remover Tarefa');
    print('3. Mostrar Tarefas');
    print('4. Sair');
    
    String? choice = stdin.readLineSync();
    
    if (choice == '1') {
      print('Digite a tarefa:');
      String? task = stdin.readLineSync();
      if (task != null && task.isNotEmpty) {
        tasks.add(task);
        print('Tarefa adicionada.');
      } else {
        print('Tarefa não pode ser vazia.');
      }
    } else if (choice == '2') {
      print('Tarefas:');
      for (int i = 0; i < tasks.length; i++) {
        print('${i + 1}. ${tasks[i]}');
      }
      print('Digite o número da tarefa a ser removida:');
      String? indexInput = stdin.readLineSync();
      if (indexInput != null) {
        int index = int.tryParse(indexInput) ?? -1;
        if (index > 0 && index <= tasks.length) {
          String removedTask = tasks.removeAt(index - 1);
          print('Tarefa "$removedTask" removida.');
        } else {
          print('Índice inválido.');
        }
      }
    } else if (choice == '3') {
      print('Tarefas:');
      if (tasks.isEmpty) {
        print('Nenhuma tarefa na lista.');
      } else {
        for (int i = 0; i < tasks.length; i++) {
          print('${i + 1}. ${tasks[i]}');
        }
      }
    } else if (choice == '4') {
      print('Saindo...');
      break;
    } else {
      print('Opção inválida. Tente novamente.');
    }
  }
}