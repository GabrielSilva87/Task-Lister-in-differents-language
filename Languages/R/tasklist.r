tarefas <- list()

menu <- function() {
  cat("\nListador de Tarefas\n")
  cat("1. Adicionar tarefa\n")
  cat("2. Listar tarefas\n")
  cat("3. Remover tarefa\n")
  cat("4. Sair\n")
  cat("Escolha uma opção: ")
}

adicionar_tarefa <- function() {
  tarefa <- readline(prompt = "Digite a descrição da tarefa: ")
  tarefas <<- c(tarefas, tarefa)
  cat("Tarefa adicionada.\n")
}

listar_tarefas <- function() {
  if (length(tarefas) == 0) {
    cat("Nenhuma tarefa cadastrada.\n")
  } else {
    cat("Tarefas:\n")
    for (i in seq_along(tarefas)) {
      cat(i, ": ", tarefas[[i]], "\n", sep = "")
    }
  }
}

remover_tarefa <- function() {
  listar_tarefas()
  if (length(tarefas) > 0) {
    indice <- as.integer(readline(prompt = "Digite o número da tarefa a ser removida: "))
    if (indice > 0 && indice <= length(tarefas)) {
      tarefas <<- tarefas[-indice]
      cat("Tarefa removida.\n")
    } else {
      cat("Índice inválido.\n")
    }
  }
}

executar_listador <- function() {
  repeat {
    menu()
    opcao <- as.integer(readline())
    if (opcao == 1) {
      adicionar_tarefa()
    } else if (opcao == 2) {
      listar_tarefas()
    } else if (opcao == 3) {
      remover_tarefa()
    } else if (opcao == 4) {
      cat("Saindo...\n")
      break
    } else {
      cat("Opção inválida. Tente novamente.\n")
    }
  }
}

executar_listador()